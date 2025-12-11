#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright: Contributors to the Ansible project
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

import os
from ansible.module_utils.basic import AnsibleModule  # pylint:disable=wrong-import-position

result = {"changed": False, "stdout": "", "return_code": "unexpected_failure"}

module = AnsibleModule(
    argument_spec=dict(
        scli_username=dict(type="str", required=False, no_log=True, default=""),
        scli_password=dict(type="str", required=False, no_log=True, default=""),
        host_ip=dict(type="str", required=True, no_log=False),
        vendor_cli=dict(type="str", required=True),
    ),
    supports_check_mode=False,
)


def main():
    if not module.get_bin_path(module.params["vendor_cli"]):
        result["return_code"] = "prereq_vendorcli_missing"
        module.fail_json("prereq_vendorcli_missing", **result)

    os.environ["SCLI_USERNAME"] = module.params["scli_username"]
    os.environ["SCLI_PASSWORD"] = module.params["scli_password"]

    command = (
        f"{module.params['vendor_cli']} --login --management_system_ip {module.params['host_ip']} "
        "--username $SCLI_USERNAME --password $SCLI_PASSWORD"
    )
    result["command"] = command

    rc, out, err = None, None, None
    try:
        rc, out, err = module.run_command(
            command,
            use_unsafe_shell=False,
            expand_user_and_vars=True,
        )
    except Exception as e:  # pylint:disable=broad-exception-caught
        module.fail_json(msg=str(e))

    result["rc"] = rc
    result["stdout"] = out.strip()
    result["stderr"] = err
    module.exit_json(**result)


if __name__ == "__main__":
    main()
