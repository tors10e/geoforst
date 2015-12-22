import django_filters
from django_filters import ChoiceFilter, DateFilter, IsoDateTimeFilter
from django.db.models.query import QuerySet

from .models import *

class InventoryPlotFilter(django_filters.FilterSet):
           
    class Meta:
        model = ForestInventoryPlot
        fields = {
                  'plot_number':['exact'],
                  }

    def __init__(self, *args, **kwargs):       
         super(InventoryPlotFilter, self).__init__(*args, **kwargs)
         
class InventoryDataFilter(django_filters.FilterSet):
           
    class Meta:
        model = ForestInventoryData
        fields = {
                  'speciestreetype_id':['exact'],
                  }

    def __init__(self, *args, **kwargs):       
         super(InventoryDataFilter, self).__init__(*args, **kwargs)


   