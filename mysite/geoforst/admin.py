from django.contrib.gis import admin
from geoforst.models import StandArea

#admin.site.register(WorldBorder, admin.GeoModelAdmin)
admin.site.register(StandArea, admin.OSMGeoAdmin)