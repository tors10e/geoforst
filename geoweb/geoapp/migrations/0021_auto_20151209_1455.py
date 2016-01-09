# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0020_auto_20151209_1444'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='logdata',
            name='created_by',
        ),
        migrations.RemoveField(
            model_name='logdata',
            name='diameter_unit',
        ),
        migrations.RemoveField(
            model_name='logdata',
            name='length_unit',
        ),
        migrations.RemoveField(
            model_name='logdata',
            name='lumberload',
        ),
        migrations.RemoveField(
            model_name='logdata',
            name='speciestreetype',
        ),
        migrations.RemoveField(
            model_name='lumberload',
            name='created_by',
        ),
        migrations.RemoveField(
            model_name='lumberload',
            name='scalingticket',
        ),
        migrations.RemoveField(
            model_name='sawmill',
            name='created_by',
        ),
        migrations.RemoveField(
            model_name='scalingticket',
            name='created_by',
        ),
        migrations.RemoveField(
            model_name='scalingticket',
            name='sawmill',
        ),
        migrations.RemoveField(
            model_name='firebreakline',
            name='created_by',
        ),
        migrations.DeleteModel(
            name='LogData',
        ),
        migrations.DeleteModel(
            name='LumberLoad',
        ),
        migrations.DeleteModel(
            name='Sawmill',
        ),
        migrations.DeleteModel(
            name='ScalingTicket',
        ),
    ]
