# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0011_auto_20151029_2217'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='activityarea',
            name='acttype',
        ),
        migrations.RemoveField(
            model_name='activityarea',
            name='created_by',
        ),
        migrations.RemoveField(
            model_name='activityarea',
            name='plannedact_uuid',
        ),
        migrations.RemoveField(
            model_name='plannedactivity',
            name='acttype',
        ),
        migrations.RemoveField(
            model_name='plannedactivity',
            name='created_by',
        ),
        migrations.RemoveField(
            model_name='plannedactivity',
            name='landarea',
        ),
        migrations.RemoveField(
            model_name='plannedactivity',
            name='taskstatus',
        ),
        migrations.DeleteModel(
            name='ActivityArea',
        ),
        migrations.DeleteModel(
            name='ActivityType',
        ),
        migrations.DeleteModel(
            name='PlannedActivity',
        ),
    ]
