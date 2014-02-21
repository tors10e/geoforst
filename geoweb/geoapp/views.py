from django.shortcuts import get_object_or_404, render, render_to_response, redirect
from django.http import HttpResponseRedirect
from django.views.generic import ListView, DetailView, UpdateView, DeleteView, CreateView
from geoapp.models import ForestInventoryPlot, ForestInventoryData, LumberLoad, LogData, ScalingTicket
from geoapp.models import Sawmill
from geoapp.forms import InventoryPlotForm, InventoryDataForm, LumberLoadForm, LogDataForm
from geoapp.forms import  ScalingTicketForm, SawmillForm
from django.core.urlresolvers import reverse, reverse_lazy
from django.contrib import auth


def Home(request):
    if not request.user.is_authenticated():
        return redirect('/geoapp/accounts/login/')
    else:
        return render_to_response('geoapp/home.html', {})
    
def logout_view(request):     
    auth.logout(request)     # Redirect to login page.     
    return HttpResponseRedirect("/geoapp/accounts/login/")

#************************************************************
# Lumber scaling classes.
#************************************************************
class LumberLoadCreate(CreateView):
    form_class = LumberLoadForm
    model = LumberLoad
    template_name_suffix = '_form'
    
    # Set created_by to the current user.
    def form_valid(self, form):
        form.instance.created_by = self.request.user
        return super(LumberLoadCreate, self).form_valid(form)
    
    # Return to the load list when done creating a plot.
    def get_success_url(self):
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
        return reverse('geoapp:sawmill-edit')

    
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


    

    
    
    
    
    
    
    
    
    
    