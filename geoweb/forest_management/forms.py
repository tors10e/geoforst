from forest_management.models import PlannedActivity
from django.contrib.gis import forms 
from django.forms import ModelForm,Textarea, Select
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Submit, Layout, HTML, Fieldset
from crispy_forms.bootstrap import FormActions
from utilities.crispy_forms.bootstrap import SubmitCancelFormActions

class PlannedActivityForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super(PlannedActivityForm, self).__init__(*args, **kwargs)
        self.helper = FormHelper(self)
        self.helper.form_id = 'id-PlannedActivityForm'
        self.helper.form_class = 'form-horizontal'
        self.helper.label_class = 'col-lg-2'
        self.helper.field_class = 'col-lg-8'
        self.helper.form_method = 'post'
 
        self.helper.layout.append(
            FormActions(
                HTML("""<a role="button" class="btn btn-default"
                        href="{% url "forest_management:planned-activity-list" %}">Cancel</a>"""),
                Submit('save', 'Submit'),
        ))     
    
    class Meta:
        model = PlannedActivity
        exclude = ('created_by','plannedact_id')      
 
    
class PlannedActivityFilterForm(ModelForm):
    class Meta:
        model = PlannedActivity
        fields = ()
    ('created_by',)