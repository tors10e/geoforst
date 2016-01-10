from django.contrib.gis.db import models
import uuid
from django.contrib.auth.models import User
# Create your models here.


class CulturalPoint(models.Model):
    cultpt_id = models.AutoField(primary_key=True)
    geometry = models.PointField(srid=2163, null=True, blank=True)
    culttype = models.ForeignKey('CulturalType', null=True, blank=True)
    description = models.CharField(max_length=255, blank=True)
    created_by = models.ForeignKey(User)
    objects = models.GeoManager()
    class Meta:
        db_table = 'cultural_point'

class CulturalType(models.Model):
    culttype_id = models.IntegerField(primary_key=True)
    culttype_cd = models.CharField(max_length=3, blank=True)
    culttype_dsc = models.CharField(max_length=50, blank=True)
    class Meta:
        db_table = 'cultural_type'
    def __unicode__(self):
        return unicode(self.culttype_dsc)
        
        
class RecreationPoint(models.Model):
    recpt_id = models.AutoField(primary_key=True)
    geometry = models.PointField(srid=2163, null=True, blank=True)
    rectype = models.ForeignKey('RecreationType', null=True, blank=True)
    description = models.CharField(max_length=255, blank=True)
    created_by = models.ForeignKey(User)
    objects = models.GeoManager()
    class Meta:
        db_table = 'recreation_point'
    def __unicode__(self):
        return unicode(self.description)

class RecreationType(models.Model):
    rectype_id = models.IntegerField(primary_key=True)
    rectype_cd = models.CharField(max_length=3, blank=True)
    rectype_dsc = models.CharField(max_length=50, blank=True)
    class Meta:
        db_table = 'recreation_type'
    def __unicode__(self):
        return unicode(self.rectype_dsc)
    
class Trail(models.Model):
    trail_id = models.AutoField(primary_key = True)
    geometry = models.LineStringField(srid=2163, null=False, blank=False)
    trailtype = models.ForeignKey('TrailType', null=True, blank=True, verbose_name = 'Type')
    trailstatus = models.ForeignKey('TrailStatusType', null=True, blank=True, verbose_name = 'Status')
    trail_name = models.CharField(max_length=30, null=True, blank=True, verbose_name = 'Name')
    description = models.CharField(max_length=255, null=True, blank=True)
    trail_uuid = models.UUIDField(default=uuid.uuid4, unique=True)
    created_by = models.ForeignKey(User)
     
    class Meta:
         db_table = 'trail'
       
    def __unicode__(self):
        return unicode(self.trail_name)
    
class TrailStatusType(models.Model):
    trailstatus_id = models.IntegerField(null=False, blank=False, primary_key=True)
    trailstatus_cd = models.CharField(null=True, blank=True, max_length=4)
    trailstatus_dsc = models.CharField(max_length=30, null=False, blank=False)
    
    class Meta:
        db_table = 'trail_status_type'
        
    def __unicode__(self):
        return unicode(self.trailstatus_dsc)
    
class TrailType(models.Model):
    trailtype_id = models.IntegerField(null=False, blank=False, primary_key=True)
    trailtype_cd = models.CharField(null=True, blank=True, max_length=4)
    trailtype_dsc = models.CharField(max_length=30, null=False, blank=False)
    
    class Meta:
        db_table = 'trail_type'
        
    def __unicode__(self):
        return unicode(self.trailtype_dsc)