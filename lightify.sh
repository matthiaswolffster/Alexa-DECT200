#Quelle: https://www.elv.de/topic/osram-lightify-ccu2.html
curl -s -X POST -H 'Content-Type: application/json' -d '{"username" : "XXX@gmail.com", "password" : "YYY", "serialNumber" : "OSR017C25F7"}' https://eu.lightify-api.org/lightify/services/session
#{"userId":"182137","securityToken":"182137-IbfHld75QgmOc6fAsafS"}


$uid = $arr->userId;
$tok = $arr->securityToken;

# wir schalten einfach die Geräte 1 und 2 ein und aus. Um Komplexeres zu erreichen, siehe die API-Dokumentation.

system("curl -s -X GET -H 'Content-Type: application/json' -H 'authorization: $tok' https://eu.lightify-api.org/lightify/services/device/set?idx=1\\&level=1\\&time=10\\&onoff=1");
system("curl -s -X GET -H 'Content-Type: application/json' -H 'authorization: $tok' https://eu.lightify-api.org/lightify/services/device/set?idx=2\\&level=1\\&time=10\\&onoff=1");

$later = `date --date="now + 5 minutes" +%Y%m%d%H%M.%S`;

system("echo \"curl -s -X GET -H 'Content-Type: application/json' -H 'authorization: $tok' https://eu.lightify-api.org/lightify/services/device/set?idx=1\\&level=1\\&time=10\\&onoff=0; curl -s -X GET -H 'Content-Type: application/json' -H 'authorization: $tok' https://eu.lightify-api.org/lightify/services/device/set?idx=2\\&level=1\\&time=10\\&onoff=0\" | at -t $later");


#Schalte Plug 2 (idx=2) ein (onoff=1)
curl -s -X GET -H 'Content-Type: application/json' -H "authorization: $tok" 'https:/.org/lightify/services/device/set?idx=2&time=0&onoff=1'
#onoff=0 um auszuschalten

#Liste alle Devices
curl -s -X GET -H 'Content-Type: application/json' -H "authorization: $tok" https://eu.lightify-api.org/lightify/services/devices
