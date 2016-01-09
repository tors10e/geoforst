from django.contrib.gis.admin import site
from .models import *

site.register(RoadAccessStatusType)
site.register(RoadLine)
site.register(RoadType)
site.register(RoadSurfaceType)