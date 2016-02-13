from __future__ import unicode_literals 

# System libraries

# Third-party libraries

# Django modules
from django.contrib.gis.db import models
from django.contrib.auth.models import User
from django.core.validators import MinValueValidator, MaxValueValidator
from django.contrib.gis.geos import Point
import uuid

# Django apps
from geoapp.models import UnitLengthType, SpeciesTreeType

# Current app modules

class Sawmill(models.Model):
    sawmill_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=30, blank=True, unique=True)
    address = models.CharField(max_length=100, blank=True)
    city = models.CharField(max_length=30, blank=True)
    state = models.CharField(max_length=2, blank=True)
    zip = models.DecimalField(null=True, max_digits=5, decimal_places=0, blank=True)
    phone = models.CharField(max_length=20, blank=True)
    email = models.EmailField(max_length=100, blank=True)
    website = models.CharField(max_length=255, blank=True)
    created_by = models.ForeignKey(User)
    class Meta:
        db_table = 'sawmill'
        ordering = ["name"]
    def __unicode__(self):
        return unicode(self.name)
    
class ScalingTicket(models.Model):
    scalingticket_id = models.AutoField(primary_key=True)
    sawmill = models.ForeignKey('Sawmill', null=True, blank=True)
    species = models.CharField(max_length=30, null=True, blank=True)
    fbm = models.IntegerField(verbose_name="Board Ft.", null=True, blank=True)
    price_mfbm = models.DecimalField(verbose_name="Price/Mfbm", max_digits=6, decimal_places=2, null=True, blank=True)
    weight = models.DecimalField(null=True, max_digits=12, decimal_places=2, blank=True)
    price_ton= models.DecimalField(verbose_name="Price/Ton", max_digits=6, decimal_places=2, null=True, blank=True)
    ticket_date = models.DateField(blank=True)
    revenue = models.DecimalField(max_digits=6, decimal_places=2, null=True, blank=True)
    created_by = models.ForeignKey(User)
    created_date = models.DateField(null=True, blank=True)
    class Meta:
        db_table = 'scaling_ticket'
    def __unicode__(self):
        return unicode(self.scalingticket_id)
    
class LumberLoad(models.Model):
    lumberload_id = models.AutoField(primary_key=True)
    scalingticket = models.ForeignKey('ScalingTicket', blank=True, null=True)
    load_date = models.DateField(blank=True)
    load_comments = models.CharField(max_length=255, blank=True)
    created_by = models.ForeignKey(User)
    class Meta:
        db_table = 'lumber_load'
        ordering = ["lumberload_id"]
    def __unicode__(self):
        return unicode(self.lumberload_id)
        
class LogData(models.Model):
    logdata_id = models.AutoField(primary_key=True)
    lumberload = models.ForeignKey('LumberLoad', blank=True, null=True)
    butt_diameter = models.DecimalField(null=True, max_digits=4, decimal_places=1, blank=True)
    diameter_unit = models.ForeignKey(UnitLengthType, related_name='diameter_unit', null=True)
    log_length = models.DecimalField(null=True, max_digits=3, decimal_places=1, blank=True)
    length_unit = models.ForeignKey(UnitLengthType, related_name='length_unit', null=True)
    speciestreetype = models.ForeignKey(SpeciesTreeType, blank=True, null=True)
    recorded_date = models.DateField(blank=True, null=True)
    created_by = models.ForeignKey(User)
    class Meta:
        db_table = 'log_data'
        ordering = ["logdata_id"]
    def __unicode__(self):
        return unicode(self.logdata_id)
