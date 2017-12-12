#!/usr/bin/env python
import json
#from pprint import pprint
import requests
from variables import MAIL, PASSWD

def getlightifytoken():
    """Holt das Lightify Token und speichert es in einer Datei."""
    url = 'https://eu.lightify-api.org/lightify/services/'
    myrequest = requests.get(url + "devices")
    #print r.text

    #{"errorCode":5003,"errorMessage":"Invalid Security Token"}

    mystring = json.loads(myrequest.text)
    error5003 = 0
    if "errorCode" in mystring:
        #print "errorcode in s!"
        if str(mystring['errorCode']) == "5003":
            #print "error 5003!"
            error5003 = 1
    #print error5003

    if error5003 == 1:
        myrequest = requests.post(url + "session",
                                  '{"username" : MAIL, "password" : PASSWD, "serialNumber" : "SERIALNUMBER"}',
                                  headers={'Content-Type': 'application/json'})
        mystring = myrequest.json()
        mytoken = mystring['securityToken']
        with open("/tmp/lightifyToken.txt", "w") as text_file:
            text_file.write("{0}".format(mytoken))
      #print myToken
    #if str(s['dfdfdf'])=="5003":
    #  print "error"
      #

    #for s in json.loads(r.text):
    #  print "deleting ", s['name']
    #  url='http://127.0.0.1/api/devices/' + str(s['id'])
    #  r2 = requests.delete(url)
    #  print(r2.json())
getlightifytoken()
