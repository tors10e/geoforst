from django.forms import ModelForm
from geoapp.models import ForestInventoryPlot, ForestInventoryData


class InventoryPlotForm(ModelForm):
    class Meta:
        model = ForestInventoryPlot
        exclude = ('created_by',)
        
        
class InventoryDataForm(ModelForm):
    class Meta:
        model = ForestInventoryData
        exclude = ('created_by',)
        
    