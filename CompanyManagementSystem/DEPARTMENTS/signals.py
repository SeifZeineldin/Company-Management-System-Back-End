from django.dispatch import receiver
from django.db.models.signals import pre_save, post_save, post_delete

from .models import CompanyDepartment



@receiver(pre_save, sender=CompanyDepartment)
def track_original_relationship(sender, instance, **kwargs):
    if instance.pk: 
        original_instance = CompanyDepartment.objects.get(pk=instance.pk)
        instance._original_company_id = original_instance.company_id
        instance._original_department_id = original_instance.department_id

@receiver(post_save, sender=CompanyDepartment)
def update_number_of_departments_on_company(sender, instance, created, **kwargs):
    if created:  
        company = instance.company_id
        company.number_of_departments += 1
        company.save()
    else:
        original_company = getattr(instance, "_original_company_id", None)
        if original_company:
            original_company.number_of_departments -= 1
            original_company.save()

        new_company = instance.company_id
        new_company.number_of_departments += 1
        new_company.save()
        
    

@receiver(post_delete, sender=CompanyDepartment)
def update_number_of_departments_on_company(sender, instance, **kwargs):
    company = instance.company_id
    company.number_of_departments -= 1
    company.save()

