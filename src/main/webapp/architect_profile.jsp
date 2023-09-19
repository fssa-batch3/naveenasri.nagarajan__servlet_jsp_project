<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.fssa.dynamicdesign.service.exception.ServiceException"%>
<%@ page import="com.fssa.dynamicdesign.service.ArchitectService"%>
<%@ page import="com.fssa.dynamicdesign.model.Architect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Architect Profile</title>
<style type="text/css">
section dev {
	padding: 0px 0px;
}
</style>
<link rel="stylesheet" href="./assets/css/architect_profile.css">
<!-- Add other CSS links as needed -->
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Include your header -->

	<section>
		<%
		String email = (String) request.getParameter("email");

		ArchitectService architectService = new ArchitectService();
		Architect architect = null;

		try {
			architect = architectService.getArchitectByEmail(email);
		} catch (ServiceException e) {
			// Handle the exception appropriately, e.g., display an error message to the user or log it
			out.println("Error: " + e.getMessage());
		}
		%>
		<%
		if (architect != null) {
		%>
		<form action="ArchitectProfileServlet?email=<%=email%>" method="Get">
			<div class="main">
				<div class="personal_info">
					<div>
						<img id="userImage" src="<%=architect.getProfilePhoto()%>"
							class="information" alt="Architect image" />
					</div>
					<div class="basic-information">
						<div>
							<h2>Personal Information</h2>
						</div>
						<div class="brief-info">
							<pre>Name         : <span id="userName"><%=architect.getName()%></span>
							</pre>
							<pre>Gender       : <span id="userGender"><%=architect.getGender()%></span>
							</pre>
							<pre>Phone number : <span id="userPhoneNumber"><%=architect.getPhoneNumber()%></span>
							</pre>
							<pre>Address      : <span id="userAddress"><%=architect.getAddress()%></span>
							</pre>
							<pre>Education    : <span id="userEducation"><%=architect.getEducation()%></span>
							</pre>
							<pre>Experience   : <span id="userExperience"><%=architect.getExperience()%></span>
							</pre>
							<pre>Email        : <span id="userEmail"><%=architect.getEmail()%></span>
							</pre>
						</div>
					</div>
				</div>
			</div>

			<div class="documentImage">
				<div>
					<h2>Cover Photo</h2>
					<div>
						<img id="userCoverPhoto" src="<%=architect.getCoverPhoto()%>"
							class="free-img" alt="Cover Photo">
					</div>
				</div>
				<div>
					<h2>Degree Certificate</h2>
					<div>
						<img id="userDocument" src="<%=architect.getDegreeCertificate()%>"
							class="free-img" alt="Degree Certificate">
					</div>
				</div>
				<div>
					<h2>NATA Certificate</h2>
					<div>
						<img id="userNataCertificate"
							src="<%=architect.getNATACertificate()%>" class="free-img"
							alt="NATA Certificate">
					</div>
				</div>
			</div>

			<div>
				<h2>Sample Design</h2>
				<div id="model-designs" class="modelDesign">
					<a href="create_design.jsp"> <img
						src="./assets/image/common/add.png" alt="Add Image">
					</a>
				</div>
			</div>

			<div id="threebtn" class="submit">
				<div>
					<a href="architect_update.jsp?email=<%=email%>" class="edit_btn">Edit</a>
				</div>
				<div>
					<a href="LogoutServlet" class="edit_btn">Logout</a>
				</div>
				<div>
					<a href="architect_delete.jsp?email=<%=email%>" class="edit_btn">Delete</a>
				</div>


			</div>

		</form>

		<%
		} else {
		%>
		<!-- Display an error message -->
		<p>Architect not found or an error occurred.</p>
		<%
		}
		%>
	</section>
</body>
</html>
