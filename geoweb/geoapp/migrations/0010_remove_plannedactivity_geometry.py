# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0009_auto_20151020_1725'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='plannedactivity',
            name='geometry',
        ),
    ]
