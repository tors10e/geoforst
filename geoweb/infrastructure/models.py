import uuid
from django.contrib.gis.db import models
from geoapp.models import User
from utilities import lookups

class RoadAccessStatusType(models.Model):
    accessstatus_id = models.IntegerField(primary_key=True)
    accessstatus_cd = models.CharField(max_length=3, blank=True)
    accessstatus_dsc = models.CharField(max_length=30, blank=True)
    class Meta:
        db_table = 'road_access_status_type'
    def __unicode__(self):
        return unicode(self.accessstatus_dsc)
    
class RoadLine(models.Model):
    roadln_id = models.AutoField(primary_key=True)
    geometry = models.MultiLineStringField(srid=2163, null=True, blank=True)
    roadtype = models.ForeignKey('RoadType', null=True, blank=True)
    description = models.CharField(max_length=255, blank=True)
    road_name = models.CharField(max_length=25, blank=True)
    accessstatus = models.ForeignKey(RoadAccessStatusType, null=True, blank=True)
    roadsurface = models.ForeignKey('RoadSurfaceType', null=True, blank=True)
    created_by = models.ForeignKey(User)
    objects = models.GeoManager()
    class Meta:
        db_table = 'road_line'

class RoadSurfaceType(models.Model):
    roadsurface_id = models.IntegerField(primary_key=True)
    roadsurface_cd = models.CharField(max_length=3, blank=True)
    roadsurface_dsc = models.CharField(max_length=30, blank=True)
    class Meta:
        db_table = 'road_surface_type'
    def __unicode__(self):
        return unicode(self.roadsurface_dsc)

class RoadType(models.Model):
    roadtype_id = models.IntegerField(primary_key=True)
    roadtype_cd = models.CharField(max_length=3, blank=True)
    roadtype_dsc = models.CharField(max_length=50, blank=True)
    class Meta:
        db_table = 'road_type'
    def __unicode__(self):
        return unicode(self.roadtype_dsc)
