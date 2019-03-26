<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Register</title>

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
    
  <div class="card text-center w-75 p-3 row align-items-center" style=" background-color:#f6f5f5 ;margin: auto; outline: #c7004c solid 10px">
   <h2 class="card-title font-weight-bold" style="color: #c7004c">WINSTON-SALEM STATE UNIVERSITY</h2>
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
    <h3 class="card-title font-weight-bold" style="color: #c7004c">Student Registration</h3>
    </div>
	  <div class="container" id="student">
	  <!-- form -->
		<form class="text-left" action="<%= request.getContextPath()%>/SiteNavigator?action=register_s" method="post">
		  <div class="form-row">
		    <div class="form-group col-md-4">
		      <label for="inputfirstname">First Name</label>
		      <input type="text" class="form-control" name="s_firstname" id="inputfirstname" placeholder="First">
		    </div>
		    <div class="form-group col-md-4">
		      <label for="inputmiddlename">Middle Name</label>
		      <input type="text" class="form-control" name="s_middlename"id="inputmiddlename" placeholder="Middle">
		    </div>
		    <div class="form-group col-md-4">
		      <label for="inputlastname">Last Name</label>
		      <input type="text" class="form-control" name="s_lastname"id="inputlastname" placeholder="Last">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputAddress">Address</label>
		    <input type="text" name="s_address" class="form-control" id="inputAddress" placeholder="601 S Martin Lurther King Dr Jr">
		  </div>
		  <div class="form-row">
		    <div class="form-group col-md-6">
		      <label for="inputCity">City</label>
		      <input type="text" name="s_city" class="form-control" placeholder="Winston-Salem" id="inputCity">
		    </div>
		    <div class="form-group col-md-4">
		      <label for="inputState">State</label>
		    <input type="text" name="s_state"class="form-control" placeholder="NC" id="inputstate">
		    </div>
		    <div class="form-group col-md-2">
		      <label for="inputZip">Zip</label>
		      <input type="text" name="s_zip" class="form-control" placeholder="27110" id="inputZip">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputmajor">Major</label>
		    <input type="text" name="s_major" class="form-control" id="inputmajor" placeholder="Major">
		  </div>
		  <div class="form-group">
		    <label for="inputcontr">Concentration</label>
		    <input type="text" name="s_concentration" class="form-control" id="inputcontr" placeholder="Concentration">
		  </div>
		  <div class="form-group">
		    <label for="inputclass">Classification</label>
		    <input type="text" name="s_class" class="form-control" id="inputclass" placeholder="Freshmen/Senior">
		  </div>
		  <div class="form-group">
		    <label for="date">Date of Birth</label>
		    <input type="date" id="text" name="s_bd_day" placeholder="YYYY"  class="form-control">
		  </div>
		  <div class="form-group">
		    <label for="inputcontr">Gender</label>
		    <div class="form-check">
			  <input class="form-check-input" type="radio" name="s_gender" id="gender_m" value="Male" >
			  <label class="form-check-label" for="gender_m">Male</label>
			</div>
			<div class="form-check">
			  <input class="form-check-input" type="radio" name="s_gender" id="gender_f" value="Female">
			  <label class="form-check-label" for="gender_f">Female</label>
			</div>
		  </div>
		  
		  <div class="form-group">
		    <label for="inputusername">Create Username</label>
		    <input type="text" name="s_username" class="form-control" id="inputusername" placeholder="New Username">
		  </div>
		  <div class="form-group">

		  </div>
		  <div class="form-row">
		    <div class="form-group col-md-6">
		    <label for="inputusername">Password</label>
		    <input type="text" name="s_password" class="form-control" id="inputpassword" placeholder="New Password">
		    </div>
		   	<div class="form-group col-md-6">
		    <label for="inputusername">Re-enter Password</label>
		    <input type="text" name="s_password2" class="form-control" id="inputpassword" placeholder="Re-enter Password">
		    </div>
		  </div>
		  <div class="input-group input-group-sm mb-3" style="margin-right: auto;">
		  <div class="input-group-prepend">
		    <label class="font-weight-lighter font-italic ">Have an account? <a href="<%=request.getContextPath()%>/SiteNavigator?action=studentlogin">Login</a></label>
		  </div>
		</div>
		<div class="input-group input-group-sm mb-3">
		  <input  type="submit" value="Sign-Up" style="margin-right: auto;"  class="form-control btn btn-primary" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
		</div>
	</form>	
	  </div>
	 </div>
	 
	 
	<div id="faculty" style="display: none; ">
	<div class="card-body">
    <h3 class="card-title font-weight-bold" style="color: #c7004c">Faculty/Staff Registration</h3>
    
      <div class="container" >
	  <!-- form -->
		<form class="text-left" action="<%= request.getContextPath()%>/SiteNavigator?action=register_f" method="post">
		  <div class="form-row">
		    <div class="form-group col-md-4">
		      <label for="inputfirstname">First Name</label>
		      <input type="text" class="form-control" name="f_firstname" id="inputfirstname" placeholder="First">
		    </div>
		    <div class="form-group col-md-4">
		      <label for="inputmiddlename">Middle Name</label>
		      <input type="text" class="form-control" name="f_middlename"id="inputmiddlename" placeholder="Middle">
		    </div>
		    <div class="form-group col-md-4">
		      <label for="inputlastname">Last Name</label>
		      <input type="text" class="form-control" name="f_lastname"id="inputlastname" placeholder="Last">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputAddress">Address</label>
		    <input type="text" name="f_address" class="form-control" id="inputAddress" placeholder="601 S Martin Lurther King Dr Jr">
		  </div>
		  <div class="form-row">
		    <div class="form-group col-md-6">
		      <label for="inputCity">City</label>
		      <input type="text" name="f_city" class="form-control" placeholder="Winston-Salem" id="inputCity">
		    </div>
		    <div class="form-group col-md-4">
		      <label for="inputState">State</label>
		    <input type="text" name="f_state"class="form-control" placeholder="NC" id="inputstate">
		      </select>
		    </div>
		    <div class="form-group col-md-2">
		      <label for="inputZip">Zip</label>
		      <input type="text" name="f_zip" class="form-control" placeholder="27110" id="inputZip">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputfield">Field of Study</label>
		    <input type="text" name="f_field" class="form-control" id="inputfield" placeholder="field">
		  </div>
		  <div class="form-group">
		    <label for="inputDep">Department</label>
		    <input type="text" id="text" name="f_department" placeholder="Department"  class="form-control">
		  </div>
		  <div class="form-group">
		    <label for="inputcontr">Gender</label>
		    <div class="form-check">
			  <input class="form-check-input" type="radio" name="s_gender" id="gender_m" value="Male" >
			  <label class="form-check-label" for="gender_m">Male</label>
			</div>
			<div class="form-check">
			  <input class="form-check-input" type="radio" name="s_gender" id="gender_f" value="Female">
			  <label class="form-check-label" for="gender_f">Female</label>
			</div>
		  </div>
		  
		  <div class="form-group">
		    <label for="inputusername">Create Username</label>
		    <input type="text" name="f_username" class="form-control" id="inputusername" placeholder="New Username">
		  </div>
		  <div class="form-group">

		  </div>
		  <div class="form-row">
		    <div class="form-group col-md-6">
		    <label for="inputusername">Password</label>
		    <input type="text" name="f_password" class="form-control" id="inputpassword" placeholder="New Password">
		    </div>
		   	<div class="form-group col-md-6">
		    <label for="inputusername">Re-enter Password</label>
		    <input type="text" name="f_password2" class="form-control" id="inputpassword" placeholder="Re-enter Password">
		    </div>
		  </div>
		  <div class="input-group input-group-sm mb-3" style="margin-right: auto;">
		  <div class="input-group-prepend">
		    <label class="font-weight-lighter font-italic ">Have an account? <a href="<%=request.getContextPath()%>/SiteNavigator?action=facultylogin">Login</a></label>
		  </div>
		</div>
		<div class="input-group input-group-sm mb-3">
		  <input  type="submit" value="Sign-Up" style="margin-right: auto;"  class="form-control btn btn-primary" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
		</div>
	</form>	
	  </div>
	 </div>
    
    </div>
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

