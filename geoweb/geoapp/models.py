from __future__ import unicode_literals 
from django.contrib.gis.db import models
from django.contrib.auth.models import User
from django.core.validators import MinValueValidator, MaxValueValidator
from django.contrib.gis.geos import Point
import uuid

# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#     * Rearrange models' order
#     * Make sure each model has one field with primary_key=True
# Feel free to rename the models, but don't rename db_table values or field names.
#
# Also note: You'll have to insert the output of 'django-admin.py sqlcustom [appname]'
# into your database.

# Returns the string representation of the model.


class BurnCompartment(models.Model):
    burncompartment_id = models.AutoField(primary_key=True)
    geometry = models.TextField(blank=True) # This field type is a guess.
    compartment_set = models.IntegerField(null=True, blank=True)
    created_by = models.ForeignKey(User)
    class Meta:
        db_table = 'burn_compartment'

class ControlPoint(models.Model):
    controlpt_id = models.AutoField(primary_key=True)
    geometry = models.PointField(srid=2163, null=True, blank=True)
    description = models.CharField(max_length=255, blank=True)
    x = models.FloatField(null=True, blank=True)
    y = models.FloatField(null=True, blank=True)
    status = models.CharField(max_length=25, blank=True)
    objects = models.GeoManager()
    class Meta:
        db_table = 'control_point'

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
        
class FirebreakLine(models.Model):
    fbkln_id = models.AutoField(primary_key=True)
    geometry = models.LineStringField(srid=2163, null=True, blank=True)
    description = models.CharField(max_length=255, blank=True)
    created_by = models.ForeignKey(User)
    length_meters = models.FloatField(null=True, blank=True)
    objects = models.GeoManager()
    class Meta:
        db_table = 'firebreak_line'

class ForestAgeType(models.Model):
    forestagetype_id = models.IntegerField(primary_key=True)
    forestagetype_cd = models.CharField(max_length=3, blank=True)
    forestagetype_dsc = models.CharField(max_length=30, blank=True)
    class Meta:
        db_table = 'forest_age_type'
    def __unicode__(self):
        return unicode(self.forestagetype_dsc)
    
class ForestInventoryData(models.Model):
    forestinventorydata_id = models.AutoField(primary_key=True)
    forestinventorydata_uuid = models.UUIDField(default=uuid.uuid4, unique=True)
    forestinventoryplot = models.ForeignKey('ForestInventoryPlot',null=True, blank=True)
    tree = models.ForeignKey('Tree', null=True, blank=True)
    collection_date = models.DateField(null=True, blank=True)
    speciestreetype = models.ForeignKey('SpeciesTreeType', null=False)
    dbh = models.DecimalField(max_digits=4, decimal_places=1, blank=True, null=True)
    dbh_unit = models.ForeignKey('UnitLengthType', related_name='dbh_unit', null=True)
    height = models.IntegerField(blank=True, null=True)
    height_unit = models.ForeignKey('UnitLengthType',related_name='height_unit', null=True, blank=True)
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
    plot_area_unit = models.ForeignKey('UnitAreaType',null=True)
    plot_radius = models.IntegerField(blank=True, null=True)
    plot_radius_unit = models.ForeignKey('UnitLengthType', null=True, blank=True)
    plot_xlength = models.IntegerField(blank=True, null=True)
    plot_ylength = models.IntegerField(blank=True, null=True)
    plot_length_unit = models.ForeignKey('UnitLengthType', related_name='plot_length_unit', null=True, blank=True)
    geometry = models.PointField(srid=2163, null=True, blank=True)
    latitude = models.FloatField(verbose_name='Latitude') # Not persisted, used to populate geometry.
    longitude = models.FloatField(verbose_name='Longitude') 
    elevation = models.IntegerField(null=True, blank=True)
    elevation_unit = models.ForeignKey('UnitLengthType', related_name='elevation_unit', null=True, blank=True)
    position_description = models.CharField(max_length=255, null=True, blank=True)
    plot_create_date = models.DateField(null=True, blank=True)
    created_by = models.ForeignKey(User)
    
    objects = models.GeoManager()
    
    class Meta:
            db_table = 'forest_inventory_plot'
            ordering = ["plot_number"]
            
    def __unicode__(self):
        return unicode(self.plot_number)
    
    def save(self,*args, **kwargs):
        self.geometry = Point(self.longitude, self.latitude)
        super(ForestInventoryPlot, self).save(*args,**kwargs)

class ForestType(models.Model):
    foresttype_id = models.IntegerField(primary_key=True)
    foresttype_cd = models.CharField(max_length=3, blank=True)
    foresttype_dsc = models.CharField(max_length=50, blank=True)
    class Meta:
        db_table = 'forest_type'
    def __unicode__(self):
        return unicode(self.foresttype_dsc)

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

class HarvestType(models.Model):
    harvesttype_id = models.IntegerField(primary_key=True)
    harvesttype_cd = models.CharField(max_length=3, blank=True)
    harvesttype_dsc = models.CharField(max_length=50, blank=True)
    class Meta:
        db_table = 'harvest_type'
    def __unicode__(self):
        return unicode(self.harvesttype_dsc)

class LandArea(models.Model):
    landarea_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=30, null=True, blank=True)
    geometry = models.PolygonField(srid=2163, null=True, blank=True)
    description = models.CharField(max_length=255, blank=True)
    start_date = models.DateField(null=True, blank=True)
    transaction_start_date = models.DateField(null=True, blank=True)
    created_by = models.ForeignKey(User)
    objects = models.GeoManager()
    class Meta:
        db_table = 'land_area'
    
    def __unicode__(self):
        return unicode(self.name)

class LandAreaHistory(models.Model):
    landareahist_id = models.AutoField(primary_key=True)
    landarea_id = models.IntegerField(null=True, blank=True)
    geometry = models.PolygonField(srid=2163, null=True, blank=True)
    description = models.CharField(max_length=255, blank=True)
    start_date = models.DateField(null=True, blank=True)
    end_date = models.DateField(null=True, blank=True)
    transaction_start_date = models.DateField(null=True, blank=True)
    transaction_end_date = models.DateField(null=True, blank=True)
    created_by = models.ForeignKey(User)
    objects = models.GeoManager()
    class Meta:
        db_table = 'land_area_history'

class Person(models.Model):
    person_id = models.AutoField(primary_key=True)
    name_last = models.CharField(max_length=30)
    name_first = models.CharField(max_length=30)
    address = models.CharField(max_length=50, blank=True)
    address_ext = models.CharField(max_length=50, blank=True)
    city = models.CharField(max_length=30, blank=True)
    state = models.CharField(max_length=2, blank=True)
    zip_code = models.DecimalField(null=True, max_digits=5, decimal_places=0, blank=True)
    phone = models.CharField(max_length=12, blank=True)
    created_by = models.ForeignKey(User)
    class Meta:
        db_table = 'person'

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
    
class SeasonType(models.Model):
    seasontype_id = models.IntegerField(primary_key=True)
    seasontype_dsc = models.CharField(max_length=6)
    class Meta:
        db_table = 'season_type'
    def __unicode__(self):
        return unicode(self.seasontype_dsc)

class SeverityType(models.Model):
    severity_id = models.IntegerField(primary_key=True)
    severity_cd = models.CharField(max_length=3, blank=True)
    severity_dsc = models.CharField(max_length=30, blank=True)
    class Meta:
        db_table = 'severity_type'
    def __unicode__(self):
        return unicode(self.severity_dsc)

class StandArea(models.Model):
    standarea_id = models.AutoField(primary_key=True)
    geometry = models.PolygonField(srid=2163, null=True, blank=True)
    stand_no = models.IntegerField(null=True, blank=True)
    description = models.CharField(max_length=255, blank=True)
    start_date = models.DateTimeField(null=True, blank=True)
    foresttype = models.ForeignKey(ForestType, null=True, blank=True)
    transaction_start_date = models.DateTimeField(null=True, blank=True)
    standdescription = models.ForeignKey('StandDescription', null=True, blank=True)
    created_by = models.ForeignKey(User)
    objects = models.GeoManager()
    class Meta:
        db_table = 'stand_area'
    def __unicode__(self):
        return unicode(self.standdescription)


class StandAreaHistory(models.Model):
    standareahist_id = models.AutoField(primary_key=True)
    standarea_id = models.IntegerField(null=True, blank=True)
    geometry = models.PolygonField(srid=2163, null=True, blank=True)
    stand_no = models.IntegerField(null=True, blank=True)
    description = models.CharField(max_length=255, blank=True)
    end_date = models.DateTimeField(null=True, blank=True)
    start_date = models.DateTimeField(null=True, blank=True)
    foresttype_id = models.IntegerField(null=True, blank=True)
    transaction_start_date = models.DateTimeField(null=True, blank=True)
    transaction_end_date = models.DateTimeField(null=True, blank=True)
    created_by = models.ForeignKey(User)
    objects = models.GeoManager()
    class Meta:
        db_table = 'stand_area_history'
    def __unicode__(self):
        return unicode(self.standareahist_id)

class StandDescription(models.Model):
    standdescription_id = models.AutoField(primary_key=True)
    stockingtype = models.ForeignKey('StockingType', null=True, blank=True)
    forestagetype = models.ForeignKey(ForestAgeType, null=True, blank=True)
    stand_description = models.CharField(max_length=255, blank=True)
    foresttype = models.ForeignKey(ForestType, null=True, blank=True)
    created_by = models.ForeignKey(User)
    class Meta:
        db_table = 'stand_description'
    def __unicode__(self):
        return unicode(self.stand_description)

class StandStatus(models.Model):
    standstatus_id = models.AutoField(primary_key=True)
    year = models.DecimalField(null=True, max_digits=4, decimal_places=0, blank=True)
    recommended_treatment = models.CharField(max_length=255, blank=True)
    notes = models.CharField(max_length=255, blank=True)
    damage_severity = models.ForeignKey(SeverityType, null=True, db_column='damage_severity', blank=True)
    stand = models.ForeignKey(StandDescription, null=True, blank=True)
    created_by = models.ForeignKey(User)
    class Meta:
        db_table = 'stand_status'
        verbose_name_plural = "stand_statuses"
    def __unicode__(self):
        return unicode(self.standstatus_id)

class StandType(models.Model):
    standtype_id = models.IntegerField(primary_key=True)
    standtype_cd = models.CharField(max_length=3, blank=True)
    standtype_dsc = models.CharField(max_length=50, blank=True)
    class Meta:
        db_table = 'stand_type'
    def __unicode__(self):
        return unicode(self.standtype_dsc)

class StockingType(models.Model):
    stockingtype_id = models.IntegerField(primary_key=True)
    stockingtype_cd = models.CharField(max_length=3, blank=True)
    stockingtype_dsc = models.CharField(max_length=50, blank=False)
    class Meta:
        db_table = 'stocking_type'
    def __unicode__(self):
        return unicode(self.stockingtype_dsc)

class Stream(models.Model):
    stream_id =  models.AutoField(primary_key=True)
    geometry = models.LineStringField(srid=2163, null=True, blank=True)
    shape_leng = models.CharField(max_length=25, blank=True)
    stream_type = models.CharField(max_length=25, blank=True)
    stream_name = models.CharField(max_length=25, blank=True)
    created_by = models.ForeignKey(User)
    objects = models.GeoManager()
    class Meta:
        db_table = 'stream'
    def __unicode__(self):
        return unicode(self.stream_name)

class StreamsideManagementZone(models.Model):
    smz_id =  models.AutoField(primary_key=True)
    geometry = models.MultiPolygonField(srid=2163, null=True, blank=True)
    shape_leng = models.FloatField(null=True, blank=True)
    et_id = models.CharField(max_length=255, blank=True)
    shape_area = models.FloatField(null=True, blank=True)
    created_by = models.ForeignKey(User)
    objects = models.GeoManager()
    class Meta:
        db_table = 'streamside_management_zone'
    def __unicode__(self):
        return unicode(self.smz_id)

class TaskStatusType(models.Model):
    taskstatus_id = models.AutoField(primary_key=True)
    status_code = models.CharField(max_length=3, blank=True)
    status_dsc = models.CharField(max_length=30, blank=True)
    class Meta:
        db_table = 'task_status_type'
    def __unicode__(self):
        return unicode(self.status_dsc)

class Tree(models.Model):
    tree_id = models.AutoField(primary_key=True)
    geometry = models.PointField(srid=2163, null=True, blank=True)
    speciestreetype =  models.ForeignKey('SpeciesTreeType', max_length=50, blank=True)
    start_year = models.CharField(max_length=4, blank=True)
    created_by = models.ForeignKey(User)
    objects = models.GeoManager()
    class Meta:
        db_table = 'tree'
    def __unicode__(self):
        return unicode(self.tree_id)

class WaterPoint(models.Model):
    waterpoint_id = models.AutoField(primary_key=True)
    geometry = models.PointField(srid=2163, null=True, blank=True)
    watertype = models.ForeignKey('WaterType', null=True, blank=True)
    description = models.CharField(max_length=255, blank=True)
    created_by = models.ForeignKey(User)
    objects = models.GeoManager()
    class Meta:
        db_table = 'water_point'
    def __unicode__(self):
        return unicode(self.description)

class WaterType(models.Model):
    watertype_id = models.IntegerField(primary_key=True)
    watertype_cd = models.CharField(max_length=3, blank=True)
    watertype_dsc = models.CharField(max_length=50, blank=True)
    class Meta:
        db_table = 'water_type'
    def __unicode__(self):
        return unicode(self.watertype_dsc)

class Sawmill(models.Model):
    sawmill_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=30, blank=True, unique=True)
    address = models.CharField(max_length=100, blank=True)
    city = models.CharField(max_length=30, blank=True)
    state = models.CharField(max_length=2, blank=True)
    zip = models.DecimalField(null=True, max_digits=5, decimal_places=0, blank=True)
    phone = models.CharField(max_length=20, blank=True)
    email = models.CharField(max_length=100, blank=True)
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
    diameter_unit = models.ForeignKey('UnitLengthType', related_name='diameter_unit', null=True)
    log_length = models.DecimalField(null=True, max_digits=3, decimal_places=1, blank=True)
    length_unit = models.ForeignKey('UnitLengthType', related_name='length_unit', null=True)
    speciestreetype = models.ForeignKey('SpeciesTreeType', blank=True, null=True)
    recorded_date = models.DateField(blank=True, null=True)
    created_by = models.ForeignKey(User)
    class Meta:
        db_table = 'log_data'
        ordering = ["logdata_id"]
    def __unicode__(self):
        return unicode(self.logdata_id)

class MonthType(models.Model):
    monthtype_id = models.IntegerField(primary_key=True)
    monthtype_dsc = models.CharField(max_length=30, null=False)
    class Meta:
        db_table = 'month_type'
    def __unicode__(self):
        return unicode(self.monthtype_dsc)
    
class PlotGeometryType(models.Model):
    plotgeomtype_id = models.IntegerField(primary_key=True)
    plotgeomtype_cd = models.CharField(max_length=3, null=False)
    plotgeomtype_dsc = models.CharField(max_length=50, null=False)
    class Meta:
        db_table = 'plot_geometry_type'
    def __unicode__(self):
        return unicode(self.plotgeomtype_dsc)
        
class UnitLengthType(models.Model):
    unitlengthtype_id = models.IntegerField(primary_key=True)
    unitlengthtype_cd = models.CharField(max_length=3, null=False)
    unitlengthtype_dsc = models.CharField(max_length=50, null=False)
    class Meta:
        db_table = 'unit_length_type'
    def __unicode__(self):
        return unicode(self.unitlengthtype_dsc)    

class UnitAreaType(models.Model):
    unitareatype_id = models.IntegerField(primary_key=True)
    unitareatype_cd = models.CharField(max_length=3, null=False)
    unitareatype_dsc = models.CharField(max_length=50, null=False)
    class Meta:
        db_table = 'unit_area_type'
    def __unicode__(self):        
        return unicode(self.unitareatype_dsc)  
 
    
class UserUpload(models.Model):
    userupload_id = models.AutoField(primary_key=True)
    file = models.FileField(upload_to='user_data')
    description = models.CharField(max_length=255, null=True)
    create_date = models.DateField(blank=True, null=True)
    created_by =  models.ForeignKey(User)
    class Meta:
        db_table='user_upload'
        
class SpeciesTreeType(models.Model):
    speciestreetype_id = models.IntegerField(primary_key=True)
    speciestreetype_cd = models.CharField(max_length=3, null=False)
    speciestreetype_dsc = models.CharField(max_length=50, null=False)
    speciestreetype_bn = models.CharField(max_length=50, null=False)
    class Meta:
        db_table='species_tree_type'
        ordering = ["speciestreetype_dsc"]
    def __unicode__(self):
        return unicode(self.speciestreetype_dsc)