<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!-- header -->
  <%@ include file="header_footer/header.txt"  %>
 <%
  String username = null, sessionID = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("username")) {
					username = cookie.getValue();
				}
				if (cookie.getName().equals("JSESSIONID")) {
					sessionID = cookie.getValue();
				}
			}
		}
		System.out.println(username +"  <---user"+ sessionID+"<----seesion");
		if ((sessionID == null || username == null)) {
			response.sendRedirect("index.jsp");
		}
	%>
    <!-- Page Content -->
   <div class="container" id="main-table">
   
		 <div class="container">
		  <div class="row">
		    <div class="col-lg"  style="margin: 6px">
			  <div class="card">
				  <h5 class="card-header">TODO List</h5>
				<div class="card-body">	
					<table class="table table-hover">
					  <thead class="thead-dark">
					    <tr>
					      <th scope="col" style="text-align:left;">Task</th>
					      <th scope="col" style="text-align:right; width:20%"></th>  
					    </tr>
					  </thead>
					  <tbody id="table-body">
					  <!-- Adding ToDO items Here -->
					  </tbody>
					</table>
						  <div class="input-group mb-3">
							  <input type="text" class="form-control" id="todo-input" value="" placeholder="Add To TODO..." aria-label="todo list" aria-describedby="todo list">
							  <div class="input-group-append">
							    <button class="btn btn-outline-secondary btn-dark" type="button" onclick="add_to_Todo()" >Add</button>
						  	  </div>
						 </div>
				</div>
			  </div>
		    </div>
		    <div class="col-lg" style="margin: 6px">
				<div class="card">
				  <h5 class="card-header">Course Summary</h5>
				  <div class="card-body">
				  <h5>Above Average</h5>
				   <table class="table">
				  <thead class="thead-dark">
				    <tr>
				      <th scope="col">Course</th>
				      <th scope="col">Professor</th>
				      <th scope="col">Grade</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <td>Computer Programming</td>
				      <td>Mark</td>
				      <td>95%</td>
				    </tr>

				  </tbody>
				</table>
				<h5>Below Average</h5>
				<table class="table">
				  <thead class="thead-dark">
				    <tr>
				      <th scope="col">Course</th>
				      <th scope="col">Professor</th>
				      <th scope="col">Grade</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <td>Computer Programming</td>
				      <td>Mark</td>
				      <td>70%</td>
				    </tr>

				  </tbody>
				</table>
				  </div>
				</div>
		    </div> 
		    
		     <div class="col-lg" style="margin: 6px">
				<div class="card">
				  <h5 class="card-header">Course Rooster</h5>
				  <div class="card-body">
				 <!-- Begin -->
				 <form class="form-inline">
				  <div class="form-group mb-2">
				    <label for="course-description" class="sr-only">Email</label>
					<!-- Select tag here -->
				  </div>
				  <div class="form-group mx-sm-3 mb-2">
				    <label for="inputPassword2" class="sr-only">Password</label>
				    <input type="password" class="form-control" id="inputPassword2" placeholder="Password">
				  </div>
				  <button type="submit" class="btn btn-primary mb-2">Confirm identity</button>
				</form>
				  <!-- end -->
				   <table class="table">
				  <thead class="thead-dark">
				    <tr>
				      <th scope="col">Student</th>
				      <th scope="col">Professor</th>
				      <th scope="col">Year</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <td>Computer Programming</td>
				      <td>Mark</td>
				      <td>95%</td>
				    </tr>

				  </tbody>
		     </table>
		  </div>
		</div>
	</div>
  </div>
  </div>
  </div>
  
  <!-- footer -->
  <%@ include file="header_footer/footer.txt"  %>
