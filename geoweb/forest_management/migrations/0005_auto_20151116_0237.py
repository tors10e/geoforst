# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('forest_management', '0004_auto_20151112_0258'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='activityarea',
            name='plannedact_uuid',
        ),
        migrations.AlterField(
            model_name='plannedactivity',
            name='planned_year',
            field=models.IntegerField(blank=True, null=True, choices=[(2015, 2015), (2014, 2014), (2013, 2013), (2012, 2012), (2011, 2011)]),
        ),
        migrations.AlterField(
            model_name='plannedactivity',
            name='plannedact_uuid',
            field=models.UUIDField(default=uuid.uuid4, unique=True, verbose_name=b'Planned Activity'),
        ),
    ]
