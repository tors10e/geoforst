# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0030_auto_20151209_1703'),
    ]

    operations = [
        migrations.DeleteModel(
            name='PlotGeometryType',
        ),
    ]
