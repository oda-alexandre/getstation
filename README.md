# GETSTATION

<img src="https://station-website.cdn.prismic.io/station-website%2F56c6c214-38ea-4449-bba2-93f9b7807c0e_logo-station-blue.svg" />


## INDEX

- [Badges](#BADGES)
- [Introduction](#INTRODUCTION)
- [Prerequis](#PREREQUIS)
- [Installation](#INSTALLATION)
- [License](#LICENSE)


## BADGES

[![version](https://images.microbadger.com/badges/version/alexandreoda/app.svg)](https://microbadger.com/images/alexandreoda/app)
[![size](https://images.microbadger.com/badges/image/alexandreoda/app.svg)](https://microbadger.com/images/alexandreoda/app")
[![build](https://img.shields.io/docker/build/alexandreoda/app.svg)](https://hub.docker.com/r/alexandreoda/app)
[![automated](https://img.shields.io/docker/automated/alexandreoda/app.svg)](https://hub.docker.com/r/alexandreoda/app)


## INTRODUCTION

Ce repository contient le Dockerfile de

- [getstation](https://github.com/tristanheaven/getstation)

Mis à jour automatiquement dans le [docker hub public](https://hub.docker.com/r/alexandreoda/getstation).


## PREREQUIS

Installer [docker](https://www.docker.com)


## INSTALLATION

```
docker run -d --name getstation -v ${HOME}/Downloads:/home/getstation/Downloads -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v /dev/snd:/dev/snd -v /dev/shm:/dev/shm -v /var/run/dbus:/var/run/dbus -v /etc/localtime:/etc/localtime:ro -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native --group-add $(getent group audio | cut -d: -f3) -v /lib/modules:/lib/modules --privileged --cap-add=ALL -e DISPLAY alexandreoda/getstation
```


## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://github.com/oda-alexandre/getstation/blob/master/LICENSE)
