#!/bin/bash

# Create SID for Fritzbox
# SID from SID.txt is later used to access Fritzbox
# SID is valid for 60 Minutes
# Look here for the concept:
# https://avm.de/fileadmin/user_upload/Global/Service/Schnittstellen/AVM_Technical_Note_-_Session_ID.pdf
# Therefore call this script by cron every 30 minutes or so 
# 30,0 * * * * /home/pi/fritzbox_create_sid.sh

# source in confidential variables like $USER and $PASSWD
. /home/pi/alde/variables.txt

# more variables
fbox="https://fritz.box:40306" 
SIDFILE=$MYHOME/SID.txt
SIDTIME=$MYHOME/SID.time

SID=$(curl --insecure -s $fbox/login_sid.lua | sed 's/.*<SID>\(.*\)<\/SID>.*/\1/')
challenge=$(curl --insecure -s $fbox/login_sid.lua | grep -o "<Challenge>[a-z0-9]\{8\}" | cut -d'>' -f 2)
CPSTR="$challenge-$PASSWD"
hash=`echo -n $CPSTR | iconv -f ISO8859-1 -t UTF-16LE | md5sum -b | awk '{print substr($0,1,32)}'`
RESPONSE="$challenge-$hash"
POSTDATA="?username=$USER&response=$RESPONSE"
SID=$(curl --insecure --data "$POSTDATA" -s $fbox/login_sid.lua | sed 's/.*<SID>\(.*\)<\/SID>.*/\1/')
echo $SID > $SIDFILE
echo $(date +"%d.%m.%y %T") >  $SIDTIME
