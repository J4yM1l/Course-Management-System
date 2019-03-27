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
   <div class="container">
   		<div class="row"">
   		<div class="col-md-6"  style="margin-top: 40px">
		 <div style="color: gray " class="col col-md-12 bg-dark" id="course-announcements">
		 	<h4 style="text-align: center;">Course Announcements</h4>
		 	<div style="height: 200px;">
		 	</div>
		 </div>
		 </div>
		 <div class="col-md-6" style="margin-top: 40px">
		 <div style="color: gray " class="col col-md-12 bg-dark" id="favorite-courses">
		 	<h4 style="text-align: center;">Favorite Courses</h4>
		 	<div style="height: 200px;">
		 	</div>
		 </div>
		 </div>
		 <div class="col-md-6"  style="margin-top: 40px">
		 <div style=" color: gray " class="text-center col col-md-12 bg-dark" id="favorite-courses-grade">
			<h4 style="text-align: center;">Favorite Courses Grades</h4>
			<div style="height: 200px; ">
			</div>
		 </div>
		</div>
		<div class="col-md-6"  style="margin-top: 40px">
		 <div style=" color: gray " class="text-center col col-md-12 bg-dark" id="calendar">
			<h4 style="text-align: center;">Calendar</h4>
			<div style="height: 200px; ">
			</div>
		 </div>
		</div>
	</div>
	</div>
  
  <!-- footer -->
  <%@ include file="header_footer/footer.txt"  %>
