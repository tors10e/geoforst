from django.forms import Textarea
from geoapp.models import ForestInventoryPlot, ForestInventoryData, LumberLoad, LogData, ScalingTicket, Sawmill
from django.contrib.gis import forms 
from geoapp import custom_widgets 
from django.contrib.gis.forms.widgets import OpenLayersWidget
from django.forms.widgets import TextInput
from django.forms import ModelForm

class InventoryPlotForm(ModelForm):
    class Meta:
        model = ForestInventoryPlot
        exclude = ('created_by','geometry') # Geometry field is temporarily suspended and replaced with lat/long.
        widgets = {
            'position_description': Textarea(attrs={'cols': 80, 'rows': 5}),
#            'geometry': custom_widgets.LatLongField(attrs={'size'   :50}),
            'geometry':TextInput(attrs={'size':75}),
#            'geometry':custom_widgets.LatLongField(),
        }  
             
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
        exclude = ('created_by')
        exclude = ('created_by',)