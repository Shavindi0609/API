# 📣 Complaint Management System (CMS)

## 🛠️ Project Overview
The **Complaint Management System (CMS)** is a web-based prototype application developed for the **Municipal IT Division**. It allows employees to submit and track complaints, while administrators manage resolutions. This project was built using **JavaServer Pages (JSP)**, **Jakarta EE**, and **MySQL**, strictly following the **MVC (Model-View-Controller)** design pattern.

All HTTP interactions are handled via **synchronous HTML form submissions** using `GET` and `POST`. **No AJAX or asynchronous mechanisms** are used.

---

## 🚀 Features

### 👨‍💼 Employee Role
- Login to the system
- Submit new complaints
- View submitted complaints
- Edit or delete unresolved complaints

### 👩‍💼 Admin Role
- Login to the system
- View all complaints from all users
- Update status and add remarks
- Delete any complaint

---

## 🔧 Technology Stack

| Component   | Technology                        |
|------------|------------------------------------|
| Frontend   | JSP, HTML, CSS, JavaScript (validation only) |
| Controller | Jakarta EE (Servlets)              |
| Model      | JavaBeans, DAO                     |
| Database   | MySQL via Apache Commons DBCP      |
| Server     | Apache Tomcat                      |

---

## 🧱 Application Architecture (MVC)

The application uses the **MVC pattern**:

- **Model**: JavaBeans and DAO classes for database and business logic.
- **View**: JSP pages for rendering and input (e.g., `login.jsp`, `employee_dashboard.jsp`).
- **Controller**: Servlets handle business flow and interactions.

### Workflow:

User (JSP Form) -→ Servlet (Controller) -→ DAO (Model) -→ Database
                                 ↑
                        Redirect to JSP

## 📁 Project Structure
complaint-management-system/
│
├── README.md
├── .gitignore
├── pom.xml (if using Maven)
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/municipal/cms/
│   │   │       ├── controller/
│   │   │       │   ├── LoginServlet.java
│   │   │       │   ├── LogoutServlet.java
│   │   │       │   ├── ComplaintServlet.java
│   │   │       └── model/
│   │   │           ├── Complaint.java
│   │   │           ├── User.java
│   │   │           ├── ComplaintDAO.java
│   │   │           ├── UserDAO.java
│   └── main/
│       └── webapp/
│           ├── WEB-INF/
│           │   └── web.xml
│           ├── login.jsp
│           ├── dashboard.jsp
│           ├── complaint_form.jsp
│           ├── complaint_list.jsp
│           └── css/
│               └── styles.css
│           └── js/
│               └── validation.js
├── db/
│   └── schema.sql
└── docs/
    └── screenshots/

## ⚙️ Setup Instructions

### 1. Install Required Software
- Java JDK 11+
- Apache Tomcat 10.x
- MySQL Server 8.x
- IntelliJ IDEA / Eclipse
- Git

### 2. Clone the Repository

  
   git clone https://github.com/your-username/complaint-management-system.git
   cd complaint-management-system
 

### 3. SetUp MySQL Database

CREATE DATABASE api;

# Inside MySQL CLI or GUI
source /src/main/resources/db/schema.sql;

### 4.Configure DBCP Connection (in DataSource.java)
  BasicDataSource ds = new BasicDataSource();
  ds.setUrl("jdbc:mysql://localhost:3306/cms_db");
  ds.setUsername("your_username");
  ds.setPassword("your_password");
  ds.setDriverClassName("com.mysql.cj.jdbc.Driver");

 ### 5.Run On Tomcat
  - Set up Tomcat in your IDE
  - Build WAR and deploy to webapps/
  - Access via:
  http://localhost:8080/cms/

## 🧪 Test Users
INSERT INTO users (username, email, password, role) VALUES
('Ann', 'admin@example.com', 'admin123', 'Admin'),
('Smith', 'employee@example.com', 'emp123', 'Employee');

## 🐞 Troubleshooting
| Issue               | Solution                              |
| ------------------- | ------------------------------------- |
| DB connection error | Check DB URL, username/password       |
| Page not loading    | Confirm WAR is deployed in Tomcat     |
| JDBC driver missing | Add MySQL JDBC Connector to classpath |

## 📌 Version Control Guidelines
git add .
git commit -m "Add complaint form servlet and DAO"
git push origin main

