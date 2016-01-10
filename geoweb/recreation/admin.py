from django.contrib import admin
from .models import *

# Register your models here.
admin.site.register(CulturalPoint)
admin.site.register(CulturalType)

admin.site.register(RecreationPoint)
admin.site.register(RecreationType)

admin.site.register(Trail)
admin.site.register(TrailType)
admin.site.register(TrailStatusType)