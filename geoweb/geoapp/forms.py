from django.forms import *
#from geoapp.models import ForestInventoryPlot, ForestInventoryData, LumberLoad, LogData, ScalingTicket, Sawmill
from models import *
from django.contrib.gis import forms 
from django.forms.widgets import TextInput, HiddenInput
from django.forms import ModelForm
from django.db.models.fields import DecimalField, CharField
import email
from django.db.models.query import QuerySet

class InventoryPlotForm(ModelForm):
    class Meta:
        model = ForestInventoryPlot
        widgets = {
            'position_description': Textarea(attrs={'cols': 80, 'rows': 5}),
            'geometry' : TextInput(attrs={"size":75}),
        }  
        fields = {"position_description", "plot_number", "elevation", "elevation_unit", "plot_create_date", "latitude", "longitude" }
            
class InventoryDataForm(ModelForm):
    class Meta:
        model = ForestInventoryData
        exclude = ('created_by',)
        
class LumberLoadForm(ModelForm):
    class Meta:
        model = LumberLoad
        exclude = ('created_by',)
        
class LogDataForm(ModelForm):
    class Meta:
        model = LogData
        exclude = ('created_by',)

class ScalingTicketForm(ModelForm):
    class Meta:
        model = ScalingTicket
        exclude = ('created_by','created_date')

class SawmillForm(ModelForm):
    class Meta:
        model = Sawmill
        exclude = ('created_by',)
        widgets = {
                   'email':EmailInput(),
                   'website':URLInput(),
                   }



