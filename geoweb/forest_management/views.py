from django.shortcuts import get_object_or_404, render, render_to_response, redirect
from django.http import HttpResponseRedirect, HttpResponse
from django.views.generic import ListView, DetailView, UpdateView, DeleteView, CreateView, FormView
from django.core.urlresolvers import reverse, reverse_lazy
from django.contrib import auth
from django.contrib.auth.forms import UserCreationForm
from django import forms
from django.core import serializers
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from models import PlannedActivity
from forms import PlannedActivityForm
from filters import PlannedActivityFilter

#************************************************************
# Activity classes.
#************************************************************

class PlannedActivityCreate(CreateView):
    model = PlannedActivity
    form = PlannedActivityForm
    template_name_suffix = '_form'
    fields = ('landarea', 'acttype', 'planned_year', 'planned_month', 'completed_date', 'description', 'notes', 'revenue', 'taskstatus', 'stand_no')
    
    def get_queryset(self):
        return PlannedActivity.objects.filter(created_by=self.request.user)
        
    def form_valid(self, form):
        form.instance.created_by = self.request.user
        return super(PlannedActivityCreate, self).form_valid(form)
    
    def get_success_url(self):
        return reverse('forest_management:planned-activity-list')
    
        # Set default form values.
    def get_initial(self):
        if self.request.method == 'GET':
            return {'revenue':0, 'taskstatus':1, 'acttype':8}
    
# class PlannedActivityList(ListView):
#     # model = PlannedActivity
#     template_name_suffix = '_list'
#     form = PlannedActivityForm
#     context_object_name = 'activities'
#     paginate_by = 10
#     def get_queryset(self):
#         return PlannedActivity.objects.filter(created_by=self.request.user)

class PlannedActivityList(ListView):
    model = PlannedActivityFilter
    template = 'forest_management/template.html'
    form = PlannedActivityForm
    context_object_name = 'activities'
    paginate_by = 10
    def get_queryset(self):
        planned_year = self.request.GET.get('planned_year', None)
        planned_activities = PlannedActivity.objects.filter(created_by=self.request.user)
        if planned_year is not None:
                planned_activities = planned_activities.filter(planned_year=planned_year)
        #return PlannedActivity.objects.filter(created_by=self.request.user).filter(planned_year=planned_year)
        return planned_activities

class PlannedActivityDelete(DeleteView):
    model = PlannedActivity
    template_name_suffix = '_confirm_delete'
    success_url = reverse_lazy('forest_management:planned-activity-list')
    
class PlannedActivityUpdate(UpdateView):
    model = PlannedActivity
    form_class = PlannedActivityForm
    template_name = 'forest_management/plannedactivity_update_form.html'
    
    def get_success_url(self):
        return reverse('forest_management:planned-activity-list')
#     
# class PlannedActivityCreate(CreateView):
#     model = PlannedActivity
#     form_class = PlannedActivityForm
#     template_name = 'forest_management/plannedactivity_update_form.html'
#     
#     def get_success_url(self):
#         return reverse('geoapp:planned-activity-list')
    

# def planned_activity_list(request):
#     f = PlannedActivityFilter(request.GET, queryset=PlannedActivity.objects.all())
#     return render_to_response('forest_management/template.html', {'filter': f})

