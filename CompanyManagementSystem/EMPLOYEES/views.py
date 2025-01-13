# views.py
from rest_framework.viewsets import ModelViewSet
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from .models import Employee
from .serializers import EmployeeSerializer
from rest_framework.permissions import BasePermission
from CompanyManagementSystem.core.permissions import *


class EmployeeViewSet(ModelViewSet):
    serializer_class = EmployeeSerializer
    permission_classes = [ IsAdminOrManager] 
    def get_queryset(self):
        user = self.request.user
        return Employee.objects.filter(company_id=user.employee_id.company_id)


    def perform_create(self, serializer):
        user = self.request.user

        if user.employee_id.company_id:
            serializer.save(company_id=user.employee_id.company_id)
        else:
            return Response(
                {"detail": "User does not have a valid company assigned."},
                status=status.HTTP_400_BAD_REQUEST
            )

    def perform_update(self, serializer):
        user = self.request.user
        employee = self.get_object()

        if employee.company_id != user.employee_id.company_id:
            return Response(
                {"detail": "You are not authorized to update employees from another company."},
                status=status.HTTP_400_BAD_REQUEST
            )
        
        serializer.save()