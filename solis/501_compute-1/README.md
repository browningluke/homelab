# solis:501 - compute-1

`VMID: 501` `IP: 10.8.5.1`

Most of Solis' Docker stacks are running on this VM. Many of the stacks share a common dependent stack (gocryptfs), thus a compromise was made to run all of these on a single VM - as it makes it slightly easier.

This VM was created with CloudInit, from a base Debian-11 template image (see `/templates/cloudinit/`).

## VM Config
|      Stat     |    Value    |
|:-------------:|:-----------:|
|      vCPU     |      4      |
|     Memory    | 2GiB / 8GiB |
|  Guest Agent  |      ✗      |
| Start at Boot |      ✗      |
|   CloudInit   |      ✓      |

## Storage
| Size |      Device Name     |   Device ID   |
|:----:|:--------------------:|:-------------:|
|  34G | Proxmox Virtual Disk | vm-501-disk-0 |

## Mounts
|       Share       |  Mount Point | Mode |
|:-----------------:|:------------:|:----:|
|  //omv.sol/media  |  /mnt/media  |  RW  |
| //omv.sol/gocrypt | /mnt/gocrypt |  RW  |

  
## Network Interfaces
| Common Name | PVE Mapping |      IP      |
|:-----------:|:-----------:|:------------:|
|     LAN     |    vmbr4    | 10.8.5.1/16  |

## Applications

See `docker/`.
