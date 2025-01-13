from rest_framework import serializers
from .models import ReviewCycle

class assignEmployeeSerializer(serializers.ModelSerializer):
    class Meta:
        model = ReviewCycle
        fields = [
            'employee', 
            'manager', 
            'stage', 
            'review_date', 
            'feedback', 
            'created_at', 
            'updated_at'
        ]
