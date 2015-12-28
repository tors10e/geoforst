# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.contrib.gis.db.models.fields


class Migration(migrations.Migration):

    dependencies = [
        ('forest_inventory', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='forestinventoryplot',
            name='geometry',
            field=django.contrib.gis.db.models.fields.PointField(srid=4269, null=True, blank=True),
        ),
    ]
