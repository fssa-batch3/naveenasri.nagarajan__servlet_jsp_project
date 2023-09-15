<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="com.fssa.dynamicdesign.model.Architect" %>
<%@ page import="com.fssa.dynamicdesign.service.ArchitectService" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Architects List</title>
    <link rel="stylesheet" href="./assets/css/universe.css" />
    <link rel="stylesheet" href="./assets/css/architect.css">
    <link rel="stylesheet" href="./assets/css/index.css" />
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="all-architect-list">
        <%
        List<Architect> listArchitects = (List<Architect>) request.getAttribute("architects");
        if (listArchitects != null && !listArchitects.isEmpty()) {
            for (Architect architect : listArchitects) {
        %>
        <div class="card">
            <div class="cover-photo" style="background: url(<%= architect.getCoverPhoto()%>) no-repeat center center / cover;">
                <img class="profile" src="<%= architect.getProfilePhoto() %>" alt="<%= architect.getName() %>">
            </div>
            <h3 class="profile-name"><%= architect.getName() %></h3>
            <div class="exp_div">
                <pre>Experience : </pre>
                <p class="about"><%= architect.getExperience() %></p>
            </div>
			<a class="btn" href="user_architect_details.jsp?email=<%= architect.getEmail()%>" id="detailsbtn">More Details</a>
            <a class="btn" href="#" id="bookbtn">Book Now</a>
        </div>
        <%
        }
        } else {
        %>
        <p>No Architects available.</p>
        <%
        }
        %>
    </div>
</body>
</html>
