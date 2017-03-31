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
- Fritz!DECT 200 smart plug with a Lichterkette
- Fritz!Box 6490 WLAN router
- Bose Soundtouch 30 wireless speaker
- PC with Windows 10 OS and EventGhost

## The idea
- Use voice control to switch the Fritz!DECT 200 smart plug on and off. This device is not directly supported by Alexa. such a plug is not discovered when you search for smart home devices in the Alexa App.
- Use voice control to start my favorite radio station "radioeins vom rbb", control volume and switch it off
- Start and stop the Windows PC

## How it works
The voice command is heard by Alexa, e.g. "Alexa, switch on Lichterkette". Alexa contacts ha-bridge and ha-bridge executes the bash shell script associated with device Lichterkette. The shell script calls a special URL for that device.

ha-bridge is configured to advertise the following smart home devices: "Lichterkette", "radioeins" and "Computer". The json file "devices.json" is used to configure ha-bridge.

## Waking up and shutting down the Computer
There is no URL to switch on a Windows PC, but there is wake on LAN (wol). The script al_PC.sh uses etherwake. Unfortunately my PC does not support wol when it is completely shut down.. 
## Preparing things
- On the rpi: install the Raspbian Jessie OS and [ha-bridge](https://github.com/bwssytems/ha-bridge) as described on their homepages. Execute " sudo apt install etherwake".  
## Bash shell scripts used
Device controlled | Script 
-------|-----
Fritz!DECT 200 smart plug | al_lichterkette.sh 
Fritz!Box 6490 WLAN router | fritzbox_create_sid.sh 
Bose Soundtouch 30 wireless speaker | al_soundtouch.sh
PC with Windows 10 OS | al_PC.sh

All shell scripts run on the rpi.


