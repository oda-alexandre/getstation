# GETSTATION

<img src="https://assets.gitlab-static.net/uploads/-/system/project/avatar/12904447/index.png" width="200" height="200"/>

## INDEX

- [GETSTATION](#getstation)
  - [INDEX](#index)
  - [BADGES](#badges)
  - [FIRST UPDATE](#first-update)
  - [INTRODUCTION](#introduction)
  - [PREREQUISITES](#prerequisites)
  - [INSTALL](#install)
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

```
docker run -d --name getstation -v ${HOME}:/home/getstation -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v /dev/snd:/dev/snd -v /dev/shm:/dev/shm -v /var/run/dbus:/var/run/dbus -v /etc/localtime:/etc/localtime:ro -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native --group-add $(getent group audio | cut -d: -f3) -v /lib/modules:/lib/modules --privileged --network host --cap-add=ALL -e DISPLAY alexandreoda/getstation
```

## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://gitlab.com/oda-alexandre/getstation/blob/master/LICENSE)
