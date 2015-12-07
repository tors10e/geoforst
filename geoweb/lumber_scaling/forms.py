# Third-party libraries
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Submit, Layout, HTML, Fieldset
from crispy_forms.bootstrap import FormActions
from utilities.crispy_forms.bootstrap import SubmitCancelFormActions

# Django modules
from django.forms import *
from lumber_scaling.models import *
from django.contrib.gis import forms 
from django.forms.widgets import TextInput, HiddenInput
from django.forms import ModelForm
from django.db.models.fields import DecimalField, CharField
import email
from django.db.models.query import QuerySet


class LumberLoadForm(ModelForm):
    class Meta:
        model = LumberLoad
        exclude = ('created_by',)
        
class LogDataForm(ModelForm):
    class Meta:
        model = LogData
        exclude = ('created_by',)

class ScalingTicketForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super(ScalingTicketForm, self).__init__(*args, **kwargs)
        self.helper = FormHelper(self)
        self.helper.form_id = 'id-ScalingticketForm'
        self.helper.form_class = 'form-horizontal'
        self.helper.label_class = 'col-lg-2'
        self.helper.field_class = 'col-lg-8'
        self.helper.form_method = 'post'
        
        self.helper.layout.append(
            FormActions(
                HTML("""<a role="button" class="btn btn-default"
                        href="{% url "lumber_scaling:scaling-ticket-list" %}">Cancel</a>"""),
                Submit('save', 'Submit'),
        ))  
        
    class Meta:
        model = ScalingTicket
        exclude = ('created_by','created_date')

class SawmillForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super(SawmillForm, self).__init__(*args, **kwargs)
        self.helper = FormHelper(self)
        self.helper.form_id = 'id-SawmillForm'
        self.helper.form_class = 'form-horizontal'
        self.helper.label_class = 'col-lg-2'
        self.helper.field_class = 'col-lg-8'
        self.helper.form_method = 'post'
 
        self.helper.layout.append(
            FormActions(
                HTML("""<a role="button" class="btn btn-default"
                        href="{% url "lumber_scaling:sawmill-list" %}">Cancel</a>"""),
                Submit('save', 'Submit'),
        ))     
    
    class Meta:
        model = Sawmill
        exclude = ('created_by','sawmill_id')      



