# Alexa-DECT200
Voice controlled switching FRITZ!DECT 200, Bose Soundtouch and a Windows 10 PC

This is a collection of 
- bash shell scripts, 
- a json file for ha-bridge 
- raspberry pi (rpi) config files
- an [EventGhost](http://www.eventghost.org/) xml file

## The environment
- Amazon Echo smart speaker
- Raspberry Pi 3 with Jessie OS and [ha-bridge](https://github.com/bwssytems/ha-bridge)
- Fritz!DECT 200 smart plug
- Fritz!Box 6490 WLAN router
- Bose Soundtouch 30 wireless speaker
- PC with Windows 10 OS and EventGhost

ha-bridge is configured to advertise the following smart home devices: "Lichterkette", "radioeins" and "Computer". The json file "devices.json" is used to configure ha-bridge.

## Bash shell scripts used

Device controlled | Script 
-------|-----
Fritz!DECT 200 smart plug | al_lichterkette.sh 
Fritz!Box 6490 WLAN router | fritzbox_create_sid.sh 
Bose Soundtouch 30 wireless speaker | al_soundtouch.sh
PC with Windows 10 OS | al_PC.sh

All shell scripts run on the rpi


