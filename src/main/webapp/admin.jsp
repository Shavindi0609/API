<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
    <!-- Bootstrap CSS එක්කරලා -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">

<% String msg = (String) session.getAttribute("loginSuccess"); %>
<% if (msg != null) { %>
<div id="successAlert" class="alert alert-success"><%= msg %></div>
<% session.removeAttribute("loginSuccess"); %>
<% } %>

<h1>Admin</h1>

<!-- Bootstrap JS (Optional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>

<script>
    window.addEventListener("DOMContentLoaded", function () {
        const alertBox = document.getElementById("successAlert");
        if (alertBox) {
            setTimeout(function () {
                alertBox.style.transition = "opacity 0.5s ease";
                alertBox.style.opacity = "0";
                setTimeout(() => {
                    alertBox.style.display = "none";
                }, 500);
            }, 2000); // 2 seconds delay
        }
    });
</script>
</body>
</html>
