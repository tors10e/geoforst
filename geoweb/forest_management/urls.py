from django.conf.urls import patterns, url
from forest_management import views
from django_filters.views import FilterView
from forest_management.models import PlannedActivity

urlpatterns = patterns(
    '',
    url(r'^planned_activity/add/$', views.PlannedActivityCreate.as_view(), name='planned-activity-add'),
    url(r'^planned_activity/(?P<pk>\d+)/edit/$', views.PlannedActivityUpdate.as_view(), name='planned-activity-edit'),
    url(r'^planned_activity/(?P<pk>\d+)/delete/$', views.PlannedActivityDelete.as_view(), name='planned-activity-delete'),
    url(r'^planned_activity/$', views.PlannedActivityList.as_view(), name='planned-activity-list'),
  )