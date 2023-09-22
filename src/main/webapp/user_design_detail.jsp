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
<title>User Design Detail</title>
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
			            List<String> designUrls = design.getDesignUrls(); // Assuming getDesignUrls() returns a List<String>
			            int currentIndex = 0;
			
			            if (request.getParameter("action") != null) {
			                String action = request.getParameter("action");
			                if ("next".equals(action)) {
			                    currentIndex = (currentIndex + 1) % designUrls.size();
			                } else if ("prev".equals(action)) {
			                    currentIndex = (currentIndex - 1 + designUrls.size()) % designUrls.size();
			                }
			            }
			
			            int numDesigns = designUrls.size(); // Calculate the number of designs
			
			            for (int i = 0; i < numDesigns; i++) {
			                String imageUrl = designUrls.get(i);
			        %>
			        <input class="carousel-open" type="radio" id="carousel-<%= i %>" name="carousel" aria-hidden="true" hidden=""
			            <% if (i == currentIndex) { %>checked="checked"<% } %>>
			        <div class="carousel-item <% if (i == currentIndex) { %>active<% } %>">
			            <img class="mainimage" id="mainimage" alt="interior design" src="<%= imageUrl %>">
			        </div>
			        <% } %>
			    </div>
			
			    <label for="?action=prev" class="carousel-control prev control-<%= currentIndex %>">&lt;</label>
			    <label for="?action=next" class="carousel-control next control-<%= currentIndex %>">&gt;</label>
			
			    <ol class="carousel-indicators">
			        <% for (int i = 0; i < numDesigns; i++) { %>
			        <li>
			            <label for="carousel-<%= i %>" class="carousel-bullet">&#8226;</label>
			        </li>
			        <% } %>
			    </ol>
			</div>
			
		<script>
			    var currentIndex = <%= currentIndex %>;
			    var numDesigns = <%= numDesigns %>;
			
			    function nextSlide() {
			        currentIndex = (currentIndex + 1) % numDesigns;
			        updateCarousel();
			    }
			
			    function prevSlide() {
			        currentIndex = (currentIndex - 1 + numDesigns) % numDesigns;
			        updateCarousel();
			    }
			
			    function updateCarousel() {
			        var radios = document.getElementsByName("carousel");
			        radios[currentIndex].checked = true;
			    }
			
			    // Set a timer to automatically advance the carousel
			    var autoAdvanceInterval = 1000; // Set the interval in milliseconds (e.g., 3000ms = 3 seconds)
			    setInterval(nextSlide, autoAdvanceInterval);
			</script>

    
  
</div>


	<div class="card">
	        <div class="cover-photo" style="background: url(<%= architect.getCoverPhoto()%>) no-repeat center center / cover;">
	            <img class="profile" src="<%= architect.getProfilePhoto() %>" alt="<%= architect.getName() %>">
	        </div>
	        <h3 class="profile-name"><%= architect.getName()%></h3>
	        <div class="exp_div">
	            <pre>Experience : <%= architect.getExperience()%></pre>
	        </div>
	        <a class="btn" href="user_architect_details.jsp?email=<%= architect.getEmail()%>" id="detailsbtn">More Details</a>
	        <a class="btn" href="user_create_booking.jsp?architectId=<%=architect.getArchitectID() %>" id="bookbtn">Book Now</a>
	 </div>
    
    </div>
<div class="details">
    <div>
        <div id="about">
            <p>
                About the design :<br>
                <span id="para"><%=design.getBio()%></span><br>
            </p>
        </div>
        <div>
            <span id="brief_para"> <%=design.getBrief()%></span>
        </div>
    </div>
    <div>
       <pre>Design name             : <span id="dname"><%=design.getDesignName()%></span></pre>
			<pre>Style                          : <span><%=design.getStyle()%></span></pre>
			<pre>Price of design(&#8377)     : <span id="pdesign"><%=design.getPricePerSqFt() * design.getSquareFeet()%></span></pre>
			<pre>sq/ft of the design     : <span id="squarefeet"><%=design.getSquareFeet()%></span></pre>
			<pre>Price per sq/ft           : <span id="ppsquarefeet"><%=design.getPricePerSqFt()%></span></pre>
			<pre>Category                   : <span><%=design.getCategory()%></span></pre>
			<pre>Floor plan                 : <span><%=design.getFloorPlan()%></span></pre>
			<pre>Required Months     : <span id="dates"><%=design.getTimeRequired()%> months</span></pre>
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
