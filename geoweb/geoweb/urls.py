from django.conf.urls import patterns, url, include
from django.contrib.gis import admin

admin.autodiscover()

urlpatterns = patterns('',
    url(r'^admin/', include(admin.site.urls)),
    url(r'^geoapp/', include('geoapp.urls', namespace='geoapp')),
)