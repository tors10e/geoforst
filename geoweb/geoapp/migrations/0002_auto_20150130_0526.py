# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='scalingticket',
            name='fbm',
            field=models.DecimalField(null=True, verbose_name='Board Ft.', max_digits=6, decimal_places=2, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='scalingticket',
            name='price_mfbm',
            field=models.DecimalField(null=True, verbose_name='Price per Mfbm', max_digits=6, decimal_places=2, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='scalingticket',
            name='species',
            field=models.CharField(max_length=30, null=True, blank=True),
            preserve_default=True,
        ),
    ]
