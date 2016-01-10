# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
from django.conf import settings
import django.contrib.gis.db.models.fields


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
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
        ),
        migrations.CreateModel(
            name='RoadLine',
            fields=[
                ('roadln_id', models.AutoField(serialize=False, primary_key=True)),
                ('geometry', django.contrib.gis.db.models.fields.MultiLineStringField(srid=2163, null=True, blank=True)),
                ('description', models.CharField(max_length=255, blank=True)),
                ('road_name', models.CharField(max_length=25, blank=True)),
                ('accessstatus', models.ForeignKey(blank=True, to='infrastructure.RoadAccessStatusType', null=True)),
                ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'road_line',
            },
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
        ),
        migrations.AddField(
            model_name='roadline',
            name='roadsurface',
            field=models.ForeignKey(blank=True, to='infrastructure.RoadSurfaceType', null=True),
        ),
        migrations.AddField(
            model_name='roadline',
            name='roadtype',
            field=models.ForeignKey(blank=True, to='infrastructure.RoadType', null=True),
        ),
    ]
