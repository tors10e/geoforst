from django.conf.urls import patterns, url
from .views import *

urlpatterns = patterns('',
    url(r'^roads/add/$', RoadCreate.as_view(), name='road-add'),
    url(r'^roads/(?P<pk>\d+)/edit/$', RoadUpdate.as_view(), name='road-edit'),
    url(r'^roads/(?P<pk>\d+)/delete/$', RoadDelete.as_view(), name='road-delete'),
    url(r'^roads/$', RoadList, name='road-list'),
)