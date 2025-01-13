
from rest_framework.views import APIView
from rest_framework.generics import CreateAPIView
from rest_framework.response import Response
from rest_framework.authtoken.models import Token
from rest_framework.exceptions import AuthenticationFailed
from django.contrib.auth import authenticate
from django.contrib.auth import get_user_model
from .serializers import UserAccountSerializer

User = get_user_model()

class LoginAPIView(APIView):
    def post(self, request):
        email = request.data.get('email')
        password = request.data.get('password')

        user = authenticate(request, username=email, password=password)
        if not user:
            raise AuthenticationFailed("Invalid email or password")
        token, _ = Token.objects.get_or_create(user=user)
        userName=None
        if user.employee_id:
            userName=user.employee_id.name
        return Response({
            "token": token.key,
            "user": {
                "id": user.id,
                "email": user.email,
                "username": userName,
                "role": getattr(user, 'role', None) 
            }
        })


class UserAccountCreateView(CreateAPIView):
    serializer_class = UserAccountSerializer


