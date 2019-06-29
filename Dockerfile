# IMAGE TO USE
FROM debian:stretch-slim

# MAINTAINER
MAINTAINER https://www.oda-alexandre.com/

# VARIABLES
ENV USER getstation
ENV APP https://dl.getstation.com/download/linux_64?filetype=AppImage
ENV DEBIAN_FRONTEND noninteractive

# INSTALL PACKAGES
RUN apt-get update && apt-get install -y --no-install-recommends \
sudo \
ca-certificates \
dirmngr \
wget \
fuse \
libgtk2.0-0 \
libgtk-3-0 \
libnss3 \
libasound2 \
libasound2-plugins \
pulseaudio \
pulseaudio-utils \
alsa-utils \
libcanberra-gtk-module \
libcanberra-gtk3-module \
libgl1-mesa-dri \
libgl1-mesa-glx \
mesa-utils \
xdg-utils && \

# ADD USER
useradd -d /home/${USER} -m ${USER} && \
passwd -d ${USER} && \
adduser ${USER} sudo

# SELECT USER
USER ${USER}

# SELECT WORKING SPACE
WORKDIR /home/${USER}

# INSTALL APP
RUN wget ${APP} -O /home/${USER}/browserX.AppImage && \
sudo addgroup fuse && \
sudo adduser ${USER} fuse && \
sudo chmod +x browserX.AppImage && \

# CLEANING
sudo apt-get --purge autoremove -y \
wget && \
sudo apt-get autoclean -y && \
sudo rm /etc/apt/sources.list && \
sudo rm -rf /var/cache/apt/archives/* && \
sudo rm -rf /var/lib/apt/lists/*

# START THE CONTAINER
ENTRYPOINT ./browserX.AppImage \
