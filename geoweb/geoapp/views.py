from django.shortcuts import get_object_or_404, render, render_to_response, redirect
from django.http import HttpResponseRedirect
from django.views.generic import ListView, DetailView
from geoapp.models import ForestInventoryPlot, ForestInventoryData
from geoapp.forms import InventoryPlotForm, InventoryDataForm
from django.core.urlresolvers import reverse
from django.contrib import auth
from django.views.generic.edit import CreateView


def Index(request):
    return render_to_response('geoapp/index.html', {})

def Home(request):
    if not request.user.is_authenticated():
        return redirect('/geoapp/accounts/login/')
    else:
        return render_to_response('geoapp/home.html', {})
 
class InventoryPlotListView(ListView):
    template='geoapp/forestinventoryplot_list.html'
    context_object_name='inventory_plots'
    
    def get_queryset(self):
        return ForestInventoryPlot.objects.filter(created_by=self.request.user)

class InventoryPlotDetailView(DetailView):
    queryset = ForestInventoryPlot.objects.all()
    template_name = 'geoapp/forestinventoryplot_detail.html'
    context_object_name = 'plot_detail'
    
    def get_queryset(self):
        return ForestInventoryPlot.objects.filter(created_by=self.request.user)
    
class ForestInventoryPlotCreate(CreateView):
    form_class = InventoryPlotForm
    model = ForestInventoryPlot
    
    # Return to the inventory plot list when done creating a plot.
    def get_success_url(self):
        return reverse('geoapp:inventory_plot_list')
    
    # Set created_by to the current user.
    def form_valid(self, form):
        form.instance.created_by = self.request.user
        return super(ForestInventoryPlotCreate, self).form_valid(form)
    
    # Set default form values.
    def get_initial(self):
        return {'plot_geometry':1, 'plot_area_unit':1, 'plot_radius_unit':1}

    
def InventoryPlotEdit(request, forestinventoryplot_id):
    plot = get_object_or_404(ForestInventoryPlot, pk=forestinventoryplot_id)
    if request.method == 'POST':
        form = InventoryPlotForm(request.POST or None, instance=plot)
        if form.is_valid():
            form.save()
        return HttpResponseRedirect('/geoapp/inventory_plot/')
    else:
        form = InventoryPlotForm(instance=plot)
        return render(request, 'geoapp/forestinventoryplot_update.html', {'form': form})
 
def InventoryPlotDelete(request, pk):
    ForestInventoryPlot.objects.get(forestinventoryplot_id=pk).delete()
    return HttpResponseRedirect('/geoapp/inventory_plot/')

def InventoryDataAdd(request, forestinventoryplot_id=1):
    if request.method == 'POST': 
        form = InventoryDataForm(request.POST) 
        if form.is_valid(): 
            new_data = form.save()
            return HttpResponseRedirect(reverse('geoapp:plot_detail', kwargs={'pk':new_data.forestinventoryplot_id}))
    else: 
        # Get a form and populate with forestinventoryplotid and default units.
        initial_data = {'forestinventoryplot' : forestinventoryplot_id, 'dbh_unit':3, 'height_unit':1}
        form = InventoryDataForm(initial=initial_data) 
    return render(request, 'geoapp/forestinventorydata_add.html', {'form': form})

def InventoryDataDelete(request, forestinventorydata_id):
    data = ForestInventoryData.objects.get(pk=forestinventorydata_id);
    ForestInventoryData.objects.get(pk=forestinventorydata_id).delete()
    return HttpResponseRedirect(reverse('geoapp:plot_detail', kwargs={'pk':data.forestinventoryplot_id}))
 
def InventoryDataEdit(request, forestinventorydata_id):
    data = get_object_or_404(ForestInventoryData, pk=forestinventorydata_id)
    if request.method == 'POST':
        form = InventoryDataForm(request.POST, instance=data)
        if form.is_valid():
            form.save()
        return HttpResponseRedirect(reverse('geoapp:plot_detail', kwargs={'pk':data.forestinventoryplot_id}))
    else:
        form = InventoryDataForm(instance=data)
        return render(request, 'geoapp/forestinventorydata_update.html', {'form': form})
 
def logout_view(request):     
    auth.logout(request)     # Redirect to login page.     
    return HttpResponseRedirect("/geoapp/accounts/login/")
    

    
    
    
    
    
    
    
    
    
    
    
    