<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %> 
    
<!-- header -->
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Home</title>
  <script src="f_sources/js/dataManipulation.js"></script>

  <!-- Bootstrap core CSS -->
  <link href="f_sources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="f_sources/css/business-frontpage.css" rel="stylesheet">
  <%
	String fnav=request.getParameter("nav");
	
%>
</head>

<body onload="setMenuActive(<%=fnav%>)" style="background-color: #5e5e5e">
 <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" style="color:#c7004c;" href="#">CS COURSE MANAGEMENT SYSTEM</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active" id=n0>
            <a class="nav-link" href="<%=request.getContextPath()%>/AdminSiteNavigator?nav=dashboard">Dashboard 
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item " id="n1">
            <a class="nav-link" href="<%=request.getContextPath()%>/AdminSiteNavigator?nav=createclass">Create Class</a>
          </li>
          <li class="nav-item"  id="n4">
            <a class="nav-link" href="<%=request.getContextPath()%>/AdminSiteNavigator?nav=offer">Add Offer</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="login.jsp">logout</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

<!-- Header -->
  <header class=" py-5 mb-5" style="background-color: #8f1537;">
    <div class="container h-100">
      <div class="row h-100 align-items-center">
        <div class="col-lg-12">
          <h1 class="display-4 text-white mt-5 mb-2">Computer Science Course Management System</h1>
          <p class="lead mb-5 text-white-50">Our Computer Science program is accredited by the Computing Accreditation Commission of ABET, <a href="http://www.abet.org.">http://www.abet.org.</a>
          <br/>
          Computer Science programs integrate extensive laboratory study, student organizations, seminars, and exposure to research experiences.</p>
        </div>
      </div>
    </div>
  </header>
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
   <div class="container" id="main-table">
   
		 <div class="container">
		  <div class="row">
		    
		     <div class="col-lg" style="margin: 6px">
				<div class="card">
				  <h5 class="card-header">All Courses</h5>
				  <div class="card-body">
				 <!-- Begin -->
				  <!-- end -->
				   <table class="table" id="allcourse">
				  <thead class="thead-light">
				    <tr>
				      <th scope="col">#ID</th>
				      <th scope="col">Course Name</th>
				      <th scope="col">Professor</th>
				      <th scope="col">Action</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<%
				  		String[][] result=(String[][])request.getAttribute("activeOffers");
				  		StringTokenizer token=new StringTokenizer("");
				  		if(result!=null){
				  		for(int i=0; i<result.length; i++){
				  			if(result[i][0]==null)break;
				  			token=new StringTokenizer(result[i][1],"&");
				  	%>
					    <tr>
					      <td>#<%=result[i][0] %></td>
					      <td><%=token.nextToken() %></td>
					      <td><%=token.nextToken() %></td>
					      <td><button type="button" class="btn btn-success btn float-right">remove</button></td>
					    </tr>
				    <%}
				  		}%>
				  		
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
