# Release Notes

This is a minor release of UDC.

## Breaking changes coming in next release

### Shared CACF users

With the 2.12 release of UDC (planned for first full week of June) we will remove the collections/requirements.yml file.
This change means that Project updates will happen significantly faster, **but UDC will now require the usage of the
`ansible_kyndryl_udc` Execution Environment** which is Globally Available in all CACF instances.

With this release please transition away from the ansible_kyndryl_2.15 EE in favour of ansible_kyndryl_udc.
The EE should be on the 1.3.1 version, which can be easily checked in AAP by going to the "Execution Environments" menu
and verifying the end of the image URL.

If it is downlevel, please contact AAP System Administrators to update the EE versions, which is their responsibility
and [there is an automated process available for this task](https://github.kyndryl.net/Continuous-Engineering/ansible_collection_cacf_dev_commontools/blob/master/aap_scripts/ee_readme.md).

### Dedicated CACF users

ansible_kyndryl_udc should be added as a Globally Available execution environment available via the following
Artifactory URL: kyndryl.jfrog.io/gts-cacf-global-team-prod-docker-local/ee/ansible_kyndryl_udc:1.3.1

## Bug fixes

- Removed a limitation causing the check_list variable to be registered based on the first host's variable
  for all hosts. Host or group specific check_list variable assignment is possible again.
- **Checkpoint Firewall**
  - Fixed an issue with `show_uptime` segment
- **Microsoft Windows**
  - Fixed the path for Windows Defender registry entries
    - Fixed an issue with `Windows_Lcl_Users` segment causing hangs in certain cases
- **Oracle Solaris**
  - Ruggedized `SW_C_4_1_9_Disable_Host-based` segment

## New devicetypes

- **OpenSSH (UNIX)**
  - new supported devicetype in `pilotready` state
- **Veeam Backup and Replication (VBR)**
  - new supported devicetype in `pilotready` state
- **EMC PowerFlex**
  - new supported devicetype in `pilotready` state
  - this REST API-based collector deprecates the
    previous collector for PowerFlex based on `scli`.
    Usage of a separate Launch Node is not required
    with it.

## Changes

- **Checkpoint Firewall**
  - Added 2 new segments for device topology
    - `show_version_all`
    - `dmiparse`
- **IBM AIX**
  - Added 1 new segment
    - `lparstat_u`
- **Juniper JunOS and Juniper SRX**
  - Added 3 new segments (MI)
    - `show_system_memory`
    - `show_system_storage`
    - `show_interfaces_extensive`
- **Red Hat Enterprise Linux**
  - Added new RHEL7 specific segments for v10.1 Tech Spec
- **VMware Vcenter**
      - Added message in `VMsecurity` segment in case of no VMs (both on vmware_ap_vcenter and vmware_os_vsphere)
      - Added support for "NoiSCSI" in iSCSI HBA details (both on vmware_ap_vcenter and vmware_os_vsphere)

## Remediation - Note

A stripped-down version of UDC playbook (`oneshot.yml`) and some other task
files in multiple roles are left in the release branch. This is intentional
in preparation for remediation testing,
**accounts should NOT change the playbook of their UDC job templates.**
