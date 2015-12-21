# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0016_seasontype'),
        ('forest_management', '0006_auto_20151116_0313'),
    ]

    operations = [
        migrations.AddField(
            model_name='plannedactivity',
            name='planned_season',
            field=models.ForeignKey(to_field=b'season_cd', blank=True, to='geoapp.SeasonType', null=True),
        ),
    ]
