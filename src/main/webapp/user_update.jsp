<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page
	import="com.fssa.dynamicdesign.service.exception.ServiceException"%>
<%@ page import="com.fssa.dynamicdesign.service.*"%>
<%@ page import="com.fssa.dynamicdesign.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./assets/css/universe.css" />
<link rel="stylesheet" href="./assets/css/user_login.css">
<link rel="stylesheet" href="./assets/css/index.css" />

<title>User Update</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="main-container">
		<div>

			<%
			String email = (String) request.getParameter("email");

			UserService user = new UserService();
			User userObj = new User();

			try {
				userObj = user.getUserByEmail(email);
			} catch (ServiceException e) {
				System.out.print(e.getMessage());
			}
			%>

			<form action="UserUpdateServlet" method="post" id="form2"
				class="onlyreg">
				<label>email :</label> <input type="email" name="email"
					placeholder="Enter email" value="<%=email%>" /> <br /> <br /> <label>User
					Name :</label><input name="name" placeholder="enter your name"
					value="<%=userObj.getUsername()%>" /> <br /> <br /> <label>password
					:</label> <input type="password" name="password"
					placeholder="Enter password" value="<%=userObj.getPassword()%>" />
				<br /> <br /> <label>Phone Number :</label> <input type="number"
					name="phoneNumber" placeholder="Enter Phone Number"
					value="<%=userObj.getPhonenumber()%>" /> <br /> <br /> <label>Type
					:</label> <input name="type" placeholder="Enter type"
					value="<%=userObj.getType()%>" /> <br /> <br />

				<div>
					<button class="signup" type="submit">Update</button>
				</div>
			</form>
		</div>

	</div>

</body>
</html>