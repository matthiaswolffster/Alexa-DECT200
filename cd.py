#!/usr/bin/env python
import json
from pprint import pprint
import requests

json_file='beauty.ha-devices.mwo.json'

json_devices=open(json_file)
devices = json.load(json_devices)
json_devices.close()

for device in devices:
  print "adding ", device['name']
  url='http://127.0.0.1/api/devices'
  r = requests.post(url,json.dumps(device))
  print(r.json())
