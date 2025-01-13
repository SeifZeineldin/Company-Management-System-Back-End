from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django.db import models
from EMPLOYEES.models import Employee

class CustomUserManager(BaseUserManager):
    def create_user(self, email, **extra_fields):
        if not email:
            raise ValueError("The Email field is required")
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.save(using=self._db)
        return user

class UserAccount(AbstractBaseUser):
    email = models.EmailField(unique=True)
    role = models.CharField(max_length=50, choices=[('admin', 'Admin'), ('employee', 'Employee'),('manager','Manager')])
    is_active = models.BooleanField(default=True)
    employee_id = models.ForeignKey(Employee , on_delete= models.CASCADE,related_name="employee_account")
    objects = CustomUserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

  