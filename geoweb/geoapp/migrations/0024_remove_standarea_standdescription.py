# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0023_auto_20151209_1459'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='standarea',
            name='standdescription',
        ),
    ]
