#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright: Contributors to the Ansible project
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

DOCUMENTATION = r"""
---
module: sat.udc.pexpect_xcli
version_added: '2.1'
short_description: Executes a command and responds to prompts
description:
    The M(sat.udc.pexpect_xcli) module enters an xcli shell using pexpect.
    Authentication happens using the credentials provided when calling the module.
    HC data is collected from the IBM XIV / A9000 server.
    Results are stored in a .out
    file while logs are kept in a .log file. When data collection is finished,
    pexpect's pseudo-tty is closed.
options:
  out_file:
    description:
      - Path to the .out file where results will be written
    required: true
    type: path
  log_file:
    description:
      - Path to the .log file where logs will be written
    required: true
    type: path
  host_ip:
    description:
      - management IP of the device
    required: true
    type: str
  xiv_xcliuser:
    description:
      - Username to authenticate with
    required: true
    type: str
  xiv_xclipassword:
    description:
      - Password to authenticate with
    required: true
    type: str
  vendor_cli:
    description:
      - xcli if binary in $PATH else the full path to the xcli binary
    required: true
    type: str
  udc_endpoint:
    description:
      - control variable to decide which set of commands to execute
    required: true
    type: str
requirements:
  - python >= 3.7
  - pexpect >= 4.8
  - xcli >= 5.5.4.1
attributes:
    check_mode:
        support: none
    diff_mode:
        support: none
    platform:
        support: full
        platforms: posix
notes:
  - The M(sat.udc.pexpect_xcli) module is designed B(only) to be run via
    UDC - Unified Data Collector.
author: "David Vaczi (david.vaczi@kyndryl.com)"
"""

EXAMPLES = r"""
- sat.udc.pexpect_xcli:
    out_file: "{{ temp_dir }}/{{ out_file }}"
    log_file: "{{ temp_dir }}/{{ log_file }}"
    host_ip: "{{ udc_device.host_ip }}"
    xiv_xcliuser: "{{ ansible_net_username | default(lookup('env', 'ANSIBLE_NET_USERNAME')) }}"
    # Passwords are hidden from the logs and handled securely
    xiv_xclipassword: "{{ ansible_net_password | default(lookup('env', 'ANSIBLE_NET_PASSWORD')) }}"
    vendor_cli: "{{ vendor_cli }}"
    udc_endpoint: "{{ udc_endpoint }}"
"""

import os  # pylint:disable=wrong-import-position
from importlib.util import find_spec  # pylint:disable=wrong-import-position
from time import strftime  # pylint:disable=wrong-import-position
from ansible.module_utils.basic import AnsibleModule  # pylint:disable=wrong-import-position

PROMPT = r"[\w-]+>>"

module = AnsibleModule(
    argument_spec=dict(
        host_ip=dict(type="str", required=True),
        xiv_xcliuser=dict(type="str", required=True),
        xiv_xclipassword=dict(type="str", required=True, no_log=True),
        vendor_cli=dict(type="str", required=True),
        out_file=dict(type="str", required=True),
        log_file=dict(type="str", required=True),
        udc_endpoint=dict(type="str", required=True),
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

xiv_commands = {
    "version_get": "version_get",
    "config_get": "config_get",
    "module_list": "module_list",
    "cluster_list": "cluster_list",
    "fc_port_list": "fc_port_list",
    "vol_list": "vol_list",
    "user_list": "user_list",
    "fc_connectivity_list": "fc_connectivity_list",
    "host_connectivity_list": "host_connectivity_list",
    "ipinterface_list": "ipinterface_list",
    "pool_list": "pool_list",
    "system_capacity_list": "system_capacity_list",
    "state_list": "state_list",
    "dest_list": "dest_list",
    "mirror_list_csv": "-s mirror_list -t all",
    "smtpgw_list": "smtpgw_list",
    "component_list": "component_list",
    "switch_list": "switch_list",
    "nic_list": "nic_list",
    "xiv_support_show": "xiv_support_show",
    "ldap_mode_get": "ldap_mode_get",
    "ldap_config_get": "ldap_config_get",
    "ipinterface_list_ports": "ipinterface_list_ports",
    "fc_port_list_csv": "-s fc_port_list -t all",
    "ipinterface_list_ports_csv": "-s ipinterface_list_ports -t all",
    "ipinterface_list_csv": "-s ipinterface_list -t all",
    "vol_list_csv": "-s vol_list -t all",
    "pool_list_csv": "-s pool_list -t all",
    "cg_list_csv": "-s cg_list -t all",
    "vpd_config_get": "vpd_config_get",
    "rule_list": "rule_list -s",
    "psu_list": "psu_list",
    "disk_list": "disk_list",
    "ssd_list": "ssd_list",
    "ups_list": "ups_list",
    "host_list_csv": "-s host_list -t all",
}

a9000_commands = {
    "version_get": "version_get",
    "config_get": "config_get",
    "module_list": "module_list",
    "cluster_list": "cluster_list",
    "fc_port_list": "fc_port_list",
    "vol_list": "vol_list",
    "user_list": "user_list",
    "fc_connectivity_list": "fc_connectivity_list",
    "host_connectivity_list": "host_connectivity_list",
    "ipinterface_list": "ipinterface_list",
    "pool_list": "pool_list",
    "system_capacity_list": "system_capacity_list",
    "state_list": "state_list",
    "dest_list": "dest_list",
    "mirror_list_csv": "-s mirror_list -t all",
    "smtpgw_list": "smtpgw_list",
    "component_list": "component_list",
    "switch_list": "switch_list",
    "nic_list": "nic_list",
    "xiv_support_show": "xiv_support_show",
    "ldap_mode_get": "ldap_mode_get",
    "ldap_config_get": "ldap_config_get",
    "ipinterface_list_ports": "ipinterface_list_ports",
    "fc_port_list_csv": "-s fc_port_list -t all",
    "ipinterface_list_ports_csv": "-s ipinterface_list_ports -t all",
    "ipinterface_list_csv": "-s ipinterface_list -t all",
    "vol_list_csv": "-s vol_list -t all",
    "pool_list_csv": "-s pool_list -t all",
    "cg_list_csv": "-s cg_list -t all",
    "vpd_config_get": "vpd_config_get",
    "rule_list": "rule_list -s",
    "flash_vdisk_list": "flash_vdisk_list",
    "flash_enclosure_list": "flash_enclosure_list",
    "flash_card_list": "flash_card_list",
    "flash_canister_list": "flash_canister_list",
    "flash_psu_list": "flash_psu_list",
    "flash_fan_list": "flash_fan_list",
    "flash_bbu_list": "-s flash_bbu_list",
    "flash_pib_list": "-s flash_pib_list",
    "flash_ib_adapter_list": "-s flash_ib_adapter_list",
    "flash_control_connectivity_list": "-s flash_control_connectivity_list",
    "flash_card_list_csv": "-s flash_card_list",
    "flash_led_card_list": "-s flash_led_card_list",
    "system_average_temperature": "-s system_average_temperature",
    "vault_device_list": "-s vault_device_list",
    "system_capacity_threshold_list": "system_capacity_threshold_list -s",
    "host_list_csv": "-s host_list -t all",
}


def authenticate(
    vendor_cli: str, host_ip: str, xiv_xcliuser: str, xiv_xclipassword: str
) -> pexpect.spawn:
    os.environ["XIV_XCLIUSER"] = xiv_xcliuser
    os.environ["XIV_XCLIPASSWORD"] = xiv_xclipassword
    child = pexpect.spawn(
        f"{vendor_cli} -m {host_ip}",
        env={"TERM": "dumb", **os.environ},
        timeout=180,
    )
    child.setecho(False)
    child.setwinsize(400, 400)

    i = None
    try:
        i = child.expect([PROMPT, "NO_CONNECTION", "USER_OR_PASSWORD_WRONG_OR_MISSING"])
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
        result["stderr"] = "Connection failure"
        result["return_code"] = "api_unreachable"
        module.exit_json(**result)
    if i == 2:
        result["failed"] = True
        result["stderr"] = "Authentication failure"
        result["return_code"] = "api_auth"
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


def send_command(child: pexpect.spawn, commands: dict) -> str:
    stdout = ""
    for header, command in commands.items():
        output = f"\n#### <{header}>\n"
        child.sendline(command)
        i = child.expect(PROMPT)
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
            # f"Output:\n{output}\n"
        )
        write_to_file(module.params["out_file"], output)
        write_to_file(module.params["log_file"], status)
        stdout += status
    return stdout


# This is entirely for getting the list of hosts from host_list
def get_hosts(lines: str, command: str) -> list:
    host_list = []
    if "No Hosts are defined" not in lines:
        host_list = [
            line.strip().split()[0]
            for line in lines.split("\n")
            if command not in line and not line.strip().startswith("Name") and line.strip()
        ]
    return host_list


def process_lines_for_mapping_list(lines: str, command: str, skip_header_line: bool) -> str:
    lines = lines.split("\n")
    if skip_header_line:
        return "\n".join(
            line.strip()
            for line in lines
            if command not in line and not line.strip().startswith("LUN") and line.strip()
        )
    return "\n".join(line.strip() for line in lines if command not in line and line.strip())


def get_host_list_and_mapping_list(child: pexpect.spawn) -> str:
    stdout = ""
    header = "host_list"
    command = "host_list -t all"
    output = f"\n#### <{header}>\n"
    child.sendline(command)
    i = child.expect(PROMPT)
    if i == 0:
        lines = child.before.decode()
        host_list = get_hosts(lines, command)
        output += process_lines(lines, command)
    else:
        result["stderr"] = child.before.decode()
        result["return_code"] = "pexpect_send_command_unhandled"
        module.fail_json("pexpect_send_command_unhandled", **result)
    output += f"\n#### </{header}>\n"
    status = (
        f"{strftime('%Y-%m-%d %H:%M:%S')} - #### <{header}>"
        f"{' ' * (30 - len(header))}: success\n"
        f"Host_list:\n{host_list}\n"
    )
    write_to_file(module.params["out_file"], output)
    write_to_file(module.params["log_file"], status)
    stdout += status

    # mappint_list part - with some redundant code
    header = "mapping_list"
    output = f"\n#### <{header}>\n"
    if host_list:
        skip_header_line = False
        for host in host_list:
            command = f"mapping_list host={host}"
            child.sendline(command)
            i = child.expect(PROMPT)
            if i == 0:
                lines = child.before.decode()
                output += process_lines_for_mapping_list(lines, command, skip_header_line)
                output += "\n"
                skip_header_line = True
            else:
                result["stderr"] = child.before.decode()
                result["return_code"] = "pexpect_send_command_unhandled"
                module.fail_json("pexpect_send_command_unhandled", **result)
    output += f"\n#### </{header}>\n"
    status = (
        f"{strftime('%Y-%m-%d %H:%M:%S')} - #### <{header}>"
        f"{' ' * (30 - len(header))}: success\n"
        # f"Output:\n{output}\n"
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
        module.params["host_ip"],
        module.params["xiv_xcliuser"],
        module.params["xiv_xclipassword"],
    )

    result["stdout"] += send_command(
        child, a9000_commands if module.params["udc_endpoint"] == "ibm_a9000" else xiv_commands
    )

    result["stdout"] += get_host_list_and_mapping_list(child)

    child.close(force=True)

    module.exit_json(**result)


if __name__ == "__main__":
    main()
