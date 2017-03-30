#!/usr/bin/env python
import json
from pprint import pprint
import requests

url='http://127.0.0.1/api/devices'
r = requests.get(url)
#print r.text

for s in json.loads(r.text):
  print "deleting ", s['name']
  url='http://127.0.0.1/api/devices/' + str(s['id'])
  r2 = requests.delete(url)
  print(r2.json())
