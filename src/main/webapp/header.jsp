<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.dynamicdesign.model.*"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Index Page</title>
<link rel="stylesheet" href="./assets/css/universe.css" />
<link rel="stylesheet" href="./assets/css/index.css" />
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
			User user = (User) session.getAttribute("user");
			if (user == null) {
			%>
<!--
			<a class="a" href="architect_home.jsp">Home</a> <a class="a"
				href="architectlistservlet">Architects</a> <a class="a"
				href="architectdesignlistservlet">Designs</a> <a class="a"
				href="create_design.jsp">Add Design</a> <a class="a"
				href="design_edit.jsp">Edit design</a> <a class="a"
				href="architect_update.jsp?email=<%=loggedInEmail%>">Edit
				Profile</a> <a class="a"
				href="architect_delete.jsp?email=<%=loggedInEmail%>">Delete
				Profile</a>
			 header is started -->
			
			
			<a class="a" href="architect_home.jsp">Home</a>
							<a class="a" href="create_design.jsp">Create Design</a>
							<a class="a" href="architectdesignlistservlet">Designs</a>
							<a class="a" href="ordered_design.jsp">Ordered list</a>
							<a class="a" href="architect_about_us.jsp">About us</a>
							<a class="a" href="architect_contact_us.jsp">Contact us</a>
							<a class="a" href="architect_profile.jsp?email=<%=loggedInEmail%>">
								<img src="<%=request.getContextPath()%>/assets/image/common/profile.png" alt="profile" class="profileofuser">
							</a>
			<%
			} else {
			%>
			<!-- header is started  user.getType().equals("user") 
			<a class="a" href="user_home.jsp">Home</a> <a class="a"
				href="userarchitectlistservlet">Architects</a> <a class="a"
				href="userdesignlistservlet">Designs</a> <a class="a"
				href="user_update.jsp?email=<%=loggedInEmail%>">Edit Profile</a> <a
				class="a" href="user_delete.jsp?email=<%=loggedInEmail%>">Delete
				Profile</a>
				-->
				
				<a class="a" href="user_home.jsp">Home</a> <a class="a"
									href="userarchitectlistservlet">Architects</a> <a class="a"
									href="userdesignlistservlet">Designs</a> <a class="a" href="user_about_us.jsp">About
									us</a> <a class="a" href="user_contact_us.jsp">Contact us</a> <a class="a"
									href="user_profile.jsp?email=<%=loggedInEmail%>"> <img src="<%=request.getContextPath()%>/assets/image/common/profile.png"
										alt="profile" class="profileofuser">
								</a>
			<%
			}
			}
			%>
		</nav>

	</header>
	<!-- header is ended -->
</body>

</html>