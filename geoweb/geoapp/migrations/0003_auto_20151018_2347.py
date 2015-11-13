# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.contrib.gis.db.models.fields
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0002_plannedactivity_geometry'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='landowner',
            name='created_by',
        ),
        migrations.RemoveField(
            model_name='landowner',
            name='landarea',
        ),
        migrations.RemoveField(
            model_name='landowner',
            name='person',
        ),
        migrations.RenameField(
            model_name='activityarea',
            old_name='plannedact',
            new_name='plannedact_uuid',
        ),
        migrations.RemoveField(
            model_name='controlpoint',
            name='id',
        ),
        migrations.RemoveField(
            model_name='culturalpoint',
            name='id',
        ),
        migrations.RemoveField(
            model_name='firebreakline',
            name='id',
        ),
        migrations.RemoveField(
            model_name='landareahistory',
            name='id',
        ),
        migrations.AddField(
            model_name='activityarea',
            name='activityarea_uuid',
            field=models.UUIDField(default=uuid.uuid4, unique=True),
        ),
        migrations.AlterField(
            model_name='activityarea',
            name='activityarea_id',
            field=models.AutoField(serialize=False, primary_key=True),
        ),
        migrations.AlterField(
            model_name='activityarea',
            name='geometry',
            field=django.contrib.gis.db.models.fields.PolygonField(srid=2163, null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='burncompartment',
            name='burncompartment_id',
            field=models.AutoField(serialize=False, primary_key=True),
        ),
        migrations.AlterField(
            model_name='controlpoint',
            name='controlpt_id',
            field=models.AutoField(serialize=False, primary_key=True),
        ),
        migrations.AlterField(
            model_name='culturalpoint',
            name='cultpt_id',
            field=models.AutoField(serialize=False, primary_key=True),
        ),
        migrations.AlterField(
            model_name='firebreakline',
            name='fbkln_id',
            field=models.AutoField(serialize=False, primary_key=True),
        ),
        migrations.AlterField(
            model_name='habitatenhancementarea',
            name='habenharea_id',
            field=models.AutoField(serialize=False, primary_key=True),
        ),
        migrations.AlterField(
            model_name='habitatenhancementpoint',
            name='habenhpt_id',
            field=models.AutoField(serialize=False, primary_key=True),
        ),
        migrations.AlterField(
            model_name='landareahistory',
            name='landareahist_id',
            field=models.AutoField(serialize=False, primary_key=True),
        ),
        migrations.AlterField(
            model_name='person',
            name='person_id',
            field=models.AutoField(serialize=False, primary_key=True),
        ),
        migrations.AlterField(
            model_name='recreationpoint',
            name='recpt_id',
            field=models.AutoField(serialize=False, primary_key=True),
        ),
        migrations.AlterField(
            model_name='roadline',
            name='roadln_id',
            field=models.AutoField(serialize=False, primary_key=True),
        ),
        migrations.DeleteModel(
            name='LandOwner',
        ),
    ]
