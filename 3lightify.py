#!/usr/bin/env python
import os
import json
#from pprint import pprint
from tempfile import gettempdir
import requests
from variables import MAIL, PASSWD, SERIALNUMBER

def getlightifytoken():
    """Holt das Lightify Token und speichert es in einer Datei."""
    myurl = 'https://eu.lightify-api.org/lightify/services/'
    myrequest = requests.get(myurl + "devices")

    req_answer = json.loads(myrequest.text)
    error5003 = 0
    if "errorCode" in req_answer:
        if str(req_answer['errorCode']) == "5003":
            error5003 = 1

    if error5003 == 1:
        poststring = '{"username" : "' + MAIL + '", "password" : "' + PASSWD + '", "serialNumber" : "' + SERIALNUMBER + '"}'
        myrequest = \
        requests.post(myurl + "session",
                      poststring,
                      headers={'Content-Type': 'application/json'})
        req_answer = myrequest.json()
        mytoken = req_answer['securityToken']
        print "Tempfile: " + os.path.join(gettempdir(), "lightifyToken.txt")
        with open(os.path.join(gettempdir(), "lightifyToken.txt"), "w") as text_file:
            text_file.write("{0}".format(mytoken))

getlightifytoken()
