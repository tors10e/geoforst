import django_filters
from django_filters import ChoiceFilter, DateFilter, IsoDateTimeFilter
from django.db.models.query import QuerySet

from .models import Trail, CulturalPoint, RecreationPoint

class TrailFilter(django_filters.FilterSet):
           
    class Meta:
        model = Trail
        fields = {
                  'trail_name':['exact'],
                  }

    def __init__(self, *args, **kwargs):       
         super(TrailFilter, self).__init__(*args, **kwargs)

class CulturalPointFilter(django_filters.FilterSet):
           
    class Meta:
        model = CulturalPoint
        fields = {
                  'description':['exact'],
                  }

    def __init__(self, *args, **kwargs):       
         super(CulturalPointFilter, self).__init__(*args, **kwargs)
         
class RecreationPointFilter(django_filters.FilterSet):
           
    class Meta:
        model = RecreationPoint
        fields = {
                  'description':['exact'],
                  }

    def __init__(self, *args, **kwargs):       
         super(RecreationPointFilter, self).__init__(*args, **kwargs)

   