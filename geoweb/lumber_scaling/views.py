# _*_ coding: UTF-8 _*_
# System libraries

# Third-party libraries

# Django modules
from django.shortcuts import get_object_or_404, render, render_to_response, redirect
from django.http import HttpResponseRedirect, HttpResponse
from django.views.generic import ListView, DetailView, UpdateView, DeleteView, CreateView, FormView
from django.core.urlresolvers import reverse, reverse_lazy
from django.contrib import auth
from django.contrib.auth.forms import UserCreationForm
from django import forms
from django.core import serializers
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django_filters.views import FilterView
from django.contrib.auth.decorators import login_required

# Django apps
from .models import *
from .forms import *
from .filters import *

# Current app modules

def LumberScaling(request):
    if not request.user.is_authenticated():
        return redirect('/geoapp/accounts/login/')
    else:
        return render_to_response('lumber_scaling/lumberscaling.html', {})
   

#************************************************************
# Lumber scaling classes.
#************************************************************

class LumberLoadCreate(CreateView):
    """Return a list of lumber loads."""
    
    form_class = LumberLoadForm
    model = LumberLoad
    template_name_suffix = '_form'
    
    # Set created_by to the current user.
    def form_valid(self, form):
        """Validate form."""
        form.instance.created_by = self.request.user
        return super(LumberLoadCreate, self).form_valid(form)
    
    # Return to the load list when done creating a plot.
    def get_success_url(self):
        """Return the lumber load list."""
        return reverse('lumber_scaling:lumber-load-list')

@login_required
def LumberLoadList(request):
    """ Generate a list of lumber loads. """
    f = LumberLoadFilter(request.GET, queryset=LumberLoad.objects.filter(created_by=request.user))
    return render(request, 'lumber_scaling/lumberload_list.html', {'filter': f})

   
class LumberLoadDetail(DetailView):
    queryset = LumberLoad.objects.all()
    template_name_suffix = '_detail'
    context_object_name = 'lumber_load_detail'
    
    def get_queryset(self):
        return LumberLoad.objects.filter(created_by=self.request.user)

class LumberLoadUpdate(UpdateView):
    model = LumberLoad
    form_class = LumberLoadForm
    template_name_suffix = '_form'
    
    # Return to the load list when done creating a plot.
    def get_success_url(self):
        return reverse('lumber_scaling:lumber-load-list') 
  
class LumberLoadDelete(DeleteView):
    model = LumberLoad
    template_name_suffix = '_confirm_delete'
    success_url = reverse_lazy('lumber_scaling:lumber-load-list')
       
class LogDataCreate(CreateView):
    form_class = LogDataForm
    model = LogData
    template_name_suffix = '_form'
    
    # Set created_by to the current user.
    def form_valid(self, form):
        form.instance.created_by = self.request.user
        return super(LogDataCreate, self).form_valid(form)
        
    # Set initial values of unit fields.
    def get_initial(self):
         if self.request.method == 'GET':
             return { 'lumberload': self.kwargs['pk'], 'diameter_unit': '3', 'length_unit': '1' }
  
    # Return to the load list when done creating a plot.
    def get_success_url(self):
        lumberLoadID = self.kwargs['pk']
        return reverse('lumber_scaling:lumber-load-detail', kwargs={'pk': lumberLoadID})

class LogDataList(ListView):
    context_object_name = 'log_data'
    template_name_suffix = '_list'
    
    def get_queryset(self):
        return LogData.objects.filter(created_by=self.request.user)
    
class LogDataUpdate(UpdateView):
    model = LogData
    form_class = LogDataForm
    template_name_suffix = '_form'
    
    # Return to the load list when done creating a plot.
    def get_success_url(self):
        logID = self.kwargs['pk']  # Get the log id.
        log = get_object_or_404(LogData, logdata_id=logID)  # Then get the log object.
        loadID = log.lumberload_id  # Finally get lumberload id from the object to redirect after save.
        return reverse('lumber_scaling:lumber-load-detail', kwargs={'pk':loadID})
 
class LogDataDelete(DeleteView):
    model = LogData
    template_name_suffix = '_confirm_delete'
    
    # Return to the load list when done creating a plot.
    def get_success_url(self):
        logID = self.kwargs['pk']  # Get the log id.
        log = LogData.objects.get(logdata_id=logID)  # Then get the log object.
        loadID = log.lumberload_id  # Finally get lumberload id from the object to redirect after save.
        return reverse('lumber_scaling:lumber-load-detail', kwargs={'pk':logId})

class ScalingTicketCreate(CreateView):
    model = ScalingTicket
    form_class = ScalingTicketForm
    template_name_suffix = '_form'
    
    def form_valid(self, form):
        form.instance.created_by = self.request.user
        return super(ScalingTicketCreate, self).form_valid(form)

    def get_success_url(self):
        return reverse('lumber_scaling:scaling-ticket-list')
 
@login_required   
def ScalingTicketList(request):
    f = ScalingTicketFilter(request.GET, queryset=ScalingTicket.objects.filter(created_by=request.user))
    return render(request, 'lumber_scaling/scalingticket_list.html', {'filter': f})

class ScalingTicketUpdate(UpdateView):
    model = ScalingTicket
    form_class = ScalingTicketForm
    template_name_suffix = '_form'
    
    def get_success_url(self):
        return reverse('lumber_scaling:scaling-ticket-list')

class ScalingTicketDelete(DeleteView):
    model = ScalingTicket
    template_name_suffix = '_confirm_delete'
    success_url = reverse_lazy('lumber_scaling:scaling-ticket-list')
  
class SawmillCreate(CreateView):
    model = Sawmill
    form_class = SawmillForm
    template_name_suffix = '_form'
    
    def get_queryset(self):
        return Sawmill.objects.filter(created_by=self.request.user)
        
    def form_valid(self, form):
        form.instance.created_by = self.request.user
        return super(SawmillCreate, self).form_valid(form)
    
    def get_success_url(self):
        return reverse('lumber_scaling:sawmill-list')

class SawmillDelete(DeleteView):
    model = Sawmill
    template_name_suffix = '_confirm_delete'
    success_url = reverse_lazy('lumber_scaling:sawmill-list')
   
class SawmillUpdate(UpdateView):
    model = Sawmill
    form_class = SawmillForm
    template_name_suffix = '_form'
    
    def get_success_url(self):
        return reverse('lumber_scaling:sawmill-list')

@login_required
def SawmillList(request):
    f = SawmillFilter(request.GET, queryset=Sawmill.objects.filter(created_by=request.user))
    return render(request, 'lumber_scaling/sawmill_list.html', {'filter': f})



    