# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0010_remove_plannedactivity_geometry'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='plannedactivity',
            options={'ordering': ['planned_date'], 'verbose_name_plural': 'planned activities'},
        ),
        migrations.AddField(
            model_name='plannedactivity',
            name='planned_month',
            field=models.IntegerField(null=True, blank=True),
        ),
        migrations.AddField(
            model_name='plannedactivity',
            name='planned_year',
            field=models.IntegerField(null=True, blank=True),
        ),
    ]
