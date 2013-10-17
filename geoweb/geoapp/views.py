from django.shortcuts import get_object_or_404, render, render_to_response, redirect
from django.http import HttpResponseRedirect
from django.views.generic import ListView, DetailView, TemplateView
from geoapp.models import ForestInventoryPlot, ForestInventoryData
from geoapp.forms import InventoryPlotForm, InventoryDataForm
from django.core.urlresolvers import reverse
from django.contrib import auth

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
    #model=ForestInventoryPlot
    #queryset = ForestInventoryPlot.objects.filter(created_by='ternst')
    template='geoapp/forestinventoryplot_list.html'
    context_object_name='inventory_plots'
    def get_queryset(self):
        return ForestInventoryPlot.objects.filter(created_by=self.request.user)

class InventoryPlotDetailView(DetailView):
    queryset = ForestInventoryPlot.objects.all()
    #model = ForestInventoryPlot
    template_name = 'geoapp/forestinventoryplot_detail.html'
    context_object_name = 'plot_detail'
 
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
        form = InventoryDataForm(initial=initial_data) # An unbound form
    return render(request, 'geoapp/forestinventorydata_add.html', {'form': form})

def InventoryDataDelete(request, forestinventorydata_id):
    data = ForestInventoryData.objects.get(pk=forestinventorydata_id);
    ForestInventoryData.objects.get(pk=forestinventorydata_id).delete()
    return HttpResponseRedirect(reverse('geoapp:plot_detail', kwargs={'pk':data.forestinventoryplot_id}))
 
def logout_view(request):     
    auth.logout(request)     # Redirect to login page.     
    return HttpResponseRedirect("/geoapp/accounts/login/")
    

    
    
    
    
    
    
    
    
    
    
    
    