from rest_framework import serializers
from upload.models import UploadImage

class UploadImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = UploadImage
        fields = ('id', 'image_loc', 'song_id', )
