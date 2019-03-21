<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!-- header -->
  <%@ include file="header_footer/header.txt"  %>
  
  
    <!-- Page Content -->
    <div class="container">
    	<div class="row">
	  <div class="col-md-6" style="background-color: #f6f5f5; width: 50%; float: left;">
	  	<div >
	  		<div style="background-color:#dadddf ;"><h4>Available Courses</h4></div>
	  		<div style="background-color:#ffefe0">
	  			<div style="border-style:dotted; margin: 10px; border-color: gray;">
	  				<label>CSC 1310 Computer Program. I</label>
	  				<input type="button" name="add" value="Add" style="float: right">
	  			</div>
	  			<div style="border-style:dotted; margin:10px; ">
	  				<label>CSC 1311 Computer Program. II</label>
	  				<input type="button" name="add" value="Add" style="float: right">
	  			</div>
	  			<div style="border-style:dotted; margin: 10px;">
	  				<label>CSC 4323 System Admim II</label>
	  				<input type="button" name="add" value="Add" style="float: right">
	  			</div>
	  		</div>
	  	</div> 	
	  </div>
	  <div class="col-md-6" style="background-color: #f6f5f5; width: 50%; float: right; display: block;">
	  	<div >
	  		<div style="background-color:#dadddf ;"><h4>Added Courses</h4></div>
	  		<div style="background-color:#ffefe0">
				<div style="border-style:dotted; margin: 10px">
	  				<label>CSC 1310 Computer Program. I</label>
	  				<input type="button" name="add" value="Remove" style="float: right">
	  			</div>
	
			</div>
	  	</div> 	
	  </div>
	  </div>
	</div>
  <!-- footer -->
  <%@ include file="header_footer/footer.txt"  %>
