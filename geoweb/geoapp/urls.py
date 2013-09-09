from django.conf.urls import patterns, url
from geoapp import views

urlpatterns = patterns('',
    url(r'^index$', views.Index),
    url(r'^geoapp/$', views.Index),
    url(r'^inventory_plot/add/$', views.InventoryPlotAdd, name='inventory_plot_add'),
    url(r'^inventory_plot/(?P<forestinventoryplot_id>\d+)/edit/$', views.InventoryPlotEdit, name='inventory_plot_edit'),
    (r'^map/$', views.map_page),
    (r'^map2/$', views.map2_page),
    url(r'^inventory_plot/$', views.InventoryPlotListView.as_view(), name='inventory_plot_list'),
    url(r'^inventory_plot/(?P<pk>\d+)/detail/$', views.InventoryPlotDetailView.as_view(), name='plot_detail'),
    url(r'^inventory_data/add/$', views.InventoryDataAdd, name='inventory_data_add'),
    url(r'^inventory_plot/(?P<forestinventoryplot_id>\d+)/add_data/$', views.InventoryDataAdd, name='inventory_data_add')
  )