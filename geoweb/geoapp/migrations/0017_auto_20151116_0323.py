# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0016_seasontype'),
    ]

    operations = [
        migrations.AlterField(
            model_name='seasontype',
            name='season_cd',
            field=models.CharField(unique=True, max_length=6),
        ),
        migrations.AlterField(
            model_name='seasontype',
            name='season_dsc',
            field=models.CharField(max_length=6),
        ),
    ]
