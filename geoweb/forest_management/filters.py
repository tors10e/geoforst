import django_filters
from django_filters import ChoiceFilter, DateFilter, IsoDateTimeFilter
from forest_management.models import PlannedActivity
from forest_management.forms import PlannedActivityFilterForm
from django.db.models.query import QuerySet

STATUS_CHOICES = (
    (0, '2009'),
    (1, '2010'),
    (2, '2011'),
)

class PlannedActivityFilter(django_filters.FilterSet):
    def __init__(self, *args, **kwargs):
         self.user = kwargs.pop('current_user')
         super(PlannedActivityFilter, self).__init__(*args, **kwargs)
        
    class Meta:
        model = PlannedActivity
#         planned_year = ChoiceFilter(choices=STATUS_CHOICES)
#         activity_type = django_filters.
        fields = {
                  'planned_year':['exact'],
                  'acttype':['exact'],
                  'planned_season':['exact'],
                  'taskstatus':['exact'],
                  'landarea':['exact'],
                  'stand_no':['exact'],
                  }
        
        #form = forms.PlannedActivityFilterForm
        #widgets = {
         #           'planned_year': Select(attrs={choices=STATUS_CHOICES)),
          #       }  
 
        #queryset = PlannedActivity.objects.filter(created_by=3)


    

   