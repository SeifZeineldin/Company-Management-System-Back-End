from django.db import models


class Company(models.Model):
    id=models.IntegerField(primary_key=True , auto_created=True)
    name = models.CharField(max_length=100)
    number_of_departments=models.IntegerField(default=0)
    number_of_employees=models.IntegerField(default=0)
    number_of_projects=models.IntegerField(default=0)


