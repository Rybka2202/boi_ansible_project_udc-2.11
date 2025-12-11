# Ansible Collection - sat.udc

## Overview

This collection is an integrated part UDC (Unified Data Collector) and is designed to enhance its functionality. It only adds custom modules and nothing else.

It should not be used outside of UDC executions.

## Requirements

Generic CACF and UDC prerequisites, everyting is covered on the devicetype specific [UDC DOCS](https://pages.github.kyndryl.net/Continuous-Engineering/ansible_project_udc) pages.

## Installation

As the collection is the part of the folder structure of UDC it does not have to be individually installed.

### Modules

This collection includes the following custom modules:

- [apic_aio](plugins/modules/apic_aio.py)
- [nw_command](plugins/modules/nw_command.py)
- [pexpect_dscli](plugins/modules/pexpect_dscli.py)
- [pexpect_dsmadmc](plugins/modules/pexpect_dsmadmc.py)
- [pexpect_pstcli](plugins/modules/pexpect_pstcli.py)
- [pexpect_uemcli](plugins/modules/pexpect_uemcli.py)
- [pexpect_xcli](plugins/modules/pexpect_xcli.py)
- [pwsh_command](plugins/modules/pwsh_command.py)
- [scli_login](plugins/modules/scli_login.py)
- [rubrik_rsc](plugins/modules/rubrik_rsc.py)
- [get_udc_info](plugins/modules/get_udc_info.py)
- [ps_wrapper](plugins/modules/ps_wrapper.ps1)
- [powerflex](plugins/modules/powerflex.py)

Overview of each module can be found at [plugins/README.md](plugins/README.md)

## License

[Kyndryl Intellectual Property](https://github.kyndryl.net/Continuous-Engineering/CE-Documentation/blob/master/files/LICENSE.md)
