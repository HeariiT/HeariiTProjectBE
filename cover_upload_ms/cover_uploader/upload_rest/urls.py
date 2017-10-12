from django.conf.urls import url
from upload_rest import views

urlpatterns = [
    url(r'^covers/$', views.snippet_list),
    url(r'^covers/(?P<pk>[0-9]+)$', views.snippet_detail),
]


