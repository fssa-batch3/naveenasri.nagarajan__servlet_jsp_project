<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Index Page</title>
<link rel="stylesheet" href="./assets/css/universe.css" />
<link rel="stylesheet" href="./assets/css/index.css" />

<link rel="stylesheet" href="./assets/css/architect_register.css" />
</head>

<body>
	<!-- header is started -->
	<header class="header">
		<div>
			<a href="#"> <img src="./assets/image/common/logo.png" alt="logo"
				class="logo" />
			</a>
		</div>
		<nav class="nav">
<%
			String loggedInEmail = (String) session.getAttribute("loggedInEmail");
			if (loggedInEmail == null) {
			%>
			<div id="button">
				<div class="dropdown">
					<button class="dropbtn">Login</button>
					<div class="dropdown-content">
						<a href="user_login.jsp">login as customer</a> <a
							href="architect_login.jsp">login as architect</a>
					</div>
				</div>

				<div class="dropdown">
					<button class="dropbtn">Register</button>
					<div class="dropdown-content">
						<a href="user_register.jsp">Register as customer</a> <a
							href="architect_register.jsp">Register as architect</a>
					</div>
				</div>
			</div>

			<%
			} else {
			%>
			<!-- header is started -->
			<a class="a" href="architect_home.jsp">Home</a>
			<a class="a" href="architectlistservlet">Architects</a> 
			<a class="a" href="architectdesignlistservlet">Designs</a>
			<a class="a" href="create_design.jsp">Add Design</a>
			<a class="a" href="design_edit.jsp">Edit design</a>
			<a class="a" href="architect_update.jsp?email=<%=loggedInEmail %>">Edit Profile</a>
			<a class="a" href="architect_delete.jsp?email=<%=loggedInEmail %>">Delete Profile</a>
			<%
			}
			%>
		</nav>

	</header>
	<!-- header is ended -->
</body>

</html>