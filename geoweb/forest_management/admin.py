from django.contrib.gis import admin
from forest_management.models import *
from django.contrib.gis.admin import site
from atexit import register

class ActivityTypeAdmin(admin.ModelAdmin):
    fieldsets = [
        ('ID',               {'fields': ['acttype_id']}),
        ('Description', {'fields': ['acttype_dsc']}),
    ]

admin.site.register(ActivityType, ActivityTypeAdmin)

admin.site.register(PlannedActivity)