# solis:502 - ds2

`VMID: 502` `IP: 10.50.0.x` `Hostname: ds2.sol.browningluke.dev`

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
|  24G | Proxmox Virtual Disk | vm-502-disk-0 |
  
## Network Interfaces
| Common Name | PVE Mapping |      IP      |  VLAN  |  DHCP  |
|:-----------:|:-----------:|:------------:|:------:|:------:|
|   VSWARM    |    vmbr99   | 10.50.0.x/24 |   50   |    ✓   |
