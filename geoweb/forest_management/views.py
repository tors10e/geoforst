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
from .models import PlannedActivity
from .forms import PlannedActivityForm
from .filters import PlannedActivityFilter

# Current app modules

#************************************************************
# Activity classes.
#************************************************************


class PlannedActivityCreate(CreateView):
    model = PlannedActivity
    form_class = PlannedActivityForm
    template_name_suffix = '_form'

    def get_queryset(self):
        return PlannedActivity.objects.filter(created_by=self.request.user)
        
    def form_valid(self, form):
        form.instance.created_by = self.request.user
        return super(PlannedActivityCreate, self).form_valid(form)
    
    def get_success_url(self):
        return reverse('forest_management:planned-activity-list')
    
        # Set default form values.
    def get_initial(self):
        if self.request.method == 'GET':
            return {'revenue':0, 'taskstatus':1, 'acttype':8}
  
class PlannedActivityDelete(DeleteView):
    model = PlannedActivity
    template_name_suffix = '_confirm_delete'
    success_url = reverse_lazy('forest_management:planned-activity-list')
   
class PlannedActivityUpdate(UpdateView):
    model = PlannedActivity
    form_class = PlannedActivityForm
    template_name = 'forest_management/plannedactivity_update_form.html'
    
    def get_success_url(self):
        return reverse('forest_management:planned-activity-list')

@login_required
def PlannedActivityList(request):
    f = PlannedActivityFilter(request.GET, queryset=PlannedActivity.objects.filter(created_by=request.user))
    return render(request, 'forest_management/plannedactivity_list.html', {'filter': f})

    
