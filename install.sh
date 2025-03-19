#!/bin/bash
mkdir -p /data
mkdir -p /wine

#check for install semaphore for wine
if [ -f /wine/installed]; then
    echo "Wine prereqs already installed"
else
    echo "Installing Wine prereqs"
    #install wine prerequisites
    winetricks -q dotnet48 win10
    wine reg ADD 'HKCU\Software\Wine\DllOverrides' '/f' '/v' 'd3d9' '/t' 'REG_SZ' '/d' 'native'
    #add handling to setup configuration file
    touch /wine/installed
fi

#check for install semaphore for srs
if [ -f /data/installed ]; then
    echo "SRS already installed"
else
    echo "Downloading and Installing SRS"
    url="https://github.com/ciribob/DCS-SimpleRadioStandalone/releases/download/2.1.1.0/DCS-SimpleRadioStandalone-2.1.1.0.zip" 
    curl -sL $url -o /data/srs.zip
    unzip /data/srs.zip -d /data/
    rm /data/srs.zip
    touch /data/installed
fi

echo "Installation complete"

