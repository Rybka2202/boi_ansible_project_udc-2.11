# udc_devices

The variable `udc_devices` is a list of dictionaries, a **mandatory variable** for the following devices:

- Dell EMC Powerstore (requires pstcli vendorCLI driver)
- IBM DS8000 (requires dscli vendorCLI driver)
- IBM Spectrum Protect (requires dsmadmc vendorCLI driver)
- Cisco APIC / ACI (API access required)
- Dell EMC PowerFlex (requires scli vendorCLI driver)
- Dell EMC Unity (requires uemcli vendorCLI driver)
- IBM A9000 (requires xcli vendorCLI driver)
- IBM XIV (requires xcli vendorCLI driver)

The above devices are only supported through the usage of a Launch Node. Please refer to the
[Launch Node page of UDC DOCS](https://pages.github.kyndryl.net/Continuous-Engineering/ansible_project_udc/latest/devices/launchnode/).

Device specific instructions can be read on the [UDC DOCS site](https://pages.github.kyndryl.net/Continuous-Engineering/ansible_project_udc/latest/devices/).

## Dictionary keys

Variable name          | Default   | Comments                                                                                                                             |
-----------------------|:---------:|--------------------------------------------------------------------------------------------------------------------------------------|
**host_ip** (string)   |           | **Mandatory** for all devices and is used to connect to the device                                                                   |
**host_name** (string) |           | **Mandatory** for ISP devices and optional for other vendorCLI endpoints.<br>Used instead of `host_ip` when naming the result files. |
**host_port** (string) |           | **Mandatory** for ISP devices. It's not used on other vendorCLI endpoints.                                                           |
**host_api** (string)  |           | Used with a few API devices. More info on the device specific documentation pages.                                                   |

## Variable examples

```yaml
udc_devices:
  - host_ip: "ip 1"
    host_name: "name 1"
    host_port: "port 1"
  - host_ip: "ip 2"
    host_name: "name 2"
    host_port: "port 2"
  - host_ip: "ip n"
    host_name: "name n"
    host_port: "port n"
```

### Single device examples

```yaml
udc_devices:
  - host_ip: 10.1.10.100
    host_name: DS8000-01
```

```yaml
udc_devices:
  - host_ip: 10.1.10.100
    host_name: ISP01
    host_port: 1500
```

### Multiple device examples

```yaml
udc_devices:
  - host_ip: 10.1.10.100
    host_name: ISP01
    host_port: 1500
  - host_ip: 10.1.10.101
    host_name: ISP02
    host_port: 1501
```
