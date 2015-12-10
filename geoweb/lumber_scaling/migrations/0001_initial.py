# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('geoapp', '0020_auto_20151209_1444'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
#         migrations.CreateModel(
#             name='LogData',
#             fields=[
#                 ('logdata_id', models.AutoField(serialize=False, primary_key=True)),
#                 ('butt_diameter', models.DecimalField(null=True, max_digits=4, decimal_places=1, blank=True)),
#                 ('log_length', models.DecimalField(null=True, max_digits=3, decimal_places=1, blank=True)),
#                 ('recorded_date', models.DateField(null=True, blank=True)),
#                 ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
#                 ('diameter_unit', models.ForeignKey(related_name='diameter_unit', to='geoapp.UnitLengthType', null=True)),
#                 ('length_unit', models.ForeignKey(related_name='length_unit', to='geoapp.UnitLengthType', null=True)),
#             ],
#             options={
#                 'ordering': ['logdata_id'],
#                 'db_table': 'log_data',
#             },
#         ),
#         migrations.CreateModel(
#             name='LumberLoad',
#             fields=[
#                 ('lumberload_id', models.AutoField(serialize=False, primary_key=True)),
#                 ('load_date', models.DateField(blank=True)),
#                 ('load_comments', models.CharField(max_length=255, blank=True)),
#                 ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
#             ],
#             options={
#                 'ordering': ['lumberload_id'],
#                 'db_table': 'lumber_load',
#             },
#         ),
#         migrations.CreateModel(
#             name='Sawmill',
#             fields=[
#                 ('sawmill_id', models.AutoField(serialize=False, primary_key=True)),
#                 ('name', models.CharField(unique=True, max_length=30, blank=True)),
#                 ('address', models.CharField(max_length=100, blank=True)),
#                 ('city', models.CharField(max_length=30, blank=True)),
#                 ('state', models.CharField(max_length=2, blank=True)),
#                 ('zip', models.DecimalField(null=True, max_digits=5, decimal_places=0, blank=True)),
#                 ('phone', models.CharField(max_length=20, blank=True)),
#                 ('email', models.EmailField(max_length=100, blank=True)),
#                 ('website', models.CharField(max_length=255, blank=True)),
#                 ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
#             ],
#             options={
#                 'ordering': ['name'],
#                 'db_table': 'sawmill',
#             },
#         ),
#         migrations.CreateModel(
#             name='ScalingTicket',
#             fields=[
#                 ('scalingticket_id', models.AutoField(serialize=False, primary_key=True)),
#                 ('species', models.CharField(max_length=30, null=True, blank=True)),
#                 ('fbm', models.IntegerField(null=True, verbose_name='Board Ft.', blank=True)),
#                 ('price_mfbm', models.DecimalField(null=True, verbose_name='Price/Mfbm', max_digits=6, decimal_places=2, blank=True)),
#                 ('weight', models.DecimalField(null=True, max_digits=12, decimal_places=2, blank=True)),
#                 ('price_ton', models.DecimalField(null=True, verbose_name='Price/Ton', max_digits=6, decimal_places=2, blank=True)),
#                 ('ticket_date', models.DateField(blank=True)),
#                 ('revenue', models.DecimalField(null=True, max_digits=6, decimal_places=2, blank=True)),
#                 ('created_date', models.DateField(null=True, blank=True)),
#                 ('created_by', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
#                 ('sawmill', models.ForeignKey(blank=True, to='lumber_scaling.Sawmill', null=True)),
#             ],
#             options={
#                 'db_table': 'scaling_ticket',
#             },
#         ),
#         migrations.AddField(
#             model_name='lumberload',
#             name='scalingticket',
#             field=models.ForeignKey(blank=True, to='lumber_scaling.ScalingTicket', null=True),
#         ),
#         migrations.AddField(
#             model_name='logdata',
#             name='lumberload',
#             field=models.ForeignKey(blank=True, to='lumber_scaling.LumberLoad', null=True),
#         ),
#         migrations.AddField(
#             model_name='logdata',
#             name='speciestreetype',
#             field=models.ForeignKey(blank=True, to='geoapp.SpeciesTreeType', null=True),
#         ),
    ]
