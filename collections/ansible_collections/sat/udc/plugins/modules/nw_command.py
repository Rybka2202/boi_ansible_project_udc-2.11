#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright: Contributors to the Ansible project
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

DOCUMENTATION = r"""
---
module: sat.udc.nw_command
version_added: '2.0'
short_description: Run arbitrary commands on network endpoints
description:
    The M(sat.udc.nw_command) is module used to run arbitrary commands
    on network endpoints using the Netmiko python library
    to collect data for UDC.
options:
  host:
    description:
      - Host to connect with
    required: true
    type: str
  device_type:
    description:
      - Type of the device according to Netmiko
    required: true
    type: str
  username:
    description:
      - User to authenticate with
    required: true
    type: str
  password:
    description:
      - Password to authenticate with
    required: true
    type: str
  command:
    description:
      - Command to execute
    required: true
    type: str
  config_mode:
    description:
      - Whether to enter config mode or not
    type: bool
  enable:
    description:
      - Whether to enter enable mode or not
    type: bool
  enable_password:
    description:
      - Password to authenticate for enable mode
    type: str
  session_debug:
    description:
      - Generates netmiko_session_log and reads its contents to the registered output
    type: bool
requirements:
  - python >= 3.7
  - netmiko >= 4.0.0
attributes:
    check_mode:
        support: none
    diff_mode:
        support: none
    platform:
        support: full
        platforms: posix
notes:
  - The M(sat.udc.nw_command) module is designed B(only) to be run via
    UDC - Unified Data Collector.
author: "David Vaczi (david.vaczi@kyndryl.com)"
"""

EXAMPLES = r"""
- name: Data collection
  sat.udc.nw_command:
    host: "{{ ansible_host }}"
    username: "{{ ansible_user }}"
    password: "{{ ansible_password }}"
    command: "{{ commands.command }}"
    device_type: "{{ netmiko_device_type }}"
    config_mode: "{{ commands.config_mode | default(omit) }}"
    enable: "{{ commands.become | default(omit) }}"
    enable_password: "{{ ansible_become_password | default(omit) }}"
    session_debug: "{{ udc_netmiko_debug | default(False) | bool }}"
  delegate_to: "{{ delegation_target }}"
  register: cmdout
  no_log: true
  ignore_errors: true
  ignore_unreachable: true
"""

import os  # pylint:disable=wrong-import-position
import logging  # pylint:disable=wrong-import-position
from importlib.util import find_spec  # pylint:disable=wrong-import-position
from ansible.module_utils.basic import AnsibleModule  # pylint:disable=wrong-import-position

result = {"changed": False}


def main():
    module = AnsibleModule(
        argument_spec=dict(
            host=dict(required=True),
            device_type=dict(required=True),
            username=dict(required=True),
            password=dict(required=True, no_log=True),
            command=dict(required=True, type="str"),
            config_mode=dict(required=False, type="bool"),
            enable=dict(required=False, type="bool"),
            enable_password=dict(required=False, no_log=True),
            session_debug=dict(required=False, type="bool", default=False),
            expect_string=dict(required=False, type="str", default=None),
        )
    )

    if find_spec("netmiko") is not None:
        from netmiko import ConnectHandler
    else:
        module.fail_json(
            "NETMIKO MISSING: You must have the netmiko (>=4.0.0) python module installed to "
            "use this Ansible module. "
            "Common command is: pip3 install 'netmiko>=4.0.0'",
            **result,
        )

    device_type = module.params["device_type"]
    host = module.params["host"]
    username = module.params["username"]
    password = module.params["password"]
    command = module.params["command"]
    ssh_config = "/tmp/ssh_config"

    config_mode = (
        module.params["config_mode"] if module.params["config_mode"] is not None else False
    )
    enable = module.params["enable"] if module.params["enable"] is not None else False
    enable_password = (
        module.params["enable_password"] if module.params["enable_password"] is not None else ""
    )

    expect_string = (
        module.params["expect_string"] if module.params["expect_string"] is not None else None
    )

    device = {
        "device_type": device_type,
        "host": host,
        "username": username,
        "password": password,
        "ssh_config_file": ssh_config,
        "conn_timeout": 60,
    }
    if len(enable_password) > 0:
        device["secret"] = enable_password
    if module.params["session_debug"]:
        device["session_log"] = "/tmp/netmiko_session.log"
        logging.basicConfig(filename="/tmp/netmiko_ssh.log", level=logging.DEBUG)
    try:  # pylint:disable=too-many-try-statements
        net_connect = ConnectHandler(**device)
        if config_mode:
            net_connect.config_mode()
        if enable and len(enable_password) > 0:
            net_connect.enable()
        # read_timeout is only supported in netmiko >= 4.0.0
        output = net_connect.send_command(command, read_timeout=300, expect_string=expect_string)
        net_connect.disconnect()
        if "Invalid syntax." in output:
            result["failed"] = True
            result["rc"] = 1
            result["stderr"] = output.strip()
            result["stdout"] = ""
        elif "Unknown command" in output:
            result["failed"] = True
            result["rc"] = 3
            result["stderr"] = output.strip()
            result["stdout"] = ""
        elif "Invalid input detected at" in output:
            result["failed"] = True
            result["rc"] = 3
            result["stderr"] = output.strip()
            result["stdout"] = ""
        else:
            result["rc"] = 0
            result["stdout"] = output.strip()
        result["command"] = command
        if module.params["session_debug"]:
            with open("/tmp/netmiko_session.log", "r") as logfile:
                loglines = logfile.readlines()
                result["netmiko_session_log"] = [line for line in loglines if line.strip()]
            os.remove("/tmp/netmiko_session.log")
            os.remove("/tmp/netmiko_ssh.log")
        module.exit_json(**result)
    except Exception as e:  # pylint:disable=broad-exception-caught
        if module.params["session_debug"]:
            with open("/tmp/netmiko_ssh.log", "r") as logfile:
                result["logger_results"] = logfile.readlines()
            os.remove("/tmp/netmiko_session.log")
            os.remove("/tmp/netmiko_ssh.log")
        module.fail_json(msg=str(e), **result)


if __name__ == "__main__":
    main()
