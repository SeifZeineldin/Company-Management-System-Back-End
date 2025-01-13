from django.db import models
from django.core.exceptions import ValidationError
from COMPANIES.models import Company
from DEPARTMENTS.models import Department , CompanyDepartment
from EMPLOYEES.models import Employee

class Project(models.Model):
    company_id = models.ForeignKey(Company, on_delete=models.CASCADE,related_name='Project_comapny')
    department_id = models.ForeignKey(Department, on_delete=models.CASCADE,related_name='project_department')
    name = models.CharField(max_length=100)
    description = models.TextField()
    start_date = models.DateField()
    end_date = models.DateField()

    def __str__(self):
        return self.name

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






class EmployeeProject(models.Model):
    employee_id = models.ForeignKey(Employee, on_delete=models.CASCADE,related_name='EmployeeProject_Employee')
    project_id = models.ForeignKey(Project, on_delete=models.CASCADE,related_name='EmployeeProject_project')
    
    def clean(self):
        if self.employee.company_id != self.project.company_id:
            raise ValidationError("Employee must belong to the same company as the project.")
        if self.employee.department_id != self.project.department_id:
            raise ValidationError("Employee must belong to the same department as the project.")
    
    def __str__(self):
        return f"{self.employee.name} - {self.project.name}"
