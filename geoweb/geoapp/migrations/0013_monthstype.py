# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0012_auto_20151101_1600'),
    ]

    operations = [
        migrations.CreateModel(
            name='MonthsType',
            fields=[
                ('month_id', models.IntegerField(serialize=False, primary_key=True)),
                ('month_cd', models.CharField(max_length=3)),
                ('month_dsc', models.CharField(max_length=30)),
            ],
        ),
    ]
