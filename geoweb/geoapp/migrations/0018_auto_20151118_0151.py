# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0017_auto_20151116_0323'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='monthtype',
            name='month_cd',
        ),
        migrations.RemoveField(
            model_name='seasontype',
            name='season_cd',
        ),
    ]
