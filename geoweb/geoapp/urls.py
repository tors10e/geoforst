from django.conf.urls import patterns, url
from geoapp import views

urlpatterns = patterns('',
    url(r'^$', views.Index),
    url(r'^lumber_load/$', views.LumberLoadListView.as_view(), name='lumber_load_list'),
    url(r'^lumber_load/add/$', views.LumberLoadCreate.as_view(), name='lumber_load_add'),
    url(r'^lumber_load/(?P<pk>\d+)/edit/$', views.LumberLoadUpdate.as_view(), name='lumber_load_edit'),
    url(r'^lumber_load/(?P<pk>\d+)/delete/$', views.LumberLoadDelete.as_view(), name='lumber_load_delete'),
    url(r'^lumber_load/(?P<pk>\d+)/detail/$', views.LumberLoadDetailView.as_view(), name='lumber_load_detail'),
    url(r'^lumber_load/(?P<lumberload_id>\d+)/detail/add/$', views.LogDataCreate.as_view(), name='log_data_addload'),
    url(r'^lumber_load/(?P<lumberload_id>\d+)/addlog/$', views.LogDataCreate.as_view(), name='log_data_add        '),
    url(r'^lumber_load/(?P<pk>\d+)/addlog/$', views.LogDataCreate.as_view(), name='log-data-add'),
    
    url(r'^log_data/$', views.LogDataListView.as_view(), name='log_data_list'),
    url(r'^log_data/add/$', views.LogDataCreate.as_view(), name='log_data-add'),
#    url(r'^log_data/(?P<lumberload_id>\d+)/add/$', views.LogDataCreate.as_view(), name='log_data_addload'),
    url(r'^log_data/(?P<pk>\d+)/edit/$', views.LogDataUpdate.as_view(), name='log_data_edit'),
    url(r'^log_data/(?P<pk>\d+)/delete/$', views.LogDataDelete.as_view(), name='log_data_delete'),
    
    url(r'^inventory_plot/$', views.InventoryPlotListView.as_view(), name='inventory_plot_list'),
    url(r'^inventory_plot/add/$', views.ForestInventoryPlotCreate.as_view(), name='inventory_plot_add'),
    url(r'^inventory_plot/(?P<forestinventoryplot_id>\d+)/$', views.InventoryPlotEdit, name='inventory_plot_edit'),
    url(r'^inventory_plot/(?P<forestinventoryplot_id>\d+)/edit/$', views.InventoryPlotEdit, name='inventory_plot_edit'),
    url(r'^inventory_plot/(?P<pk>\d+)/delete/$', views.InventoryPlotDelete, name='inventory_plot_delete'),    
    url(r'^inventory_plot/(?P<pk>\d+)/data/$', views.InventoryPlotDetailView.as_view(), name='plot_data'),
    url(r'^inventory_plot/(?P<pk>\d+)/detail/$', views.InventoryPlotDetailView.as_view(), name='plot_detail'),
    url(r'^inventory_plot/detail/delete/(?P<forestinventorydata_id>\d+)/$', views.InventoryDataDelete, name='inventory_data_delete'),
    url(r'^inventory_plot/detail/edit/(?P<forestinventorydata_id>\d+)/$', views.InventoryDataEdit, name='inventory_data_edit'),
    
    url(r'^inventory_data/add/$', views.InventoryDataAdd, name='inventory_data_add'),
    url(r'^inventory_data/(?P<forestinventorydata_id>\d+)/edit/$', views.InventoryDataEdit, name='inventory_data_edit'),
    url(r'^inventory_data/(?P<forestinventorydata_id>\d+)/$', views.InventoryDataEdit, name='inventory_data_edit'),
    url(r'^inventory_data/(?P<forestinventoryplot_id>\d+)/add/$', views.InventoryDataAdd, name='inventory_data_addplot'),
    url(r'^inventory_data/(?P<forestinventorydata_id>\d+)/delete/$', views.InventoryDataDelete, name='inventory_data_delete'),
    url(r'^inventory_plot/(?P<forestinventoryplot_id>\d+)/add_data/$', views.InventoryDataAdd, name='inventory_data_add'),
    
    url(r'^accounts/login/$', 'django.contrib.auth.views.login'),
    url(r'^accounts/logout/$', views.logout_view),
    url(r'^home/$', views.Home, name = 'home'),
#    url(r'^inventory_data/add/(?P<forestinventoryplot_id>\d+)/$', views.InventoryDataAdd, name='inventory_data_addition'),
  )