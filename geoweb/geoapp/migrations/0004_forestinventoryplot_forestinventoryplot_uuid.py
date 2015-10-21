# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0003_auto_20151018_2347'),
    ]

    operations = [
        migrations.AddField(
            model_name='forestinventoryplot',
            name='forestinventoryplot_uuid',
            field=models.UUIDField(default=uuid.uuid4, unique=True),
        ),
    ]
