#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright: Contributors to the Ansible project
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

import os  # pylint:disable=wrong-import-position
import requests  # pylint:disable=wrong-import-position
from importlib.util import find_spec  # pylint:disable=wrong-import-position
from time import strftime  # pylint:disable=wrong-import-position
from ansible.module_utils.basic import AnsibleModule  # pylint:disable=wrong-import-position

# DISABLE WARNINGS REGARDING SELF-SIGNED CERTIFICATES - NOT RECOMMENDED
# warnings.filterwarnings("ignore", message="Unverified HTTPS request")

# Define the conversion factor from bytes to terabytes
TB = 10**12
DATEFORMAT = "%Y-%m-%d %H:%M:%S"

result = {"changed": False, "stdout": "", "return_code": "unexpected_failure"}

module = AnsibleModule(
    argument_spec=dict(
        access_token_uri=dict(type="str", required=True),
        client_id=dict(type="str", required=True),
        client_secret=dict(type="str", required=True, no_log=True),
        out_file=dict(type="str", required=True),
        log_file=dict(type="str", required=True),
    ),
    supports_check_mode=False,
)

# Setting Credentials
os.environ["CLIENT_ID"] = module.params["client_id"]
os.environ["CLIENT_SECRET"] = module.params["client_secret"]
os.environ["ACCESS_TOKEN_URI"] = module.params["access_token_uri"]

if find_spec("pandas") is not None:
    import pandas as pd
else:
    result["return_code"] = "prereq_pandas_missing"
    module.fail_json("prereq_pandas_missing", **result)


# ------------------------------------------------------------------------------------------------------------------------
def write_to_file(file: str, output: str):
    try:  # pylint:disable=too-many-try-statements
        with open(file, mode="a", encoding="utf-8") as f:
            f.write(output)
    except IOError as e:
        result["return_code"] = "python_wtf_ioerror_unhandled"
        module.fail_json("python_wtf_ioerror_unhandled: {e}", **result)


# ------------------------------------------------------------------------------------------------------------------------
def msg_print(msg):
    log_file = module.params["log_file"]
    udc_date = strftime(DATEFORMAT)
    status = f"{udc_date} - {msg}\n"
    result["stdout"] += status
    write_to_file(log_file, status)


# ------------------------------------------------------------------------------------------------------------------------
def write_result(section, result):
    out_file = module.params["out_file"]
    startidx = f"#### <{section}>"
    endidx = f"#### </{section}>"
    segment = f"\n{startidx}\n{result}{endidx}\n"
    write_to_file(out_file, segment)


# ------------------------------------------------------------------------------------------------------------------------
# Initial auth to get the access_token
def rubrik_auth():
    try:  # pylint:disable=too-many-try-statements
        client_id = os.environ["CLIENT_ID"]
        client_secret = os.environ["CLIENT_SECRET"]
        access_token_uri = os.environ["ACCESS_TOKEN_URI"]
    except KeyError:
        raise KeyError("Credential missing...")

    payload = {
        "grant_type": "client_credentials",
        "client_id": client_id,
        "client_secret": client_secret,
    }

    local_headers = {"Content-Type": "application/json", "Accept": "application/json"}

    response = requests.post(access_token_uri, headers=local_headers, json=payload)

    if response.status_code != 200:
        raise ValueError(f"Not 200, got {response.status_code}")
    msg_print("Authentication success - access_token received")
    return response.json()["access_token"]


# ------------------------------------------------------------------------------------------------------------------------
# Setting up environment for data collection
def module_setup():
    global endpoint
    global headers
    rubrik_connection = {
        "url": os.environ["ACCESS_TOKEN_URI"].replace("/api/client_token", ""),
        "token": rubrik_auth(),
    }

    # GrapQL API URL
    endpoint = rubrik_connection["url"] + "/api/graphql"

    headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": f"Bearer {rubrik_connection['token']}",
    }


# ------------------------------------------------------------------------------------------------------------------------
def cluster_info():
    segment = "cluster_info"

    # --------------------------------------------------------------------------------------------------------------------
    # Handling pagination is not implemented - if there are more than one pages we will have partial info
    def get_nodelist(after_cursor=""):
        variables = {
            "sortBy": "ClusterName",
            "sortOrder": "ASC",
            "filter": {
                "id": [],
                "name": [""],
                "type": [],
                "orgId": [],
                "systemStatus": [],
                "connectionState": [],
                "productType": ["CDM", "CLOUD_DIRECT", "DATOS"],
            },
        }
        if after_cursor != "":
            variables["after"] = after_cursor
        query = """
        query AllClusterListTableQuery($after: String, $filter: ClusterFilterInput, $sortBy: ClusterSortByEnum, $sortOrder: SortOrder) {
            allClusterConnection(filter: $filter, sortBy: $sortBy, sortOrder: $sortOrder, after: $after) {
                edges {
                    cursor
                    node {
                        id
                        name
                        pauseStatus
                        defaultAddress
                        version
                        status
                        systemStatus
                        systemStatusAffectedNodes {
                            id
                            __typename
                        }
                        clusterNodeConnection {
                            count
                            __typename
                            nodes {
                                clusterId
                                id
                                status
                                ipAddress
                                __typename
                            }
                        }
                        connectivityLastUpdated
                        type
                        metric {
                            usedCapacity
                            availableCapacity
                            totalCapacity
                            __typename
                        }
                        allOrgs {
                            name
                            __typename
                        }
                    }
                    __typename
                }
                pageInfo {
                    startCursor
                    endCursor
                    hasNextPage
                    hasPreviousPage
                    __typename
                }
                count
                __typename
            }
        }
        """
        payload = {"query": query, "variables": variables}
        # Error handling !!!
        response = requests.post(endpoint, headers=headers, json=payload)
        # print(json.dumps(response.json(), indent=4))
        return response.json()

    # --------------------------------------------------------------------------------------------------------------------

    nodelist = get_nodelist()["data"]["allClusterConnection"]["edges"]
    nodearray = []
    for node in nodelist:
        nodeinfo = node["node"]
        if nodeinfo["metric"] is None:
            nodeinfo["metric"] = {}
        info = {
            "Cluster Name": nodeinfo["name"],
            "Cluster UUID": nodeinfo["id"],
            "Cluster Version": nodeinfo["version"],
            "Cluster UsedCapacity": nodeinfo["metric"].get("usedCapacity", 0) / TB,
            "Cluster AvailableCapacity": nodeinfo["metric"].get("availableCapacity", 0) / TB,
            "Cluster TotalCapacity": nodeinfo["metric"].get("totalCapacity", 0) / TB,
        }
        nodearray.append(info)

    df = pd.DataFrame(nodearray)
    result = df.to_csv(sep=";", index=False)
    write_result(segment, result)
    msg_print(f"#### <{segment}>: success")


# ------------------------------------------------------------------------------------------------------------------------
def lockout():
    segment = "lockout"

    # --------------------------------------------------------------------------------------------------------------------
    def get_lockout():
        query = """
        query LockoutConfigQuery {
            lockoutConfig {
                loginAttemptsLimit
                selfServiceTokenValidityInMins
                selfServiceAttemptsLimit
                accountAutoUnlockDurationInMins
                isSelfServiceEnabled
                isBruteForceLockoutEnabled
                isAutoUnlockFeatureEnabled
                __typename
            }
            orgSecurityPolicy {
                disallowWeakerPolicy
                __typename
            }
        }
        """
        payload = {"query": query}
        # Error handling !!!
        response = requests.post(endpoint, headers=headers, json=payload)
        # print(json.dumps(response.json(), indent=4))
        return response.json()

    # --------------------------------------------------------------------------------------------------------------------
    data = get_lockout().get("data")
    if data is None:
        data = {}
    info = {
        "LockoutEnabled": data.get("lockoutConfig", {}).get("isBruteForceLockoutEnabled", ""),
        "LoginAttempt": data.get("lockoutConfig", {}).get("loginAttemptsLimit", ""),
    }
    df = pd.DataFrame([info])
    result = df.to_csv(sep=";", index=False)
    write_result(segment, result)
    msg_print(f"#### <{segment}>: success")


# ------------------------------------------------------------------------------------------------------------------------
def mfa():
    segment = "mfa"

    # --------------------------------------------------------------------------------------------------------------------
    def get_mfa():
        query = """
        query MfaSettingQuery {
            mfaSetting {
                isTotpEnforcedGlobal
                totpReminderHours
                mfaRememberHours
                isTotpGlobalEnforceLocked
                __typename
            }
            orgSecurityPolicy {
                disallowWeakerPolicy
                __typename
            }
        }
        """
        payload = {"query": query}
        # Error handling !!!
        response = requests.post(endpoint, headers=headers, json=payload)
        # print(json.dumps(response.json(), indent=4))
        return response.json()

    # --------------------------------------------------------------------------------------------------------------------
    data = get_mfa().get("data")
    if data is None:
        data = {}
    info = {
        "TOTP Global Enforce Locked": data.get("mfaSetting", {}).get(
            "isTotpGlobalEnforceLocked", ""
        ),
    }
    df = pd.DataFrame([info])
    result = df.to_csv(sep=";", index=False)
    write_result(segment, result)
    msg_print(f"#### <{segment}>: success")


# ------------------------------------------------------------------------------------------------------------------------


def main():
    module_setup()
    cluster_info()
    lockout()
    mfa()
    # Exit module
    module.exit_json(**result)


if __name__ == "__main__":
    main()
