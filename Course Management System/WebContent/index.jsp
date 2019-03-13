<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CS Course Management</title>
</head>
<body>
<h1> Home</h1>
<form action="<%= request.getContextPath()%>/PageNavigator" method="get">
<input type="hidden" name="output" value="connect">
<input type="submit" value="Test Database Connection">
</form>
</body>
</html>