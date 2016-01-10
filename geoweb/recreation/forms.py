from django.forms import ModelForm,Textarea, Select
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Submit, Layout, HTML, Fieldset
from crispy_forms.bootstrap import FormActions
from utilities.crispy_forms.bootstrap import SubmitCancelFormActions
from mapping import widgets

from .models import Trail, CulturalPoint, RecreationPoint

class TrailForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super(TrailForm, self).__init__(*args, **kwargs)
        self.helper = FormHelper(self)
        self.helper.form_id = 'id-TrailForm'
        self.helper.form_class = 'form-horizontal'
        self.helper.label_class = 'col-lg-2'
        self.helper.field_class = 'col-lg-8'
        self.helper.form_method = 'post'
 
        self.helper.layout.append(
            FormActions(
                HTML("""<a role="button" class="btn btn-default"
                        href="{% url "recreation:trail-list" %}">Cancel</a>"""),
                Submit('save', 'Submit'),
        ))     
    
    class Meta:
        model = Trail
        exclude = ('created_by','trail_id', 'trail_uuid')  
        widgets =  {'geometry':widgets.GeowebOpenLayersWidget}  
        
class CulturalPointForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super(CulturalPointForm, self).__init__(*args, **kwargs)
        self.helper = FormHelper(self)
        self.helper.form_id = 'id-CulturalPointForm'
        self.helper.form_class = 'form-horizontal'
        self.helper.label_class = 'col-lg-2'
        self.helper.field_class = 'col-lg-8'
        self.helper.form_method = 'post'
 
        self.helper.layout.append(
            FormActions(
                HTML("""<a role="button" class="btn btn-default"
                        href="{% url "recreation:cultural-point-list" %}">Cancel</a>"""),
                Submit('save', 'Submit'),
        ))     
    
    class Meta:
        model = CulturalPoint
        exclude = ('created_by','culturalpt_id')  
        widgets =  {'geometry':widgets.GeowebOpenLayersWidget}  
        
class RecreationPointForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super(RecreationPointForm, self).__init__(*args, **kwargs)
        self.helper = FormHelper(self)
        self.helper.form_id = 'id-RecreationPointForm'
        self.helper.form_class = 'form-horizontal'
        self.helper.label_class = 'col-lg-2'
        self.helper.field_class = 'col-lg-8'
        self.helper.form_method = 'post'
 
        self.helper.layout.append(
            FormActions(
                HTML("""<a role="button" class="btn btn-default"
                        href="{% url "recreation:recreation-point-list" %}">Cancel</a>"""),
                Submit('save', 'Submit'),
        ))     
    
    class Meta:
        model = RecreationPoint
        exclude = ('created_by','recreationpt_id')  
        widgets =  {'geometry':widgets.GeowebOpenLayersWidget}  