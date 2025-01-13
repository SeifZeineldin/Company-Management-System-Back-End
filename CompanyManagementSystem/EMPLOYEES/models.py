from django.db import models
from django.core.exceptions import ValidationError
from COMPANIES.models import Company
from DEPARTMENTS.models import Department , CompanyDepartment
from datetime import date


class Employee(models.Model):
    id=models.AutoField(primary_key=True )
    company_id = models.ForeignKey(Company, on_delete=models.CASCADE, related_name='company_employee')
    department_id = models.ForeignKey(Department, on_delete=models.CASCADE, related_name='department_employee')
    name = models.CharField(max_length=100)
    email = models.EmailField(unique=True)
    mobile_number = models.CharField(max_length=15)
    address = models.TextField()
    designation = models.CharField(max_length=100)
    hired_on = models.DateField(null=True, blank=True)
    days_employed=models.IntegerField(default=0)

    def clean(self):
        if not self.company_id or not self.department_id:
            return

        if not CompanyDepartment.objects.filter(
            company_id=self.company_id, 
            department_id=self.department_id
        ).exists():
            raise ValidationError("The selected department does not belong to the chosen company.")

    def save(self, *args, **kwargs):
        self.clean()
        super().save(*args, **kwargs)


