# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('forest_management', '0003_auto_20151112_0201'),
    ]

    operations = [
        migrations.AddField(
            model_name='plannedactivity',
            name='plannedact_uuid',
            field=models.UUIDField(default=uuid.uuid4, unique=True),
        ),
        migrations.AlterField(
            model_name='activityarea',
            name='plannedact_uuid',
            field=models.ForeignKey(to_field=b'plannedact_uuid', blank=True, to='forest_management.PlannedActivity', null=True),
        ),
    ]
