<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="com.fssa.dynamicdesign.model.*"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>INIFINITI home</title>


<!-- css links -->
<link rel="stylesheet" href="./home.css" />
</head>
<body>
	<section class="navbar-home-page-container">
			<section class="whole-section-container">
				<div class="section-inside-container-div">
					<div class="section-inside-container">
						<div class="all-user-showing-div-container">
							<div class="all-user-showing-inside-div">
								<%
								List<User> userList = (List<User>)
 										request.getAttribute("users");
								if (userList != null && !userList.isEmpty()) {
									for (User user : userList) {
								%>
								<div class="card">
       <h2> <%=user.getUsername()%> </h2>
        <h2> <%=user.getPassword()%> </h2> 
        <h2> <%=user.getEmail()%> </h2> 
</div>
								<%
								}
								} else {
								%>
								<p>No user available.</p>
								<%
								}
								%>
							</div>
						</div>
					</div>
				</div>
			</section>
	</section>
</body>
</html>