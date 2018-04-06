#!/usr/bin/bash

# Get out of town if something errors
set -e

USER=you_user
export XAUTHORITY=/home/$USER/.Xauthority
export DISPLAY=:0
USBC_STATUS=$(</sys/class/drm/card0/card0-DP-1/status )  
sleep 8 

if [ "connected" == "$USBC_STATUS" ]; then  
    /home/$USER/.screenlayout/external.sh
    /usr/bin/notify-send --urgency=low -t 3000 "Graphics Update" "USBC plugged in"
else  
    /home/$USER/.screenlayout/laptop.sh
    /usr/bin/notify-send --urgency=low -t 3000 "Graphics Update" "External Monitor Disconnected"
    exit
fi
