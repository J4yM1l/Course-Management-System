<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    
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
	<div class="row">
	<div class="card" style="width: 100%;">
	  <div class="card-header h2">
	    Active Registered Classes
	  </div>
	  <ul class="list-group list-group-flush">
	  <%

	  	String[] data=(String[])request.getAttribute("offered");
	  	String cID, cName, professor, meet_at, rm, oid;
	  	int o;
	  	boolean found=false;
	  	int[] enrollID=(int[])request.getAttribute("enrollClasses");
	  	if(data!=null){
	  	StringTokenizer token=new StringTokenizer("");
	
	  	for(int i=0; i<data.length; i++){
	  		if(data[i]==null)break;
	  		token=new StringTokenizer(data[i],"&");
	  		cID=token.nextToken();
	  		cName=token.nextToken(); 
	  		professor=token.nextToken(); 
	  		meet_at=token.nextToken(); 
	  		rm=token.nextToken(); 
	  		oid=token.nextToken(); 

		    found=false;
		    for(int e=0; e<enrollID.length; e++){ 
		    	if(enrollID[e]==Integer.parseInt(oid)){
		    		found=true;
		    		break;}}
		    if(found==true){
  	%>
	    <li class="list-group-item">
	    	<div class="card" style="width: 100%;">
			  <div class="card-body">
			    <label class="card-title font-weight-bold">Course Name: </label>
			    <label > <%=cName%></label><br/>
			    <label class="card-title font-weight-bold">Course ID: </label>
			    <label><%=cID%></label><br/>
			    <label class="card-title font-weight-bold">Professor: </label>
			    <label><%=professor %></label><br/>
			   	<label class="card-title font-weight-bold">Meeting Location: </label>
			    <label><%=meet_at%></label><br/>
			    <label class="card-title font-weight-bold"> Meeting Room: </label>
			    <label>#<%=rm %></label><br/>    
			    <a class="float-right" href="<%=request.getContextPath()%>/StudentSiteNavigator?nav=drop&oid=<%=oid%>"><button type="submit" class="btn btn-danger float-left">DROP</button></a>
			  </div>
			</div>
	    </li>
	    <%}}} %>
	  </ul>
	</div>
	</div>
  </div>
  
  <!-- footer -->
  <%@ include file="header_footer/footer.txt"  %>
