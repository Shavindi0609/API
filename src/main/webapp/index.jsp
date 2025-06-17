<%@ page import="com.ijse.gdse.api.model.UserModel" %>
<%@ page import="com.ijse.gdse.api.dto.UserDTO" %>
<%@ page import="org.apache.commons.dbcp2.BasicDataSource" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Login - JSP</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">

<%
  String error = request.getParameter("error");
  String success = request.getParameter("success");
%>

<% if (error != null) { %>
<div id="errorAlert" class="alert alert-danger" role="alert">
  Login Failed! Please check your credentials.
</div>
<% } else if (success != null) { %>
<div id="successAlert" class="alert alert-success" role="alert">
  Login successful! Welcome back.
</div>
<% } %>

<%--<% UserDTO user = UserModel.findUserId(new UserDTO(request.getParameter("name"), request.getParameter("password")), request.getParameter("role"), (BasicDataSource) request.getServletContext().getAttribute("dataSource"));%>--%>
<form class="row g-3" method="post" action="logins">
  <div class="mb-3">
    <label for="name" class="form-label">User Name</label>
    <input type="text" class="form-control" id="name" placeholder="Enter Your Name" name="name" required>
  </div>
  <div class="mb-3">
    <label for="password" class="form-label">Password</label>
    <input type="password" class="form-control" id="password" placeholder="******" name="password" required>
  </div>
  <div class="input-group mb-3">
    <label class="input-group-text" for="inputGroupSelect01">Role</label>
    <select class="form-select" id="inputGroupSelect01" name="role" required>
      <option selected disabled value="">Choose...</option>
      <option value="employee">Employee</option>
      <option value="admin">Admin</option>
    </select>
  </div>
  <div class="col-12">
    <button type="submit" class="btn btn-primary">Sign-In</button>
    <a href="signUp.jsp" class="btn btn-info">Sign-Up</a>
  </div>
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>

<script>
  function hideAlertAfterDelay(alertId) {
    const alertElement = document.getElementById(alertId);
    if (alertElement) {
      setTimeout(() => {
        // fade out effect for smooth disappearance
        alertElement.style.transition = "opacity 0.5s ease";
        alertElement.style.opacity = "0";
        setTimeout(() => {
          alertElement.style.display = "none";
        }, 500);
      }, 2000); // Hide after 2 seconds
    }
  }

  // call the function for both alerts
  hideAlertAfterDelay("errorAlert");
  hideAlertAfterDelay("successAlert");
</script>

</body>
</html>
