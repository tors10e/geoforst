from django.conf.urls import patterns, url
from .views import *

urlpatterns = patterns('',
    url(r'^$', InventoryPlotList, name='inventory-plot-list'),
    url(r'^inventory_plot/$', InventoryPlotList, name='inventory-plot-list'),
    url(r'^inventory_plot/add/$', InventoryPlotCreate.as_view(), name='inventory-plot-add'),
    url(r'^inventory_plot/(?P<pk>\d+)/edit/$', InventoryPlotUpdate.as_view(), name='inventory-plot-edit'), 
    url(r'^inventory_plot/(?P<pk>\d+)/delete/$', InventoryPlotDelete.as_view(), name='inventory-plot-delete'),    
    url(r'^inventory_plot/(?P<pk>\d+)/detail/$', InventoryPlotDetail.as_view(), name='inventory-plot-detail'),
    url(r'^inventory_plot/(?P<pk>\d+)/add_data/$', InventoryDataCreate.as_view(), name='inventory-data-add'),
    url(r'^inventory_plot/json/$', InventoryPlotJson),
       
    url(r'^inventory_data/add/$', InventoryDataCreate.as_view(), name='inventory-data-add'),
    url(r'^inventory_data/(?P<pk>\d+)/edit/$', InventoryDataUpdate.as_view(), name='inventory-data-edit'),
    url(r'^inventory_data/(?P<pk>\d+)/delete/$', InventoryDataDelete.as_view(), name='inventory-data-delete'),
)