from django.conf.urls import patterns, url, include
from django.contrib.gis import admin
import registration

admin.autodiscover()

urlpatterns = patterns('',
    url(r'^geoapp/admin/', include(admin.site.urls)),
    url(r'^geoapp/', include('geoapp.urls', namespace='geoapp')),
    url(r'^accounts/', include('registration.backends.default.urls')),
)