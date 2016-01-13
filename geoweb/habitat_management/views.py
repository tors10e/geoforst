from django.shortcuts import render
from django.views.generic import CreateView, UpdateView, DeleteView, ListView
from django.core.urlresolvers import reverse_lazy

from .models import BurnCompartment, FirebreakLine
from .forms import *
from .filters import *
from django.db.models.query import QuerySet

class BurnCompartmentCreate(CreateView):
    model = BurnCompartment
    form_class = BurnCompartmentForm
    success_url = reverse_lazy('habitat_management:burn-compartment-list')
 
    # Set created_by to the current user.
    def form_valid(self, form):
        form.instance.created_by = self.request.user
        return super(BurnCompartmentCreate, self).form_valid(form)
      

def BurnCompartmentList(request):
    f = BurnCompartmentFilter(request.GET, queryset = BurnCompartment.objects.filter(created_by=request.user))
    return render(request, 'habitat_management/burncompartment_list.html', {'filter': f})
    
class BurnCompartmentUpdate(UpdateView):
    model = BurnCompartment
    form_class = BurnCompartmentForm
    success_url = reverse_lazy('habitat_management/burncompartment_list.html')
    
class BurnCompartmentDelete(DeleteView):
    model = BurnCompartment
    
class FirebreakCreate(CreateView):
    model = FirebreakLine
    form_class = FirebreakForm
    success_url = reverse_lazy('habitat_management/firebreak_list.html')
    
    # Set created_by to the current user.
    def form_valid(self, form):
        form.instance.created_by = self.request.user
        return super(FirebreakCreate, self).form_valid(form)
    
def FirebreakList(request):
    f = FirebreakFilter(request.GET, queryset = FirebreakLine.objects.filter(created_by=request.user))
    return render(request, 'habitat_management/firebreak_list.html', {'filter': f})
        
class FirebreakUpdate(UpdateView):
    model = FirebreakLine
    form_class = FirebreakForm
    success_url = reverse_lazy('habitat_management/Firebereak_list.html')
    
class FirebreakDelete(DeleteView):
    model = FirebreakLine
