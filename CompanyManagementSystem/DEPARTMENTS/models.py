from django.db import models
from COMPANIES.models import Company

class Department(models.Model):
    id=models.IntegerField(primary_key=True , auto_created=True)
    name = models.CharField(max_length=100)
    number_of_employees=models.IntegerField(default=0)
    number_of_projects=models.IntegerField(default=0)

class CompanyDepartment(models.Model):
    company_id = models.ForeignKey(Company, on_delete=models.CASCADE,related_name="CompanyDepartment_Company")
    department_id=models.ForeignKey(Department, on_delete=models.CASCADE,related_name="CompanyDepartment_department")

