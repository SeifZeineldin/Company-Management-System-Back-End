from rest_framework.authtoken.models import Token
from rest_framework.exceptions import AuthenticationFailed

class TokenValidationMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response
    def __call__(self, request):
        self.process_request(request)
        response = self.get_response(request)
        return response
    
    
    def process_request(self, request):
        token_key = request.headers.get('Authorization')
        if token_key:
            try:
                token = Token.objects.get(key=token_key)
                print(Token.user)
                request.user = token.user
            except Token.DoesNotExist:
                request.user = None
        else:
            request.user = None

        return request
