# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('forest_management', '0002_auto_20151102_2111'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='plannedactivity',
            options={'ordering': ['planned_year'], 'verbose_name_plural': 'planned activities'},
        ),
        migrations.RemoveField(
            model_name='plannedactivity',
            name='planned_date',
        ),
    ]
