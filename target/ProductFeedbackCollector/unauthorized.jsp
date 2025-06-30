<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Access Denied</title>
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
  <style>
    body {
      background-color: #f8f9fc;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .unauth-container {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .unauth-card {
      background: white;
      padding: 3rem;
      border-radius: 10px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      text-align: center;
      max-width: 500px;
    }

    .unauth-card h1 {
      font-size: 3rem;
      color: #e74a3b;
    }

    .unauth-card p {
      margin: 1rem 0;
      color: #5a5c69;
    }

    .btn-login {
      background-color: #4e73df;
      color: white;
      text-decoration:none;
    }

    .btn-login:hover {
      background-color: #2e59d9;
    }
  </style>
</head>
<body>

<div class="unauth-container">
  <div class="unauth-card">
    <h1>⛔ Unauthorized Access</h1>
    
    <p>You don’t have permission to view this page.<br>
       Please contact your administrator or login with proper credentials.</p>
    <a href="login.jsp" class="btn btn-login btn-block mt-4">Go to Login</a>
  </div>
</div>

</body>
</html>
