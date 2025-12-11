=====================
Sat.Udc Release Notes
=====================

.. contents:: Topics

v2.11.0
======

New Modules
-----------

- `sat.udc.ps_wrapper`: This module wraps around UDC's static powershell scripts to provide native ansible results
- `sat.udc.powerflex`: This module collects the data for the new PowerFlex API-based collector

v2.10.0
======

- `sat.udc.pexpect_pstcli`: added nvme_check segment

v2.6.0
======

New Modules
-----------

- `sat.udc.get_udc_info`: Gets troubleshooting info for support and credentials assigned for remediation enablement

v2.4.0
======

New Modules
-----------

- `sat.udc.rubrik_rsc`: on Rubrik Security Cloud (RSC) this module collects the data

Changes
--------

- sat.udc.pwsh_command - Now also handles GCP data collections

v2.2.0
======

New Modules
-----------

- `sat.udc.scli_login`: handles login for EMC PowerFlex data collections

Changes
--------

- sat.udc.pwsh_command - Now also handles AWS data collections

v2.1.0
======

New Modules
-----------

- `sat.udc.pexpect_dscli`: on IBM DS8000 this module collects the data
- `sat.udc.pexpect_dsmadmc`: on IBM Spectrum Protect this module collects the data
- `sat.udc.pexpect_pstcli`: on Dell EMC Powerstore this module collects the data
- `sat.udc.pexpect_uemcli`: on Dell EMC Unity this module collects the data
- `sat.udc.pexpect_xcli`: on IBM A9000 and IBM XIV this module collects the data


Changes
--------

- Version now matches that of UDC
- Multiple modules have been removed
    - sat.udc.dscli_command - module removed
    - sat.udc.isp_command - module removed
    - sat.udc.pstcli_command - module removed
    - sat.udc.oc_login - module removed
- sat.udc.pwsh_command - Now also handles Azure data collections

v1.0.0
======

New Modules
-----------

- sat.udc.apic_aio - Run arbitrary commands on UNIX endpoints (UDC specific)
- sat.udc.dscli_command - Run arbitrary commands on UNIX endpoints (UDC specific)
- sat.udc.isp_command - Run dsmadmc commands on IBM Spectrum Protect devices.
- sat.udc.nw_command - Run arbitrary commands on UNIX endpoints (UDC specific)
- sat.udc.oc_login - Run arbitrary commands on UNIX endpoints (UDC specific)
- sat.udc.pstcli_command - Run arbitrary commands on UNIX endpoints (UDC specific)
- sat.udc.pwsh_command - Run arbitrary commands on UNIX endpoints (UDC specific)
