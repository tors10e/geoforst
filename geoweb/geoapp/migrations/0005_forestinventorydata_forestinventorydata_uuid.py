# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0004_forestinventoryplot_forestinventoryplot_uuid'),
    ]

    operations = [
        migrations.AddField(
            model_name='forestinventorydata',
            name='forestinventorydata_uuid',
            field=models.UUIDField(default=uuid.uuid4, unique=True),
        ),
    ]
