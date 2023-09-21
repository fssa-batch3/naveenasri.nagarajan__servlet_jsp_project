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
<link rel="stylesheet" href="./assets/css/universe.css" />
<link rel="stylesheet" href="./assets/css/design.css">
<link rel="stylesheet" href="./assets/css/index.css" />

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
		<div class="designs">
		<%
		List<Design> listDesigns = (List<Design>) request.getAttribute("designs");
		if (listDesigns != null && !listDesigns.isEmpty()) {
			for (Design design : listDesigns) {
		%>
		
		 <div class="card">
            <img alt="interior design" class="free_img" src="<%= design.getDesignUrls().get(0) %>">
            <div class="info">
                <h3><%=design.getDesignName()%></h3>
				<p>
					Price:
					<%= design.getPricePerSqFt() * design.getSquareFeet() %></p>
				<p>
					<%=design.getBio()%>
				</p>
                <a class="btn" href="ArchitectDesignDetailsServlet?uniqueId=<%=design.getUniqueId() %>">More details</a>
                <a class="editdes" href="design_edit.jsp?uniqueId=<%=design.getUniqueId() %>">Edit</a>
                <a class="deletedes" id="deletedes" href="DeleteDesignServlet?uniqueId=<%=design.getUniqueId() %>">Delete</a>
            </div>
        </div>
		<%
		}
		} else {
		%>
		<img alt="interior design" class="free_img" Style="width: auto;height: auto;" src="./assets/image/common/nodesign.png">
		<%
		}
		%>
	</div>
</body>
</html>