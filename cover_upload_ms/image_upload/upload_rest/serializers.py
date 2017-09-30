from rest_framework import serializers
from upload.models import Covers

class UploadImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Covers
        fields = ('id', 'image_loc', 'song_id', )
