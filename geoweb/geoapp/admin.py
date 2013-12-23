from django.contrib.gis import admin
from geoapp.models import *
from django.contrib.gis.admin import site
from atexit import register

#admin.site.register(WorldBorder, admin.GeoModelAdmin)
#admin.site.register(StandArea, admin.OSMGeoAdmin)
admin.site.register(StandArea, admin.GeoModelAdmin)

class ActivityTypeAdmin(admin.ModelAdmin):
    fieldsets = [
        ('ID',               {'fields': ['acttype_id']}),
        ('Description', {'fields': ['acttype_dsc']}),
    ]

admin.site.register(ActivityType, ActivityTypeAdmin)

class SawMillAdmin(admin.ModelAdmin):
    fieldsets = [
        ('Sawmill Information', {'fields':['sawmill_name', 'sawmill_address', 'sawmill_state', 'sawmill_zip', 'sawmill_phone', 'sawmill_email', 'sawmill_website']})
        
    ]
admin.site.register(Sawmill, SawMillAdmin)
admin.site.register(ForestInventoryPlot)
admin.site.register(ForestInventoryData)
admin.site.register(LogData)
admin.site.register(ActivityArea)
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
admin.site.register(LandOwner)
admin.site.register(Person)
admin.site.register(PlannedActivity)
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


