# Company-Management-System-Back-End

## 1. Approach and Implementation Details

This project implements a **Company Management System** with features to manage companies, departments, employees, projects, and an **Employee Performance Review Cycle**. The system includes:
- A workflow for the **Employee Review Cycle** with distinct stages and transitions.
- Role-based access control (RBAC) to ensure security and proper data handling.
- Dynamic stage management via the `Stage` model to allow flexibility in the review process.

---

## 2. Setup and Run Instructions



### Installation Steps
1. Clone the repository:
   ```bash
   git clone [https://github.com/username/repository-name.git](https://github.com/SeifZeineldin/Company-Management-System-Back-End.git]
   cd Company-Management-System-Back-End

----
## 3.Task Completion Checklist

 - [x] Design and implementation of the ReviewCycle and Stage models.
 - [x] APIs for managing companies, departments, employees, and review cycles.
 - [x] Workflow for Employee Review Cycle, including valid stage transitions.
 - [x] Role-based access control for managers and employees.
 - [x] Data validation and security checks.
 - [x] postman collection.



----
## 4.Assumptions
1. Our roles is (admin , employee , manager)
2. only admin can see any comapany and any department , create Employee and assigned he to account 
3. only manager can create Pending Review and Aproval or reject review
4. only employee can create Review Scheduled and Feedback Provided









