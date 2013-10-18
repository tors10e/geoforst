from django.shortcuts import get_object_or_404, render, render_to_response, redirect
from django.http import HttpResponseRedirect
from django.views.generic import ListView, DetailView
from geoapp.models import ForestInventoryPlot, ForestInventoryData
from geoapp.forms import InventoryPlotForm, InventoryDataForm
from django.core.urlresolvers import reverse
from django.contrib import auth
from django.views.generic.edit import CreateView

# Does not get referenced.
class IndexView(ListView):
    template_name = 'geoapp/index.html'
    context_object_name = 'latest_geoapp_list'

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
    
class ForestInventoryPlotCreate(CreateView):
    form_class = InventoryPlotForm
    model = ForestInventoryPlot
    
    def get_success_url(self):
        return reverse('geoapp:inventory_plot_list')
    
    def form_valid(self, form):
        form.instance.created_by = self.request.user
        return super(ForestInventoryPlotCreate, self).form_valid(form)
 
def InventoryPlotAdd(request):
    if request.method == 'POST': # If the form has been submitted...
        form = InventoryPlotForm(request.POST) # A form bound to the POST data
        if form.is_valid(): # All validation rules pass
            form.save()
            return HttpResponseRedirect('/geoapp/inventory_plot/') # Redirect after POST
    else: 
        form = InventoryPlotForm() # An unbound form
        return render(request, 'geoapp/forestinventoryplot_add.html', {'form': form})
    
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
    if request.method == 'POST': # If the form has been submitted...
        form = InventoryDataForm(request.POST) # A form bound to the POST data
        if form.is_valid(): # All validation rules pass
            new_data = form.save()
            return HttpResponseRedirect(reverse('geoapp:plot_detail', kwargs={'pk':new_data.forestinventoryplot_id}))
    else: 
        # Get a form and populate with forestinventoryplotid if it is given.
        initial_data = {'forestinventoryplot' : forestinventoryplot_id}
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
    

    
    
    
    
    
    
    
    
    
    
    
    