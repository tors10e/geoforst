# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0014_monthtype'),
    ]

    operations = [
        migrations.DeleteModel(
            name='MonthsType',
        ),
    ]
