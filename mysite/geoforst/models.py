from __future__ import unicode_literals 
from django.contrib.gis.db import models


# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#     * Rearrange models' order
#     * Make sure each model has one field with primary_key=True
# Feel free to rename the models, but don't rename db_table values or field names.
#
# Also note: You'll have to insert the output of 'django-admin.py sqlcustom [appname]'
# into your database.

# GeoDjango-specific: a geometry field (MultiPolygonField), and
# overriding the default manager with a GeoManager instance.
mpoly = models.MultiPolygonField()
objects = models.GeoManager()

# Returns the string representation of the model.
def __unicode__(self):
    return self.name


class ActivityArea(models.Model):
    activityarea_id = models.IntegerField(primary_key=True)
    geometry = models.MultiPolygonField(srid=26917, null=True, blank=True)
    activity_date = models.CharField(max_length=25, blank=True)
    acttype = models.ForeignKey('ActivityType', null=True, blank=True)
    description = models.CharField(max_length=255, blank=True)
    revenue = models.TextField(blank=True) # This field type is a guess.
    plannedact_id = models.IntegerField(null=True, blank=True)
    standact = models.ForeignKey('PlannedActivity', null=True, blank=True)
    objects = models.GeoManager()
    class Meta:
        db_table = 'activity_area'

class ActivityType(models.Model):
    acttype_id = models.IntegerField()
    acttype_dsc = models.CharField(max_length=50, blank=True)
    class Meta:
        db_table = 'activity_type'

class BurnCompartment(models.Model):
    burncompartment_id = models.IntegerField(primary_key=True)
    geometry = models.TextField(blank=True) # This field type is a guess.
    compartment_set = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = 'burn_compartment'

class ControlPoint(models.Model):
    controlpt_id = models.IntegerField()
    geometry = models.PointField(srid=26917, null=True, blank=True)
    description = models.CharField(max_length=255, blank=True)
    x = models.FloatField(null=True, blank=True)
    y = models.FloatField(null=True, blank=True)
    status = models.CharField(max_length=25, blank=True)
    objects = models.GeoManager()
    class Meta:
        db_table = 'control_point'

class CulturalPoint(models.Model):
    cultpt_id = models.IntegerField()
    geometry = models.PointField(srid=26917, null=True, blank=True)
    culttype = models.ForeignKey('CulturalType', null=True, blank=True)
    description = models.CharField(max_length=255, blank=True)
    objects = models.GeoManager()
    class Meta:
        db_table = 'cultural_point'

class CulturalType(models.Model):
    culttype_id = models.IntegerField()
    culttype_cd = models.CharField(max_length=3, blank=True)
    culttype_dsc = models.CharField(max_length=50, blank=True)
    class Meta:
        db_table = 'cultural_type'
        
class FirebreakLine(models.Model):
    fbkln_id = models.IntegerField()
    geometry = models.LineStringField(srid=26917, null=True, blank=True)
    description = models.CharField(max_length=255, blank=True)
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

class ForestType(models.Model):
    foresttype_id = models.IntegerField(primary_key=True)
    foresttype_dsc = models.CharField(max_length=50, blank=True)
    class Meta:
        db_table = 'forest_type'

class HabitatEnhancementArea(models.Model):
    habenharea_id = models.IntegerField(primary_key=True)
    geometry = models.PolygonField(srid=26917, null=True, blank=True)
    habenhtype = models.ForeignKey('HabitatEnhancementType', null=True, blank=True)
    description = models.CharField(max_length=255, blank=True)
    objects = models.GeoManager()
    class Meta:
        db_table = 'habitat_enhancement_area'

class HabitatEnhancementPoint(models.Model):
    habenhpt_id = models.IntegerField(primary_key=True)
    geometry = models.PointField(srid=26917, null=True, blank=True)
    habenhtype = models.ForeignKey('HabitatEnhancementType', null=True, blank=True)
    description = models.CharField(max_length=255, blank=True)
    objects = models.GeoManager()
    class Meta:
        db_table = 'habitat_enhancement_point'

class HabitatEnhancementType(models.Model):
    habenhtype_id = models.IntegerField()
    habenhtype_dsc = models.CharField(max_length=50, blank=True)
    class Meta:
        db_table = 'habitat_enhancement_type'

class HarvestType(models.Model):
    harvesttype_id = models.IntegerField()
    harvesttype_dsc = models.CharField(max_length=50, blank=True)
    class Meta:
        db_table = 'harvest_type'

class LandArea(models.Model):
    landarea_id = models.IntegerField()
    geometry = models.PolygonField(srid=26917, null=True, blank=True)
    description = models.CharField(max_length=255, blank=True)
    start_date = models.DateField(null=True, blank=True)
    transaction_start_date = models.DateField(null=True, blank=True)
    objects = models.GeoManager()
    class Meta:
        db_table = 'land_area'

class LandAreaHistory(models.Model):
    landareahist_id = models.IntegerField()
    landarea_id = models.IntegerField(null=True, blank=True)
    geometry = models.PolygonField(srid=26917, null=True, blank=True)
    description = models.CharField(max_length=255, blank=True)
    start_date = models.DateField(null=True, blank=True)
    end_date = models.DateField(null=True, blank=True)
    transaction_start_date = models.DateField(null=True, blank=True)
    transaction_end_date = models.DateField(null=True, blank=True)
    objects = models.GeoManager()
    class Meta:
        db_table = 'land_area_history'

class LandOwner(models.Model):
    landowner_id = models.IntegerField(primary_key=True)
    landarea = models.ForeignKey(LandArea, null=True, blank=True)
    person = models.ForeignKey('Person', null=True, blank=True)
    class Meta:
        db_table = 'land_owner'

class Person(models.Model):
    person_id = models.IntegerField(primary_key=True)
    name_last = models.CharField(max_length=30)
    name_first = models.CharField(max_length=30)
    address = models.CharField(max_length=50, blank=True)
    address_ext = models.CharField(max_length=50, blank=True)
    city = models.CharField(max_length=30, blank=True)
    state = models.CharField(max_length=2, blank=True)
    zip_code = models.DecimalField(null=True, max_digits=5, decimal_places=0, blank=True)
    phone = models.CharField(max_length=12, blank=True)
    class Meta:
        db_table = 'person'

class PlannedActivity(models.Model):
    plannedact_id = models.IntegerField()
    acttype = models.ForeignKey(ActivityType, null=True, blank=True)
    planned_date = models.DecimalField(null=True, max_digits=4, decimal_places=0, blank=True)
    completed_date = models.CharField(max_length=25, blank=True)
    description = models.CharField(max_length=255, blank=True)
    notes = models.CharField(max_length=255, blank=True)
    revenue = models.FloatField(null=True, blank=True)
    taskstatus = models.ForeignKey('TaskStatusType', null=True, blank=True)
    stand_no = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = 'planned_activity'

class RecreationPoint(models.Model):
    recpt_id = models.IntegerField(primary_key=True)
    geometry = models.PointField(srid=26917, null=True, blank=True)
    rectype = models.ForeignKey('RecreationType', null=True, blank=True)
    description = models.CharField(max_length=255, blank=True)
    objects = models.GeoManager()
    class Meta:
        db_table = 'recreation_point'

class RecreationType(models.Model):
    rectype_id = models.IntegerField()
    rectype_dsc = models.CharField(max_length=50, blank=True)
    class Meta:
        db_table = 'recreation_type'

class RoadAccessStatusType(models.Model):
    accessstatus_id = models.IntegerField(primary_key=True)
    accessstatus_cd = models.CharField(max_length=3, blank=True)
    accessstatus_dsc = models.CharField(max_length=30, blank=True)
    class Meta:
        db_table = 'road_access_status_type'

class RoadLine(models.Model):
    roadln_id = models.IntegerField(primary_key=True)
    geometry = models.MultiLineStringField(srid=26917, null=True, blank=True)
    roadtype = models.ForeignKey('RoadType', null=True, blank=True)
    description = models.CharField(max_length=255, blank=True)
    road_name = models.CharField(max_length=25, blank=True)
    accessstatus = models.ForeignKey(RoadAccessStatusType, null=True, blank=True)
    roadsurface = models.ForeignKey('RoadSurfaceType', null=True, blank=True)
    objects = models.GeoManager()
    class Meta:
        db_table = 'road_line'

class RoadSurfaceType(models.Model):
    roadsurface_id = models.IntegerField(primary_key=True)
    roadsurface_cd = models.CharField(max_length=3, blank=True)
    roadsurface_dsc = models.CharField(max_length=30, blank=True)
    class Meta:
        db_table = 'road_surface_type'

class RoadType(models.Model):
    roadtype_id = models.IntegerField()
    roadtype_dsc = models.CharField(max_length=50, blank=True)
    class Meta:
        db_table = 'road_type'

class SeverityType(models.Model):
    severity_id = models.IntegerField(primary_key=True)
    severity_cd = models.CharField(max_length=3, blank=True)
    severity_dsc = models.CharField(max_length=30, blank=True)
    class Meta:
        db_table = 'severity_type'

class StandArea(models.Model):
    standarea_id = models.IntegerField()
    geometry = models.PolygonField(srid=26917, null=True, blank=True)
    stand_no = models.IntegerField(null=True, blank=True)
    description = models.CharField(max_length=255, blank=True)
    start_date = models.DateTimeField(null=True, blank=True)
    foresttype = models.ForeignKey(ForestType, null=True, blank=True)
    transaction_start_date = models.DateTimeField(null=True, blank=True)
    standdescription = models.ForeignKey('StandDescription', null=True, blank=True)
    objects = models.GeoManager()
    class Meta:
        db_table = 'stand_area'

class StandAreaHistory(models.Model):
    standareahist_id = models.IntegerField()
    standarea_id = models.IntegerField(null=True, blank=True)
    geometry = models.PolygonField(srid=26917, null=True, blank=True)
    stand_no = models.IntegerField(null=True, blank=True)
    description = models.CharField(max_length=255, blank=True)
    end_date = models.DateTimeField(null=True, blank=True)
    start_date = models.DateTimeField(null=True, blank=True)
    foresttype_id = models.IntegerField(null=True, blank=True)
    transaction_start_date = models.DateTimeField(null=True, blank=True)
    transaction_end_date = models.DateTimeField(null=True, blank=True)
    objects = models.GeoManager()
    class Meta:
        db_table = 'stand_area_history'

class StandDescription(models.Model):
    standdescription_id = models.IntegerField(primary_key=True)
    stockingtype = models.ForeignKey('StockingType', null=True, blank=True)
    forestagetype = models.ForeignKey(ForestAgeType, null=True, blank=True)
    stand_description = models.CharField(max_length=255, blank=True)
    foresttype = models.ForeignKey(ForestType, null=True, blank=True)
    class Meta:
        db_table = 'stand_description'

class StandStatus(models.Model):
    standstatus_id = models.IntegerField()
    year = models.DecimalField(null=True, max_digits=4, decimal_places=0, blank=True)
    recommended_treatment = models.CharField(max_length=255, blank=True)
    notes = models.CharField(max_length=255, blank=True)
    damage_severity = models.ForeignKey(SeverityType, null=True, db_column='damage_severity', blank=True)
    stand = models.ForeignKey(StandDescription, null=True, blank=True)
    class Meta:
        db_table = 'stand_status'

class StandType(models.Model):
    standtype_id = models.IntegerField(primary_key=True)
    standtype_cd = models.CharField(max_length=3, blank=True)
    standtype_dsc = models.CharField(max_length=50, blank=True)
    class Meta:
        db_table = 'stand_type'

class StockingType(models.Model):
    stockingtype_id = models.IntegerField()
    stockingtype_dsc = models.CharField(max_length=50, blank=True)
    class Meta:
        db_table = 'stocking_type'

class Stream(models.Model):
    stream_id = models.IntegerField()
    geometry = models.LineStringField(srid=26917, null=True, blank=True)
    shape_leng = models.CharField(max_length=25, blank=True)
    stream_type = models.CharField(max_length=25, blank=True)
    stream_name = models.CharField(max_length=25, blank=True)
    objects = models.GeoManager()
    class Meta:
        db_table = 'stream'

class StreamsideManagementZone(models.Model):
    smz_id = models.IntegerField()
    geometry = models.MultiPolygonField(srid=26917, null=True, blank=True)
    shape_leng = models.FloatField(null=True, blank=True)
    et_id = models.CharField(max_length=255, blank=True)
    shape_area = models.FloatField(null=True, blank=True)
    objects = models.GeoManager()
    class Meta:
        db_table = 'streamside_management_zone'

class TaskStatusType(models.Model):
    taskstatus_id = models.IntegerField(primary_key=True)
    status_code = models.CharField(max_length=3, blank=True)
    status_dsc = models.CharField(max_length=30, blank=True)
    class Meta:
        db_table = 'task_status_type'


class Tree(models.Model):
    tree_id = models.IntegerField()
    geometry = models.PointField(srid=26917, null=True, blank=True)
    specie = models.CharField(max_length=50, blank=True)
    start_year = models.CharField(max_length=4, blank=True)
    objects = models.GeoManager()
    class Meta:
        db_table = 'tree'

class VwQcLandAreaByYear(models.Model):
    report_year = models.DecimalField(null=True, max_digits=4, decimal_places=0, blank=True)
    period_area = models.FloatField(null=True, blank=True)
    true_area = models.FloatField(null=True, blank=True)
    area_diff = models.FloatField(null=True, blank=True)
    pct_diff = models.FloatField(null=True, blank=True)
    class Meta:
        db_table = 'vw_qc_land_area_by_year'

class VwStandAreaAll(models.Model):
    geometry = models.PolygonField(srid=26917, null=True, blank=True)
    stand_no = models.IntegerField(null=True, blank=True)
    description = models.CharField(max_length=255, blank=True)
    start_date = models.DateTimeField(null=True, blank=True)
    end_date = models.DateTimeField(null=True, blank=True)
    foresttype_id = models.IntegerField(null=True, blank=True)
    objects = models.GeoManager()
    class Meta:
        db_table = 'vw_stand_area_all'

class VwStandAreaByYear(models.Model):
    view_id = models.FloatField(null=True, blank=True)
    standarea_id = models.IntegerField(null=True, blank=True)
    geometry = models.PolygonField(srid=26917, null=True, blank=True)
    stand_no = models.IntegerField(null=True, blank=True)
    description = models.CharField(max_length=255, blank=True)
    end_date = models.DateTimeField(null=True, blank=True)
    start_date = models.DateTimeField(null=True, blank=True)
    foresttype_id = models.IntegerField(null=True, blank=True)
    reportdate_id = models.IntegerField(null=True, blank=True)
    report_year = models.DecimalField(null=True, max_digits=4, decimal_places=0, blank=True)
    report_timestamp = models.DateTimeField(null=True, blank=True)
    status = models.TextField(blank=True)
    objects = models.GeoManager()
    class Meta:
        db_table = 'vw_stand_area_by_year'

class WaterPoint(models.Model):
    waterpoint_id = models.IntegerField()
    geometry = models.PointField(srid=26917, null=True, blank=True)
    watertype = models.ForeignKey('WaterType', null=True, blank=True)
    description = models.CharField(max_length=255, blank=True)
    objects = models.GeoManager()
    class Meta:
        db_table = 'water_point'

class WaterType(models.Model):
    watertype_id = models.IntegerField()
    watertype_dsc = models.CharField(max_length=50, blank=True)
    class Meta:
        db_table = 'water_type'
