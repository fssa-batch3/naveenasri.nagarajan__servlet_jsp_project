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
<link rel="stylesheet" href="./assets/css/user_profile.css">
<link rel="stylesheet" href="./assets/css/universe.css" />
<link rel="stylesheet" href="./assets/css/user_login.css">
<link rel="stylesheet" href="./assets/css/index.css" />

<title>User profile</title>

</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="main-container">
		<div>
			<!-- update message -->
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

			<form action="UserprofileServlet?email=<%=email%>" method="post"
				id="form2" class="onlyreg">
				<div class="head_div">
					<h2 class="head" style="margin-top: 0px">User Profile</h2>
				</div>
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

				<label>Email :</label> <span class="value"> <%=email%>
				</span> <br /> <br /> <label>User Name :</label> <span class="value">
					<%=userObj.getUsername()%>
				</span> <br /> <br />  <label>Phone Number:</label> <span class="value">
					<%=userObj.getPhonenumber()%>
				</span> <br /> <br />

				<div class="submit">
					<a href="user_update.jsp?email=<%=email%>" class="edit_btn">Edit</a>
					<a href="LogoutServlet" class="edit_btn">Logout</a> <a
						href="user_delete.jsp?email=<%=email%>" class="edit_btn">Delete</a>
				</div>
			</form>
		</div>

	</div>

</body>

</html>