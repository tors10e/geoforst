from django.conf.urls import patterns, url
from geoapp import views

urlpatterns = patterns('',
    url(r'^$', views.Index),
    url(r'^lumber_load/$', views.LumberLoadList.as_view(), name='lumber-load-list'),
    url(r'^lumber_load/add/$', views.LumberLoadCreate.as_view(), name='lumber-load-add'),
    url(r'^lumber_load/(?P<pk>\d+)/edit/$', views.LumberLoadUpdate.as_view(), name='lumber-load-edit'),
    url(r'^lumber_load/(?P<pk>\d+)/delete/$', views.LumberLoadDelete.as_view(), name='lumber-load-delete'),
    url(r'^lumber_load/(?P<pk>\d+)/detail/$', views.LumberLoadDetail.as_view(), name='lumber-load-detail'),
    url(r'^lumber_load/(?P<pk>\d+)/addlog/$', views.LogDataCreate.as_view(), name='log-data-add'),
    
    url(r'^log_data/(?P<pk>\d+)/edit/$', views.LogDataUpdate.as_view(), name='log-data-edit'),
    url(r'^log_data/(?P<pk>\d+)/delete/$', views.LogDataDelete.as_view(), name='log-data-delete'),
    
    url(r'^inventory_plot/$', views.InventoryPlotList.as_view(), name='inventory-plot-list'),
    url(r'^inventory_plot/add/$', views.InventoryPlotCreate.as_view(), name='inventory-plot-add'),
    url(r'^inventory_plot/(?P<pk>\d+)/edit/$', views.InventoryPlotUpdate.as_view(), name='inventory-plot-edit'), 
    url(r'^inventory_plot/(?P<pk>\d+)/delete/$', views.InventoryPlotDelete.as_view(), name='inventory_plot_delete'),    
    url(r'^inventory_plot/(?P<pk>\d+)/detail/$', views.InventoryPlotDetail.as_view(), name='inventory-plot-detail'),
    url(r'^inventory_plot/(?P<pk>\d+)/add_data/$', views.InventoryDataCreate.as_view(), name='inventory-data-add'),
       
    url(r'^inventory_data/add/$', views.InventoryDataCreate.as_view(), name='inventory-data-add'),
    url(r'^inventory_data/(?P<pk>\d+)/edit/$', views.InventoryDataUpdate.as_view(), name='inventory_data_edit'),
    url(r'^inventory_data/(?P<pk>\d+)/delete/$', views.InventoryDataDelete.as_view(), name='inventory_data_delete'),
    
    url(r'^accounts/login/$', 'django.contrib.auth.views.login'),
    url(r'^accounts/logout/$', views.logout_view),
    url(r'^home/$', views.Home, name = 'home'),
  )