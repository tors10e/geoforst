# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0007_auto_20151019_2023'),
    ]

    operations = [
        migrations.AddField(
            model_name='forestinventorydata',
            name='created_dt',
            field=models.DateField(default=2007, auto_now_add=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='forestinventorydata',
            name='last_modified',
            field=models.DateField(default=2007, auto_now=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='forestinventoryplot',
            name='created_dt',
            field=models.DateField(default=2007, auto_now_add=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='forestinventoryplot',
            name='last_modified',
            field=models.DateField(default=2007, auto_now=True),
            preserve_default=False,
        ),
    ]
