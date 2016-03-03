from django.conf.urls import patterns, url
from .views import *

urlpatterns = patterns(
    '',
    url(r'^$', PlannedActivityList, name='planned-activity-list'),
    url(r'^planned_activity/add/$', PlannedActivityCreate.as_view(), name='planned-activity-add'),
    url(r'^planned_activity/(?P<pk>\d+)/edit/$', PlannedActivityUpdate.as_view(), name='planned-activity-edit'),
    url(r'^planned_activity/(?P<pk>\d+)/delete/$', PlannedActivityDelete.as_view(), name='planned-activity-delete'),
    url(r'^planned_activity/$', PlannedActivityList, name='planned-activity-list'),
    
    url(r'^land_area/$', LandAreaList, name = 'land-area-list'),
    url(r'^land_area/add/$', LandAreaCreate.as_view(), name = 'land-area-add'),
    url(r'^land_area/(?P<pk>\d+)/edit/$', LandAreaUpdate.as_view(), name = 'land-area-edit'),
    url(r'^land_area/(?P<pk>\d+)/delete/$', LandAreaDelete.as_view(), name = 'land-area-delete'),

   
  )