#!/bin/bash

. /home/pi/alde/variables.txt

# convert $1 to lowercase and assign to $COMMAND
declare -l COMMAND=$1

if [[ "$COMMAND" == "on" ]]; then
  sudo etherwake $PC_MAC_ADR ; fi

if [[ "$COMMAND" == "off" ]]; then
  curl "http://$PC_HOST_PORT/index.html?mwoComputerOff" ; fi
