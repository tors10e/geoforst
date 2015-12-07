from django.shortcuts import get_object_or_404, render, render_to_response, redirect
from django.http import HttpResponseRedirect, HttpResponse
from django.views.generic import ListView, DetailView, UpdateView, DeleteView, CreateView, FormView
from geoapp.forms import *
from django.core.urlresolvers import reverse, reverse_lazy
from django.contrib import auth
from django.contrib.auth.forms import UserCreationForm
from django import forms
from geoapp.models import ForestInventoryPlot
from django.core import serializers
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

import datetime
from django.views.decorators.csrf import csrf_exempt

def Map(request):   
    """Return web map if logged in, otherwise return login page."""
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/geoapp/accounts/login')
    else:
        return render_to_response('geoapp/map.html', {})

def Maps(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/geoapp/accounts/login')
    else:
        return render_to_response('geoapp/maps.html')

def MobileMap(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/geoapp/accounts/login')
    else:
        return render_to_response('geoapp/map_mobile.html', {})

def Home(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/geoapp/accounts/login/')
    else:
        return render_to_response('geoapp/home.html', {})


   
#************************************************************
# User handling.
#************************************************************    
def logout_view(request):  
    """Logs out a user and redirects to the login page."""   
    auth.logout(request)  # Redirect to login page.     
    return HttpResponseRedirect("/geoapp/accounts/login/")

def register(request):
    """Creates a new user and redirects back to the homepage."""
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            new_user = form.save()
            return HttpResponseRedirect("/geoapp/home")
    else: 
        form = UserCreationForm()
    return render(request, "registration/register.html", {'form': form, })

#************************************************************
# Forest inventory classes.
#************************************************************

class InventoryPlotCreate(CreateView):
    form_class = InventoryPlotForm
    model = ForestInventoryPlot
    template_name_suffix = '_form'
    
    # Return to the inventory plot list when done creating a plot.
    def get_success_url(self):
        return reverse('geoapp:inventory-plot-list')
    
    # Set created_by to the current user.
    def form_valid(self, form):
        form.instance.created_by = self.request.user
        return super(InventoryPlotCreate, self).form_valid(form)
    
    # Set default form values.
    def get_initial(self):
        if self.request.method == 'GET':
            return {'plot_geometry':1, 'plot_area_unit':1, 'plot_radius_unit':1}

class InventoryPlotList(ListView):
    model = ForestInventoryPlot
    context_object_name = 'inventory_plots'
    template_name_suffix = '_list'
    
    def get_queryset(self):
        return ForestInventoryPlot.objects.filter(created_by=self.request.user)

class InventoryPlotDetail(DetailView):
    queryset = ForestInventoryPlot.objects.all()
    context_object_name = 'plot_detail'
    template_name_suffix = '_detail'
    
    def get_queryset(self):
        return ForestInventoryPlot.objects.filter(created_by=self.request.user)
    
class InventoryPlotUpdate(UpdateView):
    model = ForestInventoryPlot
    form_class = InventoryPlotForm
    template_name_suffix = '_update_form'
    
   # Return to the load list when done creating a plot.
    def get_success_url(self):
        return reverse('geoapp:inventory-plot-list')
 
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
    success_url = reverse_lazy('geoapp:inventory-plot-list')



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
            return {'forestinventoryplot':self.kwargs['pk'], 'dbh_unit':3}
        
    # Return to inventory data list for the plot.
    def get_success_url(self):
        return reverse('geoapp:inventory-plot-detail', kwargs={'pk':self.kwargs['pk']})

class InventoryDataUpdate(UpdateView):
    model = ForestInventoryData
    form_class = InventoryDataForm
    template_name_suffix = '_update_form'

    def get_success_url(self):
        plotID = self.object.forestinventoryplot
        return reverse('geoapp:inventory-plot-detail', kwargs={'pk':plotID})
    
class InventoryDataDelete(DeleteView):
    model = ForestInventoryData
    template_name_suffix = '_confirm_delete'
    
    def get_success_url(self):
        plotID = self.object.forestinventoryplot
        return reverse('geoapp:inventory-plot-detail', kwargs={'pk':plotID})

#************************************************************
# Uploading sqlite databases for upsert.
#************************************************************

class UserUploadView(CreateView):
    model = UserUpload
    fields = ['file', 'description']
    success_url = reverse_lazy('geoapp:home')
    
    def form_valid(self, form):
        form.instance.created_by = self.request.user
        form.instance.create_date = datetime.datetime.now()
        return super(UserUploadView, self).form_valid(form)

def UserUploadSuccess(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/geoapp/accounts/login')
    else:
        return render_to_response('geoapp/userupload_success.html', {})


    
  
    
    
    
    
    
    
    
