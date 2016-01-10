from django.contrib.gis import admin
from geoapp.models import *
from django.contrib.gis.admin import site
from atexit import register

admin.site.register(StandArea, admin.GeoModelAdmin)

admin.site.register(BurnCompartment)
admin.site.register(FirebreakLine)
admin.site.register(ForestAgeType)
admin.site.register(ForestType)
admin.site.register(HabitatEnhancementArea)
admin.site.register(HabitatEnhancementPoint)
admin.site.register(HabitatEnhancementType)
admin.site.register(HarvestType)

admin.site.register(SeverityType)

admin.site.register(StandStatus)
admin.site.register(StandType)
admin.site.register(StockingType)
admin.site.register(Stream)
admin.site.register(StreamsideManagementZone)
admin.site.register(TaskStatusType)
admin.site.register(Tree)
admin.site.register(WaterPoint)
admin.site.register(WaterType)
admin.site.register(SpeciesTreeType)
admin.site.register(UserUpload)