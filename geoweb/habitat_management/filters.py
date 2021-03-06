import django_filters
from django_filters import ChoiceFilter, DateFilter, IsoDateTimeFilter
from django.db.models.query import QuerySet

from .models import BurnCompartment, FirebreakLine, HabitatEnhancementArea, HabitatEnhancementPoint

class BurnCompartmentFilter(django_filters.FilterSet):
           
    class Meta:
        model = BurnCompartment
        fields = {
                  'compartment_set':['exact'],
                  }

    def __init__(self, *args, **kwargs):       
         super(BurnCompartmentFilter, self).__init__(*args, **kwargs)

class FirebreakFilter(django_filters.FilterSet):
           
    class Meta:
        model = FirebreakLine
        fields = {
                  'fbkln_id':['exact'],
                  }
        
class HabitatAreaFilter(django_filters.FilterSet):
           
    class Meta:
        model = HabitatEnhancementArea
        fields = {
                  'habenharea_id':['exact'],
                  }
        
class HabitatSiteFilter(django_filters.FilterSet):
           
    class Meta:
        model = HabitatEnhancementPoint
        fields = {
                  'habenhpt_id':['exact'],
                  }

    def __init__(self, *args, **kwargs):       
         super(HabitatSiteFilter, self).__init__(*args, **kwargs)