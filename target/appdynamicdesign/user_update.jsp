<%@page import="javax.lang.model.element.ModuleElement.UsesDirective"%>
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
			<!-- update message -->
			<%
			String email = (String) request.getParameter("email");
			User users = (User) session.getAttribute("user");
			UserService user = new UserService();
			User userObj = new User();
			try {
				userObj = user.getUserByEmail(email);
			} catch (ServiceException e) {
				System.out.print(e.getMessage());
			}
			%>

			<form action="UserUpdateServlet?email=<%=users.getEmail()%>" method="post"
				id="form2" class="onlyreg">

				<!-- error message pop up  -->
				<%
				String errorMessage = request.getParameter("error");
				if (errorMessage != null) {
				%>
				<div class="styledbutton">
					<%=errorMessage%>
				</div>
				<br /> <br />
				<%
				}
				%>
				<label>You can edit only username and password</label> <br /> <br />
				<label>email :</label> <input type="email" name="email"
					placeholder="Enter email" value="<%=users.getEmail()%>" readonly /> <br /> <br />
				<label>User Name :</label><input name="name"
					placeholder="enter your name" value="<%=users.getUsername()%>" />
				<br /> <br /> <label class="hidden">password :</label> <input
					class="hidden" type="password" name="password"
					placeholder="Enter password" value="<%=users.getPassword()%> "
					readonly /> <br /> <br /> <label>Phone Number :</label> <input
					type="number" name="phoneNumber" placeholder="Enter Phone Number"
					value="<%=users.getPhonenumber()%>" /> <br /> <br /> <label
					class="hidden">Type :</label> <input name="type"
					placeholder="Enter type" value="<%=users.getType()%>"
					class="hidden" readonly /> <br /> <br />

				<div>
					<button class="signup" type="submit">Update</button>
				</div>
			</form>
		</div>

	</div>

</body>

</html>