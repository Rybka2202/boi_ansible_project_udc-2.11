#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright: Contributors to the Ansible project
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

import os  # pylint:disable=wrong-import-position
import re  # pylint:disable=wrong-import-position
from importlib.util import find_spec  # pylint:disable=wrong-import-position
from time import strftime  # pylint:disable=wrong-import-position
from ansible.module_utils.basic import AnsibleModule  # pylint:disable=wrong-import-position

USER_PROMPT = "User name"
PASSWORD_PROMPT = "Password"
PROMPT = rb"(\x1b\]\d+;\?\x1b\\\x1b)*\[\d+;\d+mcli\x1b\[\dm> "

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

commands_dict = {
    "service_user_show": "service_user show -output csv",
    "service_user_id_1_show": "service_user -id 1 show -output csv",
    "alert_show_active": "alert show -query state=ACTIVE -output csv",
    "space_metrics_by_cluster": "metrics generate -entity space_metrics_by_cluster -entity_id 0 -output csv",
    "email_notify_destination_show": "email_notify_destination show -output csv",
    "login_message_show": "login_banner show -output csv",
    "ntp_show": "ntp show -output csv",
    "smtp_config_show": "smtp_config show -output csv",
    "appliance_show": "appliance show -output csv",
    "dns_show": "dns show -output csv",
    "hardware_show_Drive": "hardware show -query type=Drive -all -output csv",
    "hardware_show_M2_Drive": "hardware show -query type=M2_Drive -all -output csv",
    "hardware_show_Base_Enclosure": "hardware show -query type=Base_Enclosure -all -output csv",
    "hardware_show_Expansion_Enclosure": "hardware show -query type=Expansion_Enclosure -all -output csv",
    "hardware_show_Battery": "hardware show -query type=Battery -all -output csv",
    "hardware_show_Node": "hardware show -all -query type=Node -output csv",
    "eth_port_show": "eth_port show -output csv",
    "hardware_show_Fan": "hardware show -all -query type=Fan -output csv",
    "hardware_show_DIMM": "hardware show -all -query type=DIMM -output csv",
    "hardware_show_SFP": "hardware show -all -query type=SFP -output csv",
    "hardware_show_IO_Module": "hardware show -all -query type=IO_Module -output csv",
    "hardware_show_Power_Supply": "hardware show -all -query type=Power_Supply -output csv",
    "remote_syslog_server": "remote_syslog_server show -output csv",
    "network_show": "network show -output csv",
    "replication_session_Failed_Over": "replication_session show -all -query state=Failed_Over -output csv",
    "replication_session_Failing_Over": "replication_session show -all -query state=Failing_Over -output csv",
    "replication_session_Failing_Over_For_DR": "replication_session show -all -query state=Failing_Over_For_DR -output csv",
    "replication_session_Paused": "replication_session show -all -query state=Paused -output csv",
    "replication_session_Paused_For_Migration": "replication_session show -all -query state=Paused_For_Migration -output csv",
    "replication_session_Paused_For_NDU": "replication_session show -all -query state=Paused_For_NDU -output csv",
    "replication_session_Reprotecting": "replication_session show -all -query state=Reprotecting -output csv",
    "replication_session_Resuming": "replication_session show -all -query state=Resuming -output csv",
    "replication_session_Synchronizing": "replication_session show -all -query state=Synchronizing -output csv",
    "replication_session_System_Paused": "replication_session show -all -query state=System_Paused -output csv",
    "remote_system_show": "remote_system show -output csv",
    "snmp_server_show": "snmp_server show -output csv",
    "local_user_show": "local_user show -output csv",
    "ldap_domain_show": "ldap_domain show -output csv",
    "ldap_account_show": "ldap_account show -output csv",
    "remote_support_contact_show": "remote_support_contact show -output csv",
    "service_config_show": "service_config show -output csv",
    "host_show": "host show -output csv",
    "volume_show": "volume show -all -output csv",
    "discovered_initiator_show": "discovered_initiator show -output csv",
    "cluster_show": "cluster -id 0 show -output csv",
    "chap_config": "chap_config show -output csv",
    "service_config": "service_config show -output csv",
    "snmp_server": "snmp_server show -output csv",
    "security_config": "security_config show -output csv",
    "nvme_check": "host show -select initiators.port_type -output csv",
}


# pylint:disable=too-many-statements
def authenticate(vendor_cli: str, hostname: str, username: str, password: str) -> pexpect.spawn:
    child = pexpect.spawn(
        f"{vendor_cli} -d {hostname} -session -ssl accept",
        env={"TERM": "dumb", **os.environ},
        timeout=180,
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
        i = child.expect(
            [
                PROMPT,
                (
                    "You do not have access to perform the requested operation."
                    "Please check your credentials."
                ),
                "The system was unable establish a secure connection to the storage server.",
            ]
        )
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
        result["stderr"] = (
            (
                "You do not have access to perform the requested operation."
                "Please check your credentials."
            ),
        )
        result["return_code"] = "api_auth"
        module.exit_json(**result)
    if i == 2:
        result["failed"] = True
        result["stderr"] = (
            "The system was unable establish a secure connection to the storage server."
        )
        result["return_code"] = "api_unreachable"
        module.exit_json(**result)
    return child


def process_lines(lines: str, command: str) -> str:
    color_code_pattern = re.compile(r"\x1b")
    return "\n".join(
        line.strip()
        for line in lines.split("\n")
        if command not in line and line.strip() and not color_code_pattern.search(line)
    )


def write_to_file(file: str, output: str):
    try:  # pylint:disable=too-many-try-statements
        with open(file, mode="a", encoding="utf-8") as f:
            f.write(output)
    except IOError as e:
        result["return_code"] = "pexpect_wtf_ioerror_unhandled"
        module.fail_json("pexpect_wtf_ioerror_unhandled: {e}", **result)


def send_command(child: pexpect.spawn, commands: dict) -> str:
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
            f"{' ' * (50 - len(header))}: success\n"
        )
        write_to_file(module.params["out_file"], output)
        write_to_file(module.params["log_file"], status)
        stdout += status
    return stdout


def send_segment_id_command(child: pexpect.spawn, segment: str, base_cmd: str, id_cmd: str) -> str:
    stdout = ""
    command = f"{base_cmd} -output csv -noformat"
    header = segment
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
        raw_data = process_lines(child.before.decode(), command)
        id_data = raw_data.split("\n")
        id_data.pop(0)  # popping the csv header
        if not id_data:
            output += f"\n#### </{header}>\n"
            status = (
                f"{strftime('%Y-%m-%d %H:%M:%S')} - #### <{header}>"
                f"{' ' * (50 - len(f'{header}'))}: success\n"
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
    first_id = True
    for line in id_data:
        current_id = line.split(",")[0]
        command = f"{id_cmd} {current_id} show -output csv"
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
            if first_id:
                output += process_lines(lines, command)
                first_id = False
            else:
                output += "\n" + (process_lines(lines, command)).split("\n")[1]
        else:
            result["stderr"] = child.before.decode()
            result["return_code"] = "pexpect_send_command_unhandled"
            module.fail_json("pexpect_send_command_unhandled", **result)
    output += f"\n#### </{header}>\n"
    status = (
        f"{strftime('%Y-%m-%d %H:%M:%S')} - #### <{header}>"
        f"{' ' * (50 - len(header))}: success\n"
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

    result["stdout"] += send_command(child, commands_dict)

    result["stdout"] += send_segment_id_command(
        child, "snmp_server_id", "snmp_server show", "snmp_server -id"
    )

    result["stdout"] += send_segment_id_command(
        child, "ldap_domain_show_id", "ldap_domain show", "ldap_domain -id"
    )

    child.close(force=True)

    module.exit_json(**result)


if __name__ == "__main__":
    main()
