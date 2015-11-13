# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.contrib.gis.db.models.fields
from django.conf import settings
import django.core.validators


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='ActivityArea',
            fields=[
                ('activityarea_id', models.IntegerField(serialize=False, primary_key=True)),
                ('geometry', django.contrib.gis.db.models.fields.MultiPolygonField(srid=2163, null=True, blank=True)),
                ('activity_date', models.DateField(blank=True)),
                ('description', models.CharField(max_length=255, blank=True)),
                ('revenue', models.DecimalField(max_digits=8, decimal_places=2, blank=True)),
            ],
            options={
                'db_table': 'activity_area',
            },
            bases=(models.Model,),
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
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='BurnCompartment',
            fields=[
                ('burncompartment_id', models.IntegerField(serialize=False, primary_key=True)),
                ('geometry', models.TextField(blank=True)),
                ('compartment_set', models.IntegerField(null=True, blank=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'burn_compartment',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='ControlPoint',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('controlpt_id', models.IntegerField()),
                ('geometry', django.contrib.gis.db.models.fields.PointField(srid=2163, null=True, blank=True)),
                ('description', models.CharField(max_length=255, blank=True)),
                ('x', models.FloatField(null=True, blank=True)),
                ('y', models.FloatField(null=True, blank=True)),
                ('status', models.CharField(max_length=25, blank=True)),
            ],
            options={
                'db_table': 'control_point',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='CulturalPoint',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('cultpt_id', models.IntegerField()),
                ('geometry', django.contrib.gis.db.models.fields.PointField(srid=2163, null=True, blank=True)),
                ('description', models.CharField(max_length=255, blank=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'cultural_point',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='CulturalType',
            fields=[
                ('culttype_id', models.IntegerField(serialize=False, primary_key=True)),
                ('culttype_cd', models.CharField(max_length=3, blank=True)),
                ('culttype_dsc', models.CharField(max_length=50, blank=True)),
            ],
            options={
                'db_table': 'cultural_type',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='FirebreakLine',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('fbkln_id', models.IntegerField()),
                ('geometry', django.contrib.gis.db.models.fields.LineStringField(srid=2163, null=True, blank=True)),
                ('description', models.CharField(max_length=255, blank=True)),
                ('length_meters', models.FloatField(null=True, blank=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'firebreak_line',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='ForestAgeType',
            fields=[
                ('forestagetype_id', models.IntegerField(serialize=False, primary_key=True)),
                ('forestagetype_cd', models.CharField(max_length=3, blank=True)),
                ('forestagetype_dsc', models.CharField(max_length=30, blank=True)),
            ],
            options={
                'db_table': 'forest_age_type',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='ForestInventoryData',
            fields=[
                ('forestinventorydata_id', models.AutoField(serialize=False, primary_key=True)),
                ('collection_date', models.DateField(null=True, blank=True)),
                ('dbh', models.DecimalField(null=True, max_digits=4, decimal_places=1, blank=True)),
                ('height', models.IntegerField(null=True, blank=True)),
                ('age', models.IntegerField(blank=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'ordering': ['forestinventorydata_id'],
                'db_table': 'forest_inventory_data',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='ForestInventoryPlot',
            fields=[
                ('forestinventoryplot_id', models.AutoField(serialize=False, primary_key=True)),
                ('plot_number', models.IntegerField(unique=True, validators=[django.core.validators.MinValueValidator(1)])),
                ('plot_area', models.DecimalField(null=True, max_digits=5, decimal_places=1, blank=True)),
                ('plot_radius', models.IntegerField(null=True, blank=True)),
                ('plot_xlength', models.IntegerField(null=True, blank=True)),
                ('plot_ylength', models.IntegerField(null=True, blank=True)),
                ('geometry', django.contrib.gis.db.models.fields.PointField(srid=2163, null=True, blank=True)),
                ('latitude', models.FloatField(verbose_name='Latitude')),
                ('longitude', models.FloatField(verbose_name='Longitude')),
                ('elevation', models.IntegerField(null=True, blank=True)),
                ('position_description', models.CharField(max_length=255, null=True, blank=True)),
                ('plot_create_date', models.DateField(null=True, blank=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'ordering': ['plot_number'],
                'db_table': 'forest_inventory_plot',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='ForestType',
            fields=[
                ('foresttype_id', models.IntegerField(serialize=False, primary_key=True)),
                ('foresttype_cd', models.CharField(max_length=3, blank=True)),
                ('foresttype_dsc', models.CharField(max_length=50, blank=True)),
            ],
            options={
                'db_table': 'forest_type',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='HabitatEnhancementArea',
            fields=[
                ('habenharea_id', models.IntegerField(serialize=False, primary_key=True)),
                ('geometry', django.contrib.gis.db.models.fields.PolygonField(srid=2163, null=True, blank=True)),
                ('description', models.CharField(max_length=255, blank=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'habitat_enhancement_area',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='HabitatEnhancementPoint',
            fields=[
                ('habenhpt_id', models.IntegerField(serialize=False, primary_key=True)),
                ('geometry', django.contrib.gis.db.models.fields.PointField(srid=2163, null=True, blank=True)),
                ('description', models.CharField(max_length=255, blank=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'habitat_enhancement_point',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='HabitatEnhancementType',
            fields=[
                ('habenhtype_id', models.IntegerField(serialize=False, primary_key=True)),
                ('habenhtype_cd', models.CharField(max_length=3, blank=True)),
                ('habenhtype_dsc', models.CharField(max_length=50, blank=True)),
            ],
            options={
                'db_table': 'habitat_enhancement_type',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='HarvestType',
            fields=[
                ('harvesttype_id', models.IntegerField(serialize=False, primary_key=True)),
                ('harvesttype_cd', models.CharField(max_length=3, blank=True)),
                ('harvesttype_dsc', models.CharField(max_length=50, blank=True)),
            ],
            options={
                'db_table': 'harvest_type',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='LandArea',
            fields=[
                ('landarea_id', models.AutoField(serialize=False, primary_key=True)),
                ('name', models.CharField(max_length=30, null=True, blank=True)),
                ('geometry', django.contrib.gis.db.models.fields.PolygonField(srid=2163, null=True, blank=True)),
                ('description', models.CharField(max_length=255, blank=True)),
                ('start_date', models.DateField(null=True, blank=True)),
                ('transaction_start_date', models.DateField(null=True, blank=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'land_area',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='LandAreaHistory',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('landareahist_id', models.IntegerField()),
                ('landarea_id', models.IntegerField(null=True, blank=True)),
                ('geometry', django.contrib.gis.db.models.fields.PolygonField(srid=2163, null=True, blank=True)),
                ('description', models.CharField(max_length=255, blank=True)),
                ('start_date', models.DateField(null=True, blank=True)),
                ('end_date', models.DateField(null=True, blank=True)),
                ('transaction_start_date', models.DateField(null=True, blank=True)),
                ('transaction_end_date', models.DateField(null=True, blank=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'land_area_history',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='LandOwner',
            fields=[
                ('landowner_id', models.IntegerField(serialize=False, primary_key=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
                ('landarea', models.ForeignKey(blank=True, to='geoapp.LandArea', null=True)),
            ],
            options={
                'db_table': 'land_owner',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='LogData',
            fields=[
                ('logdata_id', models.AutoField(serialize=False, primary_key=True)),
                ('butt_diameter', models.DecimalField(null=True, max_digits=4, decimal_places=1, blank=True)),
                ('log_length', models.DecimalField(null=True, max_digits=3, decimal_places=1, blank=True)),
                ('recorded_date', models.DateField(null=True, blank=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'ordering': ['logdata_id'],
                'db_table': 'log_data',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='LumberLoad',
            fields=[
                ('lumberload_id', models.AutoField(serialize=False, primary_key=True)),
                ('load_date', models.DateField(blank=True)),
                ('load_comments', models.CharField(max_length=255, blank=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'ordering': ['lumberload_id'],
                'db_table': 'lumber_load',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Person',
            fields=[
                ('person_id', models.IntegerField(serialize=False, primary_key=True)),
                ('name_last', models.CharField(max_length=30)),
                ('name_first', models.CharField(max_length=30)),
                ('address', models.CharField(max_length=50, blank=True)),
                ('address_ext', models.CharField(max_length=50, blank=True)),
                ('city', models.CharField(max_length=30, blank=True)),
                ('state', models.CharField(max_length=2, blank=True)),
                ('zip_code', models.DecimalField(null=True, max_digits=5, decimal_places=0, blank=True)),
                ('phone', models.CharField(max_length=12, blank=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'person',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='PlannedActivity',
            fields=[
                ('plannedact_id', models.AutoField(serialize=False, primary_key=True)),
                ('planned_date', models.DecimalField(null=True, max_digits=4, decimal_places=0, blank=True)),
                ('completed_date', models.CharField(max_length=25, null=True, blank=True)),
                ('description', models.TextField(max_length=255, blank=True)),
                ('notes', models.TextField(max_length=255, blank=True)),
                ('revenue', models.FloatField(null=True, blank=True)),
                ('stand_no', models.IntegerField(null=True, blank=True)),
                ('acttype', models.ForeignKey(verbose_name='Activity Type', blank=True, to='geoapp.ActivityType', null=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
                ('landarea', models.ForeignKey(verbose_name='Land Area', blank=True, to='geoapp.LandArea', null=True)),
            ],
            options={
                'ordering': ['-planned_date'],
                'db_table': 'planned_activity',
                'verbose_name_plural': 'planned activities',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='PlotGeometryType',
            fields=[
                ('plotgeomtype_id', models.IntegerField(serialize=False, primary_key=True)),
                ('plotgeomtype_cd', models.CharField(max_length=3)),
                ('plotgeomtype_dsc', models.CharField(max_length=50)),
            ],
            options={
                'db_table': 'plot_geometry_type',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='RecreationPoint',
            fields=[
                ('recpt_id', models.IntegerField(serialize=False, primary_key=True)),
                ('geometry', django.contrib.gis.db.models.fields.PointField(srid=2163, null=True, blank=True)),
                ('description', models.CharField(max_length=255, blank=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'recreation_point',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='RecreationType',
            fields=[
                ('rectype_id', models.IntegerField(serialize=False, primary_key=True)),
                ('rectype_cd', models.CharField(max_length=3, blank=True)),
                ('rectype_dsc', models.CharField(max_length=50, blank=True)),
            ],
            options={
                'db_table': 'recreation_type',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='RoadAccessStatusType',
            fields=[
                ('accessstatus_id', models.IntegerField(serialize=False, primary_key=True)),
                ('accessstatus_cd', models.CharField(max_length=3, blank=True)),
                ('accessstatus_dsc', models.CharField(max_length=30, blank=True)),
            ],
            options={
                'db_table': 'road_access_status_type',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='RoadLine',
            fields=[
                ('roadln_id', models.IntegerField(serialize=False, primary_key=True)),
                ('geometry', django.contrib.gis.db.models.fields.MultiLineStringField(srid=2163, null=True, blank=True)),
                ('description', models.CharField(max_length=255, blank=True)),
                ('road_name', models.CharField(max_length=25, blank=True)),
                ('accessstatus', models.ForeignKey(blank=True, to='geoapp.RoadAccessStatusType', null=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'road_line',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='RoadSurfaceType',
            fields=[
                ('roadsurface_id', models.IntegerField(serialize=False, primary_key=True)),
                ('roadsurface_cd', models.CharField(max_length=3, blank=True)),
                ('roadsurface_dsc', models.CharField(max_length=30, blank=True)),
            ],
            options={
                'db_table': 'road_surface_type',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='RoadType',
            fields=[
                ('roadtype_id', models.IntegerField(serialize=False, primary_key=True)),
                ('roadtype_cd', models.CharField(max_length=3, blank=True)),
                ('roadtype_dsc', models.CharField(max_length=50, blank=True)),
            ],
            options={
                'db_table': 'road_type',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Sawmill',
            fields=[
                ('sawmill_id', models.AutoField(serialize=False, primary_key=True)),
                ('name', models.CharField(unique=True, max_length=30, blank=True)),
                ('address', models.CharField(max_length=100, blank=True)),
                ('city', models.CharField(max_length=30, blank=True)),
                ('state', models.CharField(max_length=2, blank=True)),
                ('zip', models.DecimalField(null=True, max_digits=5, decimal_places=0, blank=True)),
                ('phone', models.CharField(max_length=20, blank=True)),
                ('email', models.CharField(max_length=100, blank=True)),
                ('website', models.CharField(max_length=255, blank=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'ordering': ['name'],
                'db_table': 'sawmill',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='ScalingTicket',
            fields=[
                ('scalingticket_id', models.AutoField(serialize=False, primary_key=True)),
                ('weight', models.DecimalField(null=True, max_digits=12, decimal_places=2, blank=True)),
                ('ticket_date', models.DateField(blank=True)),
                ('created_date', models.DateField(null=True, blank=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
                ('sawmill', models.ForeignKey(blank=True, to='geoapp.Sawmill', null=True)),
            ],
            options={
                'db_table': 'scaling_ticket',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='SeverityType',
            fields=[
                ('severity_id', models.IntegerField(serialize=False, primary_key=True)),
                ('severity_cd', models.CharField(max_length=3, blank=True)),
                ('severity_dsc', models.CharField(max_length=30, blank=True)),
            ],
            options={
                'db_table': 'severity_type',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='SpeciesTreeType',
            fields=[
                ('speciestreetype_id', models.IntegerField(serialize=False, primary_key=True)),
                ('speciestreetype_cd', models.CharField(max_length=3)),
                ('speciestreetype_dsc', models.CharField(max_length=50)),
                ('speciestreetype_bn', models.CharField(max_length=50)),
            ],
            options={
                'ordering': ['speciestreetype_dsc'],
                'db_table': 'species_tree_type',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='StandArea',
            fields=[
                ('standarea_id', models.AutoField(serialize=False, primary_key=True)),
                ('geometry', django.contrib.gis.db.models.fields.PolygonField(srid=2163, null=True, blank=True)),
                ('stand_no', models.IntegerField(null=True, blank=True)),
                ('description', models.CharField(max_length=255, blank=True)),
                ('start_date', models.DateTimeField(null=True, blank=True)),
                ('transaction_start_date', models.DateTimeField(null=True, blank=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
                ('foresttype', models.ForeignKey(blank=True, to='geoapp.ForestType', null=True)),
            ],
            options={
                'db_table': 'stand_area',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='StandAreaHistory',
            fields=[
                ('standareahist_id', models.AutoField(serialize=False, primary_key=True)),
                ('standarea_id', models.IntegerField(null=True, blank=True)),
                ('geometry', django.contrib.gis.db.models.fields.PolygonField(srid=2163, null=True, blank=True)),
                ('stand_no', models.IntegerField(null=True, blank=True)),
                ('description', models.CharField(max_length=255, blank=True)),
                ('end_date', models.DateTimeField(null=True, blank=True)),
                ('start_date', models.DateTimeField(null=True, blank=True)),
                ('foresttype_id', models.IntegerField(null=True, blank=True)),
                ('transaction_start_date', models.DateTimeField(null=True, blank=True)),
                ('transaction_end_date', models.DateTimeField(null=True, blank=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'stand_area_history',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='StandDescription',
            fields=[
                ('standdescription_id', models.AutoField(serialize=False, primary_key=True)),
                ('stand_description', models.CharField(max_length=255, blank=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
                ('forestagetype', models.ForeignKey(blank=True, to='geoapp.ForestAgeType', null=True)),
                ('foresttype', models.ForeignKey(blank=True, to='geoapp.ForestType', null=True)),
            ],
            options={
                'db_table': 'stand_description',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='StandStatus',
            fields=[
                ('standstatus_id', models.AutoField(serialize=False, primary_key=True)),
                ('year', models.DecimalField(null=True, max_digits=4, decimal_places=0, blank=True)),
                ('recommended_treatment', models.CharField(max_length=255, blank=True)),
                ('notes', models.CharField(max_length=255, blank=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
                ('damage_severity', models.ForeignKey(db_column='damage_severity', blank=True, to='geoapp.SeverityType', null=True)),
                ('stand', models.ForeignKey(blank=True, to='geoapp.StandDescription', null=True)),
            ],
            options={
                'db_table': 'stand_status',
                'verbose_name_plural': 'stand_statuses',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='StandType',
            fields=[
                ('standtype_id', models.IntegerField(serialize=False, primary_key=True)),
                ('standtype_cd', models.CharField(max_length=3, blank=True)),
                ('standtype_dsc', models.CharField(max_length=50, blank=True)),
            ],
            options={
                'db_table': 'stand_type',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='StockingType',
            fields=[
                ('stockingtype_id', models.IntegerField(serialize=False, primary_key=True)),
                ('stockingtype_cd', models.CharField(max_length=3, blank=True)),
                ('stockingtype_dsc', models.CharField(max_length=50)),
            ],
            options={
                'db_table': 'stocking_type',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Stream',
            fields=[
                ('stream_id', models.AutoField(serialize=False, primary_key=True)),
                ('geometry', django.contrib.gis.db.models.fields.LineStringField(srid=2163, null=True, blank=True)),
                ('shape_leng', models.CharField(max_length=25, blank=True)),
                ('stream_type', models.CharField(max_length=25, blank=True)),
                ('stream_name', models.CharField(max_length=25, blank=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'stream',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='StreamsideManagementZone',
            fields=[
                ('smz_id', models.AutoField(serialize=False, primary_key=True)),
                ('geometry', django.contrib.gis.db.models.fields.MultiPolygonField(srid=2163, null=True, blank=True)),
                ('shape_leng', models.FloatField(null=True, blank=True)),
                ('et_id', models.CharField(max_length=255, blank=True)),
                ('shape_area', models.FloatField(null=True, blank=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'streamside_management_zone',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='TaskStatusType',
            fields=[
                ('taskstatus_id', models.AutoField(serialize=False, primary_key=True)),
                ('status_code', models.CharField(max_length=3, blank=True)),
                ('status_dsc', models.CharField(max_length=30, blank=True)),
            ],
            options={
                'db_table': 'task_status_type',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Tree',
            fields=[
                ('tree_id', models.AutoField(serialize=False, primary_key=True)),
                ('geometry', django.contrib.gis.db.models.fields.PointField(srid=2163, null=True, blank=True)),
                ('start_year', models.CharField(max_length=4, blank=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
                ('speciestreetype', models.ForeignKey(blank=True, to='geoapp.SpeciesTreeType', max_length=50)),
            ],
            options={
                'db_table': 'tree',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='UnitAreaType',
            fields=[
                ('unitareatype_id', models.IntegerField(serialize=False, primary_key=True)),
                ('unitareatype_cd', models.CharField(max_length=3)),
                ('unitareatype_dsc', models.CharField(max_length=50)),
            ],
            options={
                'db_table': 'unit_area_type',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='UnitLengthType',
            fields=[
                ('unitlengthtype_id', models.IntegerField(serialize=False, primary_key=True)),
                ('unitlengthtype_cd', models.CharField(max_length=3)),
                ('unitlengthtype_dsc', models.CharField(max_length=50)),
            ],
            options={
                'db_table': 'unit_length_type',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='UserUpload',
            fields=[
                ('userupload_id', models.AutoField(serialize=False, primary_key=True)),
                ('file', models.FileField(upload_to='user_data')),
                ('description', models.CharField(max_length=255, null=True)),
                ('create_date', models.DateField(null=True, blank=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'user_upload',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='WaterPoint',
            fields=[
                ('waterpoint_id', models.AutoField(serialize=False, primary_key=True)),
                ('geometry', django.contrib.gis.db.models.fields.PointField(srid=2163, null=True, blank=True)),
                ('description', models.CharField(max_length=255, blank=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'water_point',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='WaterType',
            fields=[
                ('watertype_id', models.IntegerField(serialize=False, primary_key=True)),
                ('watertype_cd', models.CharField(max_length=3, blank=True)),
                ('watertype_dsc', models.CharField(max_length=50, blank=True)),
            ],
            options={
                'db_table': 'water_type',
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='waterpoint',
            name='watertype',
            field=models.ForeignKey(blank=True, to='geoapp.WaterType', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='standdescription',
            name='stockingtype',
            field=models.ForeignKey(blank=True, to='geoapp.StockingType', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='standarea',
            name='standdescription',
            field=models.ForeignKey(blank=True, to='geoapp.StandDescription', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='roadline',
            name='roadsurface',
            field=models.ForeignKey(blank=True, to='geoapp.RoadSurfaceType', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='roadline',
            name='roadtype',
            field=models.ForeignKey(blank=True, to='geoapp.RoadType', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='recreationpoint',
            name='rectype',
            field=models.ForeignKey(blank=True, to='geoapp.RecreationType', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='plannedactivity',
            name='taskstatus',
            field=models.ForeignKey(verbose_name='Task Status', blank=True, to='geoapp.TaskStatusType', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='lumberload',
            name='scalingticket',
            field=models.ForeignKey(blank=True, to='geoapp.ScalingTicket', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='logdata',
            name='diameter_unit',
            field=models.ForeignKey(related_name='diameter_unit', to='geoapp.UnitLengthType', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='logdata',
            name='length_unit',
            field=models.ForeignKey(related_name='length_unit', to='geoapp.UnitLengthType', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='logdata',
            name='lumberload',
            field=models.ForeignKey(blank=True, to='geoapp.LumberLoad', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='logdata',
            name='speciestreetype',
            field=models.ForeignKey(blank=True, to='geoapp.SpeciesTreeType', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='landowner',
            name='person',
            field=models.ForeignKey(blank=True, to='geoapp.Person', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='habitatenhancementpoint',
            name='habenhtype',
            field=models.ForeignKey(blank=True, to='geoapp.HabitatEnhancementType', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='habitatenhancementarea',
            name='habenhtype',
            field=models.ForeignKey(blank=True, to='geoapp.HabitatEnhancementType', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='forestinventoryplot',
            name='elevation_unit',
            field=models.ForeignKey(related_name='elevation_unit', blank=True, to='geoapp.UnitLengthType', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='forestinventoryplot',
            name='plot_area_unit',
            field=models.ForeignKey(to='geoapp.UnitAreaType', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='forestinventoryplot',
            name='plot_geometry',
            field=models.ForeignKey(to='geoapp.PlotGeometryType'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='forestinventoryplot',
            name='plot_length_unit',
            field=models.ForeignKey(related_name='plot_length_unit', blank=True, to='geoapp.UnitLengthType', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='forestinventoryplot',
            name='plot_radius_unit',
            field=models.ForeignKey(blank=True, to='geoapp.UnitLengthType', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='forestinventorydata',
            name='dbh_unit',
            field=models.ForeignKey(related_name='dbh_unit', to='geoapp.UnitLengthType', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='forestinventorydata',
            name='forestinventoryplot',
            field=models.ForeignKey(blank=True, to='geoapp.ForestInventoryPlot', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='forestinventorydata',
            name='height_unit',
            field=models.ForeignKey(related_name='height_unit', blank=True, to='geoapp.UnitLengthType', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='forestinventorydata',
            name='speciestreetype',
            field=models.ForeignKey(to='geoapp.SpeciesTreeType'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='forestinventorydata',
            name='tree',
            field=models.ForeignKey(blank=True, to='geoapp.Tree', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='culturalpoint',
            name='culttype',
            field=models.ForeignKey(blank=True, to='geoapp.CulturalType', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='activityarea',
            name='acttype',
            field=models.ForeignKey(blank=True, to='geoapp.ActivityType', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='activityarea',
            name='created_by',
            field=models.ForeignKey(to=settings.AUTH_USER_MODEL),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='activityarea',
            name='plannedact',
            field=models.ForeignKey(blank=True, to='geoapp.PlannedActivity', null=True),
            preserve_default=True,
        ),
    ]
