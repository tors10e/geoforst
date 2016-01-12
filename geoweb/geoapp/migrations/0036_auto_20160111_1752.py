# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0035_auto_20160109_1810'),
    ]

    operations = [
        migrations.RenameField(
            model_name='standarea',
            old_name='standarea_uuid',
            new_name='standarea_uuid_id',
        ),
        migrations.AlterField(
            model_name='standstatus',
            name='standarea_uuid',
            field=models.ForeignKey(to='geoapp.StandArea', to_field='standarea_uuid_id'),
        ),
    ]
