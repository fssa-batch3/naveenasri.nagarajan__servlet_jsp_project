<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./assets/css/universe.css" />
<link rel="stylesheet" href="./assets/css/user_login.css">
<link rel="stylesheet" href="./assets/css/index.css" />

<title>User Register</title>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="main-container">
		<div>

			<form action="user_register" method="post" id="form2" class="onlyreg">
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
				<label>Email :</label> <input type="email" name="email"
					placeholder="Enter email" value="${email}"/> <br /> <br /> <label>User
					Name :</label><input name="name" placeholder="Enter your name" value="${name}"/> <br />
				<br /> <label>Password :</label> <input type="password"
					name="password" placeholder="Enter password" value="${password}"/> <br /> <br /> <label>Phone
					Number :</label> <input type="number" name="phoneNumber"
					placeholder="Enter Phone Number" value="${phoneNumber}"/> <br /> <br /> <label style="display:none">Type
					:</label> <input style="display:none" name="type" placeholder="Enter type" value="user"/> <br /> <br />

				<div>
					<button class="signup" type="submit">Sign up</button>
				</div>
			</form>
		</div>
	</div>
</body>

</html>