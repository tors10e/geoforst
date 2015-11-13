# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import datetime
from django.utils.timezone import utc
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0008_auto_20151019_2030'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='forestinventorydata',
            name='created_dt',
        ),
        migrations.RemoveField(
            model_name='forestinventorydata',
            name='last_modified',
        ),
        migrations.RemoveField(
            model_name='forestinventoryplot',
            name='created_dt',
        ),
        migrations.RemoveField(
            model_name='forestinventoryplot',
            name='last_modified',
        ),
        migrations.AddField(
            model_name='forestinventorydata',
            name='forestinventorydata_id',
            field=models.AutoField(default=datetime.datetime(2015, 10, 21, 1, 25, 4, 268855, tzinfo=utc), serialize=False, primary_key=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='forestinventoryplot',
            name='forestinventoryplot_id',
            field=models.AutoField(default=1, serialize=False, primary_key=True),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='forestinventorydata',
            name='forestinventorydata_uuid',
            field=models.UUIDField(default=uuid.uuid4, unique=True),
        ),
        migrations.AlterField(
            model_name='forestinventoryplot',
            name='forestinventoryplot_uuid',
            field=models.UUIDField(default=uuid.uuid4, unique=True),
        ),
    ]
