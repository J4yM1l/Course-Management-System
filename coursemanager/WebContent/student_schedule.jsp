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
	<div class="row">
		<div class="col-md-6">
			<div style="border-right: 5px solid; border-left: 5px solid;border-right-width: thin; border-left-width: thin;">
				<div style="margin-left: 10px; margin-right:10px;">
				<h5 ><b>CSC 1310 Computer Program. I</b></h5>
				<table style="width:100%;">
				<tr>
					<th>
						Assigned Instructor:
					</th>
					<th>
						Mustafa Atay
					</th>
				</tr>
				<tr>
					<th>
						Grade Mode:
					</th>
					<th>
						Standard A, B, C, D, F, I
					</th>
				</tr>
				<tr>
					<th>
						Time:
					</th>
					<th>
						9:30 am - 10:45 
					</th>
				</tr>
				<tr>
					<th>
						Day:
					</th>
					<th>
						Monday; Wednesday
					</th>
				</tr>
				</table>
				</div>
			</div>
		</div>
		
		<!-- Second course -->
		<div class="col-md-6">
			<div style="border-right: 5px solid; border-left: 5px solid;border-right-width: thin; border-left-width: thin;">
				<div style="margin-left: 10px; margin-right:10px;">
				<h5 ><b>CSC 1310 Computer Program. I</b></h5>
				<table style="width:100%;">
				<tr>
					<th>
						Assigned Instructor:
					</th>
					<th>
						Mustafa Atay
					</th>
				</tr>
				<tr>
					<th>
						Grade Mode:
					</th>
					<th>
						Standard A, B, C, D, F, I
					</th>
				</tr>
				<tr>
					<th>
						Time:
					</th>
					<th>
						9:30 am - 10:45 
					</th>
				</tr>
				<tr>
					<th>
						Day:
					</th>
					<th>
						Monday; Wednesday
					</th>
				</tr>
				</table>
				</div>
			</div>
		</div>
	</div>
  </div>
  
  <!-- footer -->
  <%@ include file="header_footer/footer.txt"  %>
