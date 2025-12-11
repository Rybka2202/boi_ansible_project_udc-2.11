#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright: Contributors to the Ansible project
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

DOCUMENTATION = r"""
---
module: apic_aio
version_added: '2.0'
short_description: Get all the required data for UDC from APIC devices based on previous queries
description:
    The M(sat.udc.apic_aio) module creates the required inventory for SAT topology
    based on previous queries to api/class/topSystem.json and
    api/node/class/fabricNode.json?query-target=self&query-target-filter=ne(fabricNode.role,"controller").
options:
  mgmt_addresses:
    description:
      - Results of the call to topSystem
    required: true
    type: str
  inventory_list:
    description:
      - Results of the call to fabricNode
    required: true
    type: str
requirements:
  - python >= 3.7
attributes:
  check_mode:
    support: none
  diff_mode:
    support: none
  platform:
    support: full
    platform: posix
notes:
  - The M(sat.udc.apic_aio) module is designed B(only) to be run via
    UDC - Unified Data Collector.
author: "David Vaczi (david.vaczi@kyndryl.com)"
"""

EXAMPLES = r"""
- name: Data collection - topSystem
  cisco.aci.aci_rest:
    host: "{{ udc_device['host_ip'] }}"
    username: "{{ ansible_net_username | default(lookup('env', 'ANSIBLE_NET_USERNAME')) }}"
    password: "{{ ansible_net_password | default(lookup('env', 'ANSIBLE_NET_PASSWORD')) }}"
    validate_certs: "{{ verify_tls | default(false) }}"
    method: "get"
    path: 'api/class/topSystem.json'
  changed_when: false
  register: mgmt_addresses
  no_log: true
  ignore_errors: true
  ignore_unreachable: true

- name: Data collection - inventory_json
  cisco.aci.aci_rest:
    host: "{{ udc_device['host_ip'] }}"
    username: "{{ ansible_net_username | default(lookup('env', 'ANSIBLE_NET_USERNAME')) }}"
    password: "{{ ansible_net_password | default(lookup('env', 'ANSIBLE_NET_PASSWORD')) }}"
    validate_certs: "{{ verify_tls | default(false) }}"
    method: "get"
    path: 'api/node/class/fabricNode.json?query-target=self&query-target-filter=ne(fabricNode.role,"controller")'
  changed_when: false
  register: json_inventory
  no_log: true
  ignore_errors: true
  ignore_unreachable: true

- name: This is where the magic happens
  sat.udc.apic_aio:
    mgmt_addresses: "{{ mgmt_addresses.imdata | string }}"
    inventory_list: "{{ json_inventory.imdata | string }}"
  register: aio
  no_log: true
"""

import json  # pylint:disable=wrong-import-position
from ansible.module_utils.basic import AnsibleModule  # pylint:disable=wrong-import-position

result = {"changed": False, "failed": True}

module = AnsibleModule(
    argument_spec=dict(
        mgmt_addresses=dict(type="str", required=True),
        inventory_list=dict(type="str", required=True),
    ),
    supports_check_mode=False,
)


def main():  # pylint:disable=too-complex,too-many-branches
    try:  # pylint:disable=too-many-try-statements,too-many-nested-blocks
        mgmt_json = json.loads(module.params["mgmt_addresses"].replace("'", '"'))

        # Extract inbMgmtAddr and oobMgmtAddr
        acis = {}
        for item in mgmt_json:
            for node in item.values():
                for entry in node.values():
                    acis[entry["name"]] = {
                        "inbMgmtAddr": entry["inbMgmtAddr"],
                        "oobMgmtAddr": entry["oobMgmtAddr"],
                        "dn": entry["dn"],
                        "name": entry["name"],
                        "address": entry["address"],
                    }

        # Add inbMgmtAddr and oobMgmtAddr to inventory_json
        inventory_json = json.loads(module.params["inventory_list"].replace("'", '"'))
        for key, value in acis.items():
            for item in inventory_json:
                for node in item.values():
                    for entry in node.values():
                        if key == entry["name"]:
                            entry["inbMgmtAddr"] = value["inbMgmtAddr"]
                            entry["oobMgmtAddr"] = value["oobMgmtAddr"]

        # Create csv inventory
        save_header = True
        header = ""
        content = ""
        for item in inventory_json:
            for node in item.values():
                for entry in node.values():
                    for head, data in entry.items():
                        if save_header:
                            header += '"' + head + '",'
                        content += '"' + data + '",'
                    content = content[:-1]
                    content += "\n"
                    save_header = False

        # I already made the ansible part, so this will just align it...
        outlist = []
        for item in inventory_json:
            for node in item.values():
                for entry in node.values():
                    outlist.append(
                        {"dn": entry["dn"], "name": entry["name"], "address": entry["address"]}
                    )

        result["acis"] = acis
        result["aci"] = outlist
        result["json"] = inventory_json
        result["csv"] = header[:-1] + "\n" + content
        result["rc"] = 0
        result["failed"] = False
        module.exit_json(**result)
    except Exception as e:  # pylint:disable=broad-exception-caught
        module.fail_json(msg=str(e))


if __name__ == "__main__":
    main()
