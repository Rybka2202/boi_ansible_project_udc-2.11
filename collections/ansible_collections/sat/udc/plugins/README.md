# sat.udc Collection Plugins Directory

## Module Overview

- `sat.udc.apic_aio`: on Cisco APIC this module creates the required inventory for SAT topology based on previous queries
- `sat.udc.nw_command`: when using the Netmiko python library this module performs the actual data collection
- `sat.udc.pexpect_dscli`: on IBM DS8000 this  module collects the data
- `sat.udc.pexpect_dsmadmc`: on IBM Spectrum Protect this module collects the data
- `sat.udc.pexpect_pstcli`: on Dell EMC Powerstore this module collects the data
- `sat.udc.pexpect_uemcli`: on Dell EMC Unity this module collects the data
- `sat.udc.pexpect_xcli`: on IBM A9000 and IBM XIV this module collects the data
- `sat.udc.pwsh_command`: This module is used to launch powershell scripts targeting Hyperscaler devices
  (Azure, vCenter, AWS, GCP) where credentials have to be securely passed as environment variables
- `sat.udc.scli_login`: handles login for EMC PowerFlex data collections
- `sat.udc.rubrik_rsc`: handles data collection from Rubrik Security Cloud
- `sat.udc.get_udc_info`: Gets troubleshooting info for support and credentials assigned for remediation enablement
- `sat.udc.ps_wrapper`: wraps around UDC's static powershell scripts to provide native ansible results
- `sat.udc.powerflex`: collects the data for the new PowerFlex API-based collector
