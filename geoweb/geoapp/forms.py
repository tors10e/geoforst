from django.forms import ModelForm
from geoapp.models import ForestInventoryPlot

class InventoryPlotForm(ModelForm):
    class Meta:
        model = ForestInventoryPlot
        fields = ['forestinventoryplot_id', 'plot_area_ft2', 'plot_radius_ft','plot_length_x_ft',
                  'plot_length_y_ft', 'plot_geometry', 'elevation', 'position_description', 
                  'plot_create_date']
        
    