# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('recreation', '0003_auto_20160109_2023'),
    ]

    operations = [
        migrations.AddField(
            model_name='trail',
            name='created_by',
            field=models.ForeignKey(default=3, to=settings.AUTH_USER_MODEL),
            preserve_default=False,
        ),
    ]
