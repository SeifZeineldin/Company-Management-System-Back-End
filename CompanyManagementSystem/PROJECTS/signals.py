from django.db.models.signals import post_save, post_delete, pre_save
from django.dispatch import receiver
from .models import Project , EmployeeProject


@receiver(post_save, sender=Project)
def update_project_counts_on_add(sender, instance, created, **kwargs):
    if created:
        company = instance.company_id
        department = instance.department_id

        company.number_of_Projects += 1
        department.number_of_Projects += 1

        company.save()
        department.save()
    else:
        if hasattr(instance, '_original_department'):
            if instance.department_id != instance._original_department:
                original_department = instance._original_department
                original_department.number_of_Projects -= 1
                original_department.save()
                # Increment the new department count
                instance.department.number_of_Projects += 1
                instance.department.save()
        if hasattr(instance, '_original_company'):
            if instance.company_id != instance._original_company:
                # Decrement the original company count
                original_company = instance._original_company
                original_company.number_of_Projects -= 1
                original_company.save()
                # Increment the new company count
                instance.company.number_of_Projects += 1
                instance.company.save()

@receiver(pre_save, sender=Project)
def track_original_relationship(sender, instance, **kwargs):
    if instance.pk:
        original = Project.objects.get(pk=instance.pk)
        instance._original_department = original.department_id
        instance._original_company = original.company_id





@receiver(post_delete, sender=Project)
def update_project_counts_on_delete(sender, instance, **kwargs):
    # Decrement Project counts
    company = instance.company_id
    department = instance.department_id

    company.number_of_Projects -= 1
    department.number_of_Projects -= 1

    company.save()
    department.save()


@receiver(post_save, sender=EmployeeProject)
def update_days_employed(sender, instance, **kwargs):
    employee = instance.employee_id
    total_days = 0
    for employee_project in EmployeeProject.objects.filter(employee=employee):
        project = employee_project.project_id
        if project.start_date and project.end_date:
            total_days += (project.end_date - project.start_date).days

    employee.days_employed = total_days
    employee.save()