# solis:500 - ds0

`VMID: 500` `IP: 10.50.0.x` `Hostname: ds0.sol.browningluke.dev`

The (sole) manager node of the docker swarm `ds`. Being the manager, it runs the main Traefik entrypoint, as well as swarm management tools - such as Portainer.

This VM was created with cloud-init (see `./cloudinit`); from a base Debian 11 template image.

## VM Config
|      Stat     |     Value     |
|:-------------:|:-------------:|
|      vCPU     |       4       |
|     Memory    | 512MiB / 2GiB |
|  Guest Agent  |       ✓       |
| Start at Boot |       ✗       |
|   CloudInit   |       ✓       |

## Storage
| Size |      Device Name     |   Device ID   |
|:----:|:--------------------:|:-------------:|
|  4G  | Proxmox Virtual Disk | vm-500-disk-0 |
  
## Network Interfaces
| Common Name | PVE Mapping |      IP      |  VLAN  |  DHCP  |
|:-----------:|:-----------:|:------------:|:------:|:------:|
|   VSWARM    |    vmbr99   | 10.50.0.x/24 |   50   |    ✓   |
