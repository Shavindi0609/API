<%@ page import="com.ijse.gdse.api.model.UserModel" %>
<%@ page import="org.apache.commons.dbcp2.BasicDataSource" %>
<%@ page import="com.ijse.gdse.api.dto.UserDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">

<% String msg = (String) session.getAttribute("loginSuccess"); %>
<% if (msg != null) { %>
<div id="successAlert" class="alert alert-success"><%= msg %></div>
<% session.removeAttribute("loginSuccess"); %>
<% } %>

<h1>Employee</h1>

<ul class="nav">
    <li class="nav-item">
        <a class="nav-link active" aria-current="page" href="#">Active</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="#">Home</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="createEmployee.jsp">Create Employee</a>
    </li>
</ul>

<table class="table">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">Name</th>
        <th scope="col">Password</th>
        <th scope="col">Role</th>
        <th scope="col">Email</th>
        <th scope="col">Options</th>
    </tr>
    </thead>
    <tbody>
    <%
        BasicDataSource ds = (BasicDataSource) request.getServletContext().getAttribute("dataSource");
        List<UserDTO> users = UserModel.getAll(ds);
        for (UserDTO userDTO : users) {
    %>

        <tr>
            <th scope="row"><%=userDTO.getId()%></th>
            <td><%=userDTO.getName()%></td>
            <td><%=userDTO.getPassword()%></td>
            <td><%=userDTO.getJob()%></td>
            <td><%=userDTO.getEmail()%></td>
            <td>
                <a href=""  class="btn btn-info">Update</a>
            </td>
        </tr>

    <% } %>
    </tbody>
</table>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>

<script>
    window.addEventListener("DOMContentLoaded", function () {
        const alertBox = document.getElementById("successAlert");
        if (alertBox) {
            setTimeout(function () {
                // fade out effect (optional)
                alertBox.style.transition = "opacity 0.5s ease";
                alertBox.style.opacity = "0";
                setTimeout(() => {
                    alertBox.style.display = "none";
                }, 500);
            }, 2000);
        }
    });
</script>
</body>
</html>
