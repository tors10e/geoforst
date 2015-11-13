# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0003_auto_20150130_0542'),
    ]

    operations = [
        migrations.AlterField(
            model_name='scalingticket',
            name='fbm',
            field=models.IntegerField(null=True, verbose_name='Board Ft.', blank=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='scalingticket',
            name='price_mfbm',
            field=models.DecimalField(null=True, verbose_name='Price/Mfbm', max_digits=6, decimal_places=2, blank=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='scalingticket',
            name='price_ton',
            field=models.DecimalField(null=True, verbose_name='Price/Ton', max_digits=6, decimal_places=2, blank=True),
            preserve_default=True,
        ),
    ]
