<%@ page import="org.apache.commons.dbcp2.BasicDataSource" %>
<%@ page import="com.ijse.gdse.api.dto.ComplaintDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ijse.gdse.api.model.ComplaintModel" %>
<%@ page import="java.time.format.DateTimeFormatter" %><%--
  Created by IntelliJ IDEA.
  User: Shavindi
  Date: 6/18/2025
  Time: 11:27 AM
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>Complaints</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            overflow-x: hidden;
        }
        .sidebar {
            width: 220px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #343a40;
            padding-top: 60px;
        }
        .sidebar a {
            color: #fff;
            padding: 15px;
            display: block;
            text-decoration: none;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .content {
            margin-left: 220px;
            padding: 20px;
        }
    </style>
</head>
<body>

<!-- 🔹 Sidebar -->
<div class="sidebar">
    <h5 class="text-white text-center">Dashboard</h5>
    <a href="#">Home</a>
    <a href="createEmployee.jsp">New Employee</a>
    <a href="newComplaint.jsp">New Complaint</a>
    <a href="employee.jsp">Employee List</a>
    <a href="myComplaint.jsp">Complaint List</a>
</div>

<!-- 🔸 Main Content -->
<div class="content">

    <h2>Complaint List</h2>

    <table class="table table-bordered">
        <thead class="table-dark">
        <tr>
            <th>#</th>
            <th>Title</th>
            <th>Description</th>
            <th>Department</th>
            <th>Priority</th>
            <th>Status</th>
            <th>Create Date</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            BasicDataSource ds = (BasicDataSource) request.getServletContext().getAttribute("dataSource");
            List<ComplaintDTO> complaints = ComplaintModel.getAll(ds); // ⬅️ ComplaintModel.getAll method එක implement කරන්න
            for (ComplaintDTO complaint : complaints) {
        %>
        <tr>
            <td><%= complaint.getId() %></td>
            <td><%= complaint.getTitle() %></td>
            <td><%= complaint.getDescription() %></td>
            <td><%= complaint.getDepartment() %></td>
            <td><%= complaint.getPriority() %></td>
            <td><%= complaint.getStatus() %></td>
            <td><%= complaint.getCreatedDate().format(DateTimeFormatter.ofPattern("dd-MM-yyyy")) %></td>
            <td>
                <a href="updateComplaint.jsp?id=<%= complaint.getId() %>" class="btn btn-info btn-sm">Update</a>
                <a href="deleteComplaint.jsp?id=<%= complaint.getId() %>" class="btn btn-danger btn-sm">Delete</a>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
