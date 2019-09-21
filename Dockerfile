FROM debian:stretch-slim

LABEL authors https://www.oda-alexandre.com/

ENV USER getstation
ENV LANG fr_FR.UTF-8
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 1.47.0
ENV APP https://dl.getstation.com/download/linux_64?filetype=AppImage

RUN echo -e '\033[36;1m ******* INSTALL PACKAGES ******** \033[0m' && \
apt update && apt install -y --no-install-recommends \
sudo \
locales \
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
xdg-utils

RUN echo -e '\033[36;1m ******* CHANGE LOCALES ******** \033[0m' && \
echo ${LANG} > /etc/locale.gen && locale-gen

RUN echo -e '\033[36;1m ******* ADD USER ******** \033[0m' && \
useradd -d /home/${USER} -m ${USER} && \
passwd -d ${USER} && \
adduser ${USER} sudo

RUN echo -e '\033[36;1m ******* INSTALL APP ******** \033[0m' && \
mkdir appimage && \
wget ${APP} -O appimage/browserX.AppImage && \
addgroup fuse && \
adduser getstation fuse && \
chmod +x appimage/browserX.AppImage

RUN echo -e '\033[36;1m ******* SELECT USER ******** \033[0m'
USER ${USER}

RUN echo -e '\033[36;1m ******* CLEANING ******** \033[0m' && \
sudo apt-get --purge autoremove -y \
wget && \
sudo apt-get autoclean -y && \
sudo rm /etc/apt/sources.list && \
sudo rm -rf /var/cache/apt/archives/* && \
sudo rm -rf /var/lib/apt/lists/*

RUN echo -e '\033[36;1m ******* CONTAINER START COMMAND ******** \033[0m'
ENTRYPOINT appimage/browserX.AppImage --no-sandbox \