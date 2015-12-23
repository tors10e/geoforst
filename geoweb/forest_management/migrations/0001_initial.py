# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.contrib.gis.db.models.fields
from django.conf import settings
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0012_auto_20151101_1600'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='ActivityArea',
            fields=[
                ('activityarea_id', models.AutoField(serialize=False, primary_key=True)),
                ('activityarea_uuid', models.UUIDField(default=uuid.uuid4, unique=True)),
                ('geometry', django.contrib.gis.db.models.fields.PolygonField(srid=2163, null=True, blank=True)),
                ('activity_date', models.DateField(blank=True)),
                ('description', models.CharField(max_length=255, blank=True)),
                ('revenue', models.DecimalField(max_digits=8, decimal_places=2, blank=True)),
            ],
            options={
                'db_table': 'activity_area',
            },
        ),
        migrations.CreateModel(
            name='ActivityType',
            fields=[
                ('acttype_id', models.IntegerField(serialize=False, primary_key=True)),
                ('acttype_cd', models.CharField(max_length=3, blank=True)),
                ('acttype_dsc', models.CharField(max_length=50, blank=True)),
            ],
            options={
                'db_table': 'activity_type',
            },
        ),
        migrations.CreateModel(
            name='PlannedActivity',
            fields=[
                ('plannedact_id', models.AutoField(serialize=False, primary_key=True)),
                ('planned_date', models.DecimalField(null=True, verbose_name=b'Planned date', max_digits=4, decimal_places=0, blank=True)),
                ('planned_year', models.IntegerField(null=True, blank=True)),
                ('planned_month', models.IntegerField(null=True, blank=True)),
                ('completed_date', models.CharField(max_length=25, null=True, blank=True)),
                ('description', models.TextField(max_length=255, blank=True)),
                ('notes', models.TextField(max_length=255, blank=True)),
                ('revenue', models.FloatField(null=True, blank=True)),
                ('stand_no', models.IntegerField(null=True, blank=True)),
                ('acttype', models.ForeignKey(verbose_name=b'Activity Type', blank=True, to='forest_management.ActivityType', null=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
                ('landarea', models.ForeignKey(verbose_name=b'Land Area', blank=True, to='geoapp.LandArea', null=True)),
                ('taskstatus', models.ForeignKey(verbose_name=b'Task Status', blank=True, to='geoapp.TaskStatusType', null=True)),
            ],
            options={
                'ordering': ['planned_date'],
                'db_table': 'planned_activity',
                'verbose_name_plural': 'planned activities',
            },
        ),
        migrations.AddField(
            model_name='activityarea',
            name='acttype',
            field=models.ForeignKey(blank=True, to='forest_management.ActivityType', null=True),
        ),
        migrations.AddField(
            model_name='activityarea',
            name='created_by',
            field=models.ForeignKey(to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='activityarea',
            name='plannedact_uuid',
            field=models.ForeignKey(blank=True, to='forest_management.PlannedActivity', null=True),
        ),
    ]
