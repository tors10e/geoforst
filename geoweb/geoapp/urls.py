from django.conf.urls import patterns, url
from geoapp import views

urlpatterns = patterns('',
    url(r'^accounts/login/$', 'django.contrib.auth.views.login', name='login'),
    url(r'^accounts/logout/$', views.logout_view, name='logout'),
    url(r'^accounts/register/$', views.register, name='register'),
    url(r'^map/$', views.Map, name = 'map'),
    url(r'^maps/$', views.Maps, name = 'maps'),
    url(r'^mobilemap/$', views.MobileMap, name = 'mobile-map'),
    
    url(r'^inventory_plot/$', views.InventoryPlotList.as_view(), name='inventory-plot-list'),
    url(r'^inventory_plot/add/$', views.InventoryPlotCreate.as_view(), name='inventory-plot-add'),
    url(r'^inventory_plot/(?P<pk>\d+)/edit/$', views.InventoryPlotUpdate.as_view(), name='inventory-plot-edit'), 
    url(r'^inventory_plot/(?P<pk>\d+)/delete/$', views.InventoryPlotDelete.as_view(), name='inventory_plot_delete'),    
    url(r'^inventory_plot/(?P<pk>\d+)/detail/$', views.InventoryPlotDetail.as_view(), name='inventory-plot-detail'),
    url(r'^inventory_plot/(?P<pk>\d+)/add_data/$', views.InventoryDataCreate.as_view(), name='inventory-data-add'),
    url(r'^inventory_plot/json/$', views.InventoryPlotJson),
       
    url(r'^inventory_data/add/$', views.InventoryDataCreate.as_view(), name='inventory-data-add'),
    url(r'^inventory_data/(?P<pk>\d+)/edit/$', views.InventoryDataUpdate.as_view(), name='inventory_data_edit'),
    url(r'^inventory_data/(?P<pk>\d+)/delete/$', views.InventoryDataDelete.as_view(), name='inventory_data_delete'),
    
    url(r'^upload/$', views.UserUploadView.as_view(), name='user-data-upload'),
    url(r'^upload_success/$', views.UserUploadSuccess, name='user-upload-success'),
  )