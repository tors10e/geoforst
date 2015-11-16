import uuid
from django.contrib.gis.db import models
from geoapp.models import User, TaskStatusType, LandArea

class ActivityArea(models.Model):
    activityarea_id = models.AutoField(primary_key=True)
    activityarea_uuid = models.UUIDField(default=uuid.uuid4, unique=True)
    geometry = models.PolygonField(srid=2163, null=True, blank=True)
    activity_date = models.DateField (blank=True)
    acttype = models.ForeignKey('ActivityType', null=True, blank=True)
    description = models.CharField(max_length=255, blank=True)
    revenue = models.DecimalField(max_digits=8, decimal_places=2, blank=True) # This field type is a guess.
    created_by = models.ForeignKey(User)
    objects = models.GeoManager()
    class Meta:
        db_table = 'activity_area'
    def __unicode__(self):
        return unicode(self.activityarea_id)    

class ActivityType(models.Model):
    acttype_id = models.IntegerField(primary_key=True)
    acttype_cd = models.CharField(max_length=3, blank=True)
    acttype_dsc = models.CharField(max_length=50, blank=True)
    class Meta:
        db_table = 'activity_type'
    def __unicode__(self):
        return unicode(self.acttype_dsc)

class PlannedActivity(models.Model):
    plannedact_id = models.AutoField(primary_key=True)
    plannedact_uuid = models.UUIDField(default=uuid.uuid4, verbose_name="Planned Activity", unique=True)
    acttype = models.ForeignKey(ActivityType, verbose_name="Activity Type", null=True, blank=True)
    planned_year = models.IntegerField(null=True, blank=True)
    planned_month = models.IntegerField(null=True, blank=True)
    completed_date = models.CharField(max_length=25, blank=True, null=True)
    description = models.TextField(max_length=255, blank=True)
    notes = models.TextField(max_length=255, blank=True)
    revenue = models.FloatField(null=True, blank=True)
    taskstatus = models.ForeignKey(TaskStatusType, verbose_name="Task Status", null=True, blank=True)
    stand_no = models.IntegerField(null=True, blank=True)
    landarea = models.ForeignKey(LandArea, verbose_name="Land Area", null=True, blank=True)
    created_by = models.ForeignKey(User)
    objects = models.GeoManager()
    class Meta:
        db_table = 'planned_activity'
        ordering = ["planned_year"]
        verbose_name_plural = "planned activities"