FROM ubuntu:24.04

LABEL maintainer="vcrplayer"

ENV DEBIAN_FRONTEND=noninteractive

# default screen size
ENV XRES=640x480x24

# default tzdata settings
ENV TZ=Etc/UTC
ENV LANG=en_US.utf8

#prereqs
RUN apt update \
    && apt install -y --no-install-recommends software-properties-common \
        supervisor xz-utils wget gnupg2 curl \
        dbus-x11 x11-utils \
        mesa-utils libgl1-mesa-dri \
        xvfb x11vnc \
        unzip

## Add Wine
RUN dpkg --add-architecture i386
RUN apt update -y && apt install -y --no-install-recommends wine32 wine64 \
        winetricks winbind fonts-wine adwaita-icon-theme \
        && apt autoclean -y \
        && apt autoremove -y \
        && rm -rf /var/lib/apt/lists/*
ENV WINEPREFIX=/wine
COPY ./conf/supervisord.conf /etc/supervisord.conf
COPY ./scripts/startup.sh /startup.sh
COPY ./scripts/install.sh /install.sh
COPY ./scripts/srs.sh /srs.sh
COPY ./scripts/srs-env.sh /srs-env.sh
COPY ./conf/server.cfg /server.cfg
EXPOSE 5900/tcp
EXPOSE 5002/tcp
EXPOSE 5002/udp

ENTRYPOINT ["/startup.sh"]