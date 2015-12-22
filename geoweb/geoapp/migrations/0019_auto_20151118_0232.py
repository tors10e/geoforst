# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0018_auto_20151118_0151'),
    ]

    operations = [
        migrations.RenameField(
            model_name='monthtype',
            old_name='month_dsc',
            new_name='monthtype_dsc',
        ),
        migrations.RenameField(
            model_name='monthtype',
            old_name='month_id',
            new_name='monthtype_id',
        ),
        migrations.RenameField(
            model_name='seasontype',
            old_name='season_dsc',
            new_name='seasontype_dsc',
        ),
        migrations.RenameField(
            model_name='seasontype',
            old_name='season_id',
            new_name='seasontype_id',
        ),
    ]
