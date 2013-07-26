from django.conf.urls import patterns, url

from geoforst import views

urlpatterns = patterns('',
    url(r'^$', views.StandAreaView.as_view(), name='StandAreaVw'),
)