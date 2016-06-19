from django_filters import ChoiceFilter, DateFilter, IsoDateTimeFilter, FilterSet
from .models import *

class PlannedActivityFilter(FilterSet):
           
    class Meta:
        model = PlannedActivity
        fields = {
                  'planned_year':['exact'],
                  'acttype':['exact'],
                  'seasontype':['exact'],
                  'taskstatus':['exact'],
                  'landarea':['exact'],
                  'stand_no':['exact'],
                  }

    def __init__(self, *args, **kwargs):       
         super(PlannedActivityFilter, self).__init__(*args, **kwargs)

class LandAreaFilter(FilterSet):
    """ Filter object for land areas."""
    
    class Meta:
        model = LandArea
        fields = {
                  'name':['exact'],
                  }
    
    def __init__(self, *args, **kwargs):
        super(LandAreaFilter, self).__init__(*args, **kwargs)
   