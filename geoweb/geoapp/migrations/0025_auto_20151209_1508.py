# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0024_remove_standarea_standdescription'),
    ]

    operations = [
        migrations.AlterField(
            model_name='standareahistory',
            name='created_by',
            field=models.IntegerField(null=True, blank=True),
        ),
    ]
