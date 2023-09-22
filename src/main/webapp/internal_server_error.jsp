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
	<h1 Style="font-size:45px">
		Error Occurred <span style='font-size:40px;'> &#128532;</span>
		 :  <a href="user_login.jsp"> User Login</a>
	</h1>
	<img alt="interior design" class="free_img" Style="width: auto;height: auto;margin-left: 90px;" src="./assets/image/common/error.png">
	
	<%
	} else if (loggedInEmail == null) {
	%>
<h1 Style="font-size:45px">
		Error Occurred <span style='font-size:40px;'> &#128532;</span>
		 :  <a href="architect_login.jsp"> Architect Login</a>
	</h1>
	<img alt="interior design" class="free_img" Style="width: auto;height: auto;margin-left: 90px;" src="./assets/image/common/error.png">
		<%
	} else {
	%>
<h1 Style="font-size:45px">
		Error Occurred <span style='font-size:40px;'> &#128532;</span>
		 :  <a href="index.jsp">Index</a>
	</h1>
	<img alt="interior design" class="free_img" Style="width: auto;height: auto;margin-left: 90px;" src="./assets/image/common/error.png">
		<%
	}
	%>

</body>
</html>