# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0022_firebreakline_created_by'),
    ]

    operations = [
#         migrations.RemoveField(
#             model_name='person',
#             name='created_by',
#         ),
        migrations.DeleteModel(
            name='Person',
        ),
    ]
