from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from rest_framework import status
from .models import ReviewCycle, Stage
from EMPLOYEES.models import Employee
from .serializers import assignEmployeeSerializer
from CompanyManagementSystem.core.permissions import *

class AssignEmployeeView(APIView):
    permission_classes = [IsManager]

    def post(self, request):
        user = request.user
        employee_id = request.data.get("employee_id")
        try:
            employee = Employee.objects.get(pk=employee_id, employee_account__role='employee')
        except Employee.DoesNotExist:
            return Response({"error": "Employee does not exist or is not valid."}, status=status.HTTP_404_NOT_FOUND)
        review = ReviewCycle.objects.create(
            employee=employee,
            manager=user.employee_id,
            stage=Stage.objects.get(pk=1)
        )
        serializer = assignEmployeeSerializer(review)
        return Response(serializer.data, status=status.HTTP_201_CREATED)


class SetReviewDateView(APIView):
    permission_classes = [IsEmployee]

    def patch(self, request, pk):
        user = request.user

        try:
            review = ReviewCycle.objects.get(pk=pk, employee=user.employee_id.pk)                
        except ReviewCycle.DoesNotExist:
            return Response({"error": "Review not found or not assigned to you."}, status=status.HTTP_404_NOT_FOUND)

        if review.stage != Stage.objects.get(pk=1):
            return Response({"error": "You can only set the review date at the 'Pending Review' stage."}, status=status.HTTP_400_BAD_REQUEST)

        review.review_date = request.data.get("review_date")
        review.stage = Stage.objects.get(pk=2)
        review.save()

        return Response({"message": "Review date set successfully."}, status=status.HTTP_200_OK)

class AddFeedbackView(APIView):
    permission_classes = [IsEmployee]

    def patch(self, request, pk):
        user = request.user

       

        try:
            review = ReviewCycle.objects.get(pk=pk, employee=user.employee_id)
        except ReviewCycle.DoesNotExist:
            return Response({"error": "Review not found or not assigned to you."}, status=status.HTTP_404_NOT_FOUND)

        if review.stage != Stage.objects.get(pk=2):
            return Response({"error": "You can only provide feedback at the 'Review Scheduled' stage."}, status=status.HTTP_400_BAD_REQUEST)

        review.feedback = request.data.get("feedback")
        review.stage = Stage.objects.get(pk=3)
        review.save()

        return Response({"message": "Feedback provided successfully."}, status=status.HTTP_200_OK)
    

class UnderApprovalView(APIView):
    permission_classes = [IsManager]

    def patch(self, request, pk):
        user = request.user

        try:
            review = ReviewCycle.objects.get(pk=pk, employee=user.employee_id)
        except ReviewCycle.DoesNotExist:
            return Response({"error": "Review not found or not assigned to you."}, status=status.HTTP_404_NOT_FOUND)

        if review.stage != Stage.objects.get(pk=3):
            return Response({"error": "You can only provide feedback at the 'Review Scheduled' stage."}, status=status.HTTP_400_BAD_REQUEST)

        review.stage = Stage.objects.get(pk=4)
        review.save()

        return Response({"message": "Stage is under approval successfully."}, status=status.HTTP_200_OK)


class ReviewApprovalView(APIView):
    permission_classes = [IsManager]

    def patch(self, request, pk):
        user = request.user

 
        try:
            review = ReviewCycle.objects.get(pk=pk, manager=user.employee_id)
        except ReviewCycle.DoesNotExist:
            return Response({"error": "Review not found or not managed by you."}, status=status.HTTP_404_NOT_FOUND)

        if review.stage != Stage.objects.get(pk=3):
            return Response({"error": "You can only approve or reject reviews at the 'Under Approval' stage."}, status=status.HTTP_400_BAD_REQUEST)

        action = request.data.get("action")
        if action == "approve":
            review.stage = Stage.objects.get(pk=5)
        elif action == "reject":
            review.stage = Stage.objects.get(pk=6)
        else:
            return Response({"error": "Invalid action. Use 'approve' or 'reject'."}, status=status.HTTP_400_BAD_REQUEST)

        review.save()
        return Response({"message": f"Review {action}d successfully."}, status=status.HTTP_200_OK)
