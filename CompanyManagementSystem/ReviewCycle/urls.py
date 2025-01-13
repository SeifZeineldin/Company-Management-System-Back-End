from django.urls import path
from .views import *

urlpatterns = [
    path('assign-employee', AssignEmployeeView.as_view(), name='assign-employee'),  
    path('set-review-date/<int:pk>/', SetReviewDateView.as_view(), name='set-review-date'), 
    path('add-feedback/<int:pk>/', AddFeedbackView.as_view(), name='add-feedback'), 
    path('under-approval/<int:pk>/', UnderApprovalView.as_view(), name='add-feedback'), 
    path('review-approval/<int:pk>/', ReviewApprovalView.as_view(), name='review-approval'),  


]
