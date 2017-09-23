from django.conf.urls import url
from upload_rest import views

urlpatterns = [
    url(r'^images/$', views.snippet_list),
    url(r'^images/(?P<pk>[0-9]+)$', views.snippet_detail),
]


