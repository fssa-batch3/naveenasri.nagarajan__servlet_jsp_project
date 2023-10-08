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
			User users = (User) session.getAttribute("user");
			UserService user = new UserService();
			User userObj = new User();
			try {
				userObj = user.getUserByEmail(email);
			} catch (ServiceException e) {
				System.out.print(e.getMessage());
			}
			
			if(users != null){
			%>

			<form action="UserprofileServlet?email=<%=users.getEmail()%>" method="Get"
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

				<label>Email :</label> <span class="value"> <%=users.getEmail()%>
				</span> <br /> <br /> <label>Name :</label> <span class="value">
					<%=users.getUsername()%>
				</span> <br /> <br />  <label>Phone Number:</label> <span class="value">
					<%=users.getPhonenumber()%>
				</span> <br /> <br />

				<div class="submit">
					<a href="user_update.jsp" class="edit_btn">Edit</a>
					<a href="userLogoutServlet" class="edit_btn">Logout</a> <a
						href="deleteUser" class="edit_btn">Delete</a>
				</div>
			</form>
		</div>

	</div>

<%	} else {
			System.out.println("session invalid in the user profile page you wants to login again");
			response.sendRedirect("user_login.jsp");
		} %>
</body>

</html>