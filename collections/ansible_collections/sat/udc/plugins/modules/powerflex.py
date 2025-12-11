#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright: Contributors to the Ansible project
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

import warnings  # pylint:disable=wrong-import-position
from time import strftime  # pylint:disable=wrong-import-position
import requests  # pylint:disable=wrong-import-position
import copy  # pylint:disable=wrong-import-position

from ansible.module_utils.basic import AnsibleModule

# Turn off warnings for self-signed certificates
warnings.filterwarnings("ignore", message="Unverified HTTPS request")
warnings.filterwarnings("ignore", category=DeprecationWarning)

# Default values for module results
result = {"changed": False, "stdout": "", "return_code": "unexpected_failure"}

module = AnsibleModule(
    argument_spec=dict(
        out_file=dict(type="str", required=True),
        log_file=dict(type="str", required=True),
        api_url=dict(type="str", required=True),
        api_user=dict(type="str", required=True),
        api_password=dict(type="str", required=True, no_log=True),
        verify_ssl=dict(type="bool", default=False),
        timeout=dict(type="str", default="300"),
        udc_debug=dict(type="bool", default=False),
    ),
    supports_check_mode=False,
)

DATEFORMAT = "%Y-%m-%dT%H.%M.%S"

OUT_FILE = module.params["out_file"]
LOG_FILE = module.params["log_file"]
URL = module.params["api_url"]
USER = module.params["api_user"]
PASSWORD = module.params["api_password"]
VERIFY = module.params["verify_ssl"]
TIMEOUT = int(module.params["timeout"])
UDC_DEBUG = module.params["udc_debug"]

# proxies = {"http": "socks5://localhost:1080", "https": "socks5://localhost:1080"}


def write_output(segment_data):
    with open(OUT_FILE, mode="a", encoding="utf-8") as f:
        f.write(segment_data + "\n")


def write_log(status):
    with open(LOG_FILE, mode="a", encoding="utf-8") as f:
        result["stdout"] += status
        f.write(status)


###################################################################################################
###################################################################################################


def query_api(session, url):
    response = session.get(url, timeout=TIMEOUT)
    status = f"{strftime(DATEFORMAT)} - GET request success for {url} - RC:{response.status_code}\n"
    write_log(status)

    return response


###################################################################################################
###################################################################################################


def login_to_pf():
    login_url = f"{URL}/api/login"
    session = requests.Session()
    session.verify = VERIFY
    # session.proxies = proxies
    try:
        response = session.get(login_url, auth=(USER, PASSWORD), timeout=TIMEOUT)
    except ConnectionError as e:
        result["return_code"] = "login_failure"
        status = f"{strftime(DATEFORMAT)} - Login failure\n"
        write_log(status)
        module.fail_json(msg=e, **result)
    status = f"{strftime(DATEFORMAT)} - Login to {login_url} successful with RC: {response.status_code}\n"
    write_log(status)
    # This token is valid for 8 hours from the time it was created,
    # unless there has been no activity for 10 minutes, or if the client has sent a logout request.
    token = response.text.replace('"', "")
    session.headers.update(
        (
            {
                "Authorization": f"Bearer {token}",
                "Content-Type": "application/json",
                "Accept": "application/json",
            }
        )
    )
    return session


###################################################################################################
###################################################################################################


def get_system_info(session):
    # https://www.dell.com/support/manuals/hu-hu/scaleio/vxf_p_rest_api_reference_guide_3_x_sw/system?guid=guid-54394ce6-3d15-45a1-be25-b4b222297417&lang=en-us
    def build_system_info(data):
        header = "#### <system_info>"
        footer = "#### </system_info>"
        segment_data = f"{header}\n"
        if data:
            data_dict = {
                "id": data.get("id", ""),
                "name": data.get("name", ""),
                "systemVersionName": data.get("systemVersionName", ""),
                "mdmManagementPort": data.get("mdmManagementPort", ""),
                "capacityAlertHighThresholdPercent": data.get(
                    "capacityAlertHighThresholdPercent", ""
                ),
                "capacityAlertCriticalThresholdPercent": data.get(
                    "capacityAlertCriticalThresholdPercent", ""
                ),
                "installId": data.get("installId", ""),
                "swid": data.get("swid", ""),
                "daysInstalled": data.get("daysInstalled", ""),
                "maxCapacityInGb": data.get("maxCapacityInGb", ""),
                "capacityTimeLeftInDays": data.get("capacityTimeLeftInDays", ""),
                "enterpriseFeaturesEnabled": data.get("enterpriseFeaturesEnabled", ""),
                "isInitialLicense": data.get("isInitialLicense", ""),
                "upgradeState": data.get("upgradeState", ""),
                "perfProfile": data.get("perfProfile", ""),
                "cliPasswordAllowed": data.get("cliPasswordAllowed", ""),
                "managementClientSecureCommunicationEnabled": data.get(
                    "managementClientSecureCommunicationEnabled", ""
                ),
                "tlsVersion": data.get("tlsVersion", ""),
                "showGuid": data.get("showGuid", ""),
                "authenticationMethod": data.get("authenticationMethod", ""),
                "restrictedSdcModeEnabled": data.get("restrictedSdcModeEnabled", ""),
                "restrictedSdcMode": data.get("restrictedSdcMode", ""),
                "remoteReadOnlyLimitState": data.get("remoteReadOnlyLimitState", ""),
                "defragmentationEnabled": data.get("defragmentationEnabled", ""),
                "addressSpaceUsage": data.get("addressSpaceUsage", ""),
                "upgradeStartVersion": data.get("upgradeStartVersion", ""),
                "lastUpgradeTime": data.get("lastUpgradeTime", ""),
            }
            csv_header = ";".join([f'"{key}"' for key in data_dict.keys()])
            csv_content = ";".join([f'"{value}"' for value in data_dict.values()])
            segment_data += f"{csv_header}\n{csv_content}\n"
        segment_data += f"{footer}\n"
        status = f"{strftime(DATEFORMAT)} - Building {header} segment: success\n"
        write_log(status)
        write_output(segment_data)

    def build_mdm_cluster(data):
        data = data.get("mdmCluster", "")
        header = "#### <mdm_cluster>"
        footer = "#### </mdm_cluster>"
        segment_data = f"{header}\n"
        # Our final list with all the data
        data_list = []
        if data:
            # Common set of data for every CSV line
            data_dict = {
                "system_name": data.get("name", ""),
                "clusterState": data.get("clusterState", ""),
                "clusterMode": data.get("clusterMode", ""),
                "goodNodesNum": data.get("goodNodesNum", ""),
                "goodReplicasNum": data.get("goodReplicasNum", ""),
                "virtualIps": ",".join([ip for ip in data.get("virtualIps") or []]),
            }

            def add_node_lines(node, mdm_type):
                if node:
                    data_line = copy.deepcopy(data_dict)
                    data_line.update({"mdm_type": mdm_type})
                    data_line.update({"role": node.get("role", "")})
                    data_line.update({"name": node.get("name", "")})
                    data_line.update({"id": node.get("id", "")})
                    data_line.update({"port": node.get("port", "")})
                    data_line.update({"ips": ",".join([ip for ip in node.get("ips") or []])})
                    data_line.update(
                        {"managementIPs": ",".join([ip for ip in node.get("managementIPs") or []])}
                    )
                    data_line.update({"status": node.get("status", "")})
                    data_line.update({"versionInfo": node.get("versionInfo", "")})
                    data_line.update(
                        {
                            "virtualInterfaces": ",".join(
                                [intf for intf in node.get("virtualInterfaces") or []]
                            )
                        }
                    )
                    data_line.update({"opensslVersion": node.get("opensslVersion", "")})

                    data_list.append(data_line)

            # Create lines for each node of type slaves, tieBreakers and standbyMDMs
            for mdm_type in ["slaves", "tieBreakers", "standbyMDMs"]:
                mdm_nodes = data.get(mdm_type, "")
                for node in mdm_nodes:
                    add_node_lines(node, mdm_type)

            # Create a line for the master mdm node
            add_node_lines(data.get("master", ""), "master")

        # Construct the segment
        csv_header_added = False
        for line in data_list:
            if not csv_header_added:
                csv_header = ";".join([f'"{key}"' for key in line.keys()])
                segment_data += f"{csv_header}\n"
                csv_header_added = True
            csv_content = ";".join([f'"{value}"' for value in line.values()])
            segment_data += f"{csv_content}\n"
        segment_data += f"{footer}\n"
        status = f"{strftime(DATEFORMAT)} - Building {header} segment: success\n"
        write_log(status)
        write_output(segment_data)

    response = query_api(session, f"{URL}/api/types/System/instances")
    if response.status_code == 200:
        # First element of the list, it is safe to assume we'll have only one instance
        data = response.json()[0]
        build_system_info(data)
        build_mdm_cluster(data)

        # Return the data as the MDM MI check will have some more work with it
        return data

    else:
        status = f"{strftime(DATEFORMAT)} - Failed to get system_info, possible permission issues, failing collector\n"
        write_log(status)
        module.fail_json(msg="status", **result)
    # We should abort execution here when converting to an ansible module


###################################################################################################
###################################################################################################


def get_sds_info(session):
    # https://www.dell.com/support/manuals/hu-hu/scaleio/vxf_p_rest_api_reference_guide_3_x_sw/sds?guid=guid-80807a43-fe8b-44f6-be5a-bcfa62029528&lang=en-us
    def build_sds_info(data):
        header = "#### <sds_info>"
        footer = "#### </sds_info>"
        # Our final list with all the data
        data_list = []
        if data:
            for sds in data:
                data_line = {
                    "id": sds.get("id", ""),
                    "name": sds.get("name", ""),
                    "ipList": ",".join([ip.get("ip", "") for ip in sds.get("ipList") or []]),
                    "port": sds.get("port", ""),
                    "sdsState": sds.get("sdsState", ""),
                    "membershipState": sds.get("membershipState", ""),
                    "mdmConnectionState": sds.get("mdmConnectionState", ""),
                    "drlMode": sds.get("drlMode", ""),
                    "rmcacheEnabled": sds.get("rmcacheEnabled", ""),
                    "rmcacheSizeInKb": sds.get("rmcacheSizeInKb", ""),
                    "rmcacheFrozen": sds.get("rmcacheFrozen", ""),
                    "protectionDomainId": sds.get("protectionDomainId", ""),
                    "onVmWare": sds.get("onVmWare", ""),
                    "faultSetId": sds.get("faultSetId", ""),
                    "numOfIoBuffers": sds.get("numOfIoBuffers", ""),
                    "RmcacheMemoryAllocationState": sds.get("RmcacheMemoryAllocationState", ""),
                    "perfProfile": sds.get("perfProfile", ""),
                    "maintenanceState": sds.get("maintenanceState", ""),
                    "softwareVersionInfo": sds.get("softwareVersionInfo", ""),
                    "rfcacheEnabled": sds.get("rfcacheEnabled", ""),
                    "rfcacheErrorDeviceDoesNotExis": sds.get("rfcacheErrorDeviceDoesNotExis", ""),
                    "rfcacheErrorLowResources": sds.get("rfcacheErrorLowResources", ""),
                    "rfcacheErrorApiVersionMismatch": sds.get("rfcacheErrorApiVersionMismatch", ""),
                    "rfcacheErrorInconsistentCacheConfiguration": sds.get(
                        "rfcacheErrorInconsistentCacheConfiguration", ""
                    ),
                    "rfcacheErrorInconsistentSourceConfiguration": sds.get(
                        "rfcacheErrorInconsistentSourceConfiguration", ""
                    ),
                    "rfcacheErrorInvalidDriverPath": sds.get("rfcacheErrorInvalidDriverPath", ""),
                    "authenticationError": sds.get("authenticationError", ""),
                    "fglNumConcurrentWrites": sds.get("fglNumConcurrentWrites", ""),
                    "lastUpgradeTime": sds.get("lastUpgradeTime", ""),
                    "numRestarts": sds.get("numRestarts", ""),
                    "fglMetasdsCacheState": sds.get("fglMetasdsCacheState", ""),
                    "fglMetasdsCacheSize": sds.get("fglMetasdsCacheSize", ""),
                    "maintenanceType": sds.get("maintenanceType", ""),
                }
                data_list.append(data_line)

        # Create the final segment
        segment_data = f"{header}\n"
        csv_header_added = False
        for line in data_list:
            if not csv_header_added:
                csv_header = ";".join([f'"{key}"' for key in line.keys()])
                segment_data += f"{csv_header}\n"
                csv_header_added = True
            csv_content = ";".join([f'"{value}"' for value in line.values()])
            segment_data += f"{csv_content}\n"
        segment_data += f"{footer}\n"
        status = f"{strftime(DATEFORMAT)} - Building {header} segment: success\n"
        write_log(status)
        write_output(segment_data)

    response = query_api(session, f"{URL}/api/types/Sds/instances")
    data = response.json()
    build_sds_info(data)

    # Return the data as the MDM MI check will have some more work with it
    return data


###################################################################################################
###################################################################################################


def get_sdc_info(session):
    # https://www.dell.com/support/manuals/hu-hu/scaleio/vxf_p_rest_api_reference_guide_3_x_sw/sdc?guid=guid-72901b94-3548-4d03-a4d5-1f79689a46f5&lang=en-us
    def build_sdc_info(data):
        header = "#### <sdc_info>"
        footer = "#### </sdc_info>"
        # Our final list with all the data
        data_list = []
        if data:
            for sdc in data:
                data_line = {
                    "id": sdc.get("id", ""),
                    "name": sdc.get("name", ""),
                    "sdcIp": sdc.get("sdcIp", ""),
                    "sdcIps": ",".join([ip for ip in sdc.get("sdcIps") or []]),
                    "sdcApprovedIps": ",".join([ip for ip in sdc.get("sdcApprovedIps") or []]),
                    "softwareVersionInfo": sdc.get("softwareVersionInfo", ""),
                    "installedSoftwareVersionInfo": sdc.get("installedSoftwareVersionInfo", ""),
                    "kernelVersion": sdc.get("kernelVersion", ""),
                    "kernelBuildNumber": sdc.get("kernelBuildNumber", ""),
                    "osType": sdc.get("osType", ""),
                    "sdcGuid": sdc.get("sdcGuid", ""),
                    "onVmWare": sdc.get("onVmWare", ""),
                    "mdmConnectionState": sdc.get("mdmConnectionState", ""),
                    "systemId": sdc.get("systemId", ""),
                    "sdcApproved": sdc.get("sdcApproved", ""),
                    "versionInfo": sdc.get("versionInfo", ""),
                    "perfProfile": sdc.get("perfProfile", ""),
                    "sdcType": sdc.get("sdcType", ""),
                    "sdrId": sdc.get("sdrId", ""),
                    "peerMdmId": sdc.get("peerMdmId", ""),
                }
                data_list.append(data_line)

        # Create the final segment
        segment_data = f"{header}\n"
        csv_header_added = False
        for line in data_list:
            if not csv_header_added:
                csv_header = ";".join([f'"{key}"' for key in line.keys()])
                segment_data += f"{csv_header}\n"
                csv_header_added = True
            csv_content = ";".join([f'"{value}"' for value in line.values()])
            segment_data += f"{csv_content}\n"
        segment_data += f"{footer}\n"
        status = f"{strftime(DATEFORMAT)} - Building {header} segment: success\n"
        write_log(status)
        write_output(segment_data)

    response = query_api(session, f"{URL}/api/types/Sdc/instances")
    data = response.json()
    build_sdc_info(data)


###################################################################################################
###################################################################################################


def get_sdr_info(session):
    # https://www.dell.com/support/manuals/hu-hu/scaleio/vxf_p_rest_api_reference_guide_3_x_sw/sdr?guid=guid-ff793e89-dbcb-4be2-9ba6-19a1be7c7630&lang=en-us
    def build_sdr_info(data):
        header = "#### <sdr_info>"
        footer = "#### </sdr_info>"
        # Our final list with all the data
        data_list = []
        if data:
            for sdr in data:
                data_line = {
                    "id": sdr.get("id", ""),
                    "name": sdr.get("name", ""),
                    "port": sdr.get("port", ""),
                    "systemId": sdr.get("systemId", ""),
                    "ipList": ",".join([ip.get("ip", "") for ip in sdr.get("ipList") or []]),
                    "softwareVersionInfo": sdr.get("softwareVersionInfo", ""),
                    "sdrState": sdr.get("sdrState", ""),
                    "membershipState": sdr.get("membershipState", ""),
                    "maintenanceState": sdr.get("maintenanceState", ""),
                    "perfProfile": sdr.get("perfProfile", ""),
                    "authenticationError": sdr.get("authenticationError", ""),
                    "protectionDomainId": sdr.get("protectionDomainId", ""),
                }
                data_list.append(data_line)

        # Create the final segment
        segment_data = f"{header}\n"
        csv_header_added = False
        for line in data_list:
            if not csv_header_added:
                csv_header = ";".join([f'"{key}"' for key in line.keys()])
                segment_data += f"{csv_header}\n"
                csv_header_added = True
            csv_content = ";".join([f'"{value}"' for value in line.values()])
            segment_data += f"{csv_content}\n"
        segment_data += f"{footer}\n"
        status = f"{strftime(DATEFORMAT)} - Building {header} segment: success\n"
        write_log(status)
        write_output(segment_data)

    response = query_api(session, f"{URL}/api/types/Sdr/instances")
    data = response.json()
    build_sdr_info(data)


###################################################################################################
###################################################################################################


def get_disconnections(session, system_id):
    # https://www.dell.com/support/manuals/hu-hu/scaleio/vxf_p_rest_api_reference_guide_3_x_sw/query-disconnections?guid=guid-ec0d20e3-8b69-4436-881c-80c008e7796d&lang=en-us
    def build_disconnections(data):
        header = "#### <disconnections>"
        footer = "#### </disconnections>"
        segment_data = f"{header}\n"
        if data:
            csv_header = ";".join([f'"{key}"' for key in data.keys()])
            csv_content = ";".join([f'"{value}"' for value in data.values()])
            segment_data += f"{csv_header}\n{csv_content}\n"
        segment_data += f"{footer}\n"
        status = f"{strftime(DATEFORMAT)} - Building {header} segment: success\n"
        write_log(status)
        write_output(segment_data)

    # This one is unique as it needs a POST request and disconnectionType as parameter
    # I have no idea how the output should look like if not empty as Dell has no examples
    # in the API reference
    url = f"{URL}/api/instances/System::{system_id}/action/queryDisconnections"
    payload = {"disconnectionType": "All"}
    response = session.post(url, timeout=TIMEOUT, json=payload)
    status = (
        f"{strftime(DATEFORMAT)} - POST request success for {url} - RC:{response.status_code}\n"
    )
    write_log(status)
    data = response.json()
    build_disconnections(data)


###################################################################################################
###################################################################################################


def get_protection_domain(session):
    # https://www.dell.com/support/manuals/hu-hu/scaleio/vxf_p_rest_api_reference_guide_3_x_sw/protection-domain?guid=guid-8ad4b67c-216d-483b-9872-8db705922444&lang=en-us
    def build_protection_domain(data):
        header = "#### <protection_domain>"
        footer = "#### </protection_domain>"
        # Our final list with all the data
        data_list = []
        if data:
            for domain in data:
                data_line = {
                    "id": domain.get("id", ""),
                    "name": domain.get("name", ""),
                    "protectionDomainState": domain.get("protectionDomainState", ""),
                    "rebuildNetworkThrottlingEnabled": domain.get(
                        "rebuildNetworkThrottlingEnabled", ""
                    ),
                    "rebalanceNetworkThrottlingEnabled": domain.get(
                        "rebalanceNetworkThrottlingEnabled", ""
                    ),
                    "overallIoNetworkThrottlingEnabled": domain.get(
                        "overallIoNetworkThrottlingEnabled", ""
                    ),
                    "rebuildNetworkThrottlingInKbps": domain.get(
                        "rebuildNetworkThrottlingInKbps", ""
                    ),
                    "rebalanceNetworkThrottlingInKbps": domain.get(
                        "rebalanceNetworkThrottlingInKbps", ""
                    ),
                    "overallIoNetworkThrottlingInKbps": domain.get(
                        "overallIoNetworkThrottlingInKbps", ""
                    ),
                    "systemId": domain.get("systemId", ""),
                    "rfcacheEnabled": domain.get("rfcacheEnabled", ""),
                    "rfcachePageSizeKb": domain.get("rfcachePageSizeKb", ""),
                    "rfcacheMaxIoSizeKb": domain.get("rfcacheMaxIoSizeKb", ""),
                    "rfcacheOpertionalMode": domain.get("rfcacheOpertionalMode", ""),
                    "vtreeMigrationNetworkThrottlingEnabled": domain.get(
                        "vtreeMigrationNetworkThrottlingEnabled", ""
                    ),
                    "vtreeMigrationNetworkThrottlingInKbps": domain.get(
                        "vtreeMigrationNetworkThrottlingInKbps", ""
                    ),
                    "rfcacheAccpId": domain.get("rfcacheAccpId", ""),
                    "fglDefaultNumConcurrentWrites": domain.get(
                        "fglDefaultNumConcurrentWrites", ""
                    ),
                    "fglDefaultMetadataCacheSize": domain.get("fglDefaultMetadataCacheSize", ""),
                    "protectedMaintenanceModeNetworkThrottlingEnabled": domain.get(
                        "protectedMaintenanceModeNetworkThrottlingEnabled", ""
                    ),
                    "protectedMaintenanceModeNetworkThrottlingInKbps": domain.get(
                        "protectedMaintenanceModeNetworkThrottlingInKbps", ""
                    ),
                    "replicationCapacityMaxRatio": domain.get("replicationCapacityMaxRatio", ""),
                }
                data_list.append(data_line)

        # Create the final segment
        segment_data = f"{header}\n"
        csv_header_added = False
        for line in data_list:
            if not csv_header_added:
                csv_header = ";".join([f'"{key}"' for key in line.keys()])
                segment_data += f"{csv_header}\n"
                csv_header_added = True
            csv_content = ";".join([f'"{value}"' for value in line.values()])
            segment_data += f"{csv_content}\n"
        segment_data += f"{footer}\n"
        status = f"{strftime(DATEFORMAT)} - Building {header} segment: success\n"
        write_log(status)
        write_output(segment_data)

    response = query_api(session, f"{URL}/api/types/ProtectionDomain/instances")
    data = response.json()
    build_protection_domain(data)


###################################################################################################
###################################################################################################


# This one does not even have ANY entry in the API reference guide...
def get_login_banner(session):
    def build_login_banner(data):
        header = "#### <login_banner>"
        footer = "#### </login_banner>"
        segment_data = f"{header}\n"
        if data:
            csv_header = ";".join([f'"{key}"' for key in data.keys()])
            csv_content = ";".join([f'"{value}"' for value in data.values()])
            segment_data += f"{csv_header}\n{csv_content}\n"
        segment_data += f"{footer}\n"
        status = f"{strftime(DATEFORMAT)} - Building {header} segment: success\n"
        write_log(status)
        write_output(segment_data)

    response = query_api(session, f"{URL}/rest/v1/login-banners")
    try:
        data = response.json()
    except requests.exceptions.JSONDecodeError:
        data = {}
    build_login_banner(data)


###################################################################################################
###################################################################################################


def get_replication_pair(session):
    def build_replication_pair(data):
        header = "#### <replication_pair>"
        footer = "#### </replication_pair>"
        data_list = []
        if data:
            for rp in data:
                data_line = {
                    "id": rp.get("id", ""),
                    "name": rp.get("name", ""),
                    "remoteId": rp.get("remoteId", ""),
                    "userRequestedPauseTransmitInitCopy": rp.get(
                        "userRequestedPauseTransmitInitCopy", ""
                    ),
                    "remoteCapacityInMB": rp.get("remoteCapacityInMB", ""),
                    "localVolumeId": rp.get("localVolumeId", ""),
                    "remoteVolumeId": rp.get("remoteVolumeId", ""),
                    "remoteVolumeName": rp.get("remoteVolumeName", ""),
                    "replicationConsistencyGroupId": rp.get("replicationConsistencyGroupId", ""),
                    "copyType": rp.get("remotcopyTypeeId", ""),
                    "lifetimeState": rp.get("lifetimeState", ""),
                    "peerSystemName": rp.get("peerSystemName", ""),
                    "initialCopyState": rp.get("initialCopyState", ""),
                    "initialCopyPriority": rp.get("initialCopyPriority", ""),
                }
                data_list.append(data_line)

        # Create the final segment
        segment_data = f"{header}\n"
        csv_header_added = False
        for line in data_list:
            if not csv_header_added:
                csv_header = ";".join([f'"{key}"' for key in line.keys()])
                segment_data += f"{csv_header}\n"
                csv_header_added = True
            csv_content = ";".join([f'"{value}"' for value in line.values()])
            segment_data += f"{csv_content}\n"
        segment_data += f"{footer}\n"
        status = f"{strftime(DATEFORMAT)} - Building {header} segment: success\n"
        write_log(status)
        write_output(segment_data)

    response = query_api(session, f"{URL}/api/types/ReplicationPair/instances")
    data = response.json()
    build_replication_pair(data)


###################################################################################################
###################################################################################################


def get_replication_consistency_group(session):
    def build_replication_consistency_group(data):
        header = "#### <replication_consistency_group>"
        footer = "#### </replication_consistency_group>"
        data_list = []
        if data:
            for rpcg in data:
                data_line = {
                    "id": rpcg.get("id", ""),
                    "name": rpcg.get("name", ""),
                    "remoteId": rpcg.get("remoteId", ""),
                    "remoteMdmId": rpcg.get("remoteMdmId", ""),
                    "rpoInSeconds": rpcg.get("rpoInSeconds", ""),
                    "replicationDirection": rpcg.get("replicationDirection", ""),
                    "currConsistMode": rpcg.get("currConsistMode", ""),
                    "freezeState": rpcg.get("freezeState", ""),
                    "pauseMode": rpcg.get("pauseMode", ""),
                    "lifetimeState": rpcg.get("lifetimeState", ""),
                    "snapCreationInProgress": rpcg.get("snapCreationInProgress", ""),
                    "peerMdmId": rpcg.get("peerMdmId", ""),
                    "disasterRecoveryState": rpcg.get("disasterRecoveryState", ""),
                    "remoteDisasterRecoveryState": rpcg.get("remoteDisasterRecoveryState", ""),
                    "type": rpcg.get("type", ""),
                    "protectionDomainId": rpcg.get("protectionDomainId", ""),
                    "reremoteProtectionDomainIdmoteId": rpcg.get("remoteProtectionDomainId", ""),
                    "targetVolumeAccessMode": rpcg.get("targetVolumeAccessMode", ""),
                    "failoverType": rpcg.get("failoverType", ""),
                    "failoverState": rpcg.get("failoverState", ""),
                    "activeLocal": rpcg.get("activeLocal", ""),
                    "activeRemote": rpcg.get("activeRemote", ""),
                    "abstractState": rpcg.get("abstractState", ""),
                    "error": rpcg.get("error", ""),
                }
                data_list.append(data_line)

        # Create the final segment
        segment_data = f"{header}\n"
        csv_header_added = False
        for line in data_list:
            if not csv_header_added:
                csv_header = ";".join([f'"{key}"' for key in line.keys()])
                segment_data += f"{csv_header}\n"
                csv_header_added = True
            csv_content = ";".join([f'"{value}"' for value in line.values()])
            segment_data += f"{csv_content}\n"
        segment_data += f"{footer}\n"
        status = f"{strftime(DATEFORMAT)} - Building {header} segment: success\n"
        write_log(status)
        write_output(segment_data)

    response = query_api(session, f"{URL}/api/types/ReplicationConsistencyGroup/instances")
    data = response.json()
    build_replication_consistency_group(data)


###################################################################################################
###################################################################################################


# This one does not even have ANY entry in the API reference guide...
def get_dispatch_policies(session):
    def build_dispatch_policies(data):
        header = "#### <dispatch_policies>"
        footer = "#### </dispatch_policies>"
        data_list = []
        if data:
            for policy in data:
                data_line = {
                    "id": policy.get("id", ""),
                    "name": policy.get("name", ""),
                    "severity": ",".join([severity for severity in policy.get("severity") or []]),
                    "source": policy.get("source", ""),
                    "status": policy.get("status", ""),
                    "syslog_severity": policy.get("syslog_severity", ""),
                    "facility": policy.get("facility", ""),
                    "domain": policy.get("domain", ""),
                    "destination": ",".join(
                        [str(dest) for dest in policy.get("destination") or []]
                    ),
                    "description": policy.get("description", ""),
                    "active": policy.get("active", ""),
                }
                data_list.append(data_line)

        # Create the final segment
        segment_data = f"{header}\n"
        csv_header_added = False
        for line in data_list:
            if not csv_header_added:
                csv_header = ";".join([f'"{key}"' for key in line.keys()])
                segment_data += f"{csv_header}\n"
                csv_header_added = True
            csv_content = ";".join([f'"{value}"' for value in line.values()])
            segment_data += f"{csv_content}\n"
        segment_data += f"{footer}\n"
        status = f"{strftime(DATEFORMAT)} - Building {header} segment: success\n"
        write_log(status)
        write_output(segment_data)

    response = query_api(session, f"{URL}/rest/v1/dispatch-policies")
    data = response.json().get("results", [])
    build_dispatch_policies(data)


###################################################################################################
###################################################################################################


# https://www.dell.com/support/manuals/hu-hu/scaleio/vxf_p_rest_api_reference_guide_3_x_sw/volume?guid=guid-666d5daa-01ef-46b6-ad73-a7511b7c4822&lang=en-us
def get_volumes(session):
    def build_volumes(data):
        header = "#### <volumes>"
        footer = "#### </volumes>"
        data_list = []
        if data:
            for volume in data:
                data_line = {
                    "id": volume.get("id", ""),
                    "name": volume.get("name", ""),
                    "sizeInKb": volume.get("sizeInKb", ""),
                    "creationTime": volume.get("creationTime", ""),
                    "volumeType": volume.get("volumeType", ""),
                    "consistencyGroupId": volume.get("consistencyGroupId", ""),
                    "mappingToAllSdcsEnabled": volume.get("mappingToAllSdcsEnabled", ""),
                    # "mappedSdcInfo" is erronously "mappedSdcInfoList" in the API reference guide
                    # Here we only provide if there are ANY Sdc mappings in place as that's enough
                    # to validate the best practice check for orphan volumes
                    "mapped_to_clients": True if volume.get("mappedSdcInfo", "") else False,
                    "ancestorVolumeId": volume.get("ancestorVolumeId", ""),
                    "vtreeId": volume.get("vtreeId", ""),
                    "storagePoolId": volume.get("storagePoolId", ""),
                    "notGenuineSnapshot": volume.get("notGenuineSnapshot", ""),
                    "useRmcache": volume.get("useRmcache", ""),
                    "managedBy": volume.get("managedBy", ""),
                    "snplIdOfAutoSnapshot": volume.get("snplIdOfAutoSnapshot", ""),
                    "lockedAutoSnapshot": volume.get("lockedAutoSnapshot", ""),
                    "lockedAutoSnapshotMarkedForRemoval": volume.get(
                        "lockedAutoSnapshotMarkedForRemoval", ""
                    ),
                    "originalExpiryTime": volume.get("originalExpiryTime", ""),
                    "autoSnapshotGroupId": volume.get("autoSnapshotGroupId", ""),
                    "retentionLevels": ",".join(
                        [str(level) for level in volume.get("retentionLevels") or []]
                    ),
                    "snplIdOfSourceVolume": volume.get("snplIdOfSourceVolume", ""),
                    "compressionMethod": volume.get("compressionMethod", ""),
                    "dataLayout": volume.get("dataLayout", ""),
                    "accessModeLimit": volume.get("accessModeLimit", ""),
                    "secureSnapshotExpTime": volume.get("secureSnapshotExpTime", ""),
                    "volumeReplicationState": volume.get("volumeReplicationState", ""),
                    "replicationJournalVol": volume.get("replicationJournalVol", ""),
                    "pairIds": ",".join([id for id in volume.get("pairIds") or []]),
                    "replicationTimeStamp": volume.get("replicationTimeStamp", ""),
                    "timeStampIsAccurate": volume.get("timeStampIsAccurate", ""),
                }
                data_list.append(data_line)

        # Create the final segment
        segment_data = f"{header}\n"
        csv_header_added = False
        for line in data_list:
            if not csv_header_added:
                csv_header = ";".join([f'"{key}"' for key in line.keys()])
                segment_data += f"{csv_header}\n"
                csv_header_added = True
            csv_content = ";".join([f'"{value}"' for value in line.values()])
            segment_data += f"{csv_content}\n"
        segment_data += f"{footer}\n"
        status = f"{strftime(DATEFORMAT)} - Building {header} segment: success\n"
        write_log(status)
        write_output(segment_data)

    response = query_api(session, f"{URL}/api/types/Volume/instances")
    data = response.json()
    build_volumes(data)


###################################################################################################
###################################################################################################


# This one does not even have ANY entry in the API reference guide...
def get_alerts(session):
    def build_alerts(data):
        header = "#### <alerts>"
        footer = "#### </alerts>"
        data_list = []
        if data:
            for alert in data:
                data_line = {
                    "id": alert.get("id", ""),
                    "code": alert.get("code", ""),
                    "name": alert.get("name", ""),
                    "description": alert.get("description", ""),
                    "severity": alert.get("severity", ""),
                    "original_severity": alert.get("original_severity", ""),
                    "timestamp": alert.get("timestamp", ""),
                    "resource_type": alert.get("resource_type", ""),
                    "domain": alert.get("domain", ""),
                    "resource_name": alert.get("resource_name", ""),
                    "resource_id": alert.get("resource_id", ""),
                    "service": alert.get("service", ""),
                    "last_updated": alert.get("last_updated", ""),
                    "cleared_timestamp": alert.get("cleared_timestamp", ""),
                    "ack_by": alert.get("ack_by", ""),
                    "ack_timestamp": alert.get("ack_timestamp", ""),
                    "repair_flow": alert.get("repair_flow", ""),
                    "category": alert.get("category", ""),
                    "send_to_srs": alert.get("send_to_srs", ""),
                    "sent_to_srs_timestamp": alert.get("sent_to_srs_timestamp", ""),
                    "srs_symptom_id": alert.get("srs_symptom_id", ""),
                    "snmp_code": alert.get("snmp_code", ""),
                }
                data_list.append(data_line)

        # Create the final segment
        segment_data = f"{header}\n"
        csv_header_added = False
        for line in data_list:
            if not csv_header_added:
                csv_header = ";".join([f'"{key}"' for key in line.keys()])
                segment_data += f"{csv_header}\n"
                csv_header_added = True
            csv_content = ";".join([f'"{value}"' for value in line.values()])
            segment_data += f"{csv_content}\n"
        segment_data += f"{footer}\n"
        status = f"{strftime(DATEFORMAT)} - Building {header} segment: success\n"
        write_log(status)
        write_output(segment_data)

    response = query_api(session, f"{URL}/rest/v1/alerts")
    data = response.json().get("results", [])
    build_alerts(data)


###################################################################################################
###################################################################################################


# https://www.dell.com/support/manuals/hu-hu/scaleio/vxf_p_rest_api_reference_guide_3_x_sw/device?guid=guid-a3d8e759-a1bd-40cc-a20e-fe48594d9b4f&lang=en-us
def get_devices(session):
    def build_devices(data):
        header = "#### <devices>"
        footer = "#### </devices>"
        data_list = []
        if data:
            for device in data:
                data_line = {
                    "id": device.get("id", ""),
                    "name": device.get("name", ""),
                    "deviceCurrentPathname": device.get("deviceCurrentPathname", ""),
                    "deviceOriginalPathname": device.get("deviceOriginalPathname", ""),
                    "deviceState": device.get("deviceState", ""),
                    "errorState": device.get("errorState", ""),
                    "capacityLimitInKb": device.get("capacityLimitInKb", ""),
                    "maxCapacityInKb": device.get("maxCapacityInKb", ""),
                    "storagePoolId": device.get("storagePoolId", ""),
                    "rfcacheErrorDeviceDoesNotExist": device.get(
                        "rfcacheErrorDeviceDoesNotExist", ""
                    ),
                    "sdsId": device.get("sdsId", ""),
                    "updateConfiguration": device.get("updateConfiguration", ""),
                    "AccelerationPoolId": device.get("AccelerationPoolId", ""),
                    "ledSetting": device.get("ledSetting", ""),
                    "spSdsIp": device.get("spSdsIp", ""),
                    "aggregatedState": device.get("aggregatedState", ""),
                    "temperatureState": device.get("temperatureState", ""),
                    "ssdEndOfLifeState ": device.get("ssdEndOfLifeState ", ""),
                    "modelName": device.get("modelName", ""),
                    "serialNumber ": device.get("serialNumber", ""),
                    "deviceType": device.get("deviceType", ""),
                    "mediaType": device.get("mediaType", ""),
                    "vendorName": device.get("vendorName", ""),
                    "raidControllerSerialNumber": device.get("raidControllerSerialNumber", ""),
                    "firmwareVersion": device.get("firmwareVersion", ""),
                    "cacheLookAheadActive": device.get("cacheLookAheadActive", ""),
                    "writeCacheActive": device.get("writeCacheActive", ""),
                    "ataSecurityActive": device.get("ataSecurityActive", ""),
                    "capacity": device.get("capacity", ""),
                    "logicalSectorSizeInBytes": device.get("logicalSectorSizeInBytes", ""),
                    "physicalSectorSizeInBytes": device.get("physicalSectorSizeInBytes", ""),
                    "mediaFailing": device.get("mediaFailing", ""),
                    "autoDetectMediaType": device.get("autoDetectMediaType", ""),
                    "externalAccelerationType": device.get("externalAccelerationType", ""),
                    "fglNvdimmWriteCacheSize": device.get("fglNvdimmWriteCacheSize", ""),
                    "fglNvdimmMetadataAmortizationX100": device.get(
                        "fglNvdimmMetadataAmortizationX100", ""
                    ),
                    "persistentChecksumState": device.get("persistentChecksumState", ""),
                }
                data_list.append(data_line)

        # Create the final segment
        segment_data = f"{header}\n"
        csv_header_added = False
        for line in data_list:
            if not csv_header_added:
                csv_header = ";".join([f'"{key}"' for key in line.keys()])
                segment_data += f"{csv_header}\n"
                csv_header_added = True
            csv_content = ";".join([f'"{value}"' for value in line.values()])
            segment_data += f"{csv_content}\n"
        segment_data += f"{footer}\n"
        status = f"{strftime(DATEFORMAT)} - Building {header} segment: success\n"
        write_log(status)
        write_output(segment_data)

    response = query_api(session, f"{URL}/api/types/Device/instances")
    data = response.json()
    build_devices(data)


###################################################################################################
###################################################################################################


# https://www.dell.com/support/manuals/hu-hu/scaleio/vxf_p_rest_api_reference_guide_3_x_sw/query-system-statistics?guid=guid-5c46b11f-97b8-449e-8822-9d7c43422c5b&lang=en-us
def get_system_statistics(session, system_id):
    def build_system_statistics(data):
        header = "#### <system_statistics>"
        footer = "#### </system_statistics>"
        segment_data = f"{header}\n"
        if data:
            data_dict = {
                "backgroundScanFixedReadErrorCount": data.get(
                    "backgroundScanFixedReadErrorCount", ""
                ),
                "numOfVtreeMigrationsInSystem": data.get("numOfVtreeMigrationsInSystem", ""),
                "numOfCrashPointConfigs": data.get("numOfCrashPointConfigs", ""),
                "pendingMovingOutBckRebuildJobs": data.get("pendingMovingOutBckRebuildJobs", ""),
                "rfcachePoolWritePending": data.get("rfcachePoolWritePending", ""),
                "rplCgRpoCompliance": data.get("rplCgRpoCompliance", ""),
                "degradedHealthyCapacityInKb": data.get("degradedHealthyCapacityInKb", ""),
                "activeMovingOutFwdRebuildJobs": data.get("activeMovingOutFwdRebuildJobs", ""),
                "numSdsSdrDisconnections": data.get("numSdsSdrDisconnections", ""),
                "rfcachePoolWritePendingG1Sec": data.get("rfcachePoolWritePendingG1Sec", ""),
                "netFglUncompressedDataSizeInKb": data.get("netFglUncompressedDataSizeInKb", ""),
                "BackgroundScannedInMB": data.get("BackgroundScannedInMB", ""),
                "numOfSnapPolicies": data.get("numOfSnapPolicies", ""),
                "protectedMaintenanceModeWaitSendQLength": data.get(
                    "protectedMaintenanceModeWaitSendQLength", ""
                ),
                "maxUserDataCapacityInKb": data.get("maxUserDataCapacityInKb", ""),
                "rfcacheReadsSkippedAlignedSizeTooLarge": data.get(
                    "rfcacheReadsSkippedAlignedSizeTooLarge", ""
                ),
                "rfcachePoolSize": data.get("rfcachePoolSize", ""),
                "pendingMovingInRebalanceJobs": data.get("pendingMovingInRebalanceJobs", ""),
                "fglMetadataCacheHitrate": data.get("fglMetadataCacheHitrate", ""),
                "rfcacheWritesSkippedHeavyLoad": data.get("rfcacheWritesSkippedHeavyLoad", ""),
                "rfcachePoolPagesInuse": data.get("rfcachePoolPagesInuse", ""),
                "unusedCapacityInKb": data.get("unusedCapacityInKb", ""),
                "rmcacheEntryEvictionCount": data.get("rmcacheEntryEvictionCount", ""),
                "rfcacheFdAvgWriteTime": data.get("rfcacheFdAvgWriteTime", ""),
                "persistentChecksumCapacityInKb": data.get("persistentChecksumCapacityInKb", ""),
                "rmPendingAllocatedInKb": data.get("rmPendingAllocatedInKb", ""),
                "numOfVolumes": data.get("numOfVolumes", ""),
                "rfcacheIosOutstanding": data.get("rfcacheIosOutstanding", ""),
                "rmcacheBigBlockEvictionSizeCountInKb": data.get(
                    "rmcacheBigBlockEvictionSizeCountInKb", ""
                ),
                "numRpoViolatingRplCgsSrc": data.get("numRpoViolatingRplCgsSrc", ""),
                "numOfMappedToAllVolumes": data.get("numOfMappedToAllVolumes", ""),
                "capacityAvailableForVolumeAllocationInKb": data.get(
                    "capacityAvailableForVolumeAllocationInKb", ""
                ),
                "currentTickerValue": data.get("currentTickerValue", ""),
                "netThinUserDataCapacityInKb": data.get("netThinUserDataCapacityInKb", ""),
                "backgroundScanFixedCompareErrorCount": data.get(
                    "backgroundScanFixedCompareErrorCount", ""
                ),
                "thinAndSnapshotRatio": data.get("thinAndSnapshotRatio", ""),
                "rebuildPerReceiveJobNetThrottlingInKbps": data.get(
                    "rebuildPerReceiveJobNetThrottlingInKbps", ""
                ),
                "fglUserDataCapacityInKb": data.get("fglUserDataCapacityInKb", ""),
                "pendingMovingInEnterProtectedMaintenanceModeJobs": data.get(
                    "pendingMovingInEnterProtectedMaintenanceModeJobs", ""
                ),
                "rmcache32kbEntryCount": data.get("rmcache32kbEntryCount", ""),
                "rfcachePoolEvictions": data.get("rfcachePoolEvictions", ""),
                "rfcachePoolNumCacheDevs": data.get("rfcachePoolNumCacheDevs", ""),
                "activeMovingInNormRebuildJobs": data.get("activeMovingInNormRebuildJobs", ""),
                "aggregateCompressionLevel": data.get("aggregateCompressionLevel", ""),
                "rfcacheFdWriteTimeGreater500Millis": data.get(
                    "rfcacheFdWriteTimeGreater500Millis", ""
                ),
                "netUserDataCapacityInKb": data.get("netUserDataCapacityInKb", ""),
                "rmcacheSkipCountCacheAllBusy": data.get("rmcacheSkipCountCacheAllBusy", ""),
                "numOfSdc": data.get("numOfSdc", ""),
                "rfcachePoolNumSrcDevs": data.get("rfcachePoolNumSrcDevs", ""),
                "rfcacheFdMonitorErrorStuckIo": data.get("rfcacheFdMonitorErrorStuckIo", ""),
                "pendingMovingOutExitProtectedMaintenanceModeJobs": data.get(
                    "pendingMovingOutExitProtectedMaintenanceModeJobs", ""
                ),
                "overallUsageRatio": data.get("overallUsageRatio", ""),
                "rfcacheReadsSkippedInternalError": data.get(
                    "rfcacheReadsSkippedInternalError", ""
                ),
                "rfcachePoolWritePendingG500Micro": data.get(
                    "rfcachePoolWritePendingG500Micro", ""
                ),
                "netCapacityInUseNoOverheadInKb": data.get("netCapacityInUseNoOverheadInKb", ""),
                "pendingMovingInBckRebuildJobs": data.get("pendingMovingInBckRebuildJobs", ""),
                "sdtIds": ",".join([id for id in data.get("sdtIds") or []]),
                "activeBckRebuildCapacityInKb": data.get("activeBckRebuildCapacityInKb", ""),
                "snapPolicyIds": ",".join([id for id in data.get("snapPolicyIds") or []]),
                "rebalanceCapacityInKb": data.get("rebalanceCapacityInKb", ""),
                "pendingMovingInExitProtectedMaintenanceModeJobs": data.get(
                    "pendingMovingInExitProtectedMaintenanceModeJobs", ""
                ),
                "numDevErrors": data.get("numDevErrors", ""),
                "rfcacheReadsSkippedLowResources": data.get("rfcacheReadsSkippedLowResources", ""),
                "rfcachePoolInLowMemoryCondition": data.get("rfcachePoolInLowMemoryCondition", ""),
                "rplJournalCapAllowed": data.get("rplJournalCapAllowed", ""),
                "numSnapshotsTaken": data.get("numSnapshotsTaken", ""),
                "thinCapacityInUseInKb": data.get("thinCapacityInUseInKb", ""),
                "rfcachePoolLowResourcesInitiatedPassthroughMode": data.get(
                    "rfcachePoolLowResourcesInitiatedPassthroughMode", ""
                ),
                "rfcachePoolWritePendingG10Millis": data.get(
                    "rfcachePoolWritePendingG10Millis", ""
                ),
                "activeMovingInEnterProtectedMaintenanceModeJobs": data.get(
                    "activeMovingInEnterProtectedMaintenanceModeJobs", ""
                ),
                "rfcacheWritesSkippedInternalError": data.get(
                    "rfcacheWritesSkippedInternalError", ""
                ),
                "rfcachePoolWriteHit": data.get("rfcachePoolWriteHit", ""),
                "rmcache128kbEntryCount": data.get("rmcache128kbEntryCount", ""),
                "netUserDataCapacityNoTrimInKb": data.get("netUserDataCapacityNoTrimInKb", ""),
                "rfcacheWritesSkippedCacheMiss": data.get("rfcacheWritesSkippedCacheMiss", ""),
                "rfcacheFdReadTimeGreater5Sec": data.get("rfcacheFdReadTimeGreater5Sec", ""),
                "numOscillationCountersPassedThreshold": data.get(
                    "numOscillationCountersPassedThreshold", ""
                ),
                "numOfFaultSets": data.get("numOfFaultSets", ""),
                "degradedFailedCapacityInKb": data.get("degradedFailedCapacityInKb", ""),
                "activeNormRebuildCapacityInKb": data.get("activeNormRebuildCapacityInKb", ""),
                "fglSparesInKb": data.get("fglSparesInKb", ""),
                "snapCapacityInUseInKb": data.get("snapCapacityInUseInKb", ""),
                "compressionRatio": data.get("compressionRatio", ""),
                "rfcacheFdIoErrors": data.get("rfcacheFdIoErrors", ""),
                "rfcacheWriteMiss": data.get("rfcacheWriteMiss", ""),
                "numOfVtrees": data.get("numOfVtrees", ""),
                "numRpoViolatingRplCgsDest": data.get("numRpoViolatingRplCgsDest", ""),
                "userDataCapacityNoTrimInKb": data.get("userDataCapacityNoTrimInKb", ""),
                "rfacheReadHit": data.get("rfacheReadHit", ""),
                "numSmartAttributesPassedThreshold": data.get(
                    "numSmartAttributesPassedThreshold", ""
                ),
                "rfcachePooIosOutstanding": data.get("rfcachePooIosOutstanding", ""),
                "compressedDataCompressionRatio": data.get("compressedDataCompressionRatio", ""),
                "rplUsedJournalCap": data.get("rplUsedJournalCap", ""),
                "pendingMovingCapacityInKb": data.get("pendingMovingCapacityInKb", ""),
                "numOfSnapshots": data.get("numOfSnapshots", ""),
                "sdcIds": ",".join([id for id in data.get("sdcIds") or []]),
                "rmcacheBigBlockEvictionCount": data.get("rmcacheBigBlockEvictionCount", ""),
                "pendingFwdRebuildCapacityInKb": data.get("pendingFwdRebuildCapacityInKb", ""),
                "rmcacheNoEvictionCount": data.get("rmcacheNoEvictionCount", ""),
                "rmcacheCurrNumOf128kbEntries": data.get("rmcacheCurrNumOf128kbEntries", ""),
                "tempCapacityInKb": data.get("tempCapacityInKb", ""),
                "normRebuildCapacityInKb": data.get("normRebuildCapacityInKb", ""),
                "rfcachePoolReadPendingG1Millis": data.get("rfcachePoolReadPendingG1Millis", ""),
                "numOfAccelerationPools": data.get("numOfAccelerationPools", ""),
                "logWrittenBlocksInKb": data.get("logWrittenBlocksInKb", ""),
                "rmcacheSizeInUseInKb": data.get("rmcacheSizeInUseInKb", ""),
                "numOfThickBaseVolumes": data.get("numOfThickBaseVolumes", ""),
                "rfcachePoolReadPendingG10Millis": data.get("rfcachePoolReadPendingG10Millis", ""),
                "activeRebalanceCapacityInKb": data.get("activeRebalanceCapacityInKb", ""),
                "numOfReplicationJournalVolumes": data.get("numOfReplicationJournalVolumes", ""),
                "rfcacheReadsSkippedLockIos": data.get("rfcacheReadsSkippedLockIos", ""),
                "unreachableUnusedCapacityInKb": data.get("unreachableUnusedCapacityInKb", ""),
                "netProvisionedAddressesInKb": data.get("netProvisionedAddressesInKb", ""),
                "rfcachePoolReadPendingG500Micro": data.get("rfcachePoolReadPendingG500Micro", ""),
                "rmcache8kbEntryCount": data.get("rmcache8kbEntryCount", ""),
                "trimmedUserDataCapacityInKb": data.get("trimmedUserDataCapacityInKb", ""),
                "provisionedAddressesInKb": data.get("provisionedAddressesInKb", ""),
                "numOfVolumesInDeletion": data.get("numOfVolumesInDeletion", ""),
                "pendingMovingOutFwdRebuildJobs": data.get("pendingMovingOutFwdRebuildJobs", ""),
                "maxCapacityInKb": data.get("maxCapacityInKb", ""),
                "rmcacheSkipCountLargeIo": data.get("rmcacheSkipCountLargeIo", ""),
                "rmPendingThickInKb": data.get("rmPendingThickInKb", ""),
                "protectedCapacityInKb": data.get("protectedCapacityInKb", ""),
                "thinCapacityAllocatedInKb": data.get("thinCapacityAllocatedInKb", ""),
                "netFglUserDataCapacityInKb": data.get("netFglUserDataCapacityInKb", ""),
                "metadataOverheadInKb": data.get("metadataOverheadInKb", ""),
                "thinCapacityAllocatedInKm": data.get("thinCapacityAllocatedInKm", ""),
                "rmcacheCurrNumOf8kbEntries": data.get("rmcacheCurrNumOf8kbEntries", ""),
                "primaryVacInKb": data.get("primaryVacInKb", ""),
                "crashPointConfigIds": ",".join(
                    [id for id in data.get("crashPointConfigIds") or []]
                ),
                "secondaryVacInKb": data.get("secondaryVacInKb", ""),
                "netSnapshotCapacityInKb": data.get("netSnapshotCapacityInKb", ""),
                "numVolumeMigrationsPerformed": data.get("numVolumeMigrationsPerformed", ""),
                "numOfDevices": data.get("numOfDevices", ""),
                "rplTotalJournalCap": data.get("rplTotalJournalCap", ""),
                "numCmatrixPolicyChanges": data.get("numCmatrixPolicyChanges", ""),
                "rfcachePoolWriteMiss": data.get("rfcachePoolWriteMiss", ""),
                "rfcachePoolReadPendingG1Sec": data.get("rfcachePoolReadPendingG1Sec", ""),
                "failedCapacityInKb": data.get("failedCapacityInKb", ""),
                "netMetadataOverheadInKb": data.get("netMetadataOverheadInKb", ""),
                "rmcache4kbEntryCount": data.get("rmcache4kbEntryCount", ""),
                "rfcachePoolWritePendingG1Millis": data.get("rfcachePoolWritePendingG1Millis", ""),
                "rfcacheFdReadTimeGreater1Min": data.get("rfcacheFdReadTimeGreater1Min", ""),
                "rebalanceWaitSendQLength": data.get("rebalanceWaitSendQLength", ""),
                "rebalancePerReceiveJobNetThrottlingInKbps": data.get(
                    "rebalancePerReceiveJobNetThrottlingInKbps", ""
                ),
                "rfcacheFdReadTimeGreater1Sec": data.get("rfcacheFdReadTimeGreater1Sec", ""),
                "rfcacheReadsFromCache": data.get("rfcacheReadsFromCache", ""),
                "activeMovingOutBckRebuildJobs": data.get("activeMovingOutBckRebuildJobs", ""),
                "enterProtectedMaintenanceModeCapacityInKb": data.get(
                    "enterProtectedMaintenanceModeCapacityInKb", ""
                ),
                "rmcache64kbEntryCount": data.get("rmcache64kbEntryCount", ""),
                "activeMovingOutEnterProtectedMaintenanceModeJobs": data.get(
                    "activeMovingOutEnterProtectedMaintenanceModeJobs", ""
                ),
                "pendingMovingInNormRebuildJobs": data.get("pendingMovingInNormRebuildJobs", ""),
                "failedVacInKb": data.get("failedVacInKb", ""),
                "fglUncompressedDataSizeInKb": data.get("fglUncompressedDataSizeInKb", ""),
                "fglCompressedDataSizeInKb": data.get("fglCompressedDataSizeInKb", ""),
                "pendingRebalanceCapacityInKb": data.get("pendingRebalanceCapacityInKb", ""),
                "rfcacheAvgReadTime": data.get("rfcacheAvgReadTime", ""),
                "semiProtectedCapacityInKb": data.get("semiProtectedCapacityInKb", ""),
                "pendingMovingOutEnterProtectedMaintenanceModeJobs": data.get(
                    "pendingMovingOutEnterProtectedMaintenanceModeJobs", ""
                ),
                "rfcachePoolSourceIdMismatch": data.get("rfcachePoolSourceIdMismatch", ""),
                "numOfRplPairs": data.get("numOfRplPairs", ""),
                "mgUserDdataCcapacityInKb": data.get("mgUserDdataCcapacityInKb", ""),
                "snapshotCapacityInKb": data.get("snapshotCapacityInKb", ""),
                "rfcacheFdAvgReadTime": data.get("rfcacheFdAvgReadTime", ""),
                "netMgUserDataCapacityInKb": data.get("netMgUserDataCapacityInKb", ""),
                "numOfPeerMdm": data.get("numOfPeerMdm", ""),
                "rfcacheWritesReceived": data.get("rfcacheWritesReceived", ""),
                "netUnusedCapacityInKb": data.get("netUnusedCapacityInKb", ""),
                "rfcachePoolSuspendedIos": data.get("rfcachePoolSuspendedIos", ""),
                "numOfLibsdc": data.get("numOfLibsdc", ""),
                "thinUserDataCapacityInKb": data.get("thinUserDataCapacityInKb", ""),
                "rplTopPerformingRcgs": ",".join(
                    [id for id in data.get("rplTopPerformingRcgs") or []]
                ),
                "protectedVacInKb": data.get("protectedVacInKb", ""),
                "activeMovingInFwdRebuildJobs": data.get("activeMovingInFwdRebuildJobs", ""),
                "bckRebuildCapacityInKb": data.get("bckRebuildCapacityInKb", ""),
                "activeMovingRebalanceJobs": data.get("activeMovingRebalanceJobs", ""),
                "sdrIds": ",".join([id for id in data.get("sdrIds") or []]),
                "netTrimmedUserDataCapacityInKb": data.get("netTrimmedUserDataCapacityInKb", ""),
                "pendingMovingRebalanceJobs": data.get("pendingMovingRebalanceJobs", ""),
                "numOfMarkedVolumesForReplication": data.get(
                    "numOfMarkedVolumesForReplication", ""
                ),
                "degradedHealthyVacInKb": data.get("degradedHealthyVacInKb", ""),
                "rfcachePoolLockTimeGreater1Sec": data.get("rfcachePoolLockTimeGreater1Sec", ""),
                "semiProtectedVacInKb": data.get("semiProtectedVacInKb", ""),
                "rplProtectedCapacityDest": data.get("rplProtectedCapacityDest", ""),
                "pendingBckRebuildCapacityInKb": data.get("pendingBckRebuildCapacityInKb", ""),
                "rmcacheCurrNumOf4kbEntries": data.get("rmcacheCurrNumOf4kbEntries", ""),
                "capacityLimitInKb": data.get("capacityLimitInKb", ""),
                "numOfProtectionDomains": data.get("numOfProtectionDomains", ""),
                "activeMovingCapacityInKb": data.get("activeMovingCapacityInKb", ""),
                "pendingExitProtectedMaintenanceModeCapacityInKb": data.get(
                    "pendingExitProtectedMaintenanceModeCapacityInKb", ""
                ),
                "rfcacheIosSkipped": data.get("rfcacheIosSkipped", ""),
                "numOfRplCgs": data.get("numOfRplCgs", ""),
                "rfcacheFdWriteTimeGreater5Sec": data.get("rfcacheFdWriteTimeGreater5Sec", ""),
                "inMaintenanceVacInKb": data.get("inMaintenanceVacInKb", ""),
                "netFglSparesInKb": data.get("netFglSparesInKb", ""),
                "rfcacheReadsSkipped": data.get("rfcacheReadsSkipped", ""),
                "rfcachePoolReadHit": data.get("rfcachePoolReadHit", ""),
                "rebuildWaitSendQLength": data.get("rebuildWaitSendQLength", ""),
                "activeExitProtectedMaintenanceModeCapacityInKb": data.get(
                    "activeExitProtectedMaintenanceModeCapacityInKb", ""
                ),
                "numOfUnmappedVolumes": data.get("numOfUnmappedVolumes", ""),
                "activeMovingOutExitProtectedMaintenanceModeJobs": data.get(
                    "activeMovingOutExitProtectedMaintenanceModeJobs", ""
                ),
                "rmcacheCurrNumOf64kbEntries": data.get("rmcacheCurrNumOf64kbEntries", ""),
                "volumeAddressSpaceInKb": data.get("volumeAddressSpaceInKb", ""),
                "tempCapacityVacInKb": data.get("tempCapacityVacInKb", ""),
                "rfcacheWritesSkippedMaxIoSize": data.get("rfcacheWritesSkippedMaxIoSize", ""),
                "numSdsReconnections": data.get("numSdsReconnections", ""),
                "netMaxUserDataCapacityInKb": data.get("netMaxUserDataCapacityInKb", ""),
                "rfacheWriteHit": data.get("rfacheWriteHit", ""),
                "atRestCapacityInKb": data.get("atRestCapacityInKb", ""),
                "rfcacheSourceDeviceWrites": data.get("rfcacheSourceDeviceWrites", ""),
                "spareCapacityInKb": data.get("spareCapacityInKb", ""),
                "rfcacheFdInlightReads": data.get("rfcacheFdInlightReads", ""),
                "numOfSdt": data.get("numOfSdt", ""),
                "numOfSds": data.get("numOfSds", ""),
                "rfcacheIoErrors": data.get("rfcacheIoErrors", ""),
                "numOfSdr": data.get("numOfSdr", ""),
                "capacityInUseInKb": data.get("capacityInUseInKb", ""),
                "numSdSdcDisconnections": data.get("numSdSdcDisconnections", ""),
                "rmcacheSkipCountUnaligned4kbIo": data.get("rmcacheSkipCountUnaligned4kbIo", ""),
                "rfcacheReadsSkippedMaxIoSize": data.get("rfcacheReadsSkippedMaxIoSize", ""),
                "numSdrSdcDisconnections": data.get("numSdrSdcDisconnections", ""),
                "activeMovingInExitProtectedMaintenanceModeJobs": data.get(
                    "activeMovingInExitProtectedMaintenanceModeJobs", ""
                ),
                "rfcachePoolSuspendedPequestsRedundantSearchs": data.get(
                    "rfcachePoolSuspendedPequestsRedundantSearchs", ""
                ),
                "rfcacheWritesSkippedStuckIo": data.get("rfcacheWritesSkippedStuckIo", ""),
                "numOfStoragePools": data.get("numOfStoragePools", ""),
                "rfcachePoolCachePages": data.get("rfcachePoolCachePages", ""),
                "inMaintenanceCapacityInKb": data.get("inMaintenanceCapacityInKb", ""),
                "protectionDomainIds": ",".join(
                    [id for id in data.get("protectionDomainIds") or []]
                ),
                "netFglCompressedDataSizeInKb": data.get("netFglCompressedDataSizeInKb", ""),
                "vtreeMigrationWaitSendQLength": data.get("vtreeMigrationWaitSendQLength", ""),
                "inUseVacInKb": data.get("inUseVacInKb", ""),
                "fwdRebuildCapacityInKb": data.get("fwdRebuildCapacityInKb", ""),
                "libsdcIds": ",".join([id for id in data.get("libsdcIds") or []]),
                "thickCapacityInUseInKb": data.get("thickCapacityInUseInKb", ""),
                "activeMovingInRebalanceJobs": data.get("activeMovingInRebalanceJobs", ""),
                "backgroundScanReadErrorCount": data.get("backgroundScanReadErrorCount", ""),
                "rmcacheCurrNumOf32kbEntries": data.get("rmcacheCurrNumOf32kbEntries", ""),
                "rfcacheWritesSkippedLowResources": data.get(
                    "rfcacheWritesSkippedLowResources", ""
                ),
                "peerMdmIds": ",".join([id for id in data.get("peerMdmIds") or []]),
                "capacityInUseNoOverheadInKb": data.get("capacityInUseNoOverheadInKb", ""),
                "rfcacheFdCacheOverloaded": data.get("rfcacheFdCacheOverloaded", ""),
                "rmcache16kbEntryCount": data.get("rmcache16kbEntryCount", ""),
                "rmcacheEntryEvictionSizeCountInKb": data.get(
                    "rmcacheEntryEvictionSizeCountInKb", ""
                ),
                "rfcacheSkippedUnlinedWrite": data.get("rfcacheSkippedUnlinedWrite", ""),
                "netCapacityInUseInKb": data.get("netCapacityInUseInKb", ""),
                "rplProtectedCapacitySrc": data.get("rplProtectedCapacitySrc", ""),
                "rfcacheAvgWriteTime": data.get("rfcacheAvgWriteTime", ""),
                "pendingNormRebuildCapacityInKb": data.get("pendingNormRebuildCapacityInKb", ""),
                "vtreeMigrationPerReceiveJobNetThrottlingInKbps": data.get(
                    "vtreeMigrationPerReceiveJobNetThrottlingInKbps", ""
                ),
                "rfcacheFdReadTimeGreater500Millis": data.get(
                    "rfcacheFdReadTimeGreater500Millis", ""
                ),
                "pendingMovingOutNormrebuildJobs": data.get("pendingMovingOutNormrebuildJobs", ""),
                "rfcacheSourceDeviceReads": data.get("rfcacheSourceDeviceReads", ""),
                "rmcacheCurrNumOf16kbEntries": data.get("rmcacheCurrNumOf16kbEntries", ""),
                "initialCopyProgress": data.get("initialCopyProgress", ""),
                "volumeAllocationLimitInKb": data.get("volumeAllocationLimitInKb", ""),
                "rfcacheReadsPending": data.get("rfcacheReadsPending", ""),
                "rfcacheReadsSkippedHeavyLoad": data.get("rfcacheReadsSkippedHeavyLoad", ""),
                "protectedMaintenanceModePerReceiveJobNetThrottlingInKbps": data.get(
                    "protectedMaintenanceModePerReceiveJobNetThrottlingInKbps", ""
                ),
                "rfcacheFdInlightWrites": data.get("rfcacheFdInlightWrites", ""),
                "rfcacheReadMiss": data.get("rfcacheReadMiss", ""),
                "userDataCapacityInKb": data.get("userDataCapacityInKb", ""),
                "rfcacheFdReadsReceived": data.get("rfcacheFdReadsReceived", ""),
                "activeMovingInBckRebuildJobs": data.get("activeMovingInBckRebuildJobs", ""),
                "movingCapacityInKb": data.get("movingCapacityInKb", ""),
                "activeEnterProtectedMaintenanceModeCapacityInKb": data.get(
                    "activeEnterProtectedMaintenanceModeCapacityInKb", ""
                ),
                "backgroundScanCompareErrorCount": data.get("backgroundScanCompareErrorCount", ""),
                "pendingMovingInFwdRebuildJobs": data.get("pendingMovingInFwdRebuildJobs", ""),
                "rfcacheReadsReceived": data.get("rfcacheReadsReceived", ""),
                "rfcachePoolReadsPending": data.get("rfcachePoolReadsPending", ""),
                "pendingEnterProtectedMaintenanceModeCapacityInKb": data.get(
                    "pendingEnterProtectedMaintenanceModeCapacityInKb", ""
                ),
                "snapCapacityInUseOccupiedInKb": data.get("snapCapacityInUseOccupiedInKb", ""),
                "vtreeAddresSpaceInKb": data.get("vtreeAddresSpaceInKb", ""),
                "activeFwdRebuildCapacityInKb": data.get("activeFwdRebuildCapacityInKb", ""),
                "rfcacheReadsSkippedStuckIo": data.get("rfcacheReadsSkippedStuckIo", ""),
                "activeMovingOutNormRebuildJobs": data.get("activeMovingOutNormRebuildJobs", ""),
                "rfcacheFdWritesReceived": data.get("rfcacheFdWritesReceived", ""),
                "rmcacheSizeInKb": data.get("rmcacheSizeInKb", ""),
                "rfcacheFdWriteTimeGreater1Min": data.get("rfcacheFdWriteTimeGreater1Min", ""),
                "rfcacheFdWriteTimeGreater1Sec": data.get("rfcacheFdWriteTimeGreater1Sec", ""),
                "rfcacheWritePending": data.get("rfcacheWritePending", ""),
                "numOfThinBaseVolumes": data.get("numOfThinBaseVolumes", ""),
                "numOfRfcacheDevices": data.get("numOfRfcacheDevices", ""),
                "degradedFailedVacInKb": data.get("degradedFailedVacInKb", ""),
                "movePairsIds": ",".join([id for id in data.get("movePairsIds") or []]),
                "rfcachePoolIoTimeGreater1Min": data.get("rfcachePoolIoTimeGreater1Min", ""),
                "rfcachePoolReadMiss": data.get("rfcachePoolReadMiss", ""),
            }
            csv_header = ";".join([f'"{key}"' for key in data_dict.keys()])
            csv_content = ";".join([f'"{value}"' for value in data_dict.values()])
            segment_data += f"{csv_header}\n{csv_content}\n"
        segment_data += f"{footer}\n"
        status = f"{strftime(DATEFORMAT)} - Building {header} segment: success\n"
        write_log(status)
        write_output(segment_data)

    response = query_api(
        session, f"{URL}/api/instances/System::{system_id}/relationships/Statistics"
    )
    data = response.json()
    build_system_statistics(data)


###################################################################################################
###################################################################################################


# This one does not even have ANY entry in the API reference guide...
def get_ntp(session):
    def build_ntp(data):
        header = "#### <ntp>"
        footer = "#### </ntp>"
        segment_data = f"{header}\n"
        if data:
            csv_header = ";".join([f'"{key}"' for key in data.keys()])
            csv_content = ";".join([f'"{value}"' for value in data.values()])
            segment_data += f"{csv_header}\n{csv_content}\n"
        segment_data += f"{footer}\n"
        status = f"{strftime(DATEFORMAT)} - Building {header} segment: success\n"
        write_log(status)
        write_output(segment_data)

    response = query_api(session, f"{URL}/api/v1/ntp")
    data = response.json()
    build_ntp(data)


###################################################################################################
###################################################################################################


# /api/types/User/instances endpoint does not work, using /api/v1/User instead
# https://www.dell.com/support/manuals/en-us/scaleio/vxf_p_rest_api_reference_guide_3_x_sw/user-objects?guid=guid-65c2092c-4690-41ff-ac02-61ee6565c0ab&lang=en-us
def get_user(session):
    def build_user(data):
        header = "#### <user>"
        footer = "#### </user>"
        # Our final list with all the data
        data_list = []
        if data:
            for user in data:
                data_line = {
                    "userName": user.get("userName", ""),
                    "enabled": user.get("enabled", ""),
                    "systemUser": user.get("systemUser", ""),
                    "role": user.get("role", ""),
                }
                data_list.append(data_line)

        # Create the final segment
        segment_data = f"{header}\n"
        csv_header_added = False
        for line in data_list:
            if not csv_header_added:
                csv_header = ";".join([f'"{key}"' for key in line.keys()])
                segment_data += f"{csv_header}\n"
                csv_header_added = True
            csv_content = ";".join([f'"{value}"' for value in line.values()])
            segment_data += f"{csv_content}\n"
        segment_data += f"{footer}\n"
        status = f"{strftime(DATEFORMAT)} - Building {header} segment: success\n"
        write_log(status)
        write_output(segment_data)

    response = query_api(session, f"{URL}/api/v1/User")
    data = response.json()
    build_user(data)


###################################################################################################
###################################################################################################


def build_hci_mi_check(system_info_data, sds_info_data):
    header = "#### <mdm_check>"
    footer = "#### </mdm_check>"

    sds_list = []
    for instance in sds_info_data:
        sds_list.append(
            {
                "id": instance.get("id", ""),
                "ipList": [ip.get("ip") for ip in instance.get("ipList", [])],
                "onVmWare": instance.get("onVmWare", ""),
            }
        )

    mdm_cluster = system_info_data.get("mdmCluster", {})
    mdm_list = []

    # Add the master mdm object to the list of mdms
    for ip in mdm_cluster.get("master", {}).get("ips", []):
        mdm_list.append(
            {
                "ip": ip,
                "id": mdm_cluster.get("master", {}).get("id", ""),
                "name": mdm_cluster.get("master", {}).get("name", ""),
                "role": mdm_cluster.get("master", {}).get("role", ""),
                "mdm_type": "master",
            }
        )

    # Add all other mdm types to the list of mdms
    for mdm_type in ["slaves", "tieBreakers", "standbyMDMs"]:
        for node in mdm_cluster.get(mdm_type, {}):
            for ip in node.get("ips", []):
                mdm_list.append(
                    {
                        "ip": ip,
                        "id": node.get("id", ""),
                        "name": node.get("name", ""),
                        "role": node.get("role", ""),
                        "mdm_type": mdm_type,
                    }
                )

    # MI check happens here
    for line in mdm_list:
        for sds in sds_list:
            if line.get("ip", "") in sds.get("ipList", []):
                line["status"] = "FAILED" if sds.get("onVmWare") else "OK"
        if not line["status"]:
            line["status"] = "OK"

    # Create the final segment
    segment_data = f"{header}\n"
    csv_header_added = False
    for line in mdm_list:
        if not csv_header_added:
            csv_header = ";".join([f'"{key}"' for key in line.keys()])
            segment_data += f"{csv_header}\n"
            csv_header_added = True
        csv_content = ";".join([f'"{value}"' for value in line.values()])
        segment_data += f"{csv_content}\n"
    segment_data += f"{footer}\n"
    status = f"{strftime(DATEFORMAT)} - Building {header} segment: success\n"
    write_log(status)
    write_output(segment_data)


###################################################################################################
###################################################################################################


def main():
    session = login_to_pf()
    if session:
        system_info_data = get_system_info(session)
        system_id = system_info_data.get("id", "")
        sds_info_data = get_sds_info(session)
        get_sdc_info(session)
        get_sdr_info(session)
        get_disconnections(session, system_id)
        get_protection_domain(session)
        get_login_banner(session)
        get_replication_pair(session)
        get_replication_consistency_group(session)
        get_dispatch_policies(session)
        get_volumes(session)
        get_alerts(session)
        get_devices(session)
        get_system_statistics(session, system_id)
        get_ntp(session)
        get_user(session)
        build_hci_mi_check(system_info_data, sds_info_data)
        # A GET request to /api/logout should invalidate the token
        # but it does not work at all, so we will let it expire after
        # 10 minutes of inactivity
        status = f"{strftime(DATEFORMAT)} - Data collection finished, closing session\n"
        write_log(status)
        session.close()

        result.pop("return_code", "")
        module.exit_json(**result)


if __name__ == "__main__":
    main()
