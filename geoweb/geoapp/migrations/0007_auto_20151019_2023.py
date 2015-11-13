# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0006_auto_20151019_1945'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='forestinventorydata',
            name='created_dt',
        ),
        migrations.RemoveField(
            model_name='forestinventorydata',
            name='last_modified',
        ),
        migrations.RemoveField(
            model_name='forestinventoryplot',
            name='created_dt',
        ),
        migrations.RemoveField(
            model_name='forestinventoryplot',
            name='last_modified',
        ),
    ]
