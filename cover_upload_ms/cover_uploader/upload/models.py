import uuid
from urllib.request import urlopen, Request
import base64
import json
from django.db import models


def filenameChange(instance, filename):
    extension = filename.split('.')[-1]
    return '{}.{}'.format(uuid.uuid4(), extension)


# def imgurUpload(image):
#    client_id = "7159d1e69240724"  # put your client ID here
#    headers = {'Authorization': 'Client-ID ' + client_id}
#    f = open(image, "rb")
#    image_data = f.read()
#    b64_image = base64.standard_b64encode(image_data)
#    data = {'image': image}
#    request = Request(url="https://api.imgur.com/3/upload.json", data=data, headers=headers)
#    response = urlopen(request).read()
#    parse = json.loads(response)
#    image_url = parse['data']['link']
#    return image_url

class Covers(models.Model):
    image_loc = models.ImageField('Uploaded Image', upload_to=filenameChange)
    song_id = models.IntegerField(default=0, unique=True)
