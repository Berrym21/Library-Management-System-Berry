Library Management System

Overview

The Library Management System is a PHP-based web application designed to manage a library's operations, including book inventory, user accounts, and administrative tasks. It features a public interface for browsing books, a user area for registered patrons, and an admin area for managing books and users.

Features

Public Features:

View a list of available books without logging in.
Access detailed book descriptions.

User Features:
User registration and login.
Borrow books (if implemented).
View borrowed books and account details.

Admin Features:
Manage books:
Add new books.
Edit book details.
Delete books.
Manage users:
Add new users.
Edit user roles and details.
Delete users.

Technologies Used
Backend: PHP (with PDO for database interaction)
Frontend: HTML, CSS (Bootstrap 5 for styling)
Database: MySQL
Server: XAMPP for local development

Installation and Setup

Clone the Repository:
git clone https://github.com/Berrym21/library-management-system.git
cd library-management-system

Set Up the Database:
Import the library_system.sql file into your MySQL server.
This will create the necessary tables (books, users, etc.).
Configure Database Connection:
Open the db.php file.
Update the following details to match your MySQL configuration:
$db_host = 'localhost';
$db_name = 'library_system';
$db_user = 'root';
$db_pass = '';

Run the Application:
Place the project folder in your XAMPP htdocs directory.
Start the Apache and MySQL services via XAMPP.
Open your browser and navigate to http://localhost/library-management-system.

Folder Structure

library-management-system/
│
├── admins/
│   ├── manage_books.php   # Admin interface for managing books.
│   ├── manage_users.php   # Admin interface for managing users.
│   └── admin_login.php    # Admin login page.
│
├── public/
│   ├── index.php          # Homepage displaying books for public users.
│   └── book_details.php   # Detailed view for a single book.
│
├── users/
│   ├── user_login.php     # User login page.
│   ├── user_dashboard.php # User's personal dashboard.
│
├── db.php                 # Database connection file.
├── styles.css             # Custom CSS for styling.
└── library_system.sql     # SQL file to set up the database.

Usage
Public Access
Public user information:
Username: m.berry@fuse.net
Password: Benny
Visit the homepage to browse available books.
No sign-up is required for public browsing.
User Access
Register or log in as a user to access personal account features.
Browse and borrow books (if borrowing functionality is implemented).
Admin Access
Log in as an admin via the admin_login.php page.
Use the admin interface to manage the library's books and users.

Screenshots
Public Homepage:
Displays all available books with basic details.
Admin Panel:
Manage books and users with add, edit, and delete functionality.
User Dashboard:
Personal dashboard for users to manage borrowed books and account details.

Future Enhancements
Add book borrowing functionality.
Implement book return dates and overdue fines.
Enhance security with stronger authentication mechanisms.
Add a search and filter feature for books.

Youtube Link:
https://youtu.be/uKi8cVMpqGE

Contact
For questions or contributions, contact:

Name: Michael Berry
Email: berrym21@mymail.nku.edu
GitHub: Berrym21
