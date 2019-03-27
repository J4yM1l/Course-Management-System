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
  	<div>
  		<div >
  			<table>
  				<tr>
  					<th><label>Course Name</label></th>
  					<th><label style="margin-left: 210px;">Grade</label></th>
  				</tr>
  			</table>
  			<table >
  				<tr>
  				  	<th><label>CSC 1310 Computer Program. I</label></th>
  					<th><label style="margin-left: 100px;">A</label></th>
  				</tr>

  			</table>
  		</div>
  	</div>
  </div>
  
  <!-- footer -->
  <%@ include file="header_footer/footer.txt"  %>
