# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0002_auto_20150130_0526'),
    ]

    operations = [
        migrations.AddField(
            model_name='scalingticket',
            name='price_ton',
            field=models.DecimalField(null=True, verbose_name='Price per Ton', max_digits=6, decimal_places=2, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='scalingticket',
            name='revenue',
            field=models.DecimalField(null=True, max_digits=6, decimal_places=2, blank=True),
            preserve_default=True,
        ),
    ]
