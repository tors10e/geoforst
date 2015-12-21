# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0029_stream_created_by'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='forestinventorydata',
            name='created_by',
        ),
        migrations.RemoveField(
            model_name='forestinventorydata',
            name='dbh_unit',
        ),
        migrations.RemoveField(
            model_name='forestinventorydata',
            name='forestinventoryplot',
        ),
        migrations.RemoveField(
            model_name='forestinventorydata',
            name='height_unit',
        ),
        migrations.RemoveField(
            model_name='forestinventorydata',
            name='speciestreetype',
        ),
        migrations.RemoveField(
            model_name='forestinventorydata',
            name='tree',
        ),
        migrations.RemoveField(
            model_name='forestinventoryplot',
            name='created_by',
        ),
        migrations.RemoveField(
            model_name='forestinventoryplot',
            name='elevation_unit',
        ),
        migrations.RemoveField(
            model_name='forestinventoryplot',
            name='plot_area_unit',
        ),
        migrations.RemoveField(
            model_name='forestinventoryplot',
            name='plot_geometry',
        ),
        migrations.RemoveField(
            model_name='forestinventoryplot',
            name='plot_length_unit',
        ),
        migrations.RemoveField(
            model_name='forestinventoryplot',
            name='plot_radius_unit',
        ),
        migrations.DeleteModel(
            name='ForestInventoryData',
        ),
        migrations.DeleteModel(
            name='ForestInventoryPlot',
        ),
    ]
