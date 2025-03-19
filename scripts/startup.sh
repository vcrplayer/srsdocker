#!/bin/bash
echo "Begin Startup"
if [ -n "$VNC_PASSWORD" ]; then
    echo -n "$VNC_PASSWORD" > /.password1
    x11vnc -storepasswd $(cat /.password1) /.password2
    chmod 400 /.password*
fi
exec /usr/bin/supervisord -n -c /etc/supervisord.conf