## Table of Contents
1. Server Configuration
2. MergerFS
3. Synced Android Folders & GDrive (rclone)
4. Docker Contaieners
5. Google Apps Scripts

## Server Configurations

- BTC 4G MiFi

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

## Summary

TODO: Explaination of what server does, any scripts used, usefullness, etc.

## MergerFS

Directory structure desired.
```
/mnt/virt
	/mnt/plex1
	/mnt/plex2
	/mnt/usbdrive
```

MergerFS options
```
-o use_ino,cache.files=partial,dropcacheonclose=true,allow_other,category.create=mfs /mnt/plex1:/mnt/plex2:/mnt/usbdrive /mnt/virt
```

Important item:
- use_ino is for hard linking with Sonarr/Radarr.

## qBittorrent

TODO: Outline of categories, private trackers, seed ratios, etc.

## Plex

TODO: Outline of shared ports, library structure, auth/local subnets, etc.

## Docker Containers

1. [dashmachine](https://gist.github.com/TheBritishAccent/7704e8a6025d54172a8eb8d203fa2765#file-docker-compose-yml-L4) - [rmountjoy/dashmachine](https://hub.docker.com/r/rmountjoy/dashmachine)
2. [handbrake](https://gist.github.com/TheBritishAccent/7704e8a6025d54172a8eb8d203fa2765#file-docker-compose-yml-L12) - [jlesage/handbrake](https://hub.docker.com/r/jlesage/handbrake)
3. [jackett](https://gist.github.com/TheBritishAccent/7704e8a6025d54172a8eb8d203fa2765#file-docker-compose-yml-L21) - [linuxserver/jackett](https://hub.docker.com/r/linuxserver/jackett)
4. [komga](https://gist.github.com/TheBritishAccent/7704e8a6025d54172a8eb8d203fa2765#file-docker-compose-yml-L34) - [gotson/komga](https://hub.docker.com/r/gotson/komga)
5. [pms-docker](https://gist.github.com/TheBritishAccent/7704e8a6025d54172a8eb8d203fa2765#file-docker-compose-yml-L47) - [plexinc/pms-docker](https://hub.docker.com/r/plexinc/pms-docker)
6. [qbittorrentvpn](https://gist.github.com/TheBritishAccent/7704e8a6025d54172a8eb8d203fa2765#file-docker-compose-yml-L69) - [markusmcnugen/qbittorrentvpn](https://hub.docker.com/r/markusmcnugen/qbittorrentvpn)
7. [radarr](https://gist.github.com/TheBritishAccent/7704e8a6025d54172a8eb8d203fa2765#file-docker-compose-yml-L89) - [linuxserver/radarr](https://hub.docker.com/r/linuxserver/radarr)
8. [sonarr](https://gist.github.com/TheBritishAccent/7704e8a6025d54172a8eb8d203fa2765#file-docker-compose-yml-L103) - [linuxserver/sonarr](https://hub.docker.com/r/linuxserver/sonarr)
9. [tautulli](https://gist.github.com/TheBritishAccent/7704e8a6025d54172a8eb8d203fa2765#file-docker-compose-yml-L116) - [linuxserver/tautulli](https://hub.docker.com/r/linuxserver/tautulli)
10. [telegraf](https://gist.github.com/TheBritishAccent/7704e8a6025d54172a8eb8d203fa2765#file-docker-compose-yml-L129) - [telegraf](https://hub.docker.com/_/telegraf)

#### ***dashmachine***
Description: ree\
Host Server: `(boxie.lan / pi3.lan / pi4.lan)`\
docker-compose file: `x.yml`\
DockerHub repo: `lmao`\

#### ***handbrake***
Description: ree\
Host Server: `(boxie.lan / pi3.lan / pi4.lan)`\
docker-compose file: `x.yml`\
DockerHub repo: `lmao`\

#### ***(friendly-name)***
Description: ree\
Host Server: `(boxie.lan / pi3.lan / pi4.lan)`\
docker-compose file: `x.yml`\
DockerHub repo: `lmao`\
Ports exposed (internal -> external):
```
	xxxx -> xxxx/tcp
```
Mounts:
```
	.../.../x -> /.../x
```

TODO: add rest of containers here


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

### rclone

Remotes
| Name   | Type  |
|--------|-------|
| crypt  | crypt |
| gdrive | drive |


Differences in the Anime directory are checked and uploaded to Google Drive via a cron job scheduled to run at 12am & 12pm every day.

Crontab entry:
```
0 0/12 * * * rclone copy ~/android_sync/Anime/ crypt:anime/ -P && /usr/bin/curl https://hc-ping.com/e760d558-228b-4b62-a7dc-a4062c6615ec &>> ~/backup.log
```

## Pihole

TODO: Add blocklists

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