# Django modules
import django_filters
from django_filters import ChoiceFilter, DateFilter, IsoDateTimeFilter
from django.db.models.query import QuerySet

# Django apps
from lumber_scaling.models import *

class LumberLoadFilter(django_filters.FilterSet):
           
    class Meta:
        model = LumberLoad
        fields = {
                  'load_date':['exact'],
                  }

    def __init__(self, *args, **kwargs):      
         super(LumberLoadFilter, self).__init__(*args, **kwargs)
         
class SawmillFilter(django_filters.FilterSet):
           
    class Meta:
        model = Sawmill
        fields = {
                  'name':['exact'],
                  }

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



   