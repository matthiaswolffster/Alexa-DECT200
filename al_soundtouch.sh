#!/bin/bash

# Usage:
# al_soundtouch.sh radio <location> <itemname>
# al_soundtouch.sh off
# al_soundtouch.sh dim <percentage>
# based on: https://community.bose.com/t5/SoundTouch-Speakers/Alarm-Clock-function-via-Raspberry-Pi/td-p/44575

. /home/pi/alde/variables.txt

# Maximallautstärke 40 ist gut erträglich
MAXVOL=40
# convert $1 to lowercase and assign to $COMMAND
declare -l COMMAND=$1

if [[ "$COMMAND" == "radio" ]]; then
LOCATION=$2
ITEMNAME=$3
DATA=' <ContentItem source="INTERNET_RADIO" sourceAccount="" location="'$LOCATION'"> <itemName>'$ITEMNAME'</itemName></ContentItem> '
curl --request POST --header "Content-Type: application/xml" --data "$DATA" $BOSE_BOX_IP_ADR/select ; fi


if [[ "$COMMAND" == "off" ]]; then
  curl --request POST --header "Content-Type: application/xml" --data ' <key state="press" sender="Gabbo">POWER</key> ' $BOSE_BOX_IP_ADR/key ; fi

if [[ "$COMMAND" == "dim" ]]; then
  PERCENT=$2
  echo "$PERCENT" `date -Iseconds` >> /home/pi/alde/soundtouch-dim.log

if [[ "$PERCENT" =~ ^[0-9]+$ ]] && [ "$PERCENT" -ge 0 -a "$PERCENT" -le 100 ]; then
  VOL=`expr $PERCENT \* 1000 / 100 \* $MAXVOL / 1000`
  curl --request POST --header "Content-Type: application/xml" --data " <volume>$VOL</volume> " $BOSE_BOX_IP_ADR/volume
else echo "$PERCENT is not an integer and not in the range 0..100" > /home/pi/alde/soundtouch-dim.log && exit 1; fi
echo ""; fi
