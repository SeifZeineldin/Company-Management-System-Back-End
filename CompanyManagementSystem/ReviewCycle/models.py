from django.db import models
from django.core.exceptions import ValidationError
from EMPLOYEES.models import Employee
from USER_ACCOUNTS.models import UserAccount


class Stage(models.Model):
    id=models.AutoField(primary_key=True)
    name = models.CharField(max_length=50, unique=True)
    description = models.TextField(blank=True, null=True)
    next_stage = models.ManyToManyField('self', blank=True, symmetrical=False, related_name='previous_stage')




class ReviewCycle(models.Model):

    id=models.AutoField(primary_key=True)
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE, related_name="review_cycles_employee")
    manager = models.ForeignKey(Employee, on_delete=models.CASCADE,related_name="review_cycles_manager")
    stage = models.ForeignKey(Stage,on_delete=models.CASCADE, default=1)
    review_date = models.DateField(null=True, blank=True)
    feedback = models.TextField(null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        constraints = [
            models.UniqueConstraint(fields=['employee', 'stage'], name="unique_employee_stage")
        ]

    def clean(self):
        if self.manager.company_id != self.employee.company_id:
            raise ValidationError("The manager must belong to the same company as the employee.")
        
        # Validate stage transitions using next_stage from the Stage model
        if self.pk:  
            previous_stage = ReviewCycle.objects.get(pk=self.pk).stage
            if self.stage not in previous_stage.next_stage.all():
                raise ValidationError(f"Invalid stage transition from {previous_stage} to {self.stage}.")

    def save(self, *args, **kwargs):
        self.clean()
        super().save(*args, **kwargs)

    def __str__(self):
        return f"ReviewCycle: {self.employee.name} ({self.stage})"