# System libraries

# Third-party libraries
from tastypie.contrib.gis.resources import ModelResource

# Django modules
from django.contrib.gis.db.models.functions import Transform

# Django apps
from .models import *

# Current app modules
class LandAreaResource(ModelResource):  
 
    class Meta:
        resource_name = 'landareas'
        # Get the features and reproject to WGS84 for leaflet.
        queryset = LandArea.objects.all().transform(4326)
        fields = ['name','geometry','description']
        allowed_methods = ['get']
        filtering = {
            'geometry':'ALL',
        }