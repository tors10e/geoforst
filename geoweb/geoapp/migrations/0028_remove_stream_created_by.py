# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0027_auto_20151209_1550'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='stream',
            name='created_by',
        ),
    ]
