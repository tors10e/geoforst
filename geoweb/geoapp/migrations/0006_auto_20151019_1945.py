# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0005_forestinventorydata_forestinventorydata_uuid'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='forestinventorydata',
            options={'ordering': ['collection_date']},
        ),
        migrations.RemoveField(
            model_name='forestinventorydata',
            name='forestinventorydata_id',
        ),
        migrations.RemoveField(
            model_name='forestinventoryplot',
            name='forestinventoryplot_id',
        ),
        migrations.AddField(
            model_name='forestinventorydata',
            name='created_dt',
            field=models.DateField(default='2009-01-01', auto_now_add=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='forestinventorydata',
            name='last_modified',
            field=models.DateField(default='2009-01-01', auto_now=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='forestinventoryplot',
            name='created_dt',
            field=models.DateField(default='2009-01-01', auto_now_add=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='forestinventoryplot',
            name='last_modified',
            field=models.DateField(default='2009-01-01', auto_now=True),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='forestinventorydata',
            name='forestinventorydata_uuid',
            field=models.UUIDField(default=uuid.uuid4, serialize=False, primary_key=True),
        ),
        migrations.AlterField(
            model_name='forestinventoryplot',
            name='forestinventoryplot_uuid',
            field=models.UUIDField(default=uuid.uuid4, serialize=False, primary_key=True),
        ),
    ]
