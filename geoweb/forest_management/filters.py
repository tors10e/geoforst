import django_filters
from django_filters import ChoiceFilter, DateFilter, IsoDateTimeFilter
from forest_management.models import PlannedActivity
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


   