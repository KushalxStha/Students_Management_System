-- Database for Users
CREATE DATABASE IF NOT EXISTS login;
USE login;

-- Users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    username VARCHAR(50) NOT NULL UNIQUE,
    pass VARCHAR(255) NOT NULL
);

-- Example data for testing
INSERT INTO users (first_name, last_name, email, username, pass)
VALUES
('John', 'Doe', 'john.doe@example.com', 'johndoe', 'password123'),
('Jane', 'Smith', 'jane.smith@example.com', 'janesmith', 'password456');

-- Database for Students
CREATE DATABASE IF NOT EXISTS mydb;
USE mydb;

-- Students table
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    marks DOUBLE NOT NULL
);

-- Example data for testing
INSERT INTO students (name, age, marks)
VALUES
('Alice Johnson', 20, 85.5),
('Bob Brown', 22, 78.0),
('Charlie Davis', 19, 92.3);
