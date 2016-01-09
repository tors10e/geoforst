import django_filters
from django_filters import ChoiceFilter, DateFilter, IsoDateTimeFilter
from django.db.models.query import QuerySet

from .models import RoadLine

class RoadFilter(django_filters.FilterSet):
           
    class Meta:
        model = RoadLine
        fields = {
                  'roadsurface':['exact'],
                  }

    def __init__(self, *args, **kwargs):       
         super(RoadFilter, self).__init__(*args, **kwargs)
         

   