-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS library_system;

-- Select the database to use
USE library_system;

-- Users Table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,       -- Unique user ID
    username VARCHAR(100) NOT NULL,          -- User's username
    password VARCHAR(255) NOT NULL,          -- User's password (hashed)
    role ENUM('admin', 'user') DEFAULT 'user', -- User role (admin or user)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Timestamp for user creation
);

-- Books Table
CREATE TABLE IF NOT EXISTS books (
    id INT AUTO_INCREMENT PRIMARY KEY,       -- Unique book ID
    title VARCHAR(255) NOT NULL,              -- Book title
    author VARCHAR(255) NOT NULL,             -- Book author
    description TEXT,                        -- Book description
    created_by INT,                          -- ID of the user who created the book
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp for book creation
    FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL -- FK for user
);
