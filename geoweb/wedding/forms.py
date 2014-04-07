from wedding.models import *
from django.forms import ModelForm, Form, RadioSelect

class PresentForm(ModelForm):
    class Meta:
        model = Present
        widgets = {
            'is_purchased': RadioSelect(),
        }  