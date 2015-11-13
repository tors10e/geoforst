import django_filters
from django_filters import ChoiceFilter, DateFilter, IsoDateTimeFilter
from forest_management.models import PlannedActivity
from forest_management import forms 
from django.db.models.query import QuerySet

STATUS_CHOICES = (
    (0, '2009'),
    (1, '2010'),
    (2, '2011'),
)

class PlannedActivityFilter(django_filters.FilterSet):
    class Meta:
        model = PlannedActivity
        planned_date = django_filters.DateTimeFilter()
        #planned_year = django_filters.NumberFilter(lookup_type='exact', widget=forms.CheckboxInput)
        #planned_year = ChoiceFilter(choices=STATUS_CHOICES)
        #planned_date = DateFilter();
        fields = [
                  'planned_year', 
                  'acttype', 
                  'taskstatus', 
                  'landarea', 
                  'stand_no',]
        #form = forms.PlannedActivityFilterForm
        #together = ['planned_year', 'planned_date']
        #widgets = {
         #           'planned_year': Select(attrs={choices=STATUS_CHOICES)),
          #       }  
         #   def get_queryset(self):
        #return PlannedActivity.objects.filter(created_by=self.request.user)
        queryset = PlannedActivity.objects.filter(created_by=3)
       # def get_queryset(self):
        #     return PlannedActivity.objects.filter(created_by=self.request.user)
          
   