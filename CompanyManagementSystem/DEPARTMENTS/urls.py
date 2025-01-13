from django.urls import path
from .views import DepartmentView

urlpatterns = [
    path('', DepartmentView.as_view(), name='company-list'), 
    path('<int:pk>/', DepartmentView.as_view(), name='company-detail'),  
]