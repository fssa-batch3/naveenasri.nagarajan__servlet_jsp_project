<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Index Page</title>
<link rel="stylesheet" href="../assets/css/universe.css" />
<link rel="stylesheet" href="../assets/css/index.css" />
</head>

<body>
	<!-- header is started -->
	<header class="header">
		<div>
			<a href="#"> <img src="../assest/image/common/logo.png"
				alt="logo" class="logo" />
			</a>
		</div>
		<nav class="nav">

			<%
			String loggedInEmail = (String) session.getAttribute("loggedInEmail");
			if (loggedInEmail == null) {
			%>
			<div id= "button">
				<div class="dropdown">
					<button class="dropbtn">Login</button>
					<div class="dropdown-content">
						<a href="./pages/user_login.html">login as customer</a> <a
							href="./pages/architect_required_qualification.html">login as
							architect</a>
					</div>
				</div>

				<div class="dropdown">
					<button class="dropbtn">Register</button>
					<div class="dropdown-content">
						<a href="./pages/user_login.html">Register as customer</a> <a
							href="./pages/architect_required_qualification.html">Register
							as architect</a>
					</div>
				</div>
			</div>

			<%
			} else {
			%>
			<!-- header is started -->
			<header class="header">
				<div>
					<a href="#"> <img src="../assets/image/common/logo.png"
						alt="logo" class="logo" />
					</a>
				</div>
				<nav>
					<a class="a" href="./user_home.html">Home</a> <a class="a"
						href="./user_architect.html">Architects</a> <a class="a"
						href="./user_design_list.html">Designs</a> <a class="a"
						href="./user_about_us.html">About us</a> <a class="a"
						href="./user_contact_us.html">Contact us</a> <a class="a"
						href="./own_user_profile.html"> <img
						src="../assets/image/common/profile.png" alt="profile"
						class="profileofuser">
					</a>
				</nav>
				<a class="hamburger" href="#"> <img
					src="../assets/image/common/hamburger icon.png"
					alt="hamburger icon">
				</a>
			</header>
			<!-- header is ended -->
			<%
			}
			%>
		</nav>

	</header>
	<!-- header is ended -->
</body>

</html>