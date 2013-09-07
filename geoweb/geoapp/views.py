from django.shortcuts import get_object_or_404, render, render_to_response, get_object_or_404
from django.http import HttpResponseRedirect, HttpResponse
from django.views import generic
from django.views.generic import ListView, DetailView
from geoapp.models import ForestInventoryPlot
from geoapp.forms import InventoryPlotForm
from django.core.urlresolvers import reverse
from django.http.response import HttpResponseRedirectBase

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
            return HttpResponseRedirect('/thanks/') # Redirect after POST
    else:
        form = InventoryPlotForm() # An unbound form
        return render(request, 'geoapp/forestinventoryplot_add.html', {'form': form})
    