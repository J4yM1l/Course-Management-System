<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <%@ include file="header_footer/f_header.txt"  %>
  <meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<title>Faculty Adding Course</title>

 <!-- Bootstrap core CSS -->
  <link href="f_sources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="f_sources/css/business-frontpage.css" rel="stylesheet">
    <script src="f_sources/js/dataManipulation.js"></script>
    <%String faculty_C= (String)request.getAttribute("faculty_courses"); 
	  String faculty_S= (String)request.getAttribute("faculty_semester");
    %>
</head>
<body>
  <!-- Page Content -->
    <div class="container">
    <form class="form-inline" style="margin: auto" action="<%=request.getContextPath()%>/FacultySiteNavigator?action=addcourse" method="post">
	  <div class="form-inline" style="margin: auto">
<!--   			<select class="form-control form-control-sm" name="semester"> -->
<!-- 		<div class="btn-group"> -->
<!-- 			  <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!-- 			    Select Semester -->
<!-- 			  </button> -->
<!-- 			  <div class="dropdown-menu dropdown-menu-right"> -->
			    <select class="form-control form-control-sm" name="semester">
				  <option selected>Select Semester</option>
				  <option>Fall</option>
				  <option>Winter</option>
				  <option>Summer I</option>
				  <option >Summer II</option>  
				</select>
<!-- 	  		  </div> -->
<!-- 		</div><br/> -->
		<br/><br/>
<!-- 		  <input type="number" class="form-control form-control-sm" placeholder="Enter Year" id="year"> -->
<!-- 		<div class="btn-group"> -->
<!-- 		  <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!-- 		    Select Classes -->
<!-- 		  </button> -->
<!-- 		  <div class="dropdown-menu dropdown-menu-right"> -->
		    <select class="form-control form-control-sm" name="courses">
				  <option>Select Courses</option>
				  <option value="Web technology">CSC 3211</option>
				  <option value="Comp Programming I">CSC 3212</option>
				  <option value="Comp Programming II">CSC 3213</option>
				  <option >CSC 3214</option>
				   <option >Introduction to Cryptography</option>  
				</select>
				<button type="submit" class="btn btn-primary">Add</button>
<!--   		  </div> -->
		</div>
		  
		 </form>
<!-- 		</div> -->
	<br/>
   		 <div class="container">
	    <table class="table table-hover">
	    <thead class="thead-light">
	      <tr>
	       	<th scope="row">ID</th>
	        <th scope="row">COURSE TITLE</th>
	         <th scope="row">SEMESTER</th>
	      </tr>
	    </thead>
		  <tbody>
		    <tr>
		      <th scope="row">1</th>
		      <td><%=(faculty_C == null) ? "No class selected":faculty_C %></td>
		      <td><%=faculty_S %></td>
		    </tr>
		    <tr>
		      <th scope="row">2</th>
		      <td>CSC 3212</td>
		      <td>Fall Semester</td>
		    </tr>
		    <tr>
		      <th scope="row">3</th>
		      <td>CSC 3213</td>
		      <td>Fall Semester</td>
		    </tr>
		  </tbody>
	</table>
	</div>
	</div>
	  <!-- footer -->
  <%@ include file="header_footer/footer.txt"  %>
</body>
</html>