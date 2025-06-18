<%@ page import="com.ijse.gdse.api.model.UserModel" %>
<%@ page import="org.apache.commons.dbcp2.BasicDataSource" %>
<%@ page import="com.ijse.gdse.api.dto.UserDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            overflow-x: hidden;
            background: white;
            color: #333;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        /* Sidebar styling - purple like employee sidebar */
        .sidebar {
            width: 220px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            background: #4e3a99;
            padding-top: 60px;
        }
        .sidebar h4 {
            text-align: center;
            padding: 15px 0;
            border-bottom: 1px solid #a0a0a0;
            color: white;
            font-weight: 700;
        }
        .sidebar a {
            color: #ddd;
            padding: 15px;
            display: block;
            text-decoration: none;
            font-weight: 600;
            transition: background-color 0.3s, color 0.3s;
        }
        .sidebar a:hover {
            background-color: #6a5acd;
            color: white;
        }
        .content {
            margin-left: 220px;
            padding: 20px;
        }
        .dashboard-overview {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
        }
        .overview-box {
            flex: 1;
            margin: 0 10px;
            background: linear-gradient(135deg, #4a90e2, #8e44ad);
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 0 15px rgba(255,255,255,0.2);
            color: white;
        }
        .overview-box h3 {
            font-size: 36px;
            margin: 0;
        }
        .overview-box p {
            margin: 5px 0 0 0;
            font-size: 14px;
            letter-spacing: 1px;
        }
        h2, p {
            color: #333;
        }
        .btn {
            font-weight: 600;
        }
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <h4>Admin Panel</h4>
    <a href="admin.jsp">Dashboard</a>
    <a href="employeeList.jsp">Employee List</a>
    <a href="createEmployee.jsp">Create Employee</a>
    <a href="allComplaints.jsp">All Complaints</a>
    <a href="logout.jsp" style="color: #ff6b6b; font-weight: 700;">Logout</a>
</div>

<!-- Main Content -->
<div class="content">
    <h2>Welcome, Admin!</h2>
    <p>Use the sidebar to navigate through the admin features.</p>
    <hr />

    <h2>Dashboard Overview</h2>
    <div class="dashboard-overview">
        <div class="overview-box">
            <h3>0</h3>
            <p>Pending</p>
        </div>
        <div class="overview-box">
            <h3>0</h3>
            <p>In Progress</p>
        </div>
        <div class="overview-box">
            <h3>0</h3>
            <p>Resolved</p>
        </div>
        <div class="overview-box">
            <h3>0</h3>
            <p>Rejected</p>
        </div>
    </div>

    <%-- Example Employee Table (commented out, enable if you want to list employees) --%>
    <%--
    <h2>Employee List</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>#</th>
                <th>Name</th>
                <th>Password</th>
                <th>Role</th>
                <th>Email</th>
                <th>Options</th>
            </tr>
        </thead>
        <tbody>
        <%
            BasicDataSource ds = (BasicDataSource) request.getServletContext().getAttribute("dataSource");
            List<UserDTO> users = UserModel.getAll(ds);
            for (UserDTO userDTO : users) {
        %>
            <tr>
                <td><%= userDTO.getId() %></td>
                <td><%= userDTO.getName() %></td>
                <td><%= userDTO.getPassword() %></td>
                <td><%= userDTO.getRole() %></td>
                <td><%= userDTO.getEmail() %></td>
                <td>
                    <a href="updateEmployee.jsp?id=<%= userDTO.getId() %>" class="btn btn-info btn-sm">Update</a>
                    <a href="deleteEmployee.jsp?id=<%= userDTO.getId() %>" class="btn btn-danger btn-sm">Delete</a>
                </td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
    --%>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
