from django.shortcuts import get_object_or_404, render, render_to_response, Http404
from django.http import HttpResponseRedirect, HttpResponse
from django.views import generic
from django.views.generic import ListView, DetailView
from geoapp.models import ForestInventoryPlot, ForestInventoryData
from geoapp.forms import InventoryPlotForm, InventoryDataForm
from django.core.urlresolvers import reverse
from django.http.response import HttpResponseRedirectBase
from django.views.generic.edit import UpdateView

class IndexView(ListView):
    template_name = 'geoapp/index.html'
    context_object_name = 'latest_geoapp_list'

def Index(request):
    return render_to_response('geoapp/index.html', {})

# def index(request):
#     latest_plot_list = ForestInventoryPlot.objects.order_by('-plot_create_date')[:5] 
#     output = ', '.join([p.position_description for p in latest_plot_list])
#     return HttpResponse(output)


# def index(request):
#     latest_plot_list = ForestInventoryPlot.objects.order_by('-plot_create_date')[:5]
#     template = loader.get_template('geoapp/inventory_plot.html')
#     context = RequestContext(request, {'latest_plot_list': latest_plot_list})
#     return HttpResponse(template.render(context))

def test(request):
    return render_to_response('geoapp/test.html', {})

def map_page(request):
    return render_to_response('geoapp/map.html', {})

def map2_page(request):
    return render_to_response('geoapp/map2.html', {})

class InventoryPlotListView(ListView):
    model=ForestInventoryPlot
    template='geoapp/forestinventoryplot_list.html'
    context_object_name='inventory_plots'

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
    #plot = get_object_or_404(ForestInventoryPlot, id=forestinventoryplot_id)
    plot = get_object_or_404(ForestInventoryPlot, pk=forestinventoryplot_id)
    if request.method == 'POST':
        form = InventoryPlotForm(request.POST or None, instance=plot)
        if form.is_valid():
            form.save()
        return HttpResponseRedirect('/geoapp/inventory_plot/')
    else:
        form = InventoryPlotForm(instance=plot)
        return render(request, 'geoapp/forestinventoryplot_update.html', {'form': form})
    
def InventoryDataAdd(request, forestinventoryplot_id):
    plot = get_object_or_404(ForestInventoryPlot, id=forestinventoryplot_id)
    if request.method == 'POST' and forestinventoryplot_id is None: # If the form has been submitted...
        form = InventoryDataForm(request.POST) # A form bound to the POST data
        if form.is_valid(): # All validation rules pass
            form.save()
        return HttpResponseRedirect('/geoapp/inventory_plot/') # Redirect after POST
    elif request.method == 'POST' and forestinventoryplot_id >0: 
        form = InventoryPlotForm(request.POST or None, instance=plot)
        if form.is_valid():
            form.save()
        return HttpResponseRedirect('/geoapp/inventory_plot/')
    else: 
        initial_data = {'forestinventoryplot' : forestinventoryplot_id}
        form = InventoryDataForm(initial=initial_data) # An unbound form
        return render(request, 'geoapp/forestinventorydata_add.html', {'form': form})
    

    
    
    
    
    
    
    
    
    
    
    
    