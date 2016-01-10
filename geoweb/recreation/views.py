from django.shortcuts import render
from django.views.generic import CreateView, UpdateView, DeleteView, ListView
from django.core.urlresolvers import reverse_lazy

from .models import Trail, CulturalPoint, RecreationPoint
from .forms import *
from .filters import *
from django.db.models.query import QuerySet

class TrailCreate(CreateView):
    model = Trail
    form_class = TrailForm
    success_url = reverse_lazy('recreation:trail-list')
 
    # Set created_by to the current user.
    def form_valid(self, form):
        form.instance.created_by = self.request.user
        return super(TrailCreate, self).form_valid(form)
      

def TrailList(request):
    f = TrailFilter(request.GET, queryset = Trail.objects.filter(created_by=request.user))
    return render(request, 'recreation/trail_list.html', {'filter': f})

    
class TrailUpdate(UpdateView):
    model = Trail
    form_class = TrailForm
    success_url = reverse_lazy('recreation:trail-list')
    
class TrailDelete(DeleteView):
    model = Trail



class CulturalPointCreate(CreateView):
    model = CulturalPoint
    form_class = CulturalPointForm
    success_url = reverse_lazy('recreation:cultural-point-list')
 
    # Set created_by to the current user.
    def form_valid(self, form):
        form.instance.created_by = self.request.user
        return super(CulturalPointCreate, self).form_valid(form)
      

def CulturalPointList(request):
    f = CulturalPointFilter(request.GET, queryset = CulturalPoint.objects.filter(created_by=request.user))
    return render(request, 'recreation/culturalpoint_list.html', {'filter': f})

    
class CulturalPointUpdate(UpdateView):
    model = CulturalPoint
    form_class = CulturalPointForm
    success_url = reverse_lazy('recreation:cultural-point-list')
    
class CulturalPointDelete(DeleteView):
    model = CulturalPoint
    
    
    
    
class RecreationPointCreate(CreateView):
    model = RecreationPoint
    form_class = RecreationPointForm
    success_url = reverse_lazy('recreation:recreation-point-list')
 
    # Set created_by to the current user.
    def form_valid(self, form):
        form.instance.created_by = self.request.user
        return super(RecreationPointCreate, self).form_valid(form)
      

def RecreationPointList(request):
    f = RecreationPointFilter(request.GET, queryset = RecreationPoint.objects.filter(created_by=request.user))
    return render(request, 'recreation/recreationpoint_list.html', {'filter': f})

    
class RecreationPointUpdate(UpdateView):
    model = RecreationPoint
    form_class = RecreationPointForm
    success_url = reverse_lazy('recreation:recreation-point-list')
    
class RecreationPointDelete(DeleteView):
    model = RecreationPoint