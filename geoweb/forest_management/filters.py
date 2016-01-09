import django_filters
from django_filters import ChoiceFilter, DateFilter, IsoDateTimeFilter
from .models import *
from django.db.models.query import QuerySet

class PlannedActivityFilter(django_filters.FilterSet):
           
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

class LandAreaFilter(django_filters.FilterSet):
    """ Filter object for land areas."""
    
    class Meta:
        model = LandArea
        fields = {
                  'name':['exact'],
                  }
    
    def __init__(self, *args, **kwargs):
        super(LandAreaFilter, self).__init__(*args, **kwargs)
   