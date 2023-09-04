<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page
	import="com.fssa.dynamicdesign.service.exception.ServiceException"%>
<%@ page import="com.fssa.dynamicdesign.model.Design"%>
<%@ page import="com.fssa.dynamicdesign.service.DesignService"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Designs List</title>
<link rel="stylesheet" href="universe.css" />
<link rel="stylesheet" href="design.css">
</head>
<body>

	<h1>All Designs</h1>
	<div class="designs">
		<%
		
			List<Design> listDesigns = (List<Design>) request.getAttribute("designs");
			if (listDesigns != null && !listDesigns.isEmpty()) {
			for (Design design : listDesigns) {
		%>
	<div class="card">
			<img class="free_img" src="<%=design.getDesignUrl()%>"
				alt="Design Image">
			<div class="info">
			<h3><%=design.getDesignName()%></h3>
				<p>
					Price:
					<%=design.getPrice()%></p>
				<p>
					No Of Rooms:
					<%=design.getNoOfRooms()%></p>
				<p>
					Architect ID:
					<%=design.getArchitectId()%></p>
				<a href="#" class="btn">More details</a>
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
	</div>
</body>
</html>