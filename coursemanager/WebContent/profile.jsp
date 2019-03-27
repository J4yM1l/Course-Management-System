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
  <!-- form -->
	<form action="<%= request.getContextPath()%>/PageNavigator" method="get">
		<input type="hidden" name="output" value="connect">
		<input type="submit" value="Test Database Connection">
	</form>	
  </div>
  
  <!-- footer -->
  <%@ include file="header_footer/footer.txt"  %>
