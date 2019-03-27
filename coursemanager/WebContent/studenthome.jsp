<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!-- header -->
  <%@ include file="header_footer/header.txt"  %>
  <script src="f_sources/js/dataManipulation.js"></script>
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
   <div class="container">
   
		 <div class="container">
		  <div class="row">
		    <div class="col-sm">
				<div class="card">
				  <h5 class="card-header">TODO List</h5>
				  <div class="card-body">
					<ul class="list-group" id="input-list">
					</ul>
					  <div class="input-group mb-3">
						  <input type="text" class="form-control" id="todo-input" value="" placeholder="Add To TODO..." aria-label="todo list" aria-describedby="todo list">
						  <div class="input-group-append">
						    <button class="btn btn-outline-secondary btn-dark" type="button" onclick="add_to_Todo()" >Add</button>
						  </div>
					</div>
				  </div>
				</div>
		    </div>
		    <div class="col-sm">
				<div class="card">
				  <h5 class="card-header">Lowest Grade</h5>
				  <div class="card-body">
				    <h5 class="card-title">Special title treatment</h5>
				    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
				  </div>
				</div>
		    </div>
		    <div class="col-sm">
				<div class="card">
				  <h5 class="card-header">Calendar</h5>
				  <div class="card-body">
				    <h5 class="card-title">Special title treatment</h5>
				    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
				  </div>
				</div>
		    </div>
		  </div>
		</div>

	</div>
  
  <!-- footer -->
  <%@ include file="header_footer/footer.txt"  %>
