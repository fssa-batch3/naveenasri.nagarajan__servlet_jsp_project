<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="com.fssa.dynamicdesign.model.*"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	User user = (User) session.getAttribute("user");
	String loggedInEmail = (String) session.getAttribute("loggedInEmail");

	if (user == null) {
	%>
	<a href="user_login.jsp"> User Login</a>
	<%
	} else if (loggedInEmail == null) {
	%>
	<a href="architect_login.jsp"> Architect Login</a>
	<%
	} else {
	%>
	<a href="index.jsp">index page </a>
	<%
	}
	%>

</body>
</html>