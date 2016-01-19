from django.shortcuts import render
from django.views.generic import CreateView, UpdateView, DeleteView, ListView
from django.core.urlresolvers import reverse_lazy

from .models import BurnCompartment, FirebreakLine, HabitatEnhancementArea, HabitatEnhancementPoint
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

# Firebreaks
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
    
    
    
# Habitat Areas
class HabitatAreaCreate(CreateView):
    model = HabitatEnhancementArea
    form_class = HabitatAreaForm
    success_url = reverse_lazy('habitat_management/habitatarea_list.html')
    
    # Set created_by to the current user.
    def form_valid(self, form):
        form.instance.created_by = self.request.user
        return super(HabitatAreaCreate, self).form_valid(form)
    
def HabitatAreaList(request):
    f = HabitatAreaFilter(request.GET, queryset = HabitatEnhancementArea.objects.filter(created_by=request.user))
    return render(request, 'habitat_management/habitatarea_list.html', {'filter': f})
        
class HabitatAreaUpdate(UpdateView):
    model = HabitatEnhancementArea
    form_class = HabitatAreaForm
    success_url = reverse_lazy('habitat_management/habitatarea_list.html')
    
class HabitatAreaDelete(DeleteView):
    model = HabitatEnhancementArea
    
    # Habitat Sites
class HabitatSiteCreate(CreateView):
    model = HabitatEnhancementPoint
    form_class = HabitatSiteForm
    success_url = reverse_lazy('habitat_management/habitatsite_list.html')
    
    # Set created_by to the current user.
    def form_valid(self, form):
        form.instance.created_by = self.request.user
        return super(HabitatSiteCreate, self).form_valid(form)
    
def HabitatSiteList(request):
    f = HabitatSiteFilter(request.GET, queryset = HabitatEnhancementPoint.objects.filter(created_by=request.user))
    return render(request, 'habitat_management/habitatsite_list.html', {'filter': f})
        
class HabitatSiteUpdate(UpdateView):
    model = HabitatEnhancementPoint
    form_class = HabitatSiteForm
    success_url = reverse_lazy('habitat_management/habitatsite_list.html')
    
class HabitatSiteDelete(DeleteView):
    model = HabitatEnhancementPoint
