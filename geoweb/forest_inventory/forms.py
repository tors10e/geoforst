from django.contrib.gis import forms 
from django.forms import ModelForm,Textarea, Select
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Submit, Layout, HTML, Fieldset
from crispy_forms.bootstrap import FormActions
from utilities.crispy_forms.bootstrap import SubmitCancelFormActions

from .models import *

class InventoryDataForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super(InventoryDataForm, self).__init__(*args, **kwargs)
        self.helper = FormHelper(self)
        self.helper.form_id = 'id-InventoryDataForm'
        self.helper.form_class = 'form-horizontal'
        self.helper.label_class = 'col-lg-2'
        self.helper.field_class = 'col-lg-8'
        self.helper.form_method = 'post'
 
        self.helper.layout.append(
            FormActions(
                HTML("""<a role="button" class="btn btn-default"
                        href="{% url "forest_inventory:inventory-plot-list" %}">Cancel</a>"""),
                Submit('save', 'Submit'),
        ))     
    
    class Meta:
        model = ForestInventoryData
        exclude = ('created_by','forestinventorydata_id', 'forestinventorydata_uuid')      
        
class InventoryPlotForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super(InventoryPlotForm, self).__init__(*args, **kwargs)
        self.helper = FormHelper(self)
        self.helper.form_id = 'id-InventoryPlotForm'
        self.helper.form_class = 'form-horizontal'
        self.helper.label_class = 'col-lg-2'
        self.helper.field_class = 'col-lg-8'
        self.helper.form_method = 'post'
 
        self.helper.layout.append(
            FormActions(
                HTML("""<a role="button" class="btn btn-default"
                        href="{% url "forest_inventory:inventory-plot-list" %}">Cancel</a>"""),
                Submit('save', 'Submit'),
        ))     
    
    class Meta:
        model = ForestInventoryPlot
        exclude = ('created_by','forestinventoryplot_id', 'forestinventoryplot_uuid')  
