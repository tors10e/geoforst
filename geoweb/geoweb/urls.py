from django.conf.urls import patterns, url, include
from django.contrib.gis import admin
import registration
from forest_management import views
admin.autodiscover()
from django_filters.views import FilterView
from forest_management.filters import PlannedActivityFilter

urlpatterns = patterns('',
    url(r'^geoapp/admin/', include(admin.site.urls)),
    url(r'^geoapp/', include('geoapp.urls', namespace='geoapp')),
    url(r'^accounts/', include('registration.backends.default.urls')),
    url(r'^forest_management/', include('forest_management.urls', namespace='forest_management')),
    (r'^forest_management/list/$', FilterView.as_view(filterset_class=PlannedActivityFilter)),
)