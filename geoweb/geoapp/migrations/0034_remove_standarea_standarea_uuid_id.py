# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0033_standarea_standarea_uuid_id'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='standarea',
            name='standarea_uuid_id',
        ),
    ]
