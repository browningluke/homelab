# TBA - Home Lab 
- [TBA - Home Lab](#tba---home-lab)
	- [Server Configurations](#server-configurations)
	- [Summary](#summary)
	- [MergerFS](#mergerfs)
	- [qBittorrent](#qbittorrent)
	- [Plex](#plex)
	- [Docker Containers](#docker-containers)
			- [***dashmachine***](#dashmachine)
			- [***portainer***](#portainer)
			- [***code-server***](#code-server)
			- [***plex-stack***](#plex-stack)
			- [***pwndrop***](#pwndrop)
			- [***pyload***](#pyload)
			- [***reverse***](#reverse)
			- [***handbrake***](#handbrake)
	- [Synced Android Folders & GDrive (rclone)](#synced-android-folders--gdrive-rclone)
		- [**rclone**](#rclone)
	- [Pihole](#pihole)
	- [Google Apps Scripts](#google-apps-scripts)

## Server Configurations

**ISP**
- Service Provider: `Aliv`
- Modem: `Huawei B2338-168 4G LTE`

**boxie.lan**
- Proxmox VE 6.2-4
  - Ubuntu 20.04
  - pfSense 2.4.5-RELEASE-p1
- Intel(R) Core(TM) i7-4770K CPU @ 3.50 GHz (1 Socket)
- 32 GB (4x8GB) Corsair Dominator Platinum @ 1600MHz
- 600 GB 2.5" HDD (/) 
- 2x500 GB 2.5" HDD (/mnt/plex[1-2])
- 2TB Western Digital External HDD

**pi3.lan**
- Raspbian xx.xx
- Raspberry Pi 3B
- 1GB RAM
- 64GB SD Card

**pi4.lan**
- Raspbian xx.xx
- Raspberry Pi 4
- 4GB RAM
- 256GB SD Card

**Domains**
- thebritishaccent.net
- Local (behind CGNAT): `tba.lan`

## Summary

TODO: Explaination of what server does, any scripts used, usefullness, etc.

## MergerFS

Directory structure.
```
/mnt/virt
	/mnt/plex1
	/mnt/plex2
	/mnt/usbdrive
	/mnt/BIGBOI
```

MergerFS options
```
-o use_ino,cache.files=partial,dropcacheonclose=true,allow_other,category.create=mfs /mnt/plex1:/mnt/plex2:/mnt/usbdrive /mnt/virt
```

Important item:
- `use_ino` is for hard linking with Sonarr/Radarr.

## qBittorrent
TODO: Outline of categories, private trackers, seed ratios, etc.

## Plex
Libraries:
  - Anime
  - Anime Movies
  - Movies
  - MD Movies
  - MD TV

No-auth networks: `10.8.0.0/24`
LAN networks: `0.0.0.0/24` (while in docker container)

## Docker Containers

#### ***dashmachine***
Description: Central dashboard for all these services.\
Host Server: `boxie.lan`\
Accessible from: `dash.tba.lan`\
docker-compose file: [dashmachine.yml](dashmachine/docker-compose.yml)\
DockerHub repo: [rmountjoy/dashmachine](https://hub.docker.com/r/rmountjoy/dashmachine)

#### ***portainer***
Description: Manage all of these docker containers.\
Host Server: `boxie.lan`\
Accessible from: `port.tba.lan`\
docker-compose file: [portainer.yml](portainer/docker-compose.yml)\
DockerHub repo: [jlesage/handbrake](https://hub.docker.com/r/jlesage/handbrake)

#### ***code-server***
Description: Code from any browser.\
Host Server: `boxie.lan`\
Accessible from: `handbrake.tba.lan`\
docker-compose file: [handbrake.yml](handbrake/docker-compose.yml)\
DockerHub repo: [jlesage/handbrake](https://hub.docker.com/r/jlesage/handbrake)

#### ***plex-stack***
Description: Everything you could need (maybe?) for a plex server.\
Host Server: `boxie.lan`\
docker-compose file: [plex-stack.yml](plex-stack/docker-compose.yml)\
Containers:
  - plex:
    - Accessible from: `plex.tba.lan`
	- DockerHub repo: [plexinc/pms-docker](https://hub.docker.com/r/plexinc/pms-docker)
  - jacket: 
    - Accessible from: `jackett.tba.lan`
	- DockerHub repo: [linuxserver/jackett](https://hub.docker.com/r/linuxserver/jackett)
  - ombi:
    - Accessible from: `ombi.tba.lan`
	- DockerHub repo: [linuxserver/ombi](https://hub.docker.com/r/linuxserver/ombi)
  - qbittorrentvpn:
    - Accessible from: `qbt.tba.lan`
	- DockerHub repo: [markusmcnugen/qbittorrentvpn](https://hub.docker.com/r/markusmcnugen/qbittorrentvpn)
  - radarr:
    - Accessible from: `radarr.tba.lan`
	- DockerHub repo: [linuxserver/radarr](https://hub.docker.com/r/linuxserver/radarr)
  - sonarr:
    - Accessible from: `sonarr.tba.lan`
	- DockerHub repo: [linuxserver/sonarr](https://hub.docker.com/r/linuxserver/sonarr)
  - tautulli:
    - Accessible from: `tautulli.tba.lan`
	- DockerHub repo: [linuxserver/tautulli](https://hub.docker.com/r/linuxserver/tautulli)

#### ***pwndrop***
Description: Used as a file sharing page. Has way more potential than I'm using it for.\
Host Server: `boxie.lan`\
Accessible from: `pwn.tba.lan`\
docker-compose file: [pwndrop.yml](pwndrop/docker-compose.yml)\
DockerHub repo: [linuxserver/pwndrop](https://hub.docker.com/r/linuxserver/pwndrop)

#### ***pyload***
Description: Download files on my HS that could take a while.\
Host Server: `boxie.lan`\
Accessible from: `pyload.tba.lan`\
docker-compose file: [pyload.yml](pyload/docker-compose.yml)\
DockerHub repo: [linuxserver/pyload](https://hub.docker.com/r/linuxserver/pyload)

#### ***reverse***
Description: All that sweet reverse proxy goodness.\
Host Server: `boxie.lan`\
docker-compose file: [nginx.yml](nginx/docker-compose.yml)\
DockerHub repo: [jlesage/handbrake](https://hub.docker.com/_/nginx)

#### ***handbrake***
Description: Converting video codecs and file formats.\
Host Server: `boxie.lan`\
Accessible from: `handbrake.tba.lan`\
docker-compose file: [handbrake.yml](handbrake/docker-compose.yml)\
DockerHub repo: [jlesage/handbrake](https://hub.docker.com/r/jlesage/handbrake)


## Synced Android Folders & GDrive (rclone)

The directory structure of `android_sync`, of which `Anime` gets uploaded to GDrive with rclone. 
```
~/android_sync
	./Anime
		./*.(png/jpeg/gif/...)
		./Tachiyomi_Backup
	./Camera
		./*.(png/jpeg/mp4/...)
	./Memes
		./*.(png/jpeg/gif/...)
```

### **rclone**

**Remotes**
| Name   | Type  |
|--------|-------|
| crypt  | crypt |
| gdrive | drive |


Differences in the Anime directory are checked and uploaded to Google Drive via a cron job scheduled to run at 12am & 12pm every day.

Crontab entry:
```
0 0/12 * * * rclone copy ~/android_sync/Anime/ crypt:anime/ -P && /usr/bin/curl %HEALTHCHECK_URL% &>> ~/backup.log
```

## Pihole
Blocklists:
```
- https://raw.githubusercontent.com/d43m0nhLInt3r/socialblocklists/master/TikTok/tiktokblocklist.txt
- https://dbl.oisd.nl
- https://hosts-file.net/ad_servers.txt
- https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt
- https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt
- http://sysctl.org/cameleon/hosts
- https://mirror1.malwaredomains.com/files/justdomains
- https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
```
Rough total of blocked domains (as of 2020-10-10): `988,681`
Local DNS domains:
	- boxie.lan -> `10.8.0.116`
    - pi3.lan   -> `10.8.0.161`
    - pi4.lan   -> `10.8.0.109`
    - proxmox.lan -> `10.8.0.116`
    - tower.lan -> `10.8.0.130`
    - ubuntu.lan -> `10.8.0.160`
    - *.tba.lan -> `10.8.0.160` (reverse proxy)

## Google Apps Scripts

TODO: Outline currently running scripts on GAS, purpose, frequency, etc.

***(Script-name)***\
Purpose: `a`\
Frequency: `(x) (hrs/days/mnths)`\
Link: `a`\
APIs Used:
```
x
```


TODO: add rest of GA scripts.

---
**On Server Death**\
TODO: Instructions on re-installation, script to pull data from this repo. 