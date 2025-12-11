#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright: Contributors to the Ansible project
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

import os  # pylint:disable=wrong-import-position
import re  # pylint:disable=wrong-import-position
from importlib.util import find_spec  # pylint:disable=wrong-import-position
from time import strftime  # pylint:disable=wrong-import-position
from ansible.module_utils.basic import AnsibleModule  # pylint:disable=wrong-import-position

USER_PROMPT = "Enter your username"
PASSWORD_PROMPT = "Enter your password"
PROMPT = "dscli>"

module = AnsibleModule(
    argument_spec=dict(
        hostname=dict(type="str", required=True),
        username=dict(type="str", required=True),
        password=dict(type="str", required=True, no_log=True),
        vendor_cli=dict(type="str", required=True),
        out_file=dict(type="str", required=True),
        log_file=dict(type="str", required=True),
    ),
    supports_check_mode=False,
)

result = {
    "changed": False,
    "stdout": "",
    "return_code": "unexpected_failure",
}

if find_spec("pexpect") is not None:
    import pexpect
else:
    result["return_code"] = "prereq_pexpect_missing"
    module.fail_json("prereq_pexpect_missing", **result)

simple_commands = {
    "showpass": "showpass -bnr off",
    "ver": "ver -l -bnr off",
    "showsp": "showsp -bnr off",
    "lsserver": "lsserver -l -bnr off",
    "lsauthpol": "lsauthpol -l -bnr off -fmt delim -delim '|'",
    "lspprc": "lspprc -l -bnr off -fmt delim -delim '|' -fullid 0000-FFFF",
    "showaccess_hmc1": "showaccess -bnr off hmc1",
    "showaccess_hmc2": "showaccess -bnr off hmc2",
    "lsframe": "lsframe -l -bnr off -fmt delim -delim '|'",
    "lspprc_path": "lspprcpath -bnr off -fmt delim -delim '|' 00-FF",
    "lsgmir": "lsgmir -l -bnr off -fmt delim -delim '|' 00",
    "lsuser": "lsuser -bnr off -fmt delim -delim '|'",
    "lskeymgr": "lskeymgr -l -bnr off -fmt delim -delim '|'",
}

id_commands = {
    "showsi": "showsi -bnr off",
    "lskey": "lskey -l -bnr off -fmt delim -delim '|'",
    "lshba": "lshba -l -bnr off -fmt delim -delim '|'",
    "lsstgencl": "lsstgencl -l -bnr off -fmt delim -delim '|'",
    "lsddm": "lsddm -l -bnr off -fmt delim -delim '|'",
    "lsextpool": "lsextpool -l -bnr off -fmt delim -delim '|' -dev",
    "lslss": "lslss -l -bnr off -fmt delim -delim '|' -dev",
    "lsioport": "lsioport -l -bnr off -fmt delim -delim '|' -dev",
    "lshostconnect -unknown": "lshostconnect -unknown -bnr off -fmt delim -delim '|' -dev",
    "lsarray": "lsarray -l -bnr off -fmt delim -delim '|' -dev",
    "lsrank": "lsrank -l -bnr off -fmt delim -delim '|' -dev",
    "lsvolgrp": "lsvolgrp -bnr off -fmt delim -delim '|' -dev",
    "lshostconnect": "lshostconnect -l -bnr off -fmt delim -delim '|' -dev",
    "lslcu": "lslcu -l -bnr off -fmt delim -delim '|' -dev",
    "lsckdvol": "lsckdvol -l -bnr off -fmt delim -delim '|' -dev",
    "lsfbvol": "lsfbvol -l -bnr off -fmt delim -delim '|' -dev",
    "lsda": "lsda -l -bnr off -fmt delim -delim '|'",
    "lskeygrp": "lskeygrp -l -bnr off -fmt delim -delim '|' -dev",
}


# pylint:disable=too-many-statements
def authenticate(vendor_cli: str, hostname: str, username: str, password: str) -> pexpect.spawn:
    child = pexpect.spawn(
        f"{vendor_cli} -hmc1 {hostname}",
        env={"TERM": "dumb", **os.environ},
        timeout=600,
    )
    child.setecho(False)
    child.setwinsize(400, 400)

    try:  # pylint:disable=too-many-try-statements
        child.expect(USER_PROMPT)
    except pexpect.EOF:
        result["stderr"] = child.before.decode()
        result["return_code"] = "pexpect_auth_eof_unknown"
        module.fail_json("pexpect_auth_eof_unknown", **result)
    except pexpect.TIMEOUT:
        result["stderr"] = child.before.decode()
        result["return_code"] = "pexpect_auth_timeout_unknown"
        module.fail_json("pexpect_auth_timeout_unknown", **result)
    child.sendline(username)
    result["stdout"] += f"{strftime('%Y-%m-%d %H:%M:%S')} - Sending {username} as a response\n"
    child.expect(PASSWORD_PROMPT)
    child.sendline(password)
    result["stdout"] += f"{strftime('%Y-%m-%d %H:%M:%S')} - Sending password as a response\n"
    i = None
    try:
        i = child.expect([PROMPT, "CMUC00191E", "CMUN00018E"])
    except pexpect.EOF:
        result["stderr"] = child.before.decode()
        result["return_code"] = "pexpect_auth_eof_unknown"
        module.fail_json("pexpect_auth_eof_unknown", **result)
    except pexpect.TIMEOUT:
        result["stderr"] = child.before.decode()
        result["return_code"] = "pexpect_auth_timeout_unknown"
        module.fail_json("pexpect_auth_timeout_unknown", **result)
    if i == 1:
        result["failed"] = True
        result["stderr"] = "Authentication failure"
        result["return_code"] = "api_auth"
        module.exit_json(**result)
    if i == 2:
        result["failed"] = True
        result["stderr"] = "CMUN00018E  Unable to connect to the management console server"
        result["return_code"] = "api_unreachable"
        module.exit_json(**result)
    return child


def process_lines(lines: str, command: str) -> str:
    return "\n".join(
        line.strip() for line in lines.split("\n") if command not in line and line.strip()
    )


def write_to_file(file: str, output: str):
    try:  # pylint:disable=too-many-try-statements
        with open(file, mode="a", encoding="utf-8") as f:
            f.write(output)
    except IOError as e:
        result["return_code"] = "pexpect_wtf_ioerror_unhandled"
        module.fail_json("pexpect_wtf_ioerror_unhandled: {e}", **result)


def send_simple_command(child: pexpect.spawn, commands: dict) -> str:
    stdout = ""
    for header, command in commands.items():
        output = f"\n#### <{header}>\n"
        i = None
        try:  # pylint:disable=too-many-try-statements
            child.sendline(command)
            i = child.expect(PROMPT)
        except pexpect.EOF:
            result["stderr"] = child.before.decode()
            result["return_code"] = "pexpect_send_command_eof"
            module.fail_json("pexpect_send_command_eof", **result)
        except pexpect.TIMEOUT:
            result["stderr"] = child.before.decode()
            result["return_code"] = "pexpect_send_command_timeout"
            module.fail_json("pexpect_send_command_timeout", **result)
        if i == 0:
            lines = child.before.decode()
            output += process_lines(lines, command)
        else:
            result["stderr"] = child.before.decode()
            result["return_code"] = "pexpect_send_command_unhandled"
            module.fail_json("pexpect_send_command_unhandled", **result)
        output += f"\n#### </{header}>\n"
        status = (
            f"{strftime('%Y-%m-%d %H:%M:%S')} - #### <{header}>"
            f"{' ' * (30 - len(header))}: success\n"
        )
        write_to_file(module.params["out_file"], output)
        write_to_file(module.params["log_file"], status)
        stdout += status
    return stdout


def send_id_command(child: pexpect.spawn, commands: dict, device_id: str) -> str:
    stdout = ""
    for header, command in commands.items():
        output = f"\n#### <{header}>\n"
        i = None
        try:  # pylint:disable=too-many-try-statements
            child.sendline(f"{command} {device_id}")
            i = child.expect(PROMPT)
        except pexpect.EOF:
            result["stderr"] = child.before.decode()
            result["return_code"] = "pexpect_send_command_eof"
            module.fail_json("pexpect_send_command_eof", **result)
        except pexpect.TIMEOUT:
            result["stderr"] = child.before.decode()
            result["return_code"] = "pexpect_send_command_timeout"
            module.fail_json("pexpect_send_command_timeout", **result)
        if i == 0:
            lines = child.before.decode()
            output += process_lines(lines, command)
        else:
            result["stderr"] = child.before.decode()
            result["return_code"] = "pexpect_send_command_unhandled"
            module.fail_json("pexpect_send_command_unhandled", **result)
        output += f"\n#### </{header}>\n"
        status = (
            f"{strftime('%Y-%m-%d %H:%M:%S')} - #### <{header}>"
            f"{' ' * (30 - len(header))}: success\n"
        )
        write_to_file(module.params["out_file"], output)
        write_to_file(module.params["log_file"], status)
        stdout += status
    return stdout


# pylint:disable=too-complex,too-many-statements
def get_showuser(child: pexpect.spawn, header: str) -> str:
    command = "lsuser -s -bnr off -hdr off"
    stdout = ""
    users = None
    output = f"\n#### <{header}>\n"
    i = None
    # Get the list of users
    try:  # pylint:disable=too-many-try-statements
        child.sendline(command)
        i = child.expect(PROMPT)
    except pexpect.EOF:
        result["stderr"] = child.before.decode()
        result["return_code"] = "pexpect_send_command_eof"
        module.fail_json("pexpect_send_command_eof", **result)
    except pexpect.TIMEOUT:
        result["stderr"] = child.before.decode()
        result["return_code"] = "pexpect_send_command_timeout"
        module.fail_json("pexpect_send_command_timeout", **result)
    if i == 0:
        users = child.before.decode()
        # Handle if task is unsupported
        if "Unsupported task" in users:
            output += f"\n#### </{header}>\n"
            status = (
                f"{strftime('%Y-%m-%d %H:%M:%S')} - #### <{header}>"
                f"{' ' * (30 - len(header))}: success\n"
            )
            write_to_file(module.params["out_file"], output)
            write_to_file(module.params["log_file"], status)
            stdout += status
            return stdout
    else:
        result["stderr"] = child.before.decode()
        result["return_code"] = "pexpect_send_command_unhandled"
        module.fail_json("pexpect_send_command_unhandled", **result)

    # Get the actual data for the output
    userlist = [user.strip() for user in users.split("\n") if user.strip()]
    for user in userlist:
        try:  # pylint:disable=too-many-try-statements
            child.sendline(f"showuser -bnr off -v on {user}")
            i = child.expect(PROMPT)
        except pexpect.EOF:
            result["stderr"] = child.before.decode()
            result["return_code"] = "pexpect_send_command_eof"
            module.fail_json("pexpect_send_command_eof", **result)
        except pexpect.TIMEOUT:
            result["stderr"] = child.before.decode()
            result["return_code"] = "pexpect_send_command_timeout"
            module.fail_json("pexpect_send_command_timeout", **result)
        if i == 0:
            output += (
                "\n".join(
                    line.strip() for line in child.before.decode().split("\n") if line.strip()
                )
                + "\n\n"
            )
        else:
            result["stderr"] = child.before.decode()
            result["return_code"] = "pexpect_send_command_unhandled"
            module.fail_json("pexpect_send_command_unhandled", **result)
    output += f"\n#### </{header}>\n"
    status = (
        f"{strftime('%Y-%m-%d %H:%M:%S')} - #### <{header}>"
        f"{' ' * (30 - len(header))}: success\n"
    )
    write_to_file(module.params["out_file"], output)
    write_to_file(module.params["log_file"], status)
    stdout += status
    return stdout


def get_voldata(child: pexpect.spawn, voltype: str, device_id: str) -> str:
    command = f"ls{voltype} -s -bnr off -hdr off -dev {device_id}"
    stdout = ""
    volumes = None
    output = f"\n#### <show{voltype}>\n"
    i = None
    write_to_file(module.params["out_file"], output)
    # Get the list of users
    try:  # pylint:disable=too-many-try-statements
        child.sendline(command)
        i = child.expect(PROMPT)
    except pexpect.EOF:
        result["stderr"] = child.before.decode()
        result["return_code"] = "pexpect_send_command_eof"
        module.fail_json("pexpect_send_command_eof", **result)
    except pexpect.TIMEOUT:
        result["stderr"] = child.before.decode()
        result["return_code"] = "pexpect_send_command_timeout"
        module.fail_json("pexpect_send_command_timeout", **result)
    if i == 0:
        volumes = child.before.decode()
        # Handle if task is unsupported
        if "CMUC00234I" in volumes:
            output = f"\n#### </show{voltype}>\n"
            status = (
                f"{strftime('%Y-%m-%d %H:%M:%S')} - #### <show{voltype}>"
                f"{' ' * (30 - len(f'show{voltype}'))}: success\n"
            )
            write_to_file(module.params["out_file"], output)
            write_to_file(module.params["log_file"], status)
            stdout += status
            return stdout
    else:
        result["stderr"] = child.before.decode()
        result["return_code"] = "pexpect_send_command_unhandled"
        module.fail_json("pexpect_send_command_unhandled", **result)

    # Get the actual volume data
    volumelist = [volume.strip() for volume in volumes.split("\n") if volume.strip()]
    for volume in volumelist:
        output = ""
        try:  # pylint:disable=too-many-try-statements
            child.sendline(f"show{voltype} -bnr off -dev {device_id} {volume}")
            i = child.expect(PROMPT)
        except pexpect.EOF:
            result["stderr"] = child.before.decode()
            result["return_code"] = "pexpect_send_command_eof"
            module.fail_json("pexpect_send_command_eof", **result)
        except pexpect.TIMEOUT:
            result["stderr"] = child.before.decode()
            result["return_code"] = "pexpect_send_command_timeout"
            module.fail_json("pexpect_send_command_timeout", **result)
        if i == 0:
            output += (
                "\n".join(
                    line.strip() for line in child.before.decode().split("\n") if line.strip()
                )
                + "\n\n"
            )
            write_to_file(module.params["out_file"], output)
        else:
            result["stderr"] = child.before.decode()
            result["return_code"] = "pexpect_send_command_unhandled"
            module.fail_json("pexpect_send_command_unhandled", **result)
    output = f"\n#### </show{voltype}>\n"
    status = (
        f"{strftime('%Y-%m-%d %H:%M:%S')} - #### <show{voltype}>"
        f"{' ' * (30 - len(f'show{voltype}'))}: success\n"
    )
    write_to_file(module.params["out_file"], output)
    write_to_file(module.params["log_file"], status)
    stdout += status
    return stdout


def main():
    if not module.get_bin_path(module.params["vendor_cli"]):
        result["return_code"] = "prereq_vendorcli_missing"
        module.fail_json("prereq_vendorcli_missing", **result)

    child = authenticate(
        module.params["vendor_cli"],
        module.params["hostname"],
        module.params["username"],
        module.params["password"],
    )

    result["stdout"] += send_simple_command(child, simple_commands)

    # Get device_id for id_commands to work with
    i = None
    try:  # pylint:disable=too-many-try-statements
        child.sendline("showsi")
        i = child.expect(PROMPT)
    except pexpect.EOF:
        result["stderr"] = child.before.decode()
        result["return_code"] = "pexpect_send_command_eof"
        module.fail_json("pexpect_send_command_eof", **result)
    except pexpect.TIMEOUT:
        result["stderr"] = child.before.decode()
        result["return_code"] = "pexpect_send_command_timeout"
        module.fail_json("pexpect_send_command_timeout", **result)
    device_id = None
    if i == 0:
        device_id = (re.search(r"ID\s+(\S+)", child.before.decode())).group(1)
    else:
        result["stderr"] = child.before.decode()
        result["return_code"] = "pexpect_send_command_unhandled"
        module.fail_json("pexpect_send_command_unhandled", **result)

    result["stdout"] += send_id_command(child, id_commands, device_id)

    result["stdout"] += get_showuser(child, "showuser")

    # We got rid of showckdvol as it is not used, showfbvol is still in use
    # for voltype in ("fbvol", "ckdvol"):
    #     result["stdout"] += get_voldata(child, voltype, device_id)

    result["stdout"] += get_voldata(child, "fbvol", device_id)

    child.close(force=True)

    module.exit_json(**result)


if __name__ == "__main__":
    main()
