# solis:201 - OMV

`VMID: 201` `IP: 10.8.0.51`

Solis uses OpenMediaVault as the hub for all persistant **static** content. All attached storage devices mount in this VM. It handles pooling of file systems with MergerFS, exposing one main pool, and one Time Machine pool (for MacOS backups). File system integrity is *attempted* with SnapRAID. Cloud storage also mounts directly to this VM with Rclone, providing vdisk interfaces. Shares are accessible to other VMs over SMB. 

**NB:** As of present, all Docker config volumes are stored locally on each VM. This is an intentional decision resulting from poor performance in testing with app config/db volumes over SMB.


## VM Config
|      Stat     | Value |
|:-------------:|:-----:|
|      vCPU     |   1   |
|     Memory    |  4GiB |
|  Guest Agent  |   ✓   |
| Start at Boot |   ✗   |
|   CloudInit   |   ✗   |

## Storage
| Size |            Device Name           |                       Device ID                      |
|:----:|:--------------------------------:|:----------------------------------------------------:|
|  32G |       Proxmox Virtual Disk       |                     vm-201-disk-0                    |
|  32G |       Proxmox Virtual Disk       |                     vm-201-disk-1                    |
| 1.2T |     WD My Passport Ultra 2TB     | usb-WD_My_Passport_0820_57583231454333454B4C3237-0:0 |
| 500G |       Unknown 2.5" HDD 500G      |            ata-ST500LT012-9WS142_W0V64P1S            |
| 500G | Unknown 2.5" HDD 500G in SABRENT |         usb-SABRENT_DISK00_DB98765432146-0:0         |
| 750G | Unknown 2.5" HDD 750G in SABRENT |         usb-SABRENT_DISK02_DB98765432146-0:1         |
| 500G | Unknown 2.5" HDD 500G in SABRENT |           usb-SABRENT_DISK03_DB98765432146           |
|  6T  |     Seagate IronWolf NAS 6TB     |            ata-ST6000VN001-2BB186_ZCT2F7GS           |
|  6T  |     Seagate IronWolf NAS 6TB     |            ata-ST6000VN001-2BB186_ZR14A70T           |
  
## Network Interfaces
| Common Name | PVE Mapping |      IP      |
|:-----------:|:-----------:|:------------:|
|     LAN     |    vmbr4    | 10.8.0.51/16 |

## Applications

### Rclone

TODO

### MergerFS

```yaml
- name: timemachine
  disks:
    - usb-SABRENT_DISK00_DB98765432146-0:0
    - usb-SABRENT_DISK02_DB98765432146-0:1
  policy: LFS (Least free space)
  min_free_space: 4G
  opts: _netdev,defaults,allow_other,cache.files=off,use_ino,noforget,inodecalc=path-hash,func.getattr=newest

- name: virt
  disks:
    - usb-WD_My_Passport_0820_57583231454333454B4C3237-0:0
    - ata-ST500LT012-9WS142_W0V64P1S
    - usb-SABRENT_DISK03_DB98765432146-0:2
    - ata-ST6000VN001-2BB186_ZCT2F7GS
  policy: MFS (Most free space)
  min_free_space: 4G
  opts: _netdev,defaults,allow_other,cache.files=off,use_ino,noforget,inodecalc=path-hash,func.getattr=newest
```

### SnapRAID
|                         Name                         | Content | Data | Parity |
|:----------------------------------------------------:|:-------:|:----:|:------:|
|            ata-ST6000VN001-2BB186_ZCT2F7GS           |         |   ✓  |        |
| usb-WD_My_Passport_0820_57583231454333454B4C3237-0:0 |         |   ✓  |        |
|            ata-ST500LT012-9WS142_W0V64P1S            |         |   ✓  |        |
|         usb-SABRENT_DISK03_DB98765432146-0:2         |         |   ✓  |        |
|            ata-ST6000VN001-2BB186_ZR14A70T           |    ✓    |      |    ✓   |
|                     vm-201-disk-1                    |    ✓    |      |        |

### VM Specific Info

OMV Plugins Installed:
- openmediavault-mergerfs
- openmediavault-snapraid
