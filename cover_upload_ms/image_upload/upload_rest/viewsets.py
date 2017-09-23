from rest_framework import viewsets
from upload_rest.serializers import UploadImageSerializer
from upload.models import UploadImage

class UploadModelViewSet(viewsets.ModelViewSet):
    queryset = UploadImage.objects.all()
    serializer_class = UploadImageSerializer

