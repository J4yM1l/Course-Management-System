<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!-- header -->
  <%@ include file="header_footer/header.txt"  %>
  
 <%
  String username = null, sessionID = null;
		Cookie[] cookies = request.getCookies();
		//check for the current user session and cookie; if availabled, it loads this page else it redirect to the index page
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
					  <thead class="thead-light">
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
				  <h5 class="card-header">Course Rooster</h5>
				  <div class="card-body">
				 <!-- Begin -->
				<form action="<%=request.getContextPath()%>/StudentSiteNavigator?action=taken" method="post" onSubmit="onSubmitDeleteRows(allcourse)">
					<select class="form-control form-control-sm" name="course">
					  <option selected>Select Course</option>
					  <%String[][] data=(String[][]) request.getAttribute("allCourses");
					  	if(data!=null){	
					  	for(int i=0; i<data.length; i++){
					  		if(data[i][1]==null){break;}%>
					  		<option> <%=data[i][1]%> </option><%
					  	}}	
					  %>
					</select><br/>
					<select class="form-control form-control-sm" name="semester">
					  <option>Select Semester</option>
					  <option>Fall</option>
					  <option>Winter</option>
					  <option>Summer I</option>
					  <option >Summer II</option>  
					</select><br/>
					<input class="form-control form-control-sm" type="number" name="year" placeholder="Enter Year" required >
					<br/>
					<div class="form-group row">
					    <div class="col-md-10">
					      <button type="submit" class="btn btn-primary text-center col-md-4" style="margin: auto;">Search</button>
					    </div>
					 </div>				
	  			</form>
				  <!-- end -->
				  <h3><%=(request.getParameter("course")!=null && !request.getParameter("course").equals("Select Course")? request.getParameter("course"): "" ) %></h3>
				   <table class="table" id="allcourse">
				  <thead class="thead-light">
				    <tr>
				      <th scope="col">Student</th>
				      <th scope="col">Professor</th>
				      <th scope="col">Semester</th>
				      <th scope="col">Year</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<%
				  		String[][] result=(String[][])request.getAttribute("taken");
				  		if(result!=null){
				  		for(int i=0; i<result.length; i++){
				  			if(result[i][0]==null)break;				  			
				  	%>
					    <tr>
					      <td><%=result[i][0] %></td>
					      <td><%=result[i][1] %></td>
					      <td><%=request.getParameter("semester") %></td>
					      <td><%=request.getParameter("year") %></td>
					    </tr>
				    <%}
				  		}%>
				  		
				  		<tr id="none"class="text-center font-italic small">
					      <td>Nothing to Show</td>
					      <td>Nothing to Show</td>
					      <td>Nothing to Show</td>
					      <td>Nothing to Show</td>
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
