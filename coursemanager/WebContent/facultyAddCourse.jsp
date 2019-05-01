<%@page import="wssu.javaclasses.Faculty"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import=" wssu.sitemanager.*" %>
 <%@ page import="java.util.*" %> 
 <%@ page import= " wssu.javaclasses.Faculty" %>
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

</head>
<body>
  <!-- Page Content -->
    <div class="container">
    <form class="form-inline" style="margin: auto" action="<%=request.getContextPath()%>/FacultySiteNavigator?action=lookupcourses" method="post">
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
					</select><br/>
<!-- 	  		  </div> -->
<!-- 		</div><br/> -->
		<br/><br/>
<!-- 		  <input type="number" class="form-control form-control-sm" placeholder="Enter Year" id="year"> -->
<!-- 		<div class="btn-group"> -->
<!-- 		  <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!-- 		    Select Classes -->
<!-- 		  </button> -->
<!-- 		  <div class="dropdown-menu dropdown-menu-right"> -->
				<input class="form-control form-control-sm" type="number" name="year" placeholder="Enter Year" required >
				<button type="sumbit" class="btn btn-primary" style="margin: auto;">Search</button>
<!-- 				<div class="form-group row"> -->
<!-- 					    <div class="col-md-10"> -->
<!-- 					      <button type="submit" class="btn btn-primary" style="margin: auto;">Search</button> -->
<!-- 					    </div> -->
<!-- 					 </div>		 -->
				<br><br>
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
	          <th scope="row">Location</th>
	           <th scope="row">Room #</th>
	      </tr>
	    </thead>
		  <tbody>
<%-- 	<form class="form-inline" style="margin: auto" action="<%=request.getContextPath()%>/FacultySiteNavigator?action=Clearcourse" method="post"> --%>
		  <% String[][] facultyData=(String[][])request.getAttribute("offered");
		 
		  if (facultyData != null){
		  for(int i = 0; i<facultyData.length; i++){
		  	if(facultyData[i][0] == null){
		  		break;
		  	}
		  
		  %>
		    <tr>
		      <th scope="row"><%=facultyData[i][0] %></th>
		      <td><%=facultyData[i][1] %></td>
		      <td><%=request.getParameter("semester") %></td>
		      <td><%=facultyData[i][2] %></td>
		      <td><%=facultyData[i][3] %></td>
		  
<!-- 			<button type="button" class="btn btn-primary">Remove</button> -->
		    </tr>  
		   <%}} %>
		   
<!-- 		  </form> -->
<!-- 		    <tr> -->
<!-- 		      <th scope="row">2</th> -->
<!-- 		      <td>CSC 3212</td> -->
<!-- 		      <td>Fall Semester</td> -->
<!-- 		    </tr> -->
<!-- 		    <tr> -->
<!-- 		      <th scope="row">3</th> -->
<!-- 		      <td>CSC 3213</td> -->
<!-- 		      <td>Fall Semester</td> -->
<!-- 		    </tr> -->
	
		  </tbody>
	</table>
	</div>
	</div>
	  <!-- footer -->
  <%@ include file="header_footer/footer.txt"  %>
</body>
</html>