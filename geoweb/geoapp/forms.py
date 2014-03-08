from django.forms import Textarea
#from geoapp.models import ForestInventoryPlot, ForestInventoryData, LumberLoad, LogData, ScalingTicket, Sawmill
from geoapp.models import *
from django.contrib.gis import forms 
from geoapp import custom_widgets 
from django.contrib.gis.forms.widgets import OpenLayersWidget
from django.forms.widgets import TextInput, HiddenInput
from django.forms import ModelForm
from django.db.models.fields import DecimalField, CharField

class InventoryPlotForm(ModelForm):
    latitude = forms.DecimalField()

    def save(self, commit=True):
        model_instance = super(InventoryPlotForm, self).save(commit=False)
        result = super(InventoryPlotForm, self).save(commit=True)
        model_instance.latitude = self.cleaned_data['latitude']
        model_instance.save()
        return result
    
    class Meta:
        model = ForestInventoryPlot
        widgets = {
            'position_description': Textarea(attrs={'cols': 80, 'rows': 5}),
            'geometry' : TextInput(attrs={"size":75}),
        }  
        fields = {"position_description", "plot_number", "elevation", "elevation_unit", "plot_create_date" }
    

# class InventoryPlotForm(forms.Form):
#     plot_number = forms.IntegerField()
#     position_description = forms.CharField(max_length=100)
#     latitude = forms.DecimalField()
#     longitude = forms.DecimalField()
#     elevation = forms.IntegerField()
#     elevation_unit= forms.CharField()
#     plot_create_date = forms.DateField()
          
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
        
class PlannedActivityForm(ModelForm):
        class Meta:
            model = PlannedActivity
            exclude = ('created_by','plannedact_id')
            widgets = {
                       'description': Textarea(attrs={'cols': 80, 'rows': 5}),
            }  
        ('created_by',)