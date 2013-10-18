from django.forms import ModelForm
from geoapp.models import ForestInventoryPlot, ForestInventoryData


class InventoryPlotForm(ModelForm):
    class Meta:
        model = ForestInventoryPlot
        fields = ['forestinventoryplot_id', 'plot_area', 'plot_area_unit','plot_radius', 'radius_unit', 'plot_xlength', 'plot_xlength_unit',
                  'plot_ylength', 'plot_ylength_unit', 'plot_geometry', 'elevation', 'elevation_unit','position_description', 
                  'plot_create_date']
        exclude = ('created_by',)
        
        
class InventoryDataForm(ModelForm):
    class Meta:
        model = ForestInventoryData
        fields = ['forestinventorydata_id', 'forestinventoryplot', 'tree', 'collection_date', 
                  'tree_species', 'dbh', 'height']
        exclude = ('created_by',)
        
    