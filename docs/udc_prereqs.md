# UDC prerequisites

## Prerequisites on Launch Node

Launch Node is defined as the Linux node (RHEL 8 preferred) on the client's network which is the direct target of a CACF AAP Job Template (present in the "Limit" field) in cases where the actual data collection target cannot be directly reached from the CACF AAP. These include VMware vCenter, various Storage devices and some Network and Resiliency devices.

<!-- markdownlint-disable-next-line no-duplicate-heading -->
### Standalone software

- VMware PowerCLI (bunch of OSS licenses)
    - 13.2.1
- PowerShell (MIT)
    - 7.5.0

<!-- markdownlint-disable-next-line no-duplicate-heading -->
### Powershell modules

- ImportExcel (Apache 2.0)
    - 7.8.10

<!-- markdownlint-disable-next-line no-duplicate-heading -->
### Python packages

- pexpect (ISC)
    - 4.8.0
    - 4.9.0
- ptyprocess (ISC)
    - 0.7.0

<!-- markdownlint-disable-next-line no-duplicate-heading -->
### External code

Everything from [RamblingCookieMonster/PowerShell repository](https://github.com/RamblingCookieMonster/PowerShell) (MIT) - part of the code (Join-Object) is now in the Windows data collector which is deployed to - and subsequently cleaned up from - the target endpoint during UDC runtime.

## Prerequsites installed on the Execution Environment Image used on AAP

<!-- markdownlint-disable-next-line no-duplicate-heading -->
### Standalone software

- VMware PowerCLI (bunch of OSS licenses)
    - 13.2.1
- PowerShell (MIT)
    - 7.5.0
- AWS CLI (Apache 2.0)
    - 2.16.7
- Google Cloud CLI (Apache 2.0)
    - 509.0.0

<!-- markdownlint-disable-next-line no-duplicate-heading -->
### Powershell modules

- ImportExcel (Apache 2.0)
    - 7.8.10
- Az (Apache 2.0)
    - 13.1.0
- Az.ManagementPartner (Apache 2.0)
    - 0.7.5
- Az.NetAppFiles (Apache 2.0)
    - 0.20.1
- AWSPowerShell (Apache 2.0)
    - 4.1.750
- GoogleCloud (Apache 2.0)
    - 1.0.1.10

<!-- markdownlint-disable-next-line no-duplicate-heading -->
### Python packages

These are all explicitly requested installs, not listing their own prerequisites.

- ansible-core (GPLv3)
    - 2.15.13
- ansible-runner (Apache 2.0)
    - 2.4.0
- jmespath (MIT)
    - 1.0.1
- netmiko (MIT)
    - 4.5.0
- pandas (BSD)
    - 2.2.3
- pexpect (ISC)
    - 4.9.0
- pypsrp (MIT)
    - 0.8.1
- PySocks (BSD)
    - 1.7.1
- pywinrm (MIT)
    - 0.5.0
- PyYAML (MIT)
    - 6.0.2
- ansible-pylibssh (LGPLv2.1)
    - 1.2.2

<!-- markdownlint-disable-next-line no-duplicate-heading -->
### Ansible Collections

All of these are GPLv3.0

- community.general
    - 10.3.0
- ansible.utils
    - 5.1.2
- ansible.netcommon
    - 7.1.0
- ansible.windows
    - 2.7.0
- community.windows
    - 2.3.0
- cisco.aci
    - 2.10.1
- cisco.asa
    - 6.1.0
- cisco.ios
    - 9.1.1
- cisco.iosxr
    - 10.3.0
- cisco.nxos
    - 9.3.0
- junipernetworks.junos
    - 9.1.0
- community.vmware
    - 4.8.2
