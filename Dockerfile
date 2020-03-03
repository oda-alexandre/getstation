FROM debian:stretch-slim

LABEL authors https://www.oda-alexandre.com

ENV USER getstation
ENV HOME /home/${USER}
ENV APP https://dl.getstation.com/download/linux_64?filetype=AppImage

RUN echo -e '\033[36;1m ******* INSTALL PACKAGES ******** \033[0m' && \
  apt-get update && apt-get install -y --no-install-recommends \
  sudo \
  ca-certificates \
  dirmngr \
  wget \
  fuse \
  firefox-esr \
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
  xdg-utils \
  libsecret-1-0 && \
  rm -rf /var/lib/apt/lists/*

RUN echo -e '\033[36;1m ******* ADD USER ******** \033[0m' && \
  useradd -d ${HOME} -m ${USER} && \
  passwd -d ${USER} && \
  adduser ${USER} sudo

RUN echo -e '\033[36;1m ******* INSTALL APP ******** \033[0m' && \
  mkdir appimage && \
  wget ${APP} -O appimage/browserX.AppImage && \
  addgroup fuse && \
  adduser ${USER} fuse && \
  chmod +x appimage/browserX.AppImage && \
  apt-get --purge autoremove -y wget

RUN echo -e '\033[36;1m ******* SELECT USER ******** \033[0m'
USER ${USER}

RUN echo -e '\033[36;1m ******* CONTAINER START COMMAND ******** \033[0m'
ENTRYPOINT appimage/browserX.AppImage --no-sandbox \