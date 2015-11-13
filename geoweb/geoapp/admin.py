from django.contrib.gis import admin
from geoapp.models import *
from django.contrib.gis.admin import site
from atexit import register

#admin.site.register(WorldBorder, admin.GeoModelAdmin)
#admin.site.register(StandArea, admin.OSMGeoAdmin)
admin.site.register(StandArea, admin.GeoModelAdmin)

class SawmillAdmin(admin.ModelAdmin):
    fieldsets = [
        ('Sawmill Information', {'fields':['name', 'address', 'state', 'zip', 'phone', 'email', 'website']})
        ]
    
admin.site.register(Sawmill, SawmillAdmin)
admin.site.register(ForestInventoryPlot)
admin.site.register(ForestInventoryData)
admin.site.register(LogData)
admin.site.register(BurnCompartment)
admin.site.register(CulturalPoint)
admin.site.register(CulturalType)
admin.site.register(FirebreakLine)
admin.site.register(ForestAgeType)
admin.site.register(ForestType)
admin.site.register(HabitatEnhancementArea)
admin.site.register(HabitatEnhancementPoint)
admin.site.register(HabitatEnhancementType)
admin.site.register(HarvestType)
admin.site.register(LandArea)
admin.site.register(Person)
admin.site.register(RecreationPoint)
admin.site.register(RecreationType)
admin.site.register(RoadAccessStatusType)
admin.site.register(RoadLine)
admin.site.register(RoadSurfaceType)
admin.site.register(RoadType)
admin.site.register(SeverityType)
admin.site.register(StandDescription)
admin.site.register(StandStatus)
admin.site.register(StandType)
admin.site.register(StockingType)
admin.site.register(Stream)
admin.site.register(StreamsideManagementZone)
admin.site.register(TaskStatusType)
admin.site.register(Tree)
admin.site.register(WaterPoint)
admin.site.register(WaterType)
admin.site.register(ScalingTicket)
admin.site.register(SpeciesTreeType)
admin.site.register(UserUpload)