<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %> 
    
<!-- header -->
  <%@ include file="header_footer/header.txt"  %>
  <script>
  	//function disable(id)
  </script>
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
    <form class="form-inline" style="margin: auto" action="<%=request.getContextPath()%>/StudentSiteNavigator?action=register" method="post">
	  <div class="form-inline" style="margin: auto">
  			<select class="form-control form-control-sm" name="semester">
			  <option>Select Semester</option>
			  <option>Fall</option>
			  <option>Winter</option>
			  <option>Summer I</option>
			  <option >Summer II</option>  
			</select><br/>
		  <input type="number" class="form-control form-control-sm" placeholder="Enter Year" value="<%=(request.getParameter("year")!=null)? request.getParameter("year"):"" %>" name ="year"id="year">
		  <button type="submit" class="btn btn-primary">Submit</button>
		</div>
	</form><br/>
    
	    <table class="table table-hover ">
	    <thead class="thead-light">
	      <tr>
	        <th>Available Courses to Add</th>
	      </tr>
	    </thead>
	    <tbody>
	    <% 

	    	String[] data=(String[])request.getAttribute("offered");
	    	String c;
	    	int o;
	    	boolean found=false;
	    	int[] enrollID=(int[])request.getAttribute("enrollClasses");
	    	if(data!=null){
	    	StringTokenizer token=new StringTokenizer("");

	    	for(int i=0; i<data.length; i++){
	    		System.out.println(data[i]);
	    		if(data[i]==null)break;
	    		token=new StringTokenizer(data[i],"&");
	    		c=token.nextToken(); 
	    	%>
	      <tr>
	        <td>
	        <form action="<%=request.getContextPath()%>/StudentSiteNavigator?action=enroll" method="post">
        		<div class="card">
				  <div class=""style="display:inline">
				  	<label class="card-title font-weight-bold"> ID#: </label>
				    <label name="<%=c%>"><%=c%></label><br/>
				    <label class="card-title font-weight-bold"> Name: </label>
				    <label><%=token.nextToken() %></label><br/>
				    <label class="card-title font-weight-bold"> Professor: </label>
				    <label><%=token.nextToken() %></label><br/>
				   	<label class="card-title font-weight-bold"> Meet At: </label>
				    <label><%=token.nextToken() %></label><br/>
				    <label class="card-title font-weight-bold"> Room Number: </label>
				    <label><%=token.nextToken() %></label>
				    <% o=Integer.parseInt(token.nextToken());%>
				    <input type="hidden" name="oid" value="<%=o%>"></input>
				    <%
				    found=false;
				    for(int e=0; e<enrollID.length; e++){ 
				    	System.out.println(enrollID[e]+" "+o);
				    	if(enrollID[e]==o){
				    		found=true;
				    		break;}}
				    if(found==false){
	    			%>
	    			<button type="submit" class="btn btn-primary float-right" onclick="">Enroll</button>
	    			<%}else{
	    			%>
	    			<label class="float-right" onclick="">You are already Enrolled</label>
	    			<%} %>
				  </div>
				  
				</div>
			</form>
	        </td>
	      </tr>
	     <%} }
	     
	     %>
	    </tbody>
	  </table>
	</div>
  <!-- footer -->
  <%@ include file="header_footer/footer.txt"  %>
