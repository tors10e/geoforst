# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0015_delete_monthstype'),
    ]

    operations = [
        migrations.CreateModel(
            name='SeasonType',
            fields=[
                ('season_id', models.IntegerField(serialize=False, primary_key=True)),
                ('season_cd', models.CharField(unique=True, max_length=4)),
                ('season_dsc', models.CharField(max_length=30)),
            ],
            options={
                'db_table': 'season_type',
            },
        ),
    ]
