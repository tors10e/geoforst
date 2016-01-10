# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('recreation', '0002_trail_created_by'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='trail',
            name='created_by',
        ),
        migrations.AlterModelTable(
            name='trail',
            table='trail',
        ),
    ]
