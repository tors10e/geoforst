from django.conf.urls import patterns, url
from .views import *

urlpatterns = patterns('',
    url(r'^burn_compartment/add/$', BurnCompartmentCreate.as_view(), name='burn-compartment-add'),
    url(r'^burn_compartments/$', BurnCompartmentList, name='burn-compartment-list'),
    url(r'^burn_compartment/(?P<pk>\d+)/edit/$', BurnCompartmentUpdate.as_view(), name='burn-compartment-edit'),
    url(r'^burn_compartment/(?P<pk>\d+)/delete/$', BurnCompartmentDelete.as_view(), name='burn-compartment-delete'),
 
    url(r'^firebreak/add/$', FirebreakCreate.as_view(), name='firebreak-add'),
    url(r'^firebreaks/$', FirebreakList, name='firebreak-list'),
    url(r'^firebreak/(?P<pk>\d+)/edit/$', FirebreakUpdate.as_view(), name='firebreak-edit'),
    url(r'^firebreak/(?P<pk>\d+)/delete/$', FirebreakDelete.as_view(), name='firebreak-delete'),
    
    url(r'^habitat_area/add/$', HabitatAreaCreate.as_view(), name='habitat-area-add'),
    url(r'^habitat_areas/$', HabitatAreaList, name='habitat-area-list'),
    url(r'^habitat_area/(?P<pk>\d+)/edit/$', HabitatAreaUpdate.as_view(), name='habitat-area-edit'),
    url(r'^habitat_area/(?P<pk>\d+)/delete/$', HabitatAreaDelete.as_view(), name='habitat-area-delete'),
    
    url(r'^habitat_site/add/$', HabitatSiteCreate.as_view(), name='habitat-site-add'),
    url(r'^habitat_sites/$', HabitatSiteList, name='habitat-site-list'),
    url(r'^habitat_site/(?P<pk>\d+)/edit/$', HabitatSiteUpdate.as_view(), name='habitat-site-edit'),
    url(r'^habitat_site/(?P<pk>\d+)/delete/$', HabitatSiteDelete.as_view(), name='habitat-site-delete'),
    
  )