# Students Management System

## Project Overview
The **Students Management System** is a web application developed to manage student information efficiently. It provides functionality for creating, reading, updating, and deleting (CRUD) student records using a simple and intuitive user interface.

## Features
- **Registration System:** Users can register new students.
- **Login System:** Secure login for administrators.
- **Student Records Management:** Create, update, view, and delete student data.
- **Database Integration:** Seamlessly integrates with MySQL to store student information.
- **Interactive UI:** Dynamic web pages developed using JSP and Bootstrap for styling.

## Tech Stack
### Backend
- Java (Servlets and JSP)
- JDBC for database connectivity

### Frontend
- JSP for dynamic content
- Bootstrap for responsive design
- HTML, CSS

### Database
- MySQL

### Build Tool
- Apache Maven

## Setup and Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/KushalxStha/Students_Management_System.git
   ```
2. Open the project in IntelliJ IDEA Ultimate (or any preferred IDE).
3. Ensure the required dependencies are set up in the `pom.xml` file.
4. Execute the provided SQL script to create the necessary database & tables.
5. Update database credentials such as URL, username, and password in the JDBC configuration file.
6. Build the project:
   ```bash
   mvn clean install
   ```
7. Deploy the project:
    - Add the project to the Apache Tomcat server.
    - Start the server.

8. Access the application:
   Open a web browser and navigate to `http://localhost:8080/StudentsManagementSystem`.

## Directory Structure
```plaintext
src/
├── main/
│   ├── java/
│   │   └── com/
│   │       ├── controller/   # Servlets for handling requests
│   │       ├── dao/          # Data Access Objects
│   │       └── model/        # POJOs for Student entities
│   └── webapp/
│       ├── WEB-INF/          # Deployment descriptor (web.xml)
│       └── views/            # JSP files for UI
|
pom.xml                       # Maven configuration
```