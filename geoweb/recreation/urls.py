from django.conf.urls import patterns, url
from .views import *

urlpatterns = patterns('',
    url(r'^trail/add/$', TrailCreate.as_view(), name='trail-add'),
    url(r'^trail/(?P<pk>\d+)/edit/$', TrailUpdate.as_view(), name='trail-edit'),
    url(r'^trail/(?P<pk>\d+)/delete/$', TrailDelete.as_view(), name='trail-delete'),
    url(r'^trail/$', TrailList, name='trail-list'),
    
    url(r'^cultural_site/add/$', CulturalPointCreate.as_view(), name='cultural-point-add'),
    url(r'^cultural_site/(?P<pk>\d+)/edit/$', CulturalPointUpdate.as_view(), name='cultural-point-edit'),
    url(r'^cultural_site/(?P<pk>\d+)/delete/$', CulturalPointDelete.as_view(), name='cultural-point-delete'),
    url(r'^cultural_site/$', CulturalPointList, name='cultural-point-list'),
    
    url(r'^recreation_site/add/$', RecreationPointCreate.as_view(), name='recreation-point-add'),
    url(r'^recreation_site/(?P<pk>\d+)/edit/$', RecreationPointUpdate.as_view(), name='recreation-point-edit'),
    url(r'^recreation_site/(?P<pk>\d+)/delete/$', RecreationPointDelete.as_view(), name='recreation-point-delete'),
    url(r'^recreation_site/$', RecreationPointList, name='recreation-point-list'),
)