# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0025_auto_20151209_1508'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='standdescription',
            name='created_by',
        ),
        migrations.RemoveField(
            model_name='standdescription',
            name='forestagetype',
        ),
        migrations.RemoveField(
            model_name='standdescription',
            name='foresttype',
        ),
        migrations.RemoveField(
            model_name='standdescription',
            name='stockingtype',
        ),
        migrations.RemoveField(
            model_name='standstatus',
            name='stand',
        ),
        migrations.AddField(
            model_name='standstatus',
            name='stand_no',
            field=models.IntegerField(null=True, blank=True),
        ),
        migrations.AddField(
            model_name='standstatus',
            name='standarea',
            field=models.ForeignKey(default=1, to='geoapp.StandArea'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='standstatus',
            name='standstatus_uuid',
            field=models.UUIDField(default=uuid.uuid4, unique=True),
        ),
        migrations.DeleteModel(
            name='StandDescription',
        ),
    ]
