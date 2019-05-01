<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" 

    %> 
<!DOCTYPE html>
<html>
<!--head-->
<%@ include file="header_footer/f_header.txt"  %>
<script src="f_sources/js/dataManipulation.js"></script>
<!--meta charset="ISO-8859-1"-->
<title>Faculty Home Page</title>
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
<!--/head-->
<%String fs = (String)request.getAttribute("faculty_courses");%>
<body>
<script>


</script>
  <div class="container" id="main-table">
   
<div class="container">
<table class="table  table-hover table-striped text-center">
  <thead class="thead-dark">
    <tr>
      <th scope="col">#oid</th>
      <th scope="col">#cid</th>
      <th scope="col">Course Title</th>
      <th scope="col">Semester</th>
      <th scope="col">Number of Students Enrolled</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
   <% String[] facultyData=(String[])request.getAttribute("facultyAssigncourses");
   	StringTokenizer token;
		  if (facultyData != null){
		  for(int i = 0; i<facultyData.length; i++){
		  	if(facultyData[i] == null){
		  		break;
		  	}
		  	token=new StringTokenizer(facultyData[i], "&");
		  	String oid=token.nextToken();
		  
		  %>
    <tr class="table-danger">
      <th scope="row"><%=oid %></th>
      <td><%=token.nextToken() %></td>
      <td><%=token.nextToken()%></td>
      <td class="text-center"><%=token.nextToken()%></td>
      <td><%=token.nextToken()%></td>
      <td><button type="button" class="btn btn-info" onclick="">detail</button></td>
    </tr>
     <%}} %>
    
  </tbody>
</table>



	<div class="card" style="width: 100%; display: none">
	  <div class="card-header">
	    Featured
	  </div>
	  <table class="table  table-hover table-striped">
	  <thead class="thead-dark">
	    <tr>
	      <th scope="col">First Name</th>
	      <th scope="col">Last Name</th>
	      <th scope="col">Classification</th>
	    </tr>
	  </thead>
	  <tbody id="tablebody">
	   
	  </tbody>
	</table>
	</div>
  </div>
  </div>
    <!-- footer -->
  <%@ include file="header_footer/footer.txt" %>
</body>
</html>