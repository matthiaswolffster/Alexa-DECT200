#!/usr/bin/env python
import json
from pprint import pprint
import requests
import sys

if len(sys.argv) <> 2:
  print 'Usage: cd.py <inputfile>'
  sys.exit(0)

json_file=sys.argv[1]

json_devices=open(json_file)
devices = json.load(json_devices)
json_devices.close()

for device in devices:
  print "adding ", device['name'], " to ha-bridge"
  url='http://127.0.0.1/api/devices'
  r = requests.post(url,json.dumps(device))
  print(r.json())
