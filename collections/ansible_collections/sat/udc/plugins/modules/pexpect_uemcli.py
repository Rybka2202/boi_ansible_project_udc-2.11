#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright: Contributors to the Ansible project
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

import os  # pylint:disable=wrong-import-position
from importlib.util import find_spec  # pylint:disable=wrong-import-position
from time import strftime  # pylint:disable=wrong-import-position
from ansible.module_utils.basic import AnsibleModule  # pylint:disable=wrong-import-position

PASSWORD_PROMPT = "Password:"

module = AnsibleModule(
    argument_spec=dict(
        host_ip=dict(type="str", required=True),
        username=dict(type="str", required=True),
        password=dict(type="str", required=True, no_log=True),
        command=dict(type="str", required=True),
        vendor_cli=dict(type="str", required=True),
    ),
    supports_check_mode=False,
)

result = {
    "changed": False,
    "log": "",
    "stdout": "",
    "rc": 0,
}

if find_spec("pexpect") is not None:
    import pexpect
else:
    result["rc"] = 20
    result["failed"] = True
    module.fail_json(
        "You must have the pexpect python module installed to "
        "use this Ansible module. "
        "Common command is: pip3 install pexpect",
        **result,
    )


def execute_command(
    vendor_cli: str, host_ip: str, username: str, password: str, input_command: str
) -> pexpect.spawn:
    result["command"] = (
        f"{vendor_cli} -d {host_ip} -u {username} "
        f"-securePassword -silent -sslPolicy store {input_command}"
    )
    child = pexpect.spawn(
        (
            f"{vendor_cli} -d {host_ip} -u {username} "
            f"-securePassword -silent -sslPolicy store {input_command}"
        ),
        env={"TERM": "dumb", **os.environ},
        timeout=180,
    )
    child.setecho(False)

    try:  # pylint:disable=too-many-try-statements
        child.expect(PASSWORD_PROMPT)
        child.sendline(password)
        result["log"] += f"{strftime('%Y-%m-%d %H:%M:%S')} - Sending password as a response\n"
    except pexpect.EOF:
        # Get some useful info on why EOF happened
        result["stderr"] = child.before.decode()
        result["rc"] = 10
        result["failed"] = True
        module.fail_json(
            "Failed to spawn pseudo-tty. Please make sure that ssh pipelining is "
            "disabled. This can be achieved by defining 'ansible_ssh_pipelining: "
            "false' as an extra var. This error can also mean that uemcli is not "
            "properly configured.",
            **result,
        )
    except pexpect.TIMEOUT:
        # Get some useful info on why TIMEOUT happened
        result["stderr"] = child.before.decode()
        result["rc"] = 10
        result["failed"] = True
        module.fail_json(
            "TIMEOUT happened during Authentication phase. This might indicate that "
            "the EMC Unity server is unreachable. Please check if you can "
            "manually connect to the device from the launch node using uemcli.",
            **result,
        )
    try:
        child.expect(pexpect.EOF)
    except pexpect.TIMEOUT:
        # Get some useful info on why TIMEOUT happened
        result["stderr"] = child.before.decode()
        result["rc"] = 10
        result["failed"] = True
        module.fail_json(
            "TIMEOUT happened during Authentication phase. This might indicate that "
            "the EMC Unity server is unreachable. Please check if you can "
            "manually connect to the device from the launch node using uemcli.",
            **result,
        )
    return child


def main():
    if not module.get_bin_path(module.params["vendor_cli"]):
        result["rc_message"] = (
            f"Required {module.params['vendor_cli']} is not installed or "
            "it is not in the user's $PATH"
        )
        module.fail_json(result["rc_message"], **result)

    child = execute_command(
        module.params["vendor_cli"],
        module.params["host_ip"],
        module.params["username"],
        module.params["password"],
        module.params["command"],
    )

    if (
        "The system was unable to connect to the storage server. (Error Code:0x100000a)"
        in child.before.decode()
    ):
        result["rc"] = 255
        result["failed"] = True
        result["unreachable"] = True
        result["stderr"] = child.before.decode()
    elif (
        "You do not have access to perform the requested operation. (Error Code:0x6000001)"
        in child.before.decode()
    ):
        result["rc"] = 5
        result["failed"] = True
        result["stderr"] = child.before.decode()
    elif (
        "The requested object could not be found on the system. Recheck the command name. (Error Code:0x1000300)"
        in child.before.decode()
    ):
        result["rc"] = 1
        result["failed"] = True
        result["stderr"] = child.before.decode()
    else:
        result["stdout"] = child.before.decode()

    child.close(force=True)

    module.exit_json(**result)


if __name__ == "__main__":
    main()
