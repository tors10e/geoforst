# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('forest_management', '0010_auto_20160109_1810'),
        ('geoapp', '0034_remove_standarea_standarea_uuid_id'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='culturalpoint',
            name='created_by',
        ),
        migrations.RemoveField(
            model_name='culturalpoint',
            name='culttype',
        ),
        migrations.RemoveField(
            model_name='landarea',
            name='created_by',
        ),
        migrations.RemoveField(
            model_name='landareahistory',
            name='created_by',
        ),
        migrations.RemoveField(
            model_name='recreationpoint',
            name='created_by',
        ),
        migrations.RemoveField(
            model_name='recreationpoint',
            name='rectype',
        ),
        migrations.RemoveField(
            model_name='roadline',
            name='accessstatus',
        ),
        migrations.RemoveField(
            model_name='roadline',
            name='created_by',
        ),
        migrations.RemoveField(
            model_name='roadline',
            name='roadsurface',
        ),
        migrations.RemoveField(
            model_name='roadline',
            name='roadtype',
        ),
        migrations.DeleteModel(
            name='CulturalPoint',
        ),
        migrations.DeleteModel(
            name='CulturalType',
        ),
        migrations.DeleteModel(
            name='LandArea',
        ),
        migrations.DeleteModel(
            name='LandAreaHistory',
        ),
        migrations.DeleteModel(
            name='RecreationPoint',
        ),
        migrations.DeleteModel(
            name='RecreationType',
        ),
        migrations.DeleteModel(
            name='RoadAccessStatusType',
        ),
        migrations.DeleteModel(
            name='RoadLine',
        ),
        migrations.DeleteModel(
            name='RoadSurfaceType',
        ),
        migrations.DeleteModel(
            name='RoadType',
        ),
    ]
