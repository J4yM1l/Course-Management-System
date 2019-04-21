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
	<script>
	function edit(){
  		document.getElementsByName("fname")[0].disabled=false;
  		document.getElementsByName("mname")[0].disabled=false;
  		document.getElementsByName("lname")[0].disabled=false;
  		document.getElementsByName("major")[0].disabled=false;
  		document.getElementsByName("level")[0].disabled=false;
  		document.getElementsByName("byear")[0].disabled=false;
  		document.getElementsByName("edit")[0].style.display = "none";
  		document.getElementById("cancel1").style.display = "block";
  		document.getElementsByName("update")[0].style.display = "block";

  		return;
  	}
	
	function updatepassword(){
		document.getElementById("oldp").style.display="none";
		document.getElementById("newp").style.display="block";


	}
	function cancel2(){
		document.getElementById("oldp").style.display="block";
		document.getElementById("newp").style.display="none";
	}
	function cancel1(){

  		document.getElementsByName("edit")[0].style.display = "block";
  		document.getElementById("cancel1").style.display = "none";
  		document.getElementsByName("update")[0].style.display = "none";
  		document.getElementsByName("fname")[0].disabled=true;
  		document.getElementsByName("mname")[0].disabled=true;
  		document.getElementsByName("lname")[0].disabled=true;
  		document.getElementsByName("major")[0].disabled=true;
  		document.getElementsByName("level")[0].disabled=true;
  		document.getElementsByName("byear")[0].disabled=true;
	}
	</script>
    <!-- Page Content -->
  <div class="container">
  <div class="row">
	<div class="card" style="width: 100%;">
	  <div class="card-header h2">
	    Personal Information
	  </div>
	  <div class="card" style="width: 100%;">
	  <%
	  	String[] infor=(String[])request.getAttribute("ProfileInfor");
	  %>
	  <ul class="list-group list-group-flush">
	    <li class="list-group-item">
	     <form action="<%=request.getContextPath()%>/StudentSiteNavigator?action=profile&infor=userinfor" method="post">
	     <%
	    	if(request.getAttribute("updated")!=null && request.getAttribute("updated").equals("true")){ %>
	    	
				<div class="alert alert-success" role="alert">
				  Profile information Up-To-Date
				</div>
	    	<%}%>
	    	<table>
	    	<tbody>
	    	<tr>
	    	<td><label class="font-weight-bold" for="">First: </label></td>
	    	<td><input  class="text-uppercase form-control" type="text" name="fname"value="<%=infor[0] %>"  disabled required></td>
	    	</tr>
	    	<tr>
	    	<td><label class="font-weight-bold" for="">Middle: </label></td>
	    	<td><input class="text-uppercase form-control" type="text" name="mname" value="<%=infor[1] %>" disabled></td>
	    	</tr>

	    	<tr>
	    	<td><label class="font-weight-bold" for="">Last: </label></td>
	    	<td><input class="text-uppercase form-control" type="text" name="lname" value="<%=infor[2] %>" disabled required></td>
	    	</tr>
	    	<tr>
	    	<td><label class="font-weight-bold" for="">Major: </label></td>
	    	<td><input class="text-uppercase form-control" type="text" name="major" value="<%=infor[3] %>" disabled required></td>
	    	</tr>
			<tr>
	    	<td><label class="font-weight-bold" for="">Classification: </label></td>
	    	<td><input class="text-uppercase form-control" type="text" name="level" value="<%=infor[4] %>" disabled required></td>
	    	</tr>
	    	<tr>
	    	<td><label class="font-weight-bold" for="">Birth Year: </label></td>
	    	<td><input class="text-uppercase form-control" type="number" name="byear" value="<%=infor[5] %>" disabled required></td>
	    	</tr>
	    	<tr>
	    	<tr><td><a onclick="edit()"><button type="button" name="edit" style="display: block" class="btn btn-primary text-uppercase form-control" >edit Information</button></a></td></tr>
	    	<tr><td><button type="submit"  name="update" style="display: none" class="btn btn-primary text-uppercase form-control" onclick="">Update</button>
	    	<td><a onclick="cancel1()" style="display: none" id="cancel1"><button type="button" class="btn btn-primary text-uppercase form-control">Cancel</button></a></td>
	    	
	    	
	    	</tr>
	    	</tbody>
	    	</table>
	    	</form>
		</li>

	    <li style="display:block" id="oldp"class="list-group-item">
	    	<%
	    	if(request.getAttribute("updatefailed")!=null && request.getAttribute("updatefailed").equals("true")){ %>
	    	
				<div class="alert alert-danger" role="alert">
				  Failed To change password
				</div>
	    	<%} else if(request.getAttribute("updatefailed")!=null && request.getAttribute("updatefailed").equals("false"))
	    	{
	    	%>
				<div class="alert alert-success" role="alert">
				  Password Changed Successfully
				</div>
	    	<%} %>
	    	<table>
	    	<tbody>
	    	<tr>
	    	<td><label class="font-weight-bold" for="">Username: </label></td>
	    	<td><input  class="form-control" type="text" value="<%=infor[6] %>"  disabled></td>
	    	</tr>
	    	<tr>
	    	<td><label class="font-weight-bold" for="">Password </label></td>
	    	<td><input class="form-control" type="text" value="<%=infor[7] %>" disabled></td>
	    	</tr>
			<tr>
	    	<td><button type="submit"  onclick="updatepassword()" class="btn btn-primary text-uppercase form-control">Change Password</button></td>
	    	</tr>
	    	</tbody>
	    	</table>
	    </li>
	    <li style="display: none" id="newp"class="list-group-item">
	    	<form action="<%=request.getContextPath()%>/StudentSiteNavigator?action=profile&infor=updatepassword" method="post">
		    	<table>
		    	<tbody>
		    	<tr>
		    	<td><label class="font-weight-bold" for="">New Password: </label></td>
		    	<td><input  class="form-control" type="text" placeholder="Enter Password" name="p1" value="" required></td>
		    	</tr>
		    	<tr>
		    	<td><label class="font-weight-bold" for="">New Password </label></td>
		    	<td><input class="form-control" type="text" placeholder="Re-enter Password" name="p2" value="" required></td>
		    	</tr>
				<tr>
		    	<td><button type="submit"  class="btn btn-primary text-uppercase form-control">Update</button></td>
		    	<td><a onclick="cancel2()" id="cancel2"><button type="button"  class="btn btn-primary text-uppercase form-control">Cancel</button></a></td>
		    	</tr>
		    	</tbody>
		    	</table>
	    	</form>
	    </li>
	  </ul>
	</div>
  	</div>
  </div>
</div>
  
  <!-- footer -->
  <%@ include file="header_footer/footer.txt"  %>
