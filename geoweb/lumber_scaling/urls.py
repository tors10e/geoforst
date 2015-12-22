from django.conf.urls import patterns, url
from lumber_scaling import views
 
urlpatterns = patterns('',
    url(r'^$', views.LumberScaling, name = 'lumber-scaling'),
    
    url(r'^lumber_load/$', views.LumberLoadList, name='lumber-load-list'),
    url(r'^lumber_load/add/$', views.LumberLoadCreate.as_view(), name='lumber-load-add'),
    url(r'^lumber_load/(?P<pk>\d+)/edit/$', views.LumberLoadUpdate.as_view(), name='lumber-load-edit'),
    url(r'^lumber_load/(?P<pk>\d+)/delete/$', views.LumberLoadDelete.as_view(), name='lumber-load-delete'),
    url(r'^lumber_load/(?P<pk>\d+)/detail/$', views.LumberLoadDetail.as_view(), name='lumber-load-detail'),
    url(r'^lumber_load/(?P<pk>\d+)/addlog/$', views.LogDataCreate.as_view(), name='log-data-add'),
    
    url(r'^log_data/(?P<pk>\d+)/edit/$', views.LogDataUpdate.as_view(), name='log-data-edit'),
    url(r'^log_data/(?P<pk>\d+)/delete/$', views.LogDataDelete.as_view(), name='log-data-delete'),
    
    url(r'^scaling_ticket/add/$', views.ScalingTicketCreate.as_view(), name='scaling-ticket-add'),
    url(r'^scaling_ticket/$', views.ScalingTicketList, name='scaling-ticket-list'),
    url(r'^scaling_ticket/(?P<pk>\d+)/edit/$', views.ScalingTicketUpdate.as_view(), name='scaling-ticket-edit'),
    url(r'^scaling_ticket/(?P<pk>\d+)/delete/$', views.ScalingTicketDelete.as_view(), name='scaling-ticket-delete'),
    
    url(r'^sawmill/add/$', views.SawmillCreate.as_view(), name='sawmill-add'),
    url(r'^sawmill/$', views.SawmillList, name='sawmill-list'),
    url(r'^sawmill/(?P<pk>\d+)/edit/$', views.SawmillUpdate.as_view(), name='sawmill-edit'),
    url(r'^sawmill/(?P<pk>\d+)/delete/$', views.SawmillDelete.as_view(), name='sawmill-delete'),
)