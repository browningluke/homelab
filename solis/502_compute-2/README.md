# solis:502 - compute-2

`VMID: 502` `IP: 10.8.5.2`

This VM is purely used for Plex at the moment. The resources allocated meet Plex's recommend spec, and there is no expectation of sharing these with other applications. Plex's content is accessible from mounted shares: a media share, as well as an Rclone vdisk share.

This VM was created with CloudInit, from a base Debian-11 template image (see `/templates/cloudinit/`).

## VM Config
|      Stat     |    Value    |
|:-------------:|:-----------:|
|      vCPU     |      4      |
|     Memory    | 2GiB / 4GiB |
|  Guest Agent  |      ✗      |
| Start at Boot |      ✗      |
|   CloudInit   |      ✓      |

## Storage
| Size |      Device Name     |   Device ID   |
|:----:|:--------------------:|:-------------:|
|  34G | Proxmox Virtual Disk | vm-502-disk-0 |

## Mounts
|          Share          |     Mount Point    | Mode |
|:-----------------------:|:------------------:|:----:|
|     //omv.sol/media     |     /mnt/media     |  RO  |
| //omv.sol/gdrive-vdisk1 | /mnt/gdrive-vdisk1 |  RO  |

  
## Network Interfaces
| Common Name | PVE Mapping |      IP      |
|:-----------:|:-----------:|:------------:|
|     LAN     |    vmbr4    | 10.8.5.2/16  |

## Applications

See `docker/`.
