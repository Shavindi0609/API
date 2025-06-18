<%--
  Created by IntelliJ IDEA.
  User: Shavindi
  Date: 6/18/2025
  Time: 1:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>New Complaint</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">

<h2 class="mb-4">Submit New Complaint</h2>

<form action="complaint" method="post" class="row g-3">
    <div class="col-md-6">
        <label for="title" class="form-label">Complaint Title</label>
        <input type="text" class="form-control" id="title" name="title" required>
    </div>

    <div class="col-md-6">
        <label for="department" class="form-label">Department</label>
        <select class="form-select" id="department" name="department" required>
            <option selected disabled value="">Choose...</option>
            <option value="IT">IT</option>
            <option value="HR">HR</option>
            <option value="Finance">Finance</option>
            <option value="Admin">Admin</option>
        </select>
    </div>

    <div class="col-md-6">
        <label for="priority" class="form-label">Priority</label>
        <select class="form-select" id="priority" name="priority" required>
            <option selected disabled value="">Choose...</option>
            <option value="Low">Low</option>
            <option value="Medium">Medium</option>
            <option value="High">High</option>
        </select>
    </div>

    <div class="col-md-6">
        <label for="status" class="form-label">Status</label>
        <select class="form-select" id="status" name="status" required>
            <option selected disabled value="">Choose...</option>
            <option value="Pending">Pending</option>
            <option value="In Progress">In Progress</option>
            <option value="Resolved">Resolved</option>
            <option value="Closed">Closed</option>
        </select>
    </div>

    <div class="col-12">
        <label for="description" class="form-label">Description</label>
        <textarea class="form-control" id="description" name="description" rows="4" required></textarea>
    </div>

    <div class="col-12">
        <button type="submit" class="btn btn-primary">Submit Complaint</button>
    </div>
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<%--title , description , department ,  priority--%>
<%-- complaint id , title , description , department ,  priority , status , create date , action--%>