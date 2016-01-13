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
  )