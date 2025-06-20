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
