from django.forms import ModelForm,Textarea, Select
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Submit, Layout, HTML, Fieldset
from crispy_forms.bootstrap import FormActions
from utilities.crispy_forms.bootstrap import SubmitCancelFormActions
from mapping import widgets

from .models import BurnCompartment

class BurnCompartmentForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super(BurnCompartmentForm, self).__init__(*args, **kwargs)
        self.helper = FormHelper(self)
        self.helper.form_id = 'id-BurnCompartmentForm'
        self.helper.form_class = 'form-horizontal'
        self.helper.label_class = 'col-lg-2'
        self.helper.field_class = 'col-lg-8'
        self.helper.form_method = 'post'
 
        self.helper.layout.append(
            FormActions(
                HTML("""<a role="button" class="btn btn-default"
                        href="{% url "habitat_management:burn-compartment-list" %}">Cancel</a>"""),
                Submit('save', 'Submit'),
        ))     
    
    class Meta:
        model = BurnCompartment
        exclude = ('created_by', 'burncompartment_id')  
        widgets =  {'geometry':widgets.GeowebOpenLayersWidget}  
        
