from django.views import generic

from geoforst.models import StandArea

class StandAreaView(generic.ListView):
    model = StandArea
    template_name = 'geoforst/index.html'
    context_object_name = 'test_context_object_name'# Create your views here.
