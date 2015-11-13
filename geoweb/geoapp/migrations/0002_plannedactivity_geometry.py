# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.contrib.gis.db.models.fields


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0001_squashed_0004_auto_20150130_0550'),
    ]

    operations = [
        migrations.AddField(
            model_name='plannedactivity',
            name='geometry',
            field=django.contrib.gis.db.models.fields.MultiPolygonField(srid=2163, null=True, blank=True),
            preserve_default=True,
        ),
    ]
