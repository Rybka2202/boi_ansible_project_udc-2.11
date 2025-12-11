#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright: Contributors to the Ansible project
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

import os  # pylint:disable=wrong-import-position
import warnings  # pylint:disable=wrong-import-position
import requests  # pylint:disable=wrong-import-position
from ansible.module_utils.basic import AnsibleModule  # pylint:disable=wrong-import-position

# Turn off warnings for self-signed certificates
warnings.filterwarnings("ignore", message="Unverified HTTPS request")

DATEFORMAT = "%Y-%m-%dT%H.%M.%S"

module = AnsibleModule(
    argument_spec=dict(
        verify_ssl=dict(type="bool", default=False),
        template_id=dict(type="str", required=True),
    ),
    supports_check_mode=False,
)

# Default values for module results
result = {
    "changed": False,
    "stdout": "",
    "return_code": "unexpected_failure",
}

# ANSIBLE PARAMETERS
# Whether or not we want only verified https connections
verify_ssl = module.params["verify_ssl"]
template_id = module.params["template_id"]


def main():
    try:  # pylint:disable=too-many-try-statements
        controller_host = os.environ["TOWER_HOST"]
        controller_oauth_token = os.environ["TOWER_OAUTH_TOKEN"]
    except KeyError:
        fail_udc("missing_aap_credential")

    headers = {"Authorization": f"Bearer {controller_oauth_token}"}

    # Job template query
    q_url = f"{controller_host}/api/v2/job_templates/{template_id}/"
    response = requests.get(
        q_url,
        headers=headers,
        verify=verify_ssl,
    )
    result["credentials"] = ",".join(
        [str(credential["id"]) for credential in response.json()["summary_fields"]["credentials"]]
    )

    # Project query
    # Removed / from the end as the response already contains it
    q_url = f"{controller_host}/{response.json()['related']['project']}"
    response = requests.get(
        q_url,
        headers=headers,
        verify=verify_ssl,
    )
    result["scm_url"] = response.json()["scm_url"]

    # Controller version query
    q_url = f"{controller_host}/api/v2/config/"
    response = requests.get(
        q_url,
        headers=headers,
        verify=verify_ssl,
    )
    result["tower_version"] = response.json()["version"]

    result.pop("return_code", "")
    module.exit_json(**result)


def fail_udc(message):
    result["return_code"] = message
    module.fail_json(message, **result)


if __name__ == "__main__":
    main()
