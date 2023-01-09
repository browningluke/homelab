# solis

`OS: Proxmox Virtual Environment` `Management IP: 10.8.0.2`

solis is the central hub for the entire homelab. Being the most mature 'on-prem' server, it has the greatest proportion of time and effort spent working on the homelab project. Although, it has ancestors which are not yet documented. My knowledge of UNIX and homelabs comes from tinkering with this server, which unfortunately leads to the accumulation of lots of undocumented config options, messy file systems, and mono-VMs. Effort is being made to fix all of these, with the goal of having a clean, manageable, and documented host in the future.

I have many plans for solis; some of which are new endeavours, and others are repayment of technical debt taken in the past.

## Hardware
|                 |                         Value                        |                                                                           Link                                                                           |
|:---------------:|:----------------------------------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------:|
| **Base Server** |          HPE ProLiant MicroServer Gen10 Plus         | [HPE](https://buy.hpe.com/ca/en/servers/proliant-microserver/proliant-microserver/proliant-microserver/hpe-proliant-microserver-gen10-plus/p/1012241014) |
|     **CPU**     | 4 x Intel(R) Xeon(R) E-2224 CPU @ 3.40GHz (1 Socket) |           [Intel](https://www.intel.ca/content/www/ca/en/products/sku/191036/intel-xeon-e2224-processor-8m-cache-3-40-ghz/specifications.html)           |
|     **RAM**     |            32G - 2 x 16GB UDIMM ECC Memory           |                                                                          Unknown                                                                         |
|     **WiFi**    |      TP-Link T4U High Gain Wireless USB Adapter      |                                    [TP-Link](https://www.tp-link.com/ca/home-networking/high-gain-adapter/archer-t4u/)                                   |
| **GPU Adapter** |              Benfei VGA to HDMI Adapter              |                          [Amazon](https://www.amazon.ca/gp/product/B07K14NR8P/ref=ppx_yo_dt_b_asin_title_o00_s00?ie=UTF8&psc=1)                          |

### Base Server

Purchased in 2020 in the US, and imported. Perfect balance between size and performance for my needs, at a reasonable price point for a student.

### RAM

The base server came stock with 16G (1 x 16GB UDIMM). In the latter half of 2021, I purchased an additional stick to increase it to 32GB.

### WiFi

solis' current location does not have access to either a direct ISP connection, or an upstream router. As a result, a WiFi adapter is used to connect to the gateway router. See [#Upstream](#upstream) for more details.

### GPU Adapter

The HPE MicroServer only has 2 display outputs: DisplayPort and VGA. The GPU does not, by default, output video to the DisplayPort connection, and has to be enabled via the OS. For video display when accessing the BIOS, or other pre-OS operations, the VGA port has to be used. As a result, I use a Benfei VGA to HDMI adapter to fix this issue.

## Storage

### Internal
| Size |        Drive Model       |            Use            | Model Number |
|:----:|:------------------------:|:-------------------------:|:------------:|
|  1T  |   Kingston 2.5" SSD 1TB  | PVE Boot Disk / LVM pool  |    Unknown   |
| 500G |   Unknown 2.5" HDD 500G  |     Passthrough to OMV    |    Unknown   |
|  6T  | Seagate IronWolf NAS 6TB |     Passthrough to OMV    |  ST6000VN001 |
|  6T  | Seagate IronWolf NAS 6TB |     Passthrough to OMV    |  ST6000VN001 |

### External
| Size |            Drive Model            |         Use        | Model Number |
|:----:|:---------------------------------:|:------------------:|:------------:|
|  1T  |   WD My Passport 0820 Ultra 2TB   | Passthrough to OMV |   0820 (?)   |
| 500G | Unknown 2.5" HDD 500G in SABRENT* | Passthrough to OMV |    Unknown   |
| 500G | Unknown 2.5" HDD 500G in SABRENT* | Passthrough to OMV |    Unknown   |
| 750G | Unknown 2.5" HDD 750G in SABRENT* | Passthrough to OMV |    Unknown   |

#### SABRENT

A lot of solis' storage is in 2.5" HDD format (see [#Unknown Disks](#unknown-disks) for an explanation). The HPE MicroServer only provides 4 internal 3.5" bays, so I use a [SABRENT USB 3.0 4 Bay 2.5" Hard Drive/SSD Docking Station](https://sabrent.com/products/ds-4ssd) to dock these extra drives. They are connected to solis over USB 3.0, which *might* (the drives are old and slow) be a bottleneck if all drives are R/W from simultaneously, but performance is not a requirement for these disks. 

### Unknown Disks

Ideally, to have the most confidence in ensuring data integrity, one would know the exact origin and specifications of every disk. However, as solis evolved over time, HDDs were scavenged from other places, such as old laptops. This is a terrible idea, and the reasons why do not need to be stated. However, compromising data integrity is a decision I am willing to make. None of the data stored on these disks is valuable, and I am fully prepared to lose all of it. No VM/app config data is stored on these disks either. As a hobbyist/student unwilling to invest hundreds of dollars in expensive HDDs, I stand by my decision to use recycle old disks for cheap but volatile storage. 

## Network

### Interfaces
| Interface Name |   Common Name  | PVE Mapping |      IP     |
|:--------------:|:--------------:|:-----------:|:-----------:|
|      eno1      |       WAN      |    vmbr1    |             |
|      eno2      |                |    vmbr2    |             |
|      eno3      |       LAN      |    vmbr4    |             |
|      eno4      | PVE Management |    vmbr0    | 10.8.0.2/16 |

### Upstream

Located in Vancouver, solis connects to an ISP router provided by Telus. Due to the nature of the physical location of solis, it cannot connect directly to this router. As a result, it uses a USB 3.0 5GHz WiFi adapter; which supports *at least* 500 Mbps full duplex, so the concern of being bottle-necked over WiFi is minimal (although latency and connectivity is still a concern).

Being behind the ISP router, solis is double-NATed. I, also, have no access to the ISP router, and am thus unable to establish incoming connections. 

Average connection speeds:
- Download: 200-300 Mbps
- Upload: 50-70 Mbps
