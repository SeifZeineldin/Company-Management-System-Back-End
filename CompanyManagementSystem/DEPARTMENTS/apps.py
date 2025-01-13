from django.apps import AppConfig


class DepartmentsConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "DEPARTMENTS"
    def ready(self):
        import DEPARTMENTS.signals
