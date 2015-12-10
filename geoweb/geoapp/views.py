from django.shortcuts import get_object_or_404, render, render_to_response, redirect
from django.http import HttpResponseRedirect, HttpResponse
from django.views.generic import ListView, DetailView, UpdateView, DeleteView, CreateView, FormView
from django.core.urlresolvers import reverse, reverse_lazy
from django.contrib import auth
from django.contrib.auth.forms import UserCreationForm
from django import forms
from django.core import serializers
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.views.decorators.csrf import csrf_exempt

import datetime

from .models import *


def Map(request):   
    """Return web map if logged in, otherwise return login page."""
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/geoapp/accounts/login')
    else:
        return render_to_response('geoapp/map.html', {})

def Maps(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/geoapp/accounts/login')
    else:
        return render_to_response('geoapp/maps.html')

def MobileMap(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/geoapp/accounts/login')
    else:
        return render_to_response('geoapp/map_mobile.html', {})

def Home(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/geoapp/accounts/login/')
    else:
        return render_to_response('geoapp/home.html', {})


   
#************************************************************
# User handling.
#************************************************************    
def logout_view(request):  
    """Logs out a user and redirects to the login page."""   
    auth.logout(request)  # Redirect to login page.     
    return HttpResponseRedirect("/geoapp/accounts/login/")

def register(request):
    """Creates a new user and redirects back to the homepage."""
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            new_user = form.save()
            return HttpResponseRedirect("/geoapp/home")
    else: 
        form = UserCreationForm()
    return render(request, "registration/register.html", {'form': form, })



#************************************************************
# Uploading sqlite databases for upsert.
#************************************************************

class UserUploadView(CreateView):
    model = UserUpload
    fields = ['file', 'description']
    success_url = reverse_lazy('geoapp:home')
    
    def form_valid(self, form):
        form.instance.created_by = self.request.user
        form.instance.create_date = datetime.datetime.now()
        return super(UserUploadView, self).form_valid(form)

def UserUploadSuccess(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/geoapp/accounts/login')
    else:
        return render_to_response('geoapp/userupload_success.html', {})


    
  
    
    
    
    
    
    
    
