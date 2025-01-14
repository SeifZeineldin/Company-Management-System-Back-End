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
   git clone https://github.com/SeifZeineldin/Company-Management-System-Back-End.git
   cd Company-Management-System-Back-End
2. Create and Activate a Virtual Environment
   ```bash
      # Create a virtual environment
      python -m venv env

      # Activate the virtual environment
      # For Linux/Mac:
      source env/bin/activate

      # For Windows:
      env\Scripts\activate
3. Install Dependencies
   ```bash
      pip install -r requirements.txt
4.Connect with database
   1.open setting.py file
   ```bash
      DATABASES = {
          'default': {
              'ENGINE': 'django.db.backends.mysql',
              'NAME': 'your_database_name',
              'USER': 'your_username',
              'PASSWORD': 'your_password',
              'HOST': 'localhost',  # Or your database server's hostname
              'PORT': '3306',       # Default MySQL port
          }
      }

5. Import Database Tables
   Ensure your MySQL server is running.
   Navigate to the DataBase folder in your repository:
   ```bash
      cd DataBase
   Import the tables using the SQL dump files in the folder:
   ```bash
   mysql -u your_username -p your_database_name < table1.sql
   mysql -u your_username -p your_database_name < table2.sql
   # Repeat for all files in the folder.
6. Apply Migrations
   ```bash
   python manage.py migrate
7. Run Server
```bash
   python manage.py runserver




## 3.Postman Collection

A Postman collection is provided to help you test the APIs.

### Steps to Use the Collection
1. Open Postman.
2. Import the file `postman_collection.json` located in the `postman collection` folder.
3. Configure the required environment variables (if any):
   - Example variables:
     - `base_url`: `http://127.0.0.1:8000`
     - `auth_token`: Your authentication token.
4. Start testing the APIs:
   - Run individual requests or use the collection runner to execute multiple requests.

### Collection Details
- **File**: `postman_collection.json`
- **Folder**: `postman collection`


----
## 4.Task Completion Checklist

 - [x] Design and implementation of the ReviewCycle and Stage models.
 - [x] APIs for managing companies, departments, employees, and review cycles.
 - [x] Workflow for Employee Review Cycle, including valid stage transitions.
 - [x] Role-based access control for managers and employees.
 - [x] Data validation and security checks.
 - [x] postman collection.



----
## 5.Assumptions
1. Our roles is (admin , employee , manager)
2. only admin can see any comapany and any department , create Employee and assigned he to account 
3. only manager can create Pending Review and Aproval or reject review
4. only employee can create Review Scheduled and Feedback Provided









