# GETSTATION

![logo](https://assets.gitlab-static.net/uploads/-/system/project/avatar/12904447/index.png)

## INDEX

- [GETSTATION](#getstation)
  - [INDEX](#index)
  - [BADGES](#badges)
  - [FIRST UPDATE](#first-update)
  - [INTRODUCTION](#introduction)
  - [PREREQUISITES](#prerequisites)
  - [INSTALL](#install)
    - [DOCKER RUN](#docker-run)
    - [DOCKER COMPOSE](#docker-compose)
  - [LICENSE](#license)

## BADGES

[![pipeline status](https://gitlab.com/oda-alexandre/getstation/badges/master/pipeline.svg)](https://gitlab.com/oda-alexandre/getstation/commits/master)

## FIRST UPDATE

Date: 01-01-01

## INTRODUCTION

Ce repository contient the Dockerfile de

- [getstation](https://github.com/tristanheaven/getstation)

Continuous integration on :

- [gitlab](https://gitlab.com/oda-alexandre/getstation/pipelines)

Automatically updated on :

- [docker hub public](https://hub.docker.com/r/alexandreoda/getstation).

## PREREQUISITES

Use [docker](https://www.docker.com)

## INSTALL

### DOCKER RUN

```\
docker run -d \
--name getstation \
--privileged \
--network host \
--group-add audio \
--cap-add=SYS_ADMIN \
--device /dev/snd \
-e DISPLAY \
-e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
-v ${HOME}:/home/getstation \
-v /tmp/.X11-unix/:/tmp/.X11-unix/ \
-v /dev/shm:/dev/shm \
-v /var/run/dbus:/var/run/dbus \
-v /etc/localtime:/etc/localtime:ro \
-v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \
-v /lib/modules:/lib/modules \
alexandreoda/getstation
```

### DOCKER COMPOSE

```yml
version: "3.7"

services:
  getstation:
    container_name: getstation
    image: alexandreoda/getstation
    restart: "no"
    privileged: true
    network_mode: host
    cap_add:
      - SYS_ADMIN
    devices:
      - /dev/snd
    environment:
      - DISPLAY
      - PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native
    volumes:
      - "${HOME}:/home/getstation"
      - "/tmp/.X11-unix/:/tmp/.X11-unix/"
      - "/dev/shm:/dev/shm"
      - "/var/run/dbus:/var/run/dbus"
      - "/etc/localtime:/etc/localtime:ro"
      - "/lib/modules:/lib/modules"
      - "${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native"
```

## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://gitlab.com/oda-alexandre/getstation/blob/master/LICENSE)
