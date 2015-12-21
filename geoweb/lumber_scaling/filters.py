# Django modules
import django_filters 
from django_filters import ChoiceFilter, DateFilter, IsoDateTimeFilter, MethodFilter, FilterSet
from django.db.models.query import QuerySet

# Django apps
from lumber_scaling.models import *
from django_filters.filters import ModelChoiceFilter

class LumberLoadFilter(django_filters.FilterSet):
           
    class Meta:
        model = LumberLoad
        fields = {
                  'load_date':['exact'],
                  }

    def __init__(self, *args, **kwargs):      
         super(LumberLoadFilter, self).__init__(*args, **kwargs)
         
class SawmillFilter(django_filters.FilterSet):         
    name = django_filters.AllValuesFilter(lookup_type='exact', distinct=True)
    state = django_filters.AllValuesFilter(lookup_type='exact', distinct=True)
    city = django_filters.AllValuesFilter(lookup_type='exact', distinct=True)
    class Meta:
        model = Sawmill
        fields =['name', 'city', 'state']

    def __init__(self, *args, **kwargs):       
         super(SawmillFilter, self).__init__(*args, **kwargs)     

    
class ScalingTicketFilter(django_filters.FilterSet):
           
    class Meta:
        model = ScalingTicket
        fields = {
                  'sawmill':['exact'],
                  }

    def __init__(self, *args, **kwargs):     
         super(ScalingTicketFilter, self).__init__(*args, **kwargs)



   