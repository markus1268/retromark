# Retromark

**Linux entertainment tv box**, [ Kodi media player, Retro gaming and Browser ]
- Arch  : arm
- Board : Raspberry pi 3, Raspberrypi 4, Amlogic S905
- Build system : Buildroot
---
**Building Retromark**

Configure and build buildroot
```bash
$ cd retromark_path
$ ./scripts/buildroot_config.sh raspberrypi4_64
$ ./scripts/buildroot_build.sh raspberrypi4_64
```
Clean
```bash
$ ./scripts/buildroot_clean.sh raspberrypi4_64
```
Docker shell
```bash
$ ./scripts/buildroot_shell.sh raspberrypi4_64
```
---
**Docker Image**

Build docker image
```bash
$ cd retromark_path
$ ./scripts/docker_build_retromark_image.sh
```

Publish docker image to docker hub
```bash
$ cd retromark_path
$ docker login
$ ./scripts/docker_publish_retromark_image.sh
```

Get docker image from docker hub
```bash
$ cd retromark_path
$ ./scripts/docker_pull_retromark_image.sh
```
---
**Todo:**
- [x] Buildroot submodule
- [x] Docker and build tool scripts
- [x] BR2_EXTERNAL
- [ ] RPI4 platform support
- [ ] S905 platform support
- [ ] OdroidC2 platform support
- [ ] Kodi
- [ ] RetroArch
- [ ] Web Browser