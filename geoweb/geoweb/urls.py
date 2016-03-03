from django.conf.urls import patterns, url, include
from django.contrib.gis import admin
import registration
from forest_management import views
admin.autodiscover()
from django_filters.views import FilterView
from forest_management.filters import PlannedActivityFilter
from tastypie.api import Api
from forest_management.api import LandAreaResource

v1_api = Api(api_name='v1')
v1_api.register(LandAreaResource())

urlpatterns = patterns('',
    url(r'^admin/', include(admin.site.urls)),
    url(r'^geoapp/', include('geoapp.urls', namespace='geoapp')),
    url(r'^forest_management/', include('forest_management.urls', namespace='forest_management')),
    url(r'^forest_inventory/', include('forest_inventory.urls', namespace='forest_inventory')),
    url(r'^habitat_management/', include('habitat_management.urls', namespace='habitat_management')),
    url(r'^infrastructure/', include('infrastructure.urls', namespace='infrastructure')),
    url(r'^lumber_scaling/', include('lumber_scaling.urls', namespace='lumber_scaling')),
    url(r'^recreation/', include('recreation.urls', namespace='recreation')),
    url(r'^$', 'geoweb.views.Home', name = 'home'),
    url('^', include('django.contrib.auth.urls')),
    url(r'^accounts/', include('registration.backends.hmac.urls')),
    url(r'^api/', include(v1_api.urls)),
)