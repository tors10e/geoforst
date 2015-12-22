from django.conf.urls import patterns, url, include
from django.contrib.gis import admin
import registration
from forest_management import views
admin.autodiscover()
from django_filters.views import FilterView
from forest_management.filters import PlannedActivityFilter

urlpatterns = patterns('',
    url(r'^admin/', include(admin.site.urls)),
    url(r'^geoapp/', include('geoapp.urls', namespace='geoapp')),
    url(r'^forest_management/', include('forest_management.urls', namespace='forest_management')),
    url(r'^forest_inventory/', include('forest_inventory.urls', namespace='forest_inventory')),
    url(r'^lumber_scaling/', include('lumber_scaling.urls', namespace='lumber_scaling')),
    url(r'^$', 'geoweb.views.Home', name = 'home'),
    url('^', include('django.contrib.auth.urls')),
    url(r'^accounts/', include('registration.backends.hmac.urls')),
)