<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>User Registration</title>
  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>

<body class="bg-gradient-primary">
  <div class="container">
    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
              </div>

              <!-- ✅ Struts2 Form -->
              <s:form action="register" cssClass="user" method="post">
			<s:actionerror cssClass="alert alert-danger"/>
	
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <s:textfield name="firstName" placeholder="First Name" cssClass="form-control form-control-user" required="true"/>
                  </div>
                  <div class="col-sm-6">
                    <s:textfield name="lastName" placeholder="Last Name" cssClass="form-control form-control-user" required="true"/>
                  </div>
                </div>

                <div class="form-group">
                  <s:textfield name="email" placeholder="Email Address" cssClass="form-control form-control-user" type="email" required="true"/>
                </div>

                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <s:password name="password" placeholder="Password" cssClass="form-control form-control-user" required="true"/>
                  </div>
                  <div class="col-sm-6">
                    <s:password name="confirmPassword" placeholder="Repeat Password" cssClass="form-control form-control-user" required="true"/>
                  </div>
                </div>

                <s:submit value="Register Account" cssClass="btn btn-primary btn-user btn-block"/>
              </s:form>

              <hr />
              
              <div class="text-center">
                <a class="small" href="login.jsp">Already have an account? Login!</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- JS -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="js/sb-admin-2.min.js"></script>
</body>
</html>
