from __future__ import unicode_literals 
from django.contrib.gis.db import models
from django.contrib.auth.models import User
from django.core.validators import MinValueValidator, MaxValueValidator
#from django.contrib.gis.geos import Point
import uuid

class BurnCompartment(models.Model):
    burncompartment_id = models.AutoField(primary_key=True)
    geometry = models.PolygonField(srid=2163, blank=True) # This field type is a guess.
    compartment_set = models.IntegerField(null=True, blank=True)
    created_by = models.ForeignKey(User)
    class Meta:
        db_table = 'burn_compartment'

class FirebreakLine(models.Model):
    fbkln_id = models.AutoField(primary_key=True)
    geometry = models.LineStringField(srid=2163, null=True, blank=True)
    description = models.CharField(max_length=255, blank=True)
    created_by = models.ForeignKey(User)
    length_meters = models.FloatField(null=True, blank=True)
    objects = models.GeoManager()
    class Meta:
        db_table = 'firebreak_line'

class HabitatEnhancementArea(models.Model):
    habenharea_id = models.AutoField(primary_key=True)
    geometry = models.PolygonField(srid=2163, null=True, blank=True)
    habenhtype = models.ForeignKey('HabitatEnhancementType', null=True, blank=True)
    description = models.CharField(max_length=255, blank=True)
    created_by = models.ForeignKey(User)
    objects = models.GeoManager()
    class Meta:
        db_table = 'habitat_enhancement_area'

class HabitatEnhancementPoint(models.Model):
    habenhpt_id =models.AutoField(primary_key=True)
    geometry = models.PointField(srid=2163, null=True, blank=True)
    habenhtype = models.ForeignKey('HabitatEnhancementType', null=True, blank=True)
    description = models.CharField(max_length=255, blank=True)
    created_by = models.ForeignKey(User)
    objects = models.GeoManager()
    class Meta:
        db_table = 'habitat_enhancement_point'

class HabitatEnhancementType(models.Model):
    habenhtype_id = models.IntegerField(primary_key=True)
    habenhtype_cd = models.CharField(max_length=3, blank=True)
    habenhtype_dsc = models.CharField(max_length=50, blank=True)
    class Meta:
        db_table = 'habitat_enhancement_type'
    def __unicode__(self):
        return unicode(self.habenhtype_dsc)
