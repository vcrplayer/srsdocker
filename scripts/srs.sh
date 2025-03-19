#!/bin/bash
bash /install.sh
cd /data
bash /srs-env.sh
echo "Starting SRS"
wine SR-Server.exe