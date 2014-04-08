from django.conf.urls import patterns, url
from wedding import views

urlpatterns = patterns('',
    url(r'^registry/$', views.PresentList.as_view() , name = 'present-list'),
    url(r'^registry/(?P<pk>\d+)/edit/$', views.PresentUpdate.as_view() , name = 'present-edit'),
    url(r'^(?P<present_id>\d+)$', views.UpdatePresentStatus, name = 'toggle-purchased'),
    url(r'^$', views.PresentList.as_view(), name = 'home'),
  )