from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from upload.models import Covers
from upload_rest.serializers import CoversSerializer
import json

@api_view(['GET', 'POST'])
def snippet_list(request):
    """
    List all snippets, or create a new snippet.
    """
    if request.method == 'GET':
        snippets = Covers.objects.all()
        serializer = CoversSerializer(snippets, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    elif request.method == 'POST':
        serializer = CoversSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            response201 = {'status': 201, 'message': 'Created', 'data': serializer.data}
            return Response(response201, status=status.HTTP_201_CREATED)
        response400 = {'status': 400, 'message': 'Bad Request'}
        return Response(response400, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET', 'PUT', 'DELETE'])
def snippet_detail(request, pk):
    """
    Retrieve, update or delete a snippet instance.
    """
    try:
        snippet = Covers.objects.get(song_id=pk)
    except Covers.DoesNotExist:
        response404 = {'status': 404, 'message': 'Not Found'}
        return Response(data=response404, status=status.HTTP_404_NOT_FOUND)
    if request.method == 'GET':
        serializer = CoversSerializer(snippet)
        response200get = {'status': 200, 'data': serializer.data}
        return Response(response200get, status=status.HTTP_200_OK)

    elif request.method == 'PUT':
        serializer = CoversSerializer(snippet, data=request.data)
        if serializer.is_valid():
            serializer.save()
            response200put = {'status': 200, 'message': 'Modified', 'data': serializer.data}
            return Response(response200put, status=status.HTTP_200_OK)
        response400 = {'status': 400, 'message': 'Bad Request'}
        return Response(response400, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        snippet.delete()
        response204 = {'status': 204, 'message': 'Successfully Deleted'}
        return Response(response204, status=status.HTTP_204_NO_CONTENT)