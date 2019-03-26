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
  <script>
  	function disableDiv(type){
  		var s_active=document.getElementById("s_active");
  		var f_active=document.getElementById("f_active");
  		var student=document.getElementById("student");
  		var faculty=document.getElementById("faculty");
  		if(type==0){
  			student.style.display="block";
  			faculty.style.display = "none";
  			s_active.classList.add("active");
  			f_active.classList.remove("active")
  		}else{
  			student.style.display="none";
			faculty.style.display = "block";
  			f_active.classList.add("active")
  			s_active.classList.remove("active")
			}
  	}
  </script>
</head>

<body style="background-color: #5e5e5e">
    <!-- Page Content -->
    
 <div class="card text-center">
  <div class="card-header">
    <ul class="nav nav-tabs card-header-tabs">
      <li class="nav-item">
        <a class="nav-link active" id="s_active" onclick="disableDiv(0)" href="#">STUDENT</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" id="f_active" onclick="disableDiv(1)" href="#">FACULTY</a>
      </li>
    </ul>
  </div>
  <div id="student">
  <div class="card-body">
    <h3 class="card-title">Student Login</h3>
    </div>
	  <div class="container" id="student">
	  <!-- form -->
		<form action="<%= request.getContextPath()%>/SiteNavigator?action=studentlogin" method="post">
			Username: <input type="text" name="username" placeholder="Enter Username"></br>
			Password: <input type="password" name="password" placeholder="Enter Password"></br>
			You don't have an account? <a href="<%=request.getContextPath()%>/SiteNavigator?action=register">Register</a></br>
			<input class ="pager" type="submit" value="Login" style="margin-right: auto;" > </br>
			
		</form>	
		
		<form>
  <div class="input-group">
    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
    <input id="email" type="text" class="form-control" name="email" placeholder="Email">
  </div>
  <div class="input-group">
    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
    <input id="password" type="password" class="form-control" name="password" placeholder="Password">
  </div>
  <div class="input-group">
    <span class="input-group-addon">Text</span>
    <input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info">
  </div>
</form>
		
	  </div>
	 </div>
	<div id="faculty" style="display: none">
	<div class="card-body">
    <h3 class="card-title">Faculty Login</h3>
    </div>
	<div class="container" >
  		<!-- form -->
	<form action="<%= request.getContextPath()%>/SiteNavigator?action=facultylogin" method="post">
		Username: <input type="text" name="username" placeholder="Enter Username"></br>
		Password: <input type="password" name="password" placeholder="Enter Password"></br>
		You don't have an account? <a href="<%=request.getContextPath()%>/SiteNavigator?action=register">Register</a></br>
		<input type="submit" value="Login" style="margin-right: auto;" > </br>
		
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
