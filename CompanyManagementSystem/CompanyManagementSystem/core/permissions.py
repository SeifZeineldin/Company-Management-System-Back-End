# permissions.py

from rest_framework.permissions import BasePermission

class IsAdmin(BasePermission):
    def has_permission(self, request, view):
        return request.user.is_authenticated and request.user.role == 'admin'


class IsEmployee(BasePermission):
    def has_permission(self, request, view):
        return request.user.is_authenticated and request.user.role == 'employee'

class IsManager(BasePermission):
    def has_permission(self, request, view):
        return request.user.is_authenticated and request.user.role == 'manager'
    
class IsAdminOrEmployee(BasePermission):
    def has_permission(self, request, view):
        return request.user.is_authenticated and request.user.role in ['admin', 'employee']

class IsAdminOrManager(BasePermission):
    def has_permission(self, request, view):
        SAFE_METHODS=['get']
        if request.user.is_authenticated and request.user.role == 'admin':
            return True
        if request.user.is_authenticated and request.user.role == 'manager' and request.method in SAFE_METHODS:
            return True
        return False
