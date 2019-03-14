<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!-- header -->
  <%@ include file="header_footer/header.txt"  %>
  
  
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
