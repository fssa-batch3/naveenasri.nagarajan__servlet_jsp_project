<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./assets/css/universe.css" />
<link rel="stylesheet" href="./assets/css/user_login.css">
<link rel="stylesheet" href="./assets/css/index.css" />
<title>Delete Architect</title>
</head>
<body>
	<jsp:include page="header.jsp" />

	<h1>Delete Architect Account</h1>

	<%
	String email = (String) request.getParameter("email");
	%>
	<form action="deleteArchitect" method="post" id="deleteArchitectForm"
		class="onlylog">
		<label>Email:</label> <input type="email" name="email" id="email"
			placeholder="Enter email" value="<%=email%>" required /> <br /> <br />

		<div class="signupbtn_div">
			<a class="signupbtn" href="LogoutServlet">Logout</a>
		</div>
		<div>
			<button type="submit">Delete Account</button>
		</div>
	</form>
</body>
</html>
