# solis:501 - ds1

`VMID: 501` `IP: 10.50.0.x (DHCP)` `Hostname: ds1.sol.browningluke.dev`

A worker node added to the docker swarm `ds`.

This VM was created with cloud-init (see `./cloudinit`); from a base Debian 11 template image.

## VM Config
|      Stat     |    Value    |
|:-------------:|:-----------:|
|      vCPU     |      4      |
|     Memory    | 1GiB / 4GiB |
|  Guest Agent  |      ✓      |
| Start at Boot |      ✗      |
|   CloudInit   |      ✓      |

## Storage
| Size |      Device Name     |   Device ID   |
|:----:|:--------------------:|:-------------:|
|  8G  | Proxmox Virtual Disk | vm-501-disk-0 |
  
## Network Interfaces
| Common Name | PVE Mapping |      IP      |  VLAN  |  DHCP  |
|:-----------:|:-----------:|:------------:|:------:|:------:|
|   VSWARM    |    vmbr99   | 10.50.0.x/24 |   50   |    ✓   |
