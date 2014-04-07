from __future__ import unicode_literals 
from django.contrib.gis.db import models
from django.contrib.auth.models import User


class Present(models.Model):
    present_id = models.AutoField(primary_key=True)
    count = models.IntegerField(null=True, blank=True)
    name = models.CharField(blank=False, max_length=255)
    is_purchased = models.BooleanField(blank=True)
    description=models.CharField(max_length=255)
    date = models.DateField(blank=True, null=True)
    class Meta:
        db_table = "present"
        ordering = ["present_id"]
    def __unicode__(self):
        return unicode(self.name)   
