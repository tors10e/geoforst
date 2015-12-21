# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0018_auto_20151118_0151'),
        ('forest_management', '0007_plannedactivity_planned_season'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='plannedactivity',
            name='planned_month',
        ),
        migrations.RemoveField(
            model_name='plannedactivity',
            name='planned_season',
        ),
        migrations.AddField(
            model_name='plannedactivity',
            name='monthtype',
            field=models.ForeignKey(verbose_name=b'Planned Month', blank=True, to='geoapp.MonthType', null=True),
        ),
        migrations.AddField(
            model_name='plannedactivity',
            name='seasontype',
            field=models.ForeignKey(blank=True, to='geoapp.SeasonType', help_text=b'Season work is to be started', null=True, verbose_name=b'Planned Season'),
        ),
        migrations.AlterField(
            model_name='plannedactivity',
            name='acttype',
            field=models.ForeignKey(blank=True, to='forest_management.ActivityType', help_text=b'Type of activity', null=True, verbose_name=b'Activity Type'),
        ),
        migrations.AlterField(
            model_name='plannedactivity',
            name='completed_date',
            field=models.CharField(help_text=b'Date work was completed', max_length=25, null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='plannedactivity',
            name='description',
            field=models.TextField(help_text=b'Description of task', max_length=255, blank=True),
        ),
        migrations.AlterField(
            model_name='plannedactivity',
            name='planned_year',
            field=models.IntegerField(blank=True, help_text=b'Year work is to be started', null=True, choices=[(2025, 2025), (2024, 2024), (2023, 2023), (2022, 2022), (2021, 2021), (2020, 2020), (2019, 2019), (2018, 2018), (2017, 2017), (2016, 2016), (2015, 2015), (2014, 2014), (2013, 2013), (2012, 2012), (2011, 2011), (2010, 2010), (2009, 2009), (2008, 2008), (2007, 2007), (2006, 2006)]),
        ),
    ]
