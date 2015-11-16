# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('forest_management', '0005_auto_20151116_0237'),
    ]

    operations = [
        migrations.AlterField(
            model_name='plannedactivity',
            name='planned_month',
            field=models.ForeignKey(blank=True, to='geoapp.MonthType', null=True),
        ),
    ]
