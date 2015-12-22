# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0032_remove_standarea_standarea_uuid_id'),
    ]

    operations = [
        migrations.AddField(
            model_name='standarea',
            name='standarea_uuid_id',
            field=models.UUIDField(default=uuid.uuid4, unique=True),
        ),
    ]
