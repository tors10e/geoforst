from django.conf.urls import patterns, url
from geoapp import views

urlpatterns = patterns('',
    url(r'^index$', views.Index),
    url(r'^inventory_plot/add/$', views.InventoryPlotAdd, name='inventory_plot_add'),
    (r'^map/$', views.map_page),
    (r'^map2/$', views.map2_page),
    url(r'^inventory_plot/$', views.InventoryPlotListView.as_view(), name='inventory_plot_list'),
    url(r'^inventory_plot/(?P<pk>\d+)/detail/$', views.InventoryPlotDetailView.as_view(), name='plot-detail'),
  )