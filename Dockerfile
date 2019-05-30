FROM debian:stretch-slim

MAINTAINER https://www.oda-alexandre.com/

# VARIABLES
ENV USER getstation
ENV APP https://dl.getstation.com/download/linux_64?filetype=AppImage
ENV LANG fr_FR.UTF-8
ENV DEBIAN_FRONTEND noninteractive

# INSTALLATION DES PREREQUIS
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

# AJOUT UTILISATEUR
useradd -d /home/${USER} -m ${USER} && \
passwd -d ${USER} && \
adduser ${USER} sudo

# SELECTION UTILISATEUR
USER ${USER}

# SELECTION ESPACE DE TRAVAIL
WORKDIR /home/${USER}

# INSTALLATION DE L'APPLICATION
RUN wget ${APP} -O /home/${USER}/browserX-1.42.1-x86_64.AppImage && \
sudo addgroup fuse && \
sudo adduser ${USER} fuse && \
sudo chmod +x browserX-1.42.1-x86_64.AppImage && \

# NETTOYAGE
sudo apt-get --purge autoremove -y \
wget && \
sudo apt-get autoclean -y && \
sudo rm /etc/apt/sources.list && \
sudo rm -rf /var/cache/apt/archives/* && \
sudo rm -rf /var/lib/apt/lists/*

# COMMANDE AU DEMARRAGE DU CONTENEUR
ENTRYPOINT ./browserX-1.42.1-x86_64.AppImage
