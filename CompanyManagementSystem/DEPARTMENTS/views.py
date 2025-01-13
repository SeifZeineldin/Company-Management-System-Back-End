from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import Department
from .serializers import DepartmentSerializer
from rest_framework.permissions import IsAuthenticated
from CompanyManagementSystem.core.permissions import *

class DepartmentView(APIView):
    permission_classes = [IsAdmin]
 
    def get(self, request, pk=None):
        print(f"Request Headers: {request.headers}")
        if pk:  
            try:
                company = Department.objects.get(pk=pk)
                serializer = DepartmentSerializer(company)
                return Response(serializer.data)
            except Department.DoesNotExist:
                return Response({"detail": "Department not found."}, status=status.HTTP_404_NOT_FOUND)
        else: 
            companies = Department.objects.all()
            serializer = DepartmentSerializer(companies, many=True)
            return Response(serializer.data)
