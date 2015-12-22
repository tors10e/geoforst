# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('forest_management', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='plannedactivity',
            name='planned_date',
            field=models.DateField(null=True, verbose_name=b'Planned date', blank=True),
        ),
    ]
