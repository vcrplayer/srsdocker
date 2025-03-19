#!/bin/bash
# Record start time
start_time=$(date +%s)

mkdir -p /data
mkdir -p /wine

#check for install semaphore for wine
if [ -f /wine/installed ]; then
    echo "Wine prereqs already installed"
else
    echo "Installing Wine prereqs"
    #install wine prerequisites
    winetricks -q dotnet48 win10
    wine reg ADD 'HKCU\Software\Wine\DllOverrides' '/f' '/v' 'd3d9' '/t' 'REG_SZ' '/d' 'native'
    #add handling to setup configuration file
    touch /wine/installed
fi

#extract SRS version from URL
url="https://github.com/ciribob/DCS-SimpleRadioStandalone/releases/download/2.1.1.0/DCS-SimpleRadioStandalone-2.1.1.0.zip"
current_version=$(echo $url | grep -oP '(?<=download/)[^/]+(?=/)' || echo "unknown")
echo "Current SRS version: $current_version"
#check for install semaphore for srs and compare versions
installed_version=""
if [ -f /data/installed ]; then
    installed_version=$(cat /data/installed)
fi

if [ -f /data/installed ] && [ "$installed_version" == "$current_version" ]; then
    echo "SRS $installed_version already installed"
else
    echo "Downloading and Installing SRS $current_version"
    curl -sL $url -o /data/srs.zip --progress-bar
    unzip /data/srs.zip -d /data/
    rm /data/srs.zip
    cp /server.cfg /data/server.cfg
    echo $current_version > /data/installed
    echo "SRS $current_version installed successfully"
fi

echo "Installation complete"

# Calculate and display execution time
end_time=$(date +%s)
execution_time=$((end_time - start_time))
printf "Installation took: %s seconds\n\n\n\n\n" "$execution_time"

