from django.shortcuts import get_object_or_404, render, render_to_response, redirect
from django.http import HttpResponseRedirect
from django.views.generic import ListView, DetailView, UpdateView, DeleteView, CreateView, FormView
from geoapp.forms import *
from django.core.urlresolvers import reverse, reverse_lazy
from django.contrib import auth
from django.contrib.auth.forms import UserCreationForm
from django import forms

import datetime

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

def LumberScaling(request):
    if not request.user.is_authenticated():
        return redirect('/geoapp/accounts/login/')
    else:
        return render_to_response('geoapp/lumberscaling.html', {})
   
   
#************************************************************
#User handling.
#************************************************************    
def logout_view(request):  
    """Logs out a user and redirects to the login page."""   
    auth.logout(request)     # Redirect to login page.     
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
    return render(request, "registration/register.html", {'form': form,})

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
        return reverse('geoapp:lumber-load-list')

class LumberLoadList(ListView):
    context_object_name='lumber_load'
    template_name_suffix = '_list'
    
    def get_queryset(self):
        return LumberLoad.objects.filter(created_by=self.request.user)
    
class LumberLoadDetail(DetailView):
    queryset = LumberLoad.objects.all()
    template_name_suffix = '_detail'
    context_object_name = 'lumber_load_detail'
    
    def get_queryset(self):
        return LumberLoad.objects.filter(created_by=self.request.user)
    
class LumberLoadUpdate(UpdateView):
    model = LumberLoad
    form_class = LumberLoadForm
    template_name_suffix = '_update_form'
    
    # Return to the load list when done creating a plot.
    def get_success_url(self):
        return reverse('geoapp:lumber-load-list') 
    
class LumberLoadDelete(DeleteView):
    model = LumberLoad
    template_name_suffix = '_confirm_delete'
    success_url = reverse_lazy('geoapp:lumber-load-list')
    
    
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
             return { 'lumberload': self.kwargs['pk'],'diameter_unit': '3', 'length_unit': '1' }
  
    # Return to the load list when done creating a plot.
    def get_success_url(self):
        lumberLoadID = self.kwargs['pk']
        return reverse('geoapp:lumber-load-detail', kwargs={'pk': lumberLoadID})
   
class LogDataList(ListView):
    context_object_name='log_data'
    template_name_suffix = '_list'
    
    def get_queryset(self):
        return LogData.objects.filter(created_by=self.request.user)
    
class LogDataUpdate(UpdateView):
    model = LogData
    form_class = LogDataForm
    template_name_suffix = '_update_form'
    
    # Return to the load list when done creating a plot.
    def get_success_url(self):
        logID = self.kwargs['pk'] # Get the log id.
        log = get_object_or_404(LogData, logdata_id=logID) # Then get the log object.
        loadID = log.lumberload_id # Finally get lumberload id from the object to redirect after save.
        return reverse('geoapp:lumber-load-detail', kwargs={'pk':loadID})
     
class LogDataDelete(DeleteView):
    model = LogData
    template_name_suffix = '_confirm_delete'
    
    # Return to the load list when done creating a plot.
    def get_success_url(self):
        logID = self.kwargs['pk'] # Get the log id.
        log = LogData.objects.get(logdata_id=logID) # Then get the log object.
        loadID = log.lumberload_id # Finally get lumberload id from the object to redirect after save.
        return reverse('geoapp:lumber-load-detail', kwargs={'pk':loadID})


class ScalingTicketCreate(CreateView):
    model = ScalingTicket
    form_class = ScalingTicketForm
    template_name_suffix = '_form'
    
    def form_valid(self,form):
        form.instance.created_by = self.request.user
        return super(ScalingTicketCreate, self).form_valid(form)

    def get_success_url(self):
        return reverse('geoapp:scaling-ticket-list')
    
class ScalingTicketList(ListView):
    context_object_name = 'scaling_tickets'
    template_name_suffix = '_list'
    
    def get_queryset(self):
        return ScalingTicket.objects.filter(created_by=self.request.user)

class ScalingTicketUpdate(UpdateView):
    model = ScalingTicket
    form_class = ScalingTicketForm
    template_name_suffix = '_update_form'
    
    def get_success_url(self):
        return reverse('geoapp:scaling-ticket-list')

class ScalingTicketDelete(DeleteView):
    model = ScalingTicket
    template_name_suffix = '_confirm_delete'
    success_url = reverse_lazy('geoapp:scaling-ticket-list')
    
class SawmillCreate(CreateView):
    model = Sawmill
    form = SawmillForm
    template_name_suffix = '_form'
    
    def get_queryset(self):
        return Sawmill.objects.filter(created_by=self.request.user)
        
    def form_valid(self, form):
        form.instance.created_by = self.request.user
        return super(SawmillCreate, self).form_valid(form)
    
    def get_success_url(self):
        return reverse('geoapp:sawmill-list')
    
class SawmillList(ListView):
    model = Sawmill
    context_object_name = 'sawmills'
    template_name_suffix = '_list'
    
    def get_queryset(self):
        return Sawmill.objects.filter(created_by = self.request.user)

class SawmillDelete(DeleteView):
    model = Sawmill
    template_name_suffix = '_confirm_delete'
    success_url = reverse_lazy('geoapp:sawmill-list')
    
class SawmillUpdate(UpdateView):
    model = Sawmill
    form_class = SawmillForm
    template_name_suffix = '_update_form'
    
    def get_success_url(self):
        return reverse('geoapp:sawmill-list')

    
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
        form.instance.created_by =  self.request.user
        return super(InventoryPlotCreate, self).form_valid(form)
    
    # Set default form values.
    def get_initial(self):
        if self.request.method == 'GET':
            return {'plot_geometry':1, 'plot_area_unit':1, 'plot_radius_unit':1}

class InventoryPlotList(ListView):
    model = ForestInventoryPlot
    context_object_name='inventory_plots'
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
# Activity classes.
#************************************************************

class PlannedActivityCreate(CreateView):
    model = PlannedActivity
    form = PlannedActivityForm
    template_name_suffix = '_form'
    fields = ('landarea', 'acttype','planned_date','completed_date','description','notes','revenue', 'taskstatus', 'stand_no', 'geometry')
    
    def get_queryset(self):
        return PlannedActivity.objects.filter(created_by=self.request.user)
        
    def form_valid(self, form):
        form.instance.created_by = self.request.user
        return super(PlannedActivityCreate, self).form_valid(form)
    
    def get_success_url(self):
        return reverse('geoapp:planned-activity-list')
    
        # Set default form values.
    def get_initial(self):
        if self.request.method == 'GET':
            return {'revenue':0, 'taskstatus':1, 'acttype':8}
    
class PlannedActivityList(ListView):
    #model = PlannedActivity
    template_name_suffix = '_list'
    form = PlannedActivityForm
    context_object_name = 'activities'
    
    def get_queryset(self):
        return PlannedActivity.objects.filter(created_by = self.request.user)

class PlannedActivityDelete(DeleteView):
    model = PlannedActivity
    template_name_suffix = '_confirm_delete'
    success_url = reverse_lazy('geoapp:planned-activity-list')
    
class PlannedActivityUpdate(UpdateView):
    model = PlannedActivity
    form_class = PlannedActivityForm
    template_name_suffix = '_update_form'
    
    def get_success_url(self):
        return reverse('geoapp:planned-activity-list')
    
#************************************************************
# Uploading sqlite databases for upsert.
#************************************************************

class UserUploadView(CreateView):
    model = UserUpload
    fields = ['file','description']
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


    
  
    
    
    
    
    
    
    