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
    <script src="f_sources/js/dataManipulation.js"></script>
  
</head>

<body style="background-color: #5e5e5e;padding-top: 0px">
    <!-- Page Content -->
        <h1 class="card-title font-weight-bold card-text" style="text-align: center; color: #c7004c; padding-top: 50px;">CS COURSE MANAGEMENT SYSTEM</h1>
 <div class="card text-center w-50 p-3 row align-items-center" style="height: 400px; background-color:#f6f5f5 ;margin: auto; outline: #c7004c solid 10px">
  <div id="student">
  <div class="card-body">
    <h3 class="card-title font-weight-bold" style="color: #c7004c">System Admin Login</h3>
    </div>
	  <div class="container" id="student">
	  <!-- form -->
		<form action="<%= request.getContextPath()%>/SiteNavigator?action=facultylogin&admin=admin" method="post">
			
			<div class="input-group input-group-sm mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="inputGroup-sizing-sm"><span class="glyphicon glyphicon-user"></span>Username</span>
			  </div>
			  <input type="text" name="username" placeholder="Enter Username" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" required>
			</div>
			
			<div class="input-group input-group-sm mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="inputGroup-sizing-sm"><span class="glyphicon glyphicon-user"></span>Password</span>
			  </div>
			  <input type="password" name="password" placeholder="Enter Password" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" required>
			</div>
			
			<div class="input-group input-group-sm mb-3">
			  <div class="input-group-prepend">
			    <label style="aign-text: center"class="font-weight-lighter font-italic ">Home page? <a href="<%=request.getContextPath()%>/SiteNavigator?action=index">Let's Go</a></label>
			  </div>
			</div>
			<div>
		  	<input type="hidden" name="type" value="student"></input>
		  </div>
			<div class="input-group input-group-sm mb-3">
			  <input  type="submit" value="Login" style="margin-right: auto;"  class="form-control btn btn-primary" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
			</div>
		</form>	
	  </div>
	 </div>
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
