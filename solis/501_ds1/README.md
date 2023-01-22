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

## Manual Configuration Steps
These steps will be automated in the future, but exist here as documentation.

```
# Install Docker
$ sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
$ sudo mkdir -p /etc/apt/keyrings
$ curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
$ echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
$ sudo apt-get update
$ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Add user to Docker group
$ sudo groupadd docker
$ sudo usermod -aG docker $USER
$ newgrp docker

# Docker Swarm
$ docker swarm join --token <token> ds0.sol.browningluke.dev:2377
```
