#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright: Contributors to the Ansible project
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

DOCUMENTATION = r"""
---
module: sat.udc.pexpect_dsmadmc
version_added: '2.0'
short_description: Executes a command and responds to prompts
description:
    The M(sat.udc.pexpect_dsmadmc) module enters a dsmadmc shell using pexpect.
    Authentication happens using the credentials provided when calling the module.
    HC data is collected from the Spectrum Protect server.
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
  hostname:
    description:
      - Name of the ISP device to connect to
    required: true
    type: str
  username:
    description:
      - Username to authenticate with
    required: true
    type: str
  password:
    description:
      - Password to authenticate with
    required: true
    type: str
  vendor_cli:
    description:
      - dsmadmc if binary in $PATH else the full path to the dsmadmc binary
    required: true
    type: str
requirements:
  - python >= 3.7
  - pexpect >= 4.8
  - dsmadmc >= 8.1
attributes:
    check_mode:
        support: none
    diff_mode:
        support: none
    platform:
        support: full
        platforms: posix
notes:
  - The M(sat.udc.pexpect_dsmadmc) module is designed B(only) to be run via
    UDC - Unified Data Collector.
author: "David Vaczi (david.vaczi@kyndryl.com)"
"""

EXAMPLES = r"""
- sat.udc.pexpect_dsmadmc:
    out_file: "{{ temp_dir }}/{{ out_file }}"
    log_file: "{{ temp_dir }}/{{ log_file }}"
    hostname: "{{ udc_device.host_name | default(udc_device.host_ip) }}"
    username: "{{ ansible_net_username | default(lookup('env', 'ANSIBLE_NET_USERNAME')) }}"
    # Passwords are hidden from the logs and handled securely
    password: "{{ ansible_net_password | default(lookup('env', 'ANSIBLE_NET_PASSWORD')) }}"
    vendor_cli: "{{ vendor_cli }}"
"""

import os  # pylint:disable=wrong-import-position
from importlib.util import find_spec  # pylint:disable=wrong-import-position
from time import strftime  # pylint:disable=wrong-import-position
from ansible.module_utils.basic import AnsibleModule  # pylint:disable=wrong-import-position

USER_PROMPT = "Enter your user id:"
PASSWORD_PROMPT = "Enter your password:"

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

csv_commands = {
    "admin_schedules_csv": "select * from admin_schedules",
    "activity_log_csv": "query act begind=-1",
    "node_csv": "query node",
    "opt_expinterval_csv": "query opt expinterval",
    "sessions_csv": "select * from sessions",
    "volhistory_csv": "select * from volhistory where type='BACKUPFULL'",
    "volumes_csv": "select * from volumes",
    "devclasses_csv": "select * from devclasses",
    "occupancy_csv": "select * from occupancy",
    "stgpools_csv": "select * from stgpools",
}

list_commands = {
    "admins": "select * from admins",
    "container": "select * from containers where STATE='UNAVAILABLE' OR STATE='READONLY'",
    "db": "select * from db",
    "event": "query event * t=a begind=-1",
    "libvolumes": "select * from libvolumes",
    "log": "select * from log",
    "nodes_without_association": (
        "select node_name,platform_name from nodes where "
        "node_name NOT IN (select node_name from associations) and "
        "REPL_MODE='SEND'"
    ),
    "status": "query status",
    "stgpools": "select * from stgpools",
    "nodes": "select * from nodes",
    "count_volumes": "select count(*) from libvolumes",
    "nodes_reported_size": (
        "SELECT node_name, SUM(reporting_mb) AS Occupancy " "FROM occupancy GROUP BY Node_name"
    ),
    "count_volumes_scratch": "select count(*) from libvolumes where status='Scratch'",
    "pools_pctusage": (
        "select stgpool_name,pooltype,devclass,stg_type,pct_utilized " "from stgpools"
    ),
    "pools_reported_size": (
        "select stgpool_name, SUM(EST_CAPACITY_MB) "
        "AS Occupancy FROM stgpools GROUP BY stgpool_name"
    ),
    "pendingcmd": "query pendingcmd",
    "library_offline": (
        "select source_name as Library_Manager, "
        "destination_name as LIBRARY_NAME, online "
        "from paths where destination_type='LIBRARY'"
    ),
    "drives": "select * from drives",
    "paths_offline": (
        "select source_name, destination_name, library_name " "from paths where online='NO'"
    ),
    "library": "select * from libraries",
    "occupancy_total": "select sum(reporting_mb)/1024/1024 as TOTAL_TB from occupancy",
    "lastacc_admin": (
        "select admin_name, locked from admins "
        "where date(LASTACC_TIME)<current_timestamp -30 days"
    ),
    "vm_fullbackup": (
        "select sub_entity,max(date(end_time)) from summary_extended where "
        "activity_details='VMware' and successful='YES' and activity='BACKUP' and "
        "activity_type='Incremental Forever - Full' and "
        "end_time >= (current_timestamp - 31 day) group by sub_entity"
    ),
    "vm_no_fullbackup": (
        "select distinct(sub_entity) from summary_extended where activity_details='VMware' "
        "and successful='YES' and activity='BACKUP' and activity_type like 'Incremental Forever%' "
        "and end_time >= (current_timestamp - 31 day) and sub_entity not in (select sub_entity "
        "from summary_extended where activity_details='VMware' and successful='YES' and "
        "activity='BACKUP' and activity_type='Incremental Forever - Full' and "
        "end_time >= (current_timestamp - 31 day))"
    ),
}


def authenticate(
    output_type: str, vendor_cli: str, hostname: str, username: str, password: str
) -> pexpect.spawn:
    """Function to authenticate with the ISP server.

    Parameters:
    output_type (str): Specifies the format of the data.
        Either "csv" for comma-separated values or "list" for a list format.
    vendor_cli (str): The dsmadmc binary to be used. "dsmadmc" if in $PATH else
        provide the full path to the binary.
    hostname (str): The name of the IBM Spectrum Protect host.
    username (str): The username to authenticate with.
    password (str): The password to use.

    Returns:
    pexpect.spawn: The created pexpect.spawn object.

    Note:
    This function uses the constants USER_PROMPT and PASSWORD_PROMPT
        which should be defined elsewhere in your code.
    """
    data_format = "-comma" if output_type == "csv" else "-display=list"

    child = pexpect.spawn(
        f"{vendor_cli} -se={hostname} -dataonly=yes {data_format}",
        env={"TERM": "dumb", **os.environ},
        timeout=14400,
    )
    child.setwinsize(400, 400)
    # pexpect_debug = open("/tmp/pexpect_debug.txt", "wb")
    # child.logfile = pexpect_debug

    try:  # pylint:disable=too-many-try-statements
        child.expect(USER_PROMPT)
        child.sendline(username)
        result["stdout"] += f"{strftime('%Y-%m-%d %H:%M:%S')} - Sending {username} as a response\n"

        child.expect(PASSWORD_PROMPT)
        child.sendline(password)
        result["stdout"] += f"{strftime('%Y-%m-%d %H:%M:%S')} - Sending password as a response\n"
    except pexpect.EOF:
        result["stderr"] = child.before.decode()
        result["return_code"] = "pexpect_auth_eof_unknown"
        module.fail_json("pexpect_auth_eof_unknown", **result)
    except pexpect.TIMEOUT:
        result["stderr"] = child.before.decode()
        result["return_code"] = "pexpect_auth_timeout_unknown"
        module.fail_json("pexpect_auth_timeout_unknown", **result)
    i = None
    try:
        i = child.expect(["Protect:", "ANS1051I"])
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
    return child


def process_lines(lines: str, command: str) -> str:
    """Processes the lines of output from the child process.

    Parameters:
    lines (str): The output from the child process.
    command (str): The command that was sent.

    Returns:
    str: The processed output.
    """
    return "\n".join(
        line
        for line in lines.split("\n")
        if "more...   (" not in line
        and "to continue, 'C' to cancel)" not in line
        and line.strip()
        and command not in line
    )


def write_to_file(file: str, output: str):
    """Very simple function to append a given output to the specified file.

    Parameters:
    file (str): The full or relative path to the file.
    output (str): The string to append to the file.

    Returns:
    None
    """
    try:  # pylint:disable=too-many-try-statements
        with open(file, mode="a", encoding="utf-8") as f:
            f.write(output)
    except IOError as e:
        result["return_code"] = "pexpect_wtf_ioerror_unhandled"
        module.fail_json("pexpect_wtf_ioerror_unhandled: {e}", **result)


def send_command(child: pexpect.spawn, commands: dict) -> str:
    """Sends commands to the ISP server and processes the output.

    Parameters:
    child (pexpect.spawn): The child process to send commands to.
    commands (dict): A dictionary of commands to send.

    Raises:
    RuntimeError: If an unexpected value is returned from child.expect.
    """
    stdout = ""
    for header, command in commands.items():
        output = f"\n#### <{header}>\n"
        child.sendline(command)
        while True:  # pylint:disable=while-used
            i = child.expect(["<ENTER>", "Protect:"])
            if i in {0, 1}:
                try:
                    lines = child.before.decode()
                except UnicodeDecodeError:
                    result["bytestr"] = child.before
                    result["stderr"] = (
                        "Byte sequence cannot be decoded into UTF-8 without data loss. Please configure the device to use en_US.utf8 encoding instead of the current one."
                    )
                    result["return_code"] = "wrong_encoding"
                    module.fail_json("wrong_encoding", **result)
                output += process_lines(lines, command)
                if i == 0:
                    child.send("\n")
                else:
                    break
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


def main():
    if not module.get_bin_path(module.params["vendor_cli"]):
        result["return_code"] = "prereq_vendorcli_missing"
        module.fail_json("prereq_vendorcli_missing", **result)

    child = authenticate(
        "csv",
        module.params["vendor_cli"],
        module.params["hostname"],
        module.params["username"],
        module.params["password"],
    )

    result["stdout"] += send_command(child, csv_commands)

    child.close(force=True)

    child = authenticate(
        "list",
        module.params["vendor_cli"],
        module.params["hostname"],
        module.params["username"],
        module.params["password"],
    )

    result["stdout"] += send_command(child, list_commands)

    child.close(force=True)

    module.exit_json(**result)


if __name__ == "__main__":
    main()
