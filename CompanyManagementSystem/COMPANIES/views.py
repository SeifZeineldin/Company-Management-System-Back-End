from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import Company
from .serializers import CompanySerializer
from rest_framework.permissions import IsAuthenticated
from CompanyManagementSystem.core.permissions import *

class CompanyView(APIView):
    permission_classes = [IsAdmin]

    def get(self, request, pk=None):
        print(f"Request Headers: {request.headers}")
        if pk:  
            try:
                company = Company.objects.get(pk=pk)
                serializer = CompanySerializer(company)
                return Response(serializer.data)
            except Company.DoesNotExist:
                return Response({"detail": "Company not found."}, status=status.HTTP_404_NOT_FOUND)
        else: 
            companies = Company.objects.all()
            serializer = CompanySerializer(companies, many=True)
            return Response(serializer.data)
