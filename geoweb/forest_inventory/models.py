
from __future__ import unicode_literals 
from django.contrib.gis.db import models
from django.contrib.auth.models import User
from django.core.validators import MinValueValidator, MaxValueValidator
from django.contrib.gis.geos import Point

import uuid

from geoapp.models import Tree, SpeciesTreeType
    
class ForestInventoryData(models.Model):
    forestinventorydata_id = models.AutoField(primary_key=True)
    forestinventorydata_uuid = models.UUIDField(default=uuid.uuid4, unique=True)
    forestinventoryplot = models.ForeignKey('ForestInventoryPlot',null=True, blank=True)
    tree = models.ForeignKey(Tree, null=True, blank=True)
    collection_date = models.DateField(null=True, blank=True)
    speciestreetype = models.ForeignKey(SpeciesTreeType, null=False)
    dbh = models.DecimalField(max_digits=4, decimal_places=1, blank=True, null=True)
    height = models.IntegerField(blank=True, null=True)
    age = models.IntegerField(blank=True)
    created_by =  models.ForeignKey(User)
    
    class Meta:
        db_table = 'forest_inventory_data'
        ordering = ['collection_date']
    def __unicode__(self):
        return unicode(self.forestinventorydata_id)

class ForestInventoryPlot(models.Model):
    forestinventoryplot_id = models.AutoField(primary_key=True)
    forestinventoryplot_uuid = models.UUIDField(default=uuid.uuid4, unique=True)
    plot_number = models.IntegerField(validators=[MinValueValidator(1)], null=False, unique=True)
    plot_geometry = models.ForeignKey('PlotGeometryType', null=False)
    plot_area = models.DecimalField(null=True, blank=True, max_digits=5, decimal_places=1)
    plot_radius = models.IntegerField(blank=True, null=True)
    plot_xlength = models.IntegerField(blank=True, null=True)
    plot_ylength = models.IntegerField(blank=True, null=True)
    geometry = models.PointField(srid=4269, null=True, blank=True)
    latitude = models.FloatField(verbose_name='Latitude') # Not persisted, used to populate geometry.
    longitude = models.FloatField(verbose_name='Longitude') 
    elevation = models.IntegerField(null=True, blank=True)
    position_description = models.CharField(max_length=255, null=True, blank=True)
    plot_create_date = models.DateField(null=True, blank=True)
    created_by = models.ForeignKey(User)
    
    objects = models.GeoManager()
    
    class Meta:
            db_table = 'forest_inventory_plot'
            ordering = ["plot_number"]
            
    def __unicode__(self):
        return unicode(self.plot_number)
    
    #def save(self,*args, **kwargs):
    #    self.geometry = Point(self.longitude, self.latitude)
    #    super(ForestInventoryPlot, self).save(*args,**kwargs)

class PlotGeometryType(models.Model):
    plotgeomtype_id = models.IntegerField(primary_key=True)
    plotgeomtype_cd = models.CharField(max_length=3, null=False)
    plotgeomtype_dsc = models.CharField(max_length=50, null=False)
    class Meta:
        db_table = 'plot_geometry_type'
    def __unicode__(self):
        return unicode(self.plotgeomtype_dsc)
