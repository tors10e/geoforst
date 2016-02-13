from django.contrib.gis import admin
from lumber_scaling.models import Sawmill, LumberLoad, ScalingTicket, LogData
from django.contrib.gis.admin import site
from atexit import register


class SawmillAdmin(admin.ModelAdmin):
    fieldsets = [
        ('Sawmill Information', {'fields':['name', 'address', 'state', 'zip', 'phone', 'email', 'website']})
        ]
    
admin.site.register(Sawmill, SawmillAdmin)
admin.site.register(LumberLoad)
admin.site.register(ScalingTicket)
admin.site.register(LogData)