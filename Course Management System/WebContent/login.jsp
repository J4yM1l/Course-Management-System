<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Login</title>

  <!-- Bootstrap core CSS -->
  <link href="f_sources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="f_sources/css/business-frontpage.css" rel="stylesheet">
</head>

<body style="background-color: #5e5e5e">
    <!-- Page Content -->
  <div class="container">
  <!-- form -->
	<form action="<%= request.getContextPath()%>/PageNavigator" method="get">
		Username: <input type="text" name="username" placeholder="Enter Username"></br>
		Password: <input type="password" name="password" placeholder="Enter Password"></br>
		<input type="submit" value="Login" style="margin-right: auto;" > </br>
		You don't have an account? <a href="#">Register</a>
	</form>	
  </div>
  <!-- Footer -->
  <footer class="py-5">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="f_sources/vendor/jquery/jquery.min.js"></script>
  <script src="f_sources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
</body>
</html>
