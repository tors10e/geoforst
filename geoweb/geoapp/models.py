from __future__ import unicode_literals 
from django.contrib.gis.db import models
from django.contrib.auth.models import User
from django.core.validators import MinValueValidator, MaxValueValidator
from django.contrib.gis.geos import Point
import uuid

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
    standarea_uuid = models.UUIDField(default=uuid.uuid4, unique=True)
    geometry = models.PolygonField(srid=2163, null=True, blank=True)
    stand_no = models.IntegerField(null=True, blank=True)
    description = models.CharField(max_length=255, blank=True)
    start_date = models.DateTimeField(null=True, blank=True)
    foresttype = models.ForeignKey(ForestType, null=True, blank=True)
    transaction_start_date = models.DateTimeField(null=True, blank=True)
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
    created_by = models.IntegerField(null=True, blank=True)
    objects = models.GeoManager()
    class Meta:
        db_table = 'stand_area_history'
    def __unicode__(self):
        return unicode(self.standareahist_id)

class StandStatus(models.Model):
    standstatus_id = models.AutoField(primary_key=True)
    year = models.DecimalField(null=True, max_digits=4, decimal_places=0, blank=True)
    recommended_treatment = models.CharField(max_length=255, blank=True)
    notes = models.CharField(max_length=255, blank=True)
    damage_severity = models.ForeignKey(SeverityType, null=True, db_column='damage_severity', blank=True)
    #stand = models.ForeignKey(StandDescription, null=True, blank=True)
    created_by = models.ForeignKey(User)
    standarea_uuid = models.ForeignKey('StandArea',to_field='standarea_uuid')
    standstatus_uuid = models.UUIDField(default=uuid.uuid4, unique=True)
    stand_no = models.IntegerField(null=True, blank=True)
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



class MonthType(models.Model):
    monthtype_id = models.IntegerField(primary_key=True)
    monthtype_dsc = models.CharField(max_length=30, null=False)
    class Meta:
        db_table = 'month_type'
    def __unicode__(self):
        return unicode(self.monthtype_dsc)
        
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