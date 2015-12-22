# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.contrib.gis.db.models.fields
from django.conf import settings
import django.core.validators
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0031_delete_plotgeometrytype'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='ForestInventoryData',
            fields=[
                ('forestinventorydata_id', models.AutoField(serialize=False, primary_key=True)),
                ('forestinventorydata_uuid', models.UUIDField(default=uuid.uuid4, unique=True)),
                ('collection_date', models.DateField(null=True, blank=True)),
                ('dbh', models.DecimalField(null=True, max_digits=4, decimal_places=1, blank=True)),
                ('height', models.IntegerField(null=True, blank=True)),
                ('age', models.IntegerField(blank=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'ordering': ['collection_date'],
                'db_table': 'forest_inventory_data',
            },
        ),
        migrations.CreateModel(
            name='ForestInventoryPlot',
            fields=[
                ('forestinventoryplot_id', models.AutoField(serialize=False, primary_key=True)),
                ('forestinventoryplot_uuid', models.UUIDField(default=uuid.uuid4, unique=True)),
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
        ),
        migrations.AddField(
            model_name='forestinventoryplot',
            name='plot_geometry',
            field=models.ForeignKey(to='forest_inventory.PlotGeometryType'),
        ),
        migrations.AddField(
            model_name='forestinventorydata',
            name='forestinventoryplot',
            field=models.ForeignKey(blank=True, to='forest_inventory.ForestInventoryPlot', null=True),
        ),
        migrations.AddField(
            model_name='forestinventorydata',
            name='speciestreetype',
            field=models.ForeignKey(to='geoapp.SpeciesTreeType'),
        ),
        migrations.AddField(
            model_name='forestinventorydata',
            name='tree',
            field=models.ForeignKey(blank=True, to='geoapp.Tree', null=True),
        ),
    ]
