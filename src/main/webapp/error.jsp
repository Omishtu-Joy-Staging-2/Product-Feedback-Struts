<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Oops! Something Went Wrong</title>
  
  <!-- Bootstrap & Fonts -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">

  <style>
    body {
      background-color: #f8f9fc;
      font-family: 'Nunito', sans-serif;
    }
    .error-container {
      margin-top: 80px;
      text-align: center;
    }
    .error-icon {
      font-size: 80px;
      color: #e74a3b;
      margin-bottom: 20px;
    }
    .error-code {
      font-size: 100px;
      font-weight: 700;
      color: #e74a3b;
    }
    .error-text {
      font-size: 24px;
      color: #5a5c69;
      margin-bottom: 20px;
    }
    .error-detail {
      color: #858796;
      font-size: 16px;
      margin-bottom: 30px;
    }
    .btn-custom {
      min-width: 160px;
      margin: 5px;
    }
  </style>
</head>

<body>

<div class="container error-container">
  <div class="error-icon"><i class="fas fa-exclamation-triangle"></i></div>
  <div class="error-code">500</div>
  <div class="error-text">Oops! Something went wrong.</div>
  <div class="error-detail">
    We're experiencing an internal issue. Please try again later, or contact support if the problem persists.
  </div>
  
  <a href="Landing.action" class="btn btn-primary btn-custom">
    <i class="fas fa-home"></i> Back to Home
  </a>
  <a href="mailto:support@yourcompany.com" class="btn btn-outline-secondary btn-custom">
    <i class="fas fa-envelope"></i> Contact Support
  </a>
</div>

<!-- JS -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>
