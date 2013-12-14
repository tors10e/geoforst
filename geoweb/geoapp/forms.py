from django.forms import Textarea
from geoapp.models import ForestInventoryPlot, ForestInventoryData, LumberLoad, LogData
from django.contrib.gis import forms 
from geoapp import custom_widgets 
from django.contrib.gis.forms.widgets import OpenLayersWidget
from django.forms.widgets import TextInput

class InventoryPlotForm(forms.ModelForm):
    class Meta:
        model = ForestInventoryPlot
        exclude = ('created_by','geometry') # Geometry field is temporarily suspended and replaced with lat/long.
        widgets = {
            'position_description': Textarea(attrs={'cols': 80, 'rows': 5}),
#            'geometry': custom_widgets.LatLongField(attrs={'size'   :50}),
            'geometry':TextInput(attrs={'size':75}),
#            'geometry':custom_widgets.LatLongField(),
        }  
             
class InventoryDataForm(forms.ModelForm):
    class Meta:
        model = ForestInventoryData
        exclude = ('created_by',)
        
class LumberLoadForm(forms.ModelForm):
    class Meta:
        model = LumberLoad
        exclude = ('created_by',)
        
class LogDataForm(forms.ModelForm):
    class Meta:
        model = LogData
        exclude = ('created_by',)