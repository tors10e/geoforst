from django.shortcuts import get_object_or_404, render, render_to_response, redirect
from django.core.urlresolvers import reverse, reverse_lazy
from django.http import HttpResponseRedirect
from django.views.generic import ListView, DetailView, UpdateView, DeleteView, CreateView
from django.shortcuts import render
from wedding.models import Present
from wedding.forms import PresentForm

#************************************************************
# Lumber scaling classes.
#************************************************************

class PresentList(ListView):
    model = Present
    context_object_name='presents'
    template_name_suffix = '_list'

def UpdatePresentStatus(request, present_id):
    p = get_object_or_404(Present, pk=present_id)
    if p.is_purchased==True:
        p.is_purchased=False
    else:
        p.is_purchased=True
    p.save() 
    return HttpResponseRedirect(reverse('wedding:present-list'))
    
class PresentUpdate(UpdateView):
    model = Present
    form_class = PresentForm
    template_name_suffix = '_update_form'
    
    # Return to the load list when done creating a plot.
    def get_success_url(self):
        return reverse('wedding:present-list') 

    
    
