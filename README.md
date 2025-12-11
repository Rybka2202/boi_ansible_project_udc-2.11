# Unified Data Collector

## Synopsis

The mission of [Best Practice Service](https://kyndryl.sharepoint.com/sites/Integrated-AIOps-Best-Practice-Service/)
is to provide the data needed to maintain a healthy, optimized, compliant and secure environment.
The goal of this mission is creating outstanding customer satisfaction and value with Kyndryl and Kyndryl Services
for the purpose of driving increased revenue for Kyndryl and our Customers.

[BPS, formerly known as SDE Automation Tools, or SAT](https://kyndryl.sharepoint.com/sites/sat), is a suite of tools
designed for Kyndryl and Cloud production environments, part of Kyndryl's core platform tools.

It is required to validate and report health check and best practice deviations to mitigate avoidable incidents.

**Unified Data Collector (UDC)** collects data required for performing Best practice evaluation, from Compute
(OS and applications), Storage, Network, Resiliency and Hyperscaler devices, which is then evaluated by the BPS
Engine for processing and providing reporting and insights in AIOps.

This documentation only details the basic usage of the asset, and mostly serves as a point-in-time reference for a
given release of the playbook. **The most current and detailed documentation of Unified Data Collector can be read
at the [UDC DOCS site](https://pages.github.kyndryl.net/Continuous-Engineering/ansible_project_udc/).**

**TOWER ADMINISTRATORS:** TO CONFIGURE ANSIBLE AUTOMATION PLATFORM FOR UDC START HERE:
[UDC DOCS](https://pages.github.kyndryl.net/Continuous-Engineering/ansible_project_udc/).

### Technical / Business Analysis

- **What is the value to Kyndryl Teams? What is the value to the client?** See
  [Integrated AIOps Best Practice Service](https://kyndryl.sharepoint.com/sites/Integrated-AIOps-Best-Practice-Service)
- **What kind of resource utilization does this playbook have?** Varies from low to high.
    - When targeting compute and network endpoints resource utilization is expected to be low.
    - When the target is a much larger Storage or Hyperscaler device (for example IBM Spectrum Protect or
      VMware vCenter), resource utilization can be high.
- **How complex is it to implement this playbook?** For most device types it's straightforward. The rest can become
  complex with multiple credentials required, but we provide documentation for all device configurations on the
  [UDC DOCS/Devices](https://pages.github.kyndryl.net/Continuous-Engineering/ansible_project_udc/latest/devices) page.
- **Does this playbook make any changes to the server?** No. This playbook doesn't make any changes to server settings,
  it only collects information from the server without making any modifications.
- **How often should I run this?** See [Schedule](#schedule).

## Variables

| Variable name                          | Default | Comments                                                                                                                |
| -------------------------------------- | :-----: | ----------------------------------------------------------------------------------------------------------------------- |
| **udc_endpoint** (string)              |         | **Mandatory** for internal mapping.<br/>The list of acceptable values can be found [HERE](#currently-supported-devices) |
| **udc_devices** (list of dictionaries) |         | **Mandatory for all devices listed below!** Refer to [README_udc_devices](docs/README_udc_devices.md).                  |

**Devices which need `udc_devices` to be defined** are:

- IBM Spectrum Protect
- Dell EMC Powerstore
- IBM DS8000
- Dell EMC Unity
- IBM A9000
- IBM XIV
- Cisco APIC / ACI

### Required for data processing

These variables are needed during data processing by the BPS engine.

| Variable name       |  Default   | Comments                                                                             |
| ------------------- | :--------: | ------------------------------------------------------------------------------------ |
| **bac_id** (string) | BAC9999999 | **Mandatory** BlueID BAC-ID. If `blueid`<br> is defined then that is used as default |
| **chipid** (string) |   MyChip   | ChipID - Legacy Account ID in the BlueID Account Details page                        |

### Optional control variables for data processing

Possible values are `"off"`, `"create"` and `"send"`. When changing defaults on AAP please make sure to use quotes.

| Variable name               |  Default   | Comments                                                                         |
| --------------------------- | :--------: | -------------------------------------------------------------------------------- |
| **udc_results** (string)    |  `"send"`  | Control variable for sending results to `<org>/<org>_project_udc_results` on SFS |
| **udc_ecm** (string)        | `"create"` | Control variable for sending data to ECM.                                        |
| **udc_escm** (string)       | `"create"` | Control variable for sending data to ESCM.                                       |
| **udc_aiops** (string)      |  `"send"`  | Control variable for sending data to AIOps                                       |
| **udc_uat** (string)        |  `"send"`  | Control variable for sending data to UAT                                         |
| **udc_invscanner** (string) |  `"send"`  | Control variable for sending data to Inventory Services                          |

BPS Engine will take these into account when generating and sending results to the defined consumers. For example if a
given variable is set to `"off"`,  no processed data will be created or sent to that consumer. If the variable is set
to `"create"`, processed data will be created, but it won't be sent to the downstream consumer, it will be available
only in the udc_results archive on SFS.

#### A note on Security HC reporting

`udc_ecm` and `udc_escm` requires `chipid` properly configured, otherwise the data will not be sent to ECM/ESCM.

You can test ECM results without affecting the official reports by defining the `ecmscanscope: TEST` on the Job
Template. This will result in "_TEST" appended to each entry in the "PolicyItem" column of the MHCviol file and
makes ECM treat the upload as a test scan.

### Optional variables changing the default behaviour of UDC

The below variables can be used to change the default directories used, the checks performed on the endpoint, etc. They all have sane defaults and in a standard configuration shouldn't be used.

| Variable name                       |         Default         | Comments                                                                                                                               |
| ----------------------------------- | :---------------------: | -------------------------------------------------------------------------------------------------------------------------------------- |
| **endpoint_dir** (string)           | **/tmp** or **C:\temp** | The directory used when generating data. Must be writable by the ansible user                                                          |
| **vendor_cli** (string)             |                         | Path to the CLI Driver's binary if it's not in the ansible user's $PATH.                                                               |
| **check_list** (list)               |        `['all']`        | List of check to run. No effect on pexpect-based collectors. **Advanced** variable.                                                    |
| **sat_ip** (string)                 |                         | **Advanced** variable. Only for specific use-cases when pushing data to on-prem BPS.                                                   |
| **dsm_dir** (string)                | `/home/<ansible_user>`  | Only for IBM Spectrum Protect data collections.                                                                                        |
| **udc_privilege_escalation** (bool) |          true           | Only for select Cisco devices: IOS, ASA.<br>Controls if enable mode should be used or not - detected automatically.                    |
| **udc_asa_admin** (bool)            |          false          | Only for Cisco ASA.<br>Only set it if running ASA in Admin context.                                                                    |
| **udc_asa_context** (bool)          |          false          | Only for Cisco ASA.<br>Only set it if running ASA in a fixed context. (Context switching not allowed).                                 |
| **udc_db_user** (string)            | `oracle` or `postgres`  | Only for Oracle Database (UNIX) or PostgreSQL Database (UNIX) collectors.<br>Defines the user to switch to when querying the database. |
| **udc_catalina_home** (string)      |       /opt/tomcat       | Only for Apache Tomcat (UNIX) data collector.<br>Defines the installation home directory of tomcat.                                    |
| **udc_catalina_base** (string)      |       /opt/tomcat       | Only for Apache Tomcat (UNIX) data collector.<br>Defines the installation base directory of tomcat.                                    |
| **udc_wlp_base_dir** (string)       |          /opt           | Only for WLP (UNIX) data collector.<br>Defines the directory in which to search for WLP instances.                                     |
| **udc_postgresql_base** (string)    |          /usr           | Only for PostgreSQL (UNIX) data collector.<br>Defines the directory in which to search for postgres installations.                     |
| **udc_clustername** (string)        |                         | Only for VMware vCenter data collector.<br>Defines a single cluster to be targeted during data collection.                             |
| **udc_debug** (bool)                |          false          | Only for debugging purposes when instructed by BPS Support or know what you're doing.                                                  |
| **udc_netmiko_debug** (bool)        |          false          | Only for debugging purposes when instructed by BPS Support or know what you're doing. Used only with `udc_debug`                       |
| **udc_netmiko_prompt** (string)     |                         | Use in cases netmiko does not properly auto-detect the required prompt.                                                                |
| **use_bps_rules_server** (bool)     |          false          | Set to true if local policies should be loaded from Rules Server instead of using the files from your fork                             |

UDC hides all collected data with `no_log: true`. `udc_debug` can override this which can be beneficial for
troubleshooting, but please keep in mind that this will log **all** collected data to the ansible job log.
If used with a higher Verbosity level, the resulting log can span millions of lines.

## Results from execution

| Return Code Name               | Return Code Group  | Return Code | Comments                                                                                                                                           |
| :----------------------------- | :----------------: | :---------: | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| unexpected_failure             | framework_playbook |    2201     | The playbook failed unexpectedly. Please open an incident against BPS Support.                                                                     |
| missing_mandatory_var          |  misconfiguration  |    1400     | At least one mandatory variable is missing                                                                                                         |
| minimum_ansible_version        |  misconfiguration  |    1401     | Ansible version is outdated - requirement is >= 2.15                                                                                               |
| misconfigured_techspec_control |  misconfiguration  |    1402     | Tech Spec control variables are misconfigured - please refer to the documentation                                                                  |
| win_localhost_missing          |  misconfiguration  |    1403     | localhost needs to be in the Limit field when targeting Windows endpoints (event-socks-tunnel prerequisite)                                        |
| j2_not_found                   | framework_playbook |    2200     | No template file found for the specified device type. This is likely an issue on our side, please open an incident against BPS Support             |
| sfs_role_error                 |   service_issue    |    1500     | The SFS upload role has reported an error. Please check the Details tab for Artifacts to see what was the issue                                    |
| socks_role_error               |   service_issue    |    1501     | The event-socks-tunnel role has reported that the socks file was not created. Please check the Details tab for Artifacts to see what was the issue |
| local_template_issue           |  misconfiguration  |    1404     | Constructing setting_local variable based on local j2 template failed                                                                              |
| wrong_encoding                 |  misconfiguration  |    1405     | Ansible (not UDC!) expects text to be UTF-8 encoded. Change the default encoding of the endpoint to en_US.utf8                                     |
| appliance_auth                 |  connection_issue  |    1101     | Failed to authenticate on target using the Machine credential                                                                                      |
| appliance_unreachable          |  connection_issue  |    1102     | Could not connect to the target                                                                                                                    |
| api_auth                       |  connection_issue  |    1103     | Failed to authenticate on target using the Network credential                                                                                      |
| api_unreachable                |  connection_issue  |    1104     | Could not connect to the target's API                                                                                                              |
| compute_conn                   |  connection_issue  |    1105     | Could not connect to the target                                                                                                                    |
| oracle_authorization           |  misconfiguration  |    1406     | ansible_user cannot become oracle user or udc_db_user has insufficient permissions for database access                                             |
| hyperscaler_pwsh               |    prerequisite    |    1700     | pwsh is not present in the Execution Environment. Check if correct EE is used                                                                      |
| netapp_authorization           |  misconfiguration  |    1407     | insufficient permissions - user cannot execute 'echo'                                                                                              |
| powershell_script_error        | framework_playbook |    3200     | Script failed to execute successfully. Please open an incident against BPS Support                                                                 |
| sat_conn                       |  connection_issue  |    1107     | Could not connect to the SAT server (Push-to-SAT method)                                                                                           |
| launch_conn                    |  connection_issue  |    1108     | Could not connect to the Launch Node using the Machine credential                                                                                  |
| prereq_vendorcli_missing       |    prerequisite    |    1701     | VendorCLI driver is missing                                                                                                                        |
| prereq_pexpect_missing         |    prerequisite    |    1702     | Pexpect is missing or wrong version is present                                                                                                     |
| prereq_netmiko_missing         |    prerequisite    |    1703     | Netmiko is missing or wrong version is present                                                                                                     |
| pexpect_auth_conn              |  connection_issue  |    1109     | Could not connect to the target (Authentication phase)                                                                                             |
| pexpect_auth_auth              |  connection_issue  |    1110     | Could not authenticate to the target (Authentication phase)                                                                                        |
| pexpect_auth_eof_pseudo_tty    |  misconfiguration  |    1408     | ansible_pipelining / ansible_ssh_pipelining should be set to false (Authentication phase)                                                          |
| pexpect_auth_eof_unknown       | framework_playbook |    3201     | Unknown EOFerror in Authentication phase. Please open an incident against BPS Support                                                              |
| pexpect_auth_timeout_unknown   | framework_playbook |    3202     | Unknown TIMEOUT error in Authentication phase. Please open an incident against BPS Support                                                         |
| python_wtf_ioerror_unhandled   | framework_playbook |    3203     | Unhandled error in Write-to-File phase. Please open an incident against BPS Support                                                                |
| pexpect_send_command_eof       | framework_playbook |    3204     | Unknown EOF error in Send-Command phase. Please open an incident against BPS Support                                                               |
| pexpect_send_command_timeout   | framework_playbook |    3205     | Unknown TIMEOUT error in Send-Command phase. Please open an incident against BPS Support                                                           |
| pexpect_send_command_unhandled | framework_playbook |    3206     | Unhandled error in Send-Command phase. Please open an incident against BPS Support                                                                 |
| invalid_check_list             |  misconfiguration  |    1409     | check_list variable is misconfigured                                                                                                               |
| oracle_oratab                  |  misconfiguration  |    1410     | /etc/oratab is missing or cannot be read                                                                                                           |
| compute_privilege              |  misconfiguration  |    1411     | Privilege escalation error. The ansible_user should have passwordless sudo rights                                                                  |
| prereq_pwsh_missing            |    prerequisite    |    1704     | Powershell (as pwsh) is missing                                                                                                                    |
| prereq_pandas_missing          |    prerequisite    |    1705     | Pandas is missing or wrong version is present                                                                                                      |
| db2_no_running_instances       |  misconfiguration  |    1412     | No running DB2 instances detected                                                                                                                  |
| minimum_powershell_version     |  misconfiguration  |    1413     | Powershell version is outdated - requirement is >= 5.1                                                                                             |
| hyperscaler_cred_missing       |  misconfiguration  |    1414     | A required credential is missing for Hyperscaler data collection                                                                                   |
| wlp_no_servers_found           |  misconfiguration  |    1415     | UDC did not find any WLP servers                                                                                                                   |
| psql_no_installation_found     |  misconfiguration  |    1416     | No installation of PostgreSQL detected                                                                                                             |
| misconfigured_optional_var     |  misconfiguration  |    1417     | An optional variable is misconfigured, please check the documentation to see what the problem is                                                   |
| missing_aap_credential         |  misconfiguration  |    1418     | Red Hat Ansible Automation Platform credential is missing                                                                                          |

## Procedure

This repository hosts Unified data collector, part of the Best Practice Service. Please see the
[UDC DOCS site](https://pages.github.kyndryl.net/Continuous-Engineering/ansible_project_udc/) for detailed
description on how to set up and run UDC.

### Currently supported devices

| Platform                                 | Status     | udc_endpoint            |
| ---------------------------------------- | ---------- | ----------------------- |
| Microsoft Active Directory               | production | active_directory        |
| AIX                                      | production | aix                     |
| Amazon AWS                               | production | aws                     |
| Microsoft Azure                          | production | azure                   |
| Centos Linux                             | production | centos                  |
| Debian Linux                             | production | debian                  |
| IBM DB2 (UNIX)                           | production | db2unix                 |
| Brocade SAN Switch                       | production | broadcom_brocade        |
| Checkpoint Firewall                      | production | checkpoint_firewall     |
| Cisco APIC / ACI (*)                     | production | cisco_apic              |
| Cisco ASA                                | production | cisco_asa               |
| Cisco CSP                                | production | cisco_csp               |
| Cisco IOS                                | production | cisco_ios               |
| Cisco IOS XR                             | production | cisco_iosxr             |
| Cisco MDS                                | production | cisco_mds               |
| Cisco NX-OS                              | production | cisco_nxos              |
| Cisco WLC                                | production | cisco_wlc               |
| Citrix NetScaler                         | production | citrix_netscaler        |
| Commvault Simpana                        | production | commvault_simpana       |
| IBM DS8000 (*)                           | production | ibm_ds8000              |
| EMC Isilon                               | production | emc_isilon              |
| EMC Powerstore (*)                       | production | emc_powerstore          |
| Dell EMC Unity (*)                       | production | emc_unity               |
| F5 Big-IP LTM                            | production | f5_ltm                  |
| Fortinet FortiGate                       | production | fortinet_fortigate      |
| Google Cloud Platform (GCP)              | production | google_ap_gcp           |
| HP Procurve                              | production | hp_procurve             |
| HPE Alletra 9000                         | production | hpe_alletra_9k          |
| HPE 3PAR                                 | production | hpe_3par                |
| Microsoft HyperV                         | production | hyperv                  |
| IBM A9000 (*)                            | production | ibm_a9000               |
| IBM Storwize FlashSystem                 | production | ibm_flashsystem         |
| IBM Netcool Impact                       | production | ibm_netcoolimpact       |
| IBM Netcool Object Server                | production | ibm_netcoolobjectserver |
| IBM Netcool Probe                        | production | ibm_netcoolprobe        |
| IBM Netcool WebGUI                       | production | ibm_netcoolwebgui       |
| IBM Spectrum Protect (*)                 | production | ibm_spectrumprotect     |
| IBM Storwize SVC                         | production | ibm_svc                 |
| IBM Storwize v5000                       | production | ibm_v5000               |
| IBM Storwize v7000                       | production | ibm_v7000               |
| IBM WebSphere Liberty Profile            | production | ibm_wlp                 |
| IBM XIV (*)                              | production | ibm_xiv                 |
| Microsoft IIS Webserver                  | production | iis                     |
| Juniper Junos                            | production | juniper_junos           |
| Juniper SRX                              | production | juniper_srx             |
| Microsoft SQL Server                     | production | mssql                   |
| NetApp cDOT                              | production | netapp_cdot             |
| Oracle Database (UNIX)                   | production | oracle_db               |
| Oracle Linux                             | production | oracle_linux            |
| Paloalto PanOS                           | production | paloalto_panos          |
| PostgreSQL Database (UNIX)               | production | postgresql              |
| Pure Storage FlashArray                  | production | purestorage_flasharray  |
| Pure Storage FlashBlade                  | production | purestorage_flashblade  |
| Red Hat Enterprise Linux                 | production | rhel                    |
| Rubrik Security Cloud (RSC)              | production | rubrik_rsc              |
| ScienceLogic SL1                         | production | sciencelogic_sl1        |
| Solaris                                  | production | solaris                 |
| SUSE Linux Enterprise Server             | production | suse                    |
| Ubuntu Linux                             | production | ubuntu                  |
| Veritas NetBackup                        | production | veritas_netbackup       |
| VMware vCenter (*)                       | production | vmware_vcenter          |
| VMware Avi Load Balancer (ALB) (*)       | production | vmware_alb              |
| VMware Cloud Provider Metering (CPM) (*) | production | vmware_cpm              |
| VMware NSX (*)                           | production | vmware_nsx              |
| Microsoft Windows Server                 | production | windows                 |
| Apache Tomcat                            | pilotready | apache_tomcat           |
| Apache Webserver                         | pilotready | apache_webserver        |
| Dell EMC PowerFlex (*) - DEPRECATED      | pilotready | dell_powerflex          |
| IBM Hardware Management Console (HMC)    | pilotready | hmc                     |
| SAP Netweaver (AIX)                      | pilotready | netweaver_aix           |
| OpenSSH (UNIX)                           | pilotready | openssh_unix            |
| EMC PowerFlex - NEW API BASED            | pilotready | powerflex               |
| SAP HANA Database                        | pilotready | sap_hana                |
| SUDO (UNIX)                              | pilotready | sudo_unix               |
| IBM Virtual I/O Server (VIO)             | pilotready | vio                     |
| Veeam Backup and Replication (VBR)       | pilotready | veeam                   |
| Veritas Cluster (UNIX)                   | pilotready | veritas_clusterunix     |
| VMware vSphere                           | pilotready | vmware_os_vsphere       |
| VMware vCenter                           | pilotready | vmware_os_vcenter       |

(*) **SEPARATE [LAUNCH NODE](https://pages.github.kyndryl.net/Continuous-Engineering/ansible_project_udc/latest/devices/launchnode/) REQUIRED**

## Support

| Request type | Procedure                                                                                                                  |
| ------------ | -------------------------------------------------------------------------------------------------------------------------- |
| Support      | [ServiceNow](https://kyndryleu.service-now.com/pl_tools) ticket against Best Practice Service (BPS), select UDC in submenu |
| Enhancements | Post an "Idea" to [Aha!](https://innovate-automate.ideas.aha.io/ideas) and tag it to the BPS tool                          |

- **Please do not contact the developers directly**
- Issues opened against this GitHub Repository will be closed and you will be advised to open a ticket on ServiceNow
- More detailed info can be found on the [BPS Support page](https://kyndryl.sharepoint.com/sites/sat/support)
    - _Please request access if needed_

### Project Life Cycle and Governance model

The development of UDC started in Q3 2021, and it is continuously expanding. New commits are accepted from the authors
of the project and approved by at least 2 other authors before pulling to the main production branch.

## Deployment

If an account wishes to use UDC from Ansible Automation Platform, they first need to be boarded onto the
[CACF infrastructure](https://kyndryl.sharepoint.com/sites/CACF/SitePages/CACF%20Delivery/Account%20Onboarding.aspx).
UDC can then be deployed using the deployment instructions available on the
[UDC DOCS site](https://pages.github.kyndryl.net/Continuous-Engineering/ansible_project_udc/latest/aap_configuration/)

### Schedule

The recommended schedule for UDC job executions is **daily**. This allows for fast detection of drifts and load
balances remediation activities. _This is a suggestion_ - individual circumstances of the account can
dictate other schedules. For example if you are running UDC for vCenter, it can take up to 24 hours for a data
collection to finish. In this case running daily is pointless - a weekly schedule might be a better approach.

## Known problems and limitations

Please see the Release Notes for the given version of UDC for known problems or limitations.

## Prerequisites

### CACF Prerequisites

UDC is designed to run on the CACF Platform, therefore all CACF prerequisites **must be met** for successful job executions.

These include specific configurations for:

- [User ID management standards](https://kyndryl.sharepoint.com/:u:/r/sites/CACF/SitePages/Education/Managing-User-IDs-for-Ansible-Automation-Platform.aspx)
- [Windows Endpoints](https://kyndryl.sharepoint.com/sites/CACF/SitePages/Engagement/4-Windows-Endpoints.aspx)
- [Unix / Linux Endpoints](https://kyndryl.sharepoint.com/sites/CACF/SitePages/Engagement/5.Unix---Linux-Endpoints.aspx)
    - [Python requirements](https://kyndryl.sharepoint.com/:u:/r/sites/CACF/SitePages/Education/7.Python-on-Endpoints---Jumphosts.aspx)
- [Storage and Network Endpoints](https://kyndryl.sharepoint.com/sites/CACF/SitePages/Engagement/Storage%20&%20Network%20Endpoints.aspx)

### Additional requirements

- **Supports only Ansible 2.15 and up**
- **Ansible Automation Platform**
    - Usage of the [`ansible_kyndryl_udc`] Execution Environment is **mandatory**.
        - If the version of the EE is not at least 1.3.1 please contact the team managing your AAP instance to [update it to the latest version](https://github.kyndryl.net/Continuous-Engineering/ansible_collection_cacf_dev_commontools/blob/master/aap_scripts/ee_readme.md)
        - In the next release UDC will stop working with `ansible_kyndryl_2.15`

### Prerequisites for devices using Launch Node

The detailed prerequisites can be found
[HERE](https://pages.github.kyndryl.net/Continuous-Engineering/ansible_project_udc/latest/devices/launchnode/)
for the Launch Node itself. Device-specific instructions can be read on the
[UDC DOCS/Devices](https://pages.github.kyndryl.net/Continuous-Engineering/ansible_project_udc/latest/devices/) page.

### Dependencies

- Global Event Socks tunnel role
    - [ansible-role-event-socks-tunnel](https://github.kyndryl.net/Continuous-Engineering/ansible-role-event-socks-tunnel)
- Global role to upload results to a sfs server
    - [ansible_role_sfs_upload](https://github.kyndryl.net/Continuous-Engineering/ansible_role_sfs_upload)
- Global role to generate return codes
    - [returncode](https://github.kyndryl.net/Continuous-Engineering/ansible_role_returncode/)

## Examples

Please refer to the [UDC DOCS site](https://pages.github.kyndryl.net/Continuous-Engineering/ansible_project_udc/latest/aap_configuration/).

## License

[Kyndryl Intellectual Property](https://github.kyndryl.net/Continuous-Engineering/CE-Documentation/blob/master/files/LICENSE.md)
