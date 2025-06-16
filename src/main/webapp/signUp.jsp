<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign Up</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">

<% String msg = request.getParameter("msg"); %>
<% if ("success".equals(msg)) { %>
<div class="alert alert-success" role="alert">
    Sign-Up successful!
</div>
<% } else if ("fail".equals(msg)) { %>
<div class="alert alert-danger" role="alert">
    Sign-Up failed! Please try again.
</div>
<% } %>

<form class="row g-3" method="post" action="signUps">
    <div class="col-md-6">
        <label for="name" class="form-label">Name</label>
        <input type="text" class="form-control" id="name" name="name" required>
    </div>
    <div class="col-md-6">
        <label for="password" class="form-label">Password</label>
        <input type="password" class="form-control" id="password" name="password" required>
    </div>
    <div class="col-12">
        <label for="email" class="form-label">Email</label>
        <input type="email" class="form-control" id="email" name="email" required>
    </div>
    <div class="col-12">
        <button type="submit" class="btn btn-primary">Sign-Up</button>
        <a href="index.jsp" class="btn btn-secondary">Go to Login</a>
    </div>
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
