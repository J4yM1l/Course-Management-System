<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CS Course Management System</title>
  <link href="f_sources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="f_sources/css/business-frontpage.css" rel="stylesheet">
</head>
<body  style="background-color: #5e5e5e; padding-top:0px;">
<a style="float: right; " href="<%=request.getContextPath()%>/SiteNavigator?action=admin">Admin Login</a>

<h1 class="card-title font-weight-bold card-text" style="text-align: center; color: #c7004c; padding-top: 50px;">CS COURSE MANAGEMENT SYSTEM</h1>

<div style="margin-top: 100px;">
	<div class="row" style="margin: auto; width:60%">
	  <div class="col-*-* " style=" margin: auto;">
	  	<a href="<%=request.getContextPath()%>/SiteNavigator?action=studentlogin">
			<div class="card" style="width:18rem">
			  <img src="f_sources/images/student.png" class="img-circle" alt="Student Login">
			  <div class="card-body">
			    <h3 class="card-title font-weight-bold card-text" style="text-align: center">STUDENT LOGIN</h3>
			  </div>
			</div>
			</a>
	  </div>
	  
	 <div class="col-*-*" style="margin: auto;">
	  	<a href="<%=request.getContextPath()%>/SiteNavigator?action=facultylogin">
			<div style="width: 18rem; " class="card" >
			  <img src="f_sources/images/faculty.png" class="img-circle" alt="Faculty Login" style="height: 16rem">
			  <div class="card-body">
			   <h3 class="card-title font-weight-bold card-text" style="text-align: center">FACULTY LOGIN</h3>
			  </div>
			</div>
			</a>
	  </div>
	</div>
</div>
</body>
</html>