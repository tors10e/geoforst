from django.shortcuts import render
from django.views.generic import CreateView, UpdateView, DeleteView, ListView
from django.core.urlresolvers import reverse_lazy

from .models import RoadLine
from .forms import *
from .filters import RoadFilter
from django.db.models.query import QuerySet

class RoadCreate(CreateView):
    model = RoadLine
    form_class = RoadForm
    success_url = reverse_lazy('infrastructure:road-list')
 
    # Set created_by to the current user.
    def form_valid(self, form):
        form.instance.created_by = self.request.user
        return super(RoadCreate, self).form_valid(form)
      

def RoadList(request):
    f = RoadFilter(request.GET, queryset = RoadLine.objects.filter(created_by=request.user))
    return render(request, 'infrastructure/road_list.html', {'filter': f})

    
class RoadUpdate(UpdateView):
    model = RoadLine
    form_class = RoadForm
    success_url = reverse_lazy('infrastructure:road-list') 
    
class RoadDelete(DeleteView):
    model = RoadLine
    
    
