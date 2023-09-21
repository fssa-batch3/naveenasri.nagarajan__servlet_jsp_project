<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page
	import="com.fssa.dynamicdesign.service.exception.ServiceException"%>
<%@ page import="com.fssa.dynamicdesign.service.ArchitectService"%>
<%@ page import="com.fssa.dynamicdesign.model.Architect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./assets/css/architect_profile.css">
<title>Insert title here</title>
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
		<form action="userArchitectDetailsServlet?email=<%=email%>" method="Get">
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
							<pre>Name         : <span id="userName"><%=architect.getName()%></span></pre>
							<pre>Gender       : <span id="userGender"><%=architect.getGender()%></span></pre>
							<pre>Phone number : <span id="userPhoneNumber"><%=architect.getPhoneNumber()%></span></pre>
							<pre>Address      : <span id="userAddress"><%=architect.getAddress()%></span></pre>
							<pre>Education    : <span id="userEducation"><%=architect.getEducation()%></span></pre>
							<pre>Experience   : <span id="userExperience"><%=architect.getExperience()%></span></pre>
							<pre>Email        : <span id="userEmail"><%=architect.getEmail()%></span></pre>
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