import django_filters
from django_filters import ChoiceFilter, DateFilter, IsoDateTimeFilter
from django.db.models.query import QuerySet

from .models import BurnCompartment

class BurnCompartmentFilter(django_filters.FilterSet):
           
    class Meta:
        model = BurnCompartment
        fields = {
                  'compartment_set':['exact'],
                  }

    def __init__(self, *args, **kwargs):       
         super(BurnCompartmentFilter, self).__init__(*args, **kwargs)

   