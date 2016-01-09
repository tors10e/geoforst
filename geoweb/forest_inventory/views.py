# _*_ coding: UTF-8 _*_

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
from django.contrib.auth.decorators import login_required, permission_required
from django.views.decorators.csrf import csrf_exempt

# Current app modules
from .models import *
from .forms import *
from .filters import *

#************************************************************
# Forest inventory classes.
#************************************************************

class InventoryPlotCreate(CreateView):
    form_class = InventoryPlotForm
    model = ForestInventoryPlot
    template_name_suffix = '_form'
    
    # Return to the inventory plot list when done creating a plot.
    def get_success_url(self):
        return reverse('forest_inventory:inventory-plot-list')
    
    # Set created_by to the current user.
    def form_valid(self, form):
        form.instance.created_by = self.request.user
        return super(InventoryPlotCreate, self).form_valid(form)
    
    # Set default form values.
    def get_initial(self):
        if self.request.method == 'GET':
            return {'plot_geometry':1}

#@permission_required('forest_inventory.change_forestinventoryplot', raise_exception=True)
@login_required
def InventoryPlotList(request):
    f = InventoryPlotFilter(request.GET, queryset=ForestInventoryPlot.objects.filter(created_by=request.user))
    return render(request, 'forest_inventory/forestinventoryplot_list.html', {'filter': f})
    
class InventoryPlotDetail(DetailView):
    queryset = ForestInventoryPlot.objects.all()
    context_object_name = 'plot_detail'
    template_name_suffix = '_detail'
    
    def get_queryset(self):
        return ForestInventoryPlot.objects.filter(created_by=self.request.user)
    
class InventoryPlotUpdate(UpdateView):
    model = ForestInventoryPlot
    form_class = InventoryPlotForm
    template_name_suffix = '_form'
    
   # Return to the load list when done creating a plot.
    def get_success_url(self):
        return reverse('forest_inventory:inventory-plot-list')
 
# Returns json representation of inventory plots. 
@csrf_exempt
def InventoryPlotJson(request):
    if request.method == 'GET':
        plots = ForestInventoryPlot.objects.all()
        data = serializers.serialize('json', plots)
        return HttpResponse(data)
    
    else:
        return HttpResponse("only get requests.")      
     
class InventoryPlotDelete(DeleteView):
    model = ForestInventoryPlot
    template_name_suffix = '_confirm_delete'
    success_url = reverse_lazy('forest_inventory:inventory-plot-list')


class InventoryDataCreate(CreateView):
    model = ForestInventoryData
    form_class = InventoryDataForm
    template_name_suffix = '_form'
    
    # Set created by to current user.
    def form_valid(self, form):
        form.instance.created_by = self.request.user
        return super(InventoryDataCreate, self).form_valid(form)
    
    # Set default field values.
    def get_initial(self):
        if self.request.method == 'GET':
            return {'forestinventoryplot':self.kwargs['pk']}
        
    # Return to inventory data list for the plot.
    def get_success_url(self):
        return reverse('forest_inventory:inventory-plot-detail', kwargs={'pk':self.kwargs['pk']})

class InventoryDataUpdate(UpdateView):
    model = ForestInventoryData
    form_class = InventoryDataForm
    template_name_suffix = '_form'

    def get_success_url(self):
        plotID = self.object.forestinventoryplot
        return reverse('forest_inventory:inventory-plot-detail', kwargs={'pk':plotID})
    
class InventoryDataDelete(DeleteView):
    model = ForestInventoryData
    template_name_suffix = '_confirm_delete'
    
    def get_success_url(self):
        plotID = self.object.forestinventoryplot
        return reverse('forest_inventory:inventory-plot-detail', kwargs={'pk':plotID})
