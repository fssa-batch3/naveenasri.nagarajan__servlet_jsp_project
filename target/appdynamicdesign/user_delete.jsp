<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./assets/css/universe.css" />
<link rel="stylesheet" href="./assets/css/user_login.css">
<link rel="stylesheet" href="./assets/css/index.css" />
<title>Delete User</title>
</head>
<body>
	<jsp:include page="header.jsp" />

	<h1>Delete User Account</h1>

	<%
	String email = (String) request.getParameter("email");
	%>
	
	<%
				String errorMessage = request.getParameter("error");
				if (errorMessage != null) {
				%>

				<div class="styledbutton">
					<%=errorMessage%>
					<!-- this will change based on invalid field entered -->
				</div>
				<br /> <br />
				<%
				}
				%>
	<form action="deleteUser?email=<%=email%>" method="post" id="deleteUserForm"
		class="onlylog">
		<label>Email:</label> <input type="email" name="email" id="email"
			placeholder="Enter email" required value="<%=email%>" /> <br /> <br />

		<div class="signupbtn_div">
			<a class="signupbtn" href="LogoutServlet">Logout</a>
		</div>
		<div>
			<button type="submit">Delete Account</button>
		</div>
	</form>
</body>
</html>
