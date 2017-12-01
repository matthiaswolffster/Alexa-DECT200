#!/usr/bin/env python
import json
from pprint import pprint
import requests

url='https://eu.lightify-api.org/lightify/services/devices'
r = requests.get(url)
#print r.text

#{"errorCode":5003,"errorMessage":"Invalid Security Token"}

s=json.loads(r.text)
error5003=0
if "errorCode" in s:
  #print "errorcode in s!"
  if str(s['errorCode'])=="5003":
    #print "error 5003!"
    error5003=1
#print error5003

if error5003==1:
  r=requests.post('https://eu.lightify-api.org/lightify/services/session','{"username" : "XXX@gmail.com", "password" : "YYY", "serialNumber" : "OSR017C25F7"}',headers={'Content-Type': 'application/json'})
  s=r.json()
  myToken = s['securityToken']
  with open("/tmp/lightifyToken.txt", "w") as text_file:
      text_file.write("{0}".format(myToken))
  #print myToken
#if str(s['dfdfdf'])=="5003":
#  print "error"
  #

#for s in json.loads(r.text):
#  print "deleting ", s['name']
#  url='http://127.0.0.1/api/devices/' + str(s['id'])
#  r2 = requests.delete(url)
#  print(r2.json())
