FROM ubuntu:24.04

LABEL maintainer="vcrplayer"

ENV DEBIAN_FRONTEND=noninteractive

# default screen size
ENV XRES=1280x800x24

# default tzdata settings
ENV TZ=Etc/UTC
ENV LANG=en_US.utf8

#prereqs
RUN apt update \
    && apt install -y --no-install-recommends software-properties-common curl \
    && apt update \
    && apt install -y --no-install-recommends --allow-unauthenticated \
        supervisor xz-utils wget gnupg2 software-properties-common \
        dbus-x11 x11-utils alsa-utils \
        mesa-utils libgl1-mesa-dri \
        xvfb x11vnc \
        xfce4 xfce4-terminal xfce4-xkb-plugin mousepad adwaita-icon-theme \
        unzip \
    && apt autoclean -y \
    && apt autoremove -y \
    && rm -rf /var/lib/apt/lists/*

## Add Wine

RUN dpkg --add-architecture i386
RUN apt update -y && apt install -y --install-recommends wine32 wine64 winetricks winbind
ENV WINEPREFIX=/wine
COPY supervisord.conf /etc/supervisord.conf
COPY startup.sh /startup.sh
COPY install.sh /install.sh
COPY srs.sh /srs.sh
COPY srs-env.sh /srs-env.sh
## Disable screenlocking
COPY xfce4-screensaver.xml /home/root/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-screensaver.xml

## exposed ports
EXPOSE 5900 5002

ENTRYPOINT ["/startup.sh"]