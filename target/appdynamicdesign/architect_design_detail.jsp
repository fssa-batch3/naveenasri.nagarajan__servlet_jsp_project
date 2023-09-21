<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page
	import="com.fssa.dynamicdesign.service.exception.ServiceException"%>
<%@ page import="com.fssa.dynamicdesign.model.*"%>
<%@ page import="com.fssa.dynamicdesign.service.*"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="./assets/css/design_details.css">
<link rel="stylesheet" href="./assets/css/architect.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<!-- header is ended -->
	<%
	Architect architect = (Architect) request.getAttribute("architect");
	List<Design> listDesigns = (List<Design>) request.getAttribute("designs");
	if (listDesigns != null && !listDesigns.isEmpty()) {
		for (Design design : listDesigns) {
	%>
	<div class="AboutArchitect">

		<div class="photos">
			<div class="carousel">
				<div class="carousel-inner">
					<%
					int i = 1;
					for (String url : design.getDesignUrls()) {
					%>
					<input class="carousel-open" type="radio" id="carousel-<%=i%>"
						name="carousel" aria-hidden="true" hidden="" checked="checked">
					<div class="carousel-item">
						<img class="mainimage" id="mainimage" alt="interior design"
							src="<%=url%>">
					</div>

					<%
					i++;
					}
					%>


					<%
					int j = 1;
					for (String url : design.getDesignUrls()) {
						int size = design.getDesignUrls().size();

						int previous = 1;
						int next = 1;

						if (j == 1) {
							previous = size + 1;
						}

						if (j == size) {
							next = 1;
						}
					%>
					<label for="carousel-<%=previous%>"
						class="carousel-control prev control-<%=j%>">&lt;</label> <label
						for="carousel-<%=next%>"
						class="carousel-control next control-<%=j%>">&gt;</label>
					<%
					j++;
					}
					%>

					<ol class="carousel-indicators">

						<%
						for (String url : design.getDesignUrls()) {
							System.out.println(design.getDesignUrls().size());
							int size = design.getDesignUrls().size();
						%>
						<li><label
							for="carousel-<%=design.getDesignUrls().indexOf(url) + 1%>"
							class="carousel-bullet">&#8226;</label></li>

						<%
						}
						%>
					</ol>

				</div>
			</div>
		</div>

		<div class="card">
			<div class="cover-photo"
				style="background: url(<%=architect.getCoverPhoto()%>) no-repeat center center / cover;">
				<img class="profile" src="<%=architect.getProfilePhoto()%>"
					alt="<%=architect.getName()%>">
			</div>
			<h3 class="profile-name"><%=architect.getName()%></h3>
			<div class="exp_div">
				<pre>Experience : <%=architect.getExperience()%></pre>
			</div>
			<a class="btn"
				href="architect_profile.jsp?email=<%=architect.getEmail()%>"
				id="detailsbtn">More Details</a>
		</div>

	</div>


	<div class="details">
		<div>
			<div id="about">
				<p>
					About the design :<br> <span id="para"><%=design.getBio()%></span><br>
				</p>
			</div>
			<div>
				<span id="brief_para"> <%=design.getBrief()%></span>
			</div>
		</div>
		<div>
			<pre>Design name : <span id="dname"><%=design.getDesignName()%></span></pre>
			<pre>Style : <span><%=design.getStyle()%></span></pre>
			<pre>Price of design(&#8377) : <span id="pdesign"><%=design.getPricePerSqFt() * design.getSquareFeet()%></span></pre>
			<pre>sq/ft of the design : <span id="squarefeet"><%=design.getSquareFeet()%></span></pre>
			<pre>Price per sq/ft : <span id="ppsquarefeet"><%=design.getPricePerSqFt()%></span></pre>
			<pre>Category : <span><%=design.getCategory()%></span></pre>
			<pre>Floor plan : <span><%=design.getFloorPlan()%></span></pre>
			<pre>Time Required : <span id="dates"><%=design.getTimeRequired()%> months</span></pre>
		</div>
	</div>

	<%
		}
	} else {
	%>
	<p>No Design available.</p>
	<%
	}
	%>

</body>
</html>