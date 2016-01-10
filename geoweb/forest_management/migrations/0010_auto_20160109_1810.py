# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
from django.conf import settings
import django.contrib.gis.db.models.fields


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('forest_management', '0009_remove_activityarea_plannedact_uuid'),
    ]

    operations = [
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
        ),
        migrations.AlterField(
            model_name='plannedactivity',
            name='landarea',
            field=models.ForeignKey(verbose_name=b'Land Area', blank=True, to='forest_management.LandArea', null=True),
        ),
        migrations.AlterField(
            model_name='plannedactivity',
            name='planned_year',
            field=models.IntegerField(blank=True, help_text=b'Year work is to be started', null=True, choices=[(2026, 2026), (2025, 2025), (2024, 2024), (2023, 2023), (2022, 2022), (2021, 2021), (2020, 2020), (2019, 2019), (2018, 2018), (2017, 2017), (2016, 2016), (2015, 2015), (2014, 2014), (2013, 2013), (2012, 2012), (2011, 2011), (2010, 2010), (2009, 2009), (2008, 2008), (2007, 2007)]),
        ),
    ]
