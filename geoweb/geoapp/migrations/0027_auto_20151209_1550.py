# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0026_auto_20151209_1526'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='standstatus',
            name='standarea',
        ),
        migrations.AddField(
            model_name='standarea',
            name='standarea_uuid',
            field=models.UUIDField(default=uuid.uuid4, unique=True),
        ),
        migrations.AddField(
            model_name='standarea',
            name='standarea_uuid_id',
            field=models.UUIDField(default=uuid.uuid4, unique=True),
        ),
        migrations.AddField(
            model_name='standstatus',
            name='standarea_uuid',
            field=models.ForeignKey(to='geoapp.StandArea', default='asdfdas', to_field='standarea_uuid'),
            preserve_default=False,
        ),
    ]
