
# 📚 CampusHub Management System – PostgreSQL Project

A complete, realistic, and production-ready PostgreSQL database project designed for a university management system called **CampusHub**.  
This project covers **ALL important PostgreSQL concepts**, making it perfect for students, learners, and professionals to showcase SQL skills.

---

## 🚀 Project Overview
CampusHub is a database system designed to manage:
- Students  
- Teachers  
- Departments  
- Courses  
- Enrollments  
- Attendance  
- Fees  
- Hostel & Room Allocation  
- GPA calculation  
- Automated triggers  
- Validations & constraints  

This project is built with **PostgreSQL** and demonstrates real-world database design and implementation.

---

## 🏗️ Features Included

### ✔️ **Complete Database Schema**
Fully normalized tables with:
- Primary keys  
- Foreign keys  
- Unique & Not Null constraints  
- ENUM type  
- Many-to-many relationships  

### ✔️ **Sample Data**
Realistic sample records for testing queries.

### ✔️ **Indexes**
Performance optimization using:
- Index on students.email  
- Index on courses.teacher_id  
- Index on attendance.date  

### ✔️ **Views**
Pre-built views for reporting:
- `student_overview`  
- `department_course_count`  
- `student_attendance_percentage`  

### ✔️ **Functions**
Example function:
```sql
calculate_gpa(student_id)

Automatically calculates a student’s GPA.

### ✔️ **Triggers**
Real-life trigger automation:

Update student's total credits when grade added

Prevent attendance on weekends

Log changes to fees table

✔️ Transactions (Concept Included)

Handles rollback when:

Course capacity is full

Hostel room is not available

📂 Directory Structure
/CampusHub-PostgreSQL
│── README.md
│── CampusHub.sql        # Full project SQL script
└── sample_data.md       # (Optional) Sample data explanation

🛠️ Technologies Used

PostgreSQL 14+

SQL / PLpgSQL

Relational Database Design (RDBMS)

Constraints & Referential Integrity

Functions, Triggers, Views

Indexing & Optimization

📥 How to Use

Clone this repository:

git clone https://github.com/yourusername/CampusHub-PostgreSQL.git


Open PostgreSQL or pgAdmin.

Import and run the SQL script:

\i '/path/to/CampusHub.sql'


Database will be created with all tables, views, functions, and triggers.

🎯 Purpose of This Project

This project is designed for:

Students learning SQL

Developers improving PostgreSQL skills

Fiverr / Upwork freelancers showcasing database skills

University / College DBMS final projects

GitHub portfolio enhancement

💡 Future Improvements (Optional)

Add API using Node.js / Python

Add front-end admin dashboard

Add more advanced triggers

Add analytics dashboard

🤝 Contributing

Feel free to fork this project and submit a pull request.

⭐ Support

If this project helped you, don’t forget to star the repository ⭐ on GitHub!

📧 Contact
For help or customization:
itxsehar67@gmail.com

             --------
