from django.conf.urls import patterns, url
from geoapp import views

urlpatterns = patterns('',
    url(r'^map/$', views.Map, name = 'map'),
    url(r'^maps/$', views.Maps, name = 'maps'),
    url(r'^mobilemap/$', views.MobileMap, name = 'mobile-map'),
    url(r'^leafletmap/$', views.LeafletMap, name = 'leaflet-map'),
    url(r'^upload/$', views.UserUploadView.as_view(), name='user-data-upload'),
    url(r'^upload_success/$', views.UserUploadSuccess, name='user-upload-success'),
  )