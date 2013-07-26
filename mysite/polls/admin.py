from polls.models import Poll, Choice
from django.contrib import admin

class PollAdmin(admin.ModelAdmin):
    fieldsets = [
        ('Questions',               {'fields': ['question']}),
        ('Date information', {'fields': ['pub_date']}),
    ]
    
admin.site.register(Poll, PollAdmin)

class ChoiceAdmin(admin.ModelAdmin):
    fieldsets = [
                 ('Poll', {'fields':['poll']}),
                 ('Choices', {'fields':['choice_text']}),
                 ('Votes',{'fields':['votes']}),
                 ]
    
admin.site.register(Choice, ChoiceAdmin)