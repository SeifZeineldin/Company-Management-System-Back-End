# users/serializers.py
from rest_framework import serializers
from django.contrib.auth import get_user_model

User = get_user_model()

class UserAccountSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)

    class Meta:
        model = User
        fields = ['email', 'password', 'role','employee_id']
        extra_kwargs = {
            'password': {'write_only': True}
        }

    def create(self, validated_data):
        user = User.objects.create_user(
            email=validated_data['email'],
            role=validated_data['role'],
            employee_id=validated_data['employee_id'],
        )
        # Set the password using set_password, which hashes it
        user.set_password(validated_data['password'])
        user.save()
        return user

