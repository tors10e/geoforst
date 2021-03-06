# -*- coding: utf-8 -*-
# Generated by Django 1.9.1 on 2016-01-14 22:16
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('recreation', '0004_trail_created_by'),
    ]

    operations = [
        migrations.AlterField(
            model_name='trail',
            name='trail_name',
            field=models.CharField(blank=True, max_length=30, null=True, verbose_name=b'Name'),
        ),
        migrations.AlterField(
            model_name='trail',
            name='trailstatus',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='recreation.TrailStatusType', verbose_name=b'Status'),
        ),
        migrations.AlterField(
            model_name='trail',
            name='trailtype',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='recreation.TrailType', verbose_name=b'Type'),
        ),
    ]
