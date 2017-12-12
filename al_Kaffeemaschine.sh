#!/bin/bash
# $1 = setswitchon|setswitchoff
# concepts:
# https://avm.de/fileadmin/user_upload/Global/Service/Schnittstellen/AHA-HTTP-Interface.pdf

. /home/pi/alde/variables.py

fbox="https://fritz.box:40306" 

CURLCMD="curl --insecure -s $fbox/webservices/homeautoswitch.lua"
SID=$(cat $SIDFILE)
STATE=$($CURLCMD"?sid=$SID&ain=$AIN2&switchcmd=$1")
