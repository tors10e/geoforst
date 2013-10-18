from django.conf.urls import patterns, url
from geoapp import views

urlpatterns = patterns('',
    url(r'^$', views.Index),
    url(r'^inventory_plot/add/$', views.ForestInventoryPlotCreate.as_view(), name='inventory_plot_add'),
    url(r'^inventory_plot/edit/(?P<forestinventoryplot_id>\d+)$', views.InventoryPlotEdit, name='inventory_plot_edit'),
    url(r'^inventory_plot/delete/(?P<pk>\d+)$', views.InventoryPlotDelete, name='inventory_plot_delete'),
    url(r'^inventory_plot/$', views.InventoryPlotListView.as_view(), name='inventory_plot_list'),
    url(r'^inventory_plot/detail/(?P<pk>\d+)/$', views.InventoryPlotDetailView.as_view(), name='plot_detail'),
    url(r'^inventory_plot/detail/delete/(?P<forestinventorydata_id>\d+)/$', views.InventoryDataDelete, name='inventory_data_delete'),
    url(r'^inventory_plot/detail/edit/(?P<forestinventorydata_id>\d+)/$', views.InventoryDataEdit, name='inventory_data_edit'),
    url(r'^inventory_data/add/$', views.InventoryDataAdd, name='inventory_data_add'),
    url(r'^inventory_data/edit/(?P<forestinventorydata_id>\d+)/$', views.InventoryDataEdit, name='inventory_data_edit'),
    url(r'^inventory_data/add/(?P<forestinventoryplot_id>\d+)/$', views.InventoryDataAdd, name='inventory_data_addplot'),
    #url(r'^inventory_data/delete(?P<forestinventorydata_id>\d+)/$', views.InventoryDataDelete, name='inventory_data_delete'),
    url(r'^inventory_plot/(?P<forestinventoryplot_id>\d+)/add_data/$', views.InventoryDataAdd, name='inventory_data_add'),
    url(r'^accounts/login/$', 'django.contrib.auth.views.login'),
    url(r'^accounts/logout/$', views.logout_view),
    url(r'^home/$', views.Home, name = 'home'),
#    url(r'^inventory_data/add/(?P<forestinventoryplot_id>\d+)/$', views.InventoryDataAdd, name='inventory_data_addition'),
  )