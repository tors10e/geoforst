# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('geoapp', '0028_remove_stream_created_by'),
    ]

    operations = [
        migrations.AddField(
            model_name='stream',
            name='created_by',
            field=models.ForeignKey(default=3, to=settings.AUTH_USER_MODEL),
            preserve_default=False,
        ),
    ]
