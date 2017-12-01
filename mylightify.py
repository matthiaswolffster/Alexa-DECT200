from lightify import Lightify
lightify = Lightify("192.168.178.48")
lightify.update_all_light_status()
lights = lightify.lights()
print lights
