from django.urls import path
from .views import LoginAPIView , UserAccountCreateView

urlpatterns = [
    path('login', LoginAPIView.as_view(), name='login'),
    path('create', UserAccountCreateView.as_view(), name='login'),
]
