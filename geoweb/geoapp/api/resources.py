from tastypie.contrib.gis.resources import ModelResource
from geoapp.models import StandArea


class StandAreaResource(ModelResource):
    class Meta:
        queryset = StandArea.objects.all()
        allowed_methods = ['get']