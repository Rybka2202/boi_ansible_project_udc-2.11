#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright: Contributors to the Ansible project
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

DOCUMENTATION = r"""
---
module: sat.udc.pwsh_command
version_added: '2.0'
short_description: Run arbitrary UDC-specific commands on UNIX endpoints
description:
    The M(sat.udc.pwsh_command) module runs arbitrary commands on UNIX endpoints,
     but it's tailored to specific Powershell commands to jumpstart
     UDC's data collection.
options:
  chdir:
    description:
      - Directory to execute the command in
    required: true
    type: str
  command:
    description:
      - Command to execute
    required: true
    type: str
  vmware_user:
    description:
      - VMware user to authenticate with
    type: str
  vmware_password:
    description:
      - VMware password to authenticate with
    type: str
  vmware_rootpwd:
    description:
      - VMware root password to elevate privileges with
    type: str
  vmware_ssouser:
    description:
      - VMware SSO user to authenticate with
    type: str
  vmware_ssopwd:
    description:
      - VMware SSO password to authenticate with
    type: str
  azure_subscription_id:
    description:
      - Azure subscription ID to use for Azure data collection. Primary key.
    type: str
  azure_client_id:
    description:
      - Azure client ID to use for Azure data collection
    type: str
  azure_secret:
    description:
      - Azure secret to use for Azure data collection
    type: str
  azure_tenant:
    description:
      - Azure tenant ID to use for Azure data collection
    type: str
requirements:
  - python >= 3.7
  - powershell >= 7.3
attributes:
    check_mode:
        support: none
    diff_mode:
        support: none
    platform:
        support: full
        platforms: posix
notes:
  - The M(sat.udc.pwsh_command) module is designed B(only) to be run via
    UDC - Unified Data Collector.
author: "David Vaczi (david.vaczi@kyndryl.com)"
"""

EXAMPLES = r"""
- name: Run the script
  sat.udc.pwsh_command:
    chdir: "{{ temp_dir }}"
    azure_subscription_id: "{{ azure_subscription_id | default(lookup('env', 'AZURE_SUBSCRIPTION_ID')) }}"
    azure_client_id: "{{ azure_client_id | default(lookup('env', 'AZURE_CLIENT_ID')) }}"
    azure_secret: "{{ azure_secret | default(lookup('env', 'AZURE_SECRET')) }}"
    azure_tenant: "{{ azure_tenant | default(lookup('env', 'AZURE_TENANT')) }}"
    command: >-
      pwsh ./microsoft_ap_azure.global.ps1 -udcmode -gsma {{ account_code }} -inventoryname {{ inventory_hostname }} {%
      if udc_debug | default(False) | bool %}-Debug $true{% endif %}
  register: script_result
  ignore_errors: true
  changed_when: false
  no_log: "{{ not udc_debug | default(false) | bool }}"

- name: Run the script
  sat.udc.pwsh_command:
    chdir: "{{ temp_dir }}"
    vmware_user: "{{ vmware_user | default(lookup('env', 'VMWARE_USER')) }}"
    vmware_password: "{{ vmware_password | default(lookup('env', 'VMWARE_PASSWORD')) }}"
    vmware_rootpwd: "{{ vmware_rootpwd | default(lookup('env', 'VMWARE_ROOTPWD')) }}"
    vmware_ssouser: "{{ vmware_ssouser | default(lookup('env', 'VMWARE_SSOUSER')) }}"
    vmware_ssopwd: "{{ vmware_ssopwd | default(lookup('env', 'VMWARE_SSOPWD')) }}"
    command: |-
      pwsh './vmware_ap_vcenter.global.ps1' -udcmode -server {{ ansible_env.VMWARE_HOST }} -account '{{ account }}' -blueid '{{ blueid }}' \
      -satteam '{{ satteam }}' -hwswdomain '{{ hwswdomain }}' -chipid '{{ chipid }}' -location '{{ location }}' -outfile ./{{ ansible_env.VMWARE_HOST }}.out
  async: 86400
  poll: 0
  changed_when: false
  register: script_result
  no_log: "{{ not udc_debug | default(false) | bool }}"
  become: false
"""

from ansible.module_utils.basic import AnsibleModule  # pylint:disable=wrong-import-position

result = {"changed": False}

module = AnsibleModule(
    argument_spec=dict(
        # Common
        chdir=dict(type="str", required=True),
        command=dict(type="str", required=True),
        # VMware specific
        vmware_user=dict(type="str", required=False, no_log=True, default=""),
        vmware_password=dict(type="str", required=False, no_log=True, default=""),
        vmware_rootpwd=dict(type="str", required=False, no_log=True, default=""),
        vmware_ssouser=dict(type="str", required=False, no_log=True, default=""),
        vmware_ssopwd=dict(type="str", required=False, no_log=True, default=""),
        # Azure specific
        azure_subscription_id=dict(type="str", required=False, default=""),
        azure_client_id=dict(type="str", required=False, default=""),
        azure_secret=dict(type="str", required=False, no_log=True, default=""),
        azure_tenant=dict(type="str", required=False, default=""),
        # AWS specific
        aws_access_key_id=dict(type="str", required=False, default=""),
        aws_secret_access_key=dict(type="str", required=False, no_log=True, default=""),
        aws_security_token=dict(type="str", required=False, no_log=True, default=""),
        aws_region=dict(type="str", required=False, default=""),
        # GCP specific
        gce_email=dict(type="str", required=False, no_log=True, default=""),
        gce_project=dict(type="str", required=False, default=""),
        gce_credentials_file_path=dict(type="str", required=False, no_log=True, default=""),
    ),
    supports_check_mode=False,
)


def main():
    env = {
        "VMWARE_USER": module.params["vmware_user"],
        "VMWARE_PASSWORD": module.params["vmware_password"],
        "ESX_vCenter_user": module.params["vmware_user"],
        "ESX_vCenter_password": module.params["vmware_password"],
        "VMWARE_ROOTPWD": module.params["vmware_rootpwd"],
        "VMWARE_SSOUSER": module.params["vmware_ssouser"],
        "VMWARE_SSOPWD": module.params["vmware_ssopwd"],
        "AZURE_SUBSCRIPTION_ID": module.params["azure_subscription_id"],
        "AZURE_CLIENT_ID": module.params["azure_client_id"],
        "AZURE_SECRET": module.params["azure_secret"],
        "AZURE_TENANT": module.params["azure_tenant"],
        "AWS_ACCESS_KEY_ID": module.params["aws_access_key_id"],
        "AWS_SECRET_ACCESS_KEY": module.params["aws_secret_access_key"],
        "AWS_SECURITY_TOKEN": module.params["aws_security_token"],
        "AWS_DEFAULT_REGION": module.params["aws_region"],
        "GCE_EMAIL": module.params["gce_email"],
        "GCE_PROJECT": module.params["gce_project"],
        "GCE_CREDENTIALS_FILE_PATH": module.params["gce_credentials_file_path"],
    }

    command = module.params["command"]
    result["command"] = command

    rc, out, err = None, None, None
    try:
        rc, out, err = module.run_command(
            command,
            use_unsafe_shell=False,
            expand_user_and_vars=True,
            cwd=module.params["chdir"],
            environ_update=env,
        )
    except Exception as e:  # pylint:disable=broad-exception-caught
        module.fail_json(msg=str(e))

    result["rc"] = rc
    result["stdout"] = out.strip()
    result["stderr"] = err
    module.exit_json(**result)


if __name__ == "__main__":
    main()
