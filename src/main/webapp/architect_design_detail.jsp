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
                    <input class="carousel-open" type="radio" id="carousel-1" name="carousel" aria-hidden="true"
                        hidden="" checked="checked">
                    <div class="carousel-item">
                        <img class="mainimage" id="mainimage" alt="interior design"
                            src="<%= design.getDesignUrls().get(0) %>">
                    </div>

                    <input class="carousel-open" type="radio" id="carousel-2" name="carousel" aria-hidden="true"
                        hidden="">
                    <div class="carousel-item">
                        <img class="mainimage" id="mainimage2" alt="interior design"
                            src="<%= design.getDesignUrls().get(1) %>">
                    </div>

                    <input class="carousel-open" type="radio" id="carousel-3" name="carousel" aria-hidden="true"
                        hidden="">
                    <div class="carousel-item">
                        <img class="mainimage" id="mainimage3" alt="interior design"
                            src="<%= design.getDesignUrls().get(2) %>">
                    </div>

                    <input class="carousel-open" type="radio" id="carousel-4" name="carousel" aria-hidden="true"
                        hidden="">
                    <div class="carousel-item">
                        <img class="mainimage" id="mainimage4" alt="interior design"
                            src="<%= design.getDesignUrls().get(3) %>">
                    </div>

                    <input class="carousel-open" type="radio" id="carousel-5" name="carousel" aria-hidden="true"
                        hidden="">
                    <div class="carousel-item">
                        <img class="mainimage" id="mainimage5" alt="interior design"
                            src="<%= design.getDesignUrls().get(4) %>">
                    </div>

                    <input class="carousel-open" type="radio" id="carousel-6" name="carousel" aria-hidden="true"
                        hidden="">
                    <div class="carousel-item">
                        <img class="mainimage" id="mainimage6" alt="interior design"
                            src="<%= design.getDesignUrls().get(5)%>">
                    </div>

                    <input class="carousel-open" type="radio" id="carousel-7" name="carousel" aria-hidden="true"
                        hidden="">
                    <div class="carousel-item">
                        <img class="mainimage" id="mainimage7" alt="interior design"
                            src="<%= design.getDesignUrls().get(4) %>">
                    </div>

                    <input class="carousel-open" type="radio" id="carousel-8" name="carousel" aria-hidden="true"
                        hidden="">
                    <div class="carousel-item">
                        <img class="mainimage" id="mainimage8" alt="interior design"
                            src="<%= design.getDesignUrls().get(3) %>">
                    </div>

                    <input class="carousel-open" type="radio" id="carousel-9" name="carousel" aria-hidden="true"
                        hidden="">
                    <div class="carousel-item">
                        <img class="mainimage" id="mainimage9" alt="interior design"
                            src="<%= design.getDesignUrls().get(2) %>">
                    </div>

                    <input class="carousel-open" type="radio" id="carousel-10" name="carousel" aria-hidden="true"
                        hidden="">
                    <div class="carousel-item">
                        <img class="mainimage" id="mainimage10" alt="interior design"
                            src="<%= design.getDesignUrls().get(1) %>">
                    </div>

                    <label for="carousel-10" class="carousel-control prev control-1">&lt;</label>
                    <label for="carousel-2" class="carousel-control next control-1">&gt;</label>
                    <label for="carousel-1" class="carousel-control prev control-2">&lt;</label>
                    <label for="carousel-3" class="carousel-control next control-2">&gt;</label>
                    <label for="carousel-2" class="carousel-control prev control-3">&lt;</label>
                    <label for="carousel-4" class="carousel-control next control-3">&gt;</label>
                    <label for="carousel-3" class="carousel-control prev control-4">&lt;</label>
                    <label for="carousel-5" class="carousel-control next control-4">&gt;</label>
                    <label for="carousel-4" class="carousel-control prev control-5">&lt;</label>
                    <label for="carousel-6" class="carousel-control next control-5">&gt;</label>
                    <label for="carousel-5" class="carousel-control prev control-6">&lt;</label>
                    <label for="carousel-7" class="carousel-control next control-6">&gt;</label>
                    <label for="carousel-6" class="carousel-control prev control-7">&lt;</label>
                    <label for="carousel-8" class="carousel-control next control-7">&gt;</label>
                    <label for="carousel-7" class="carousel-control prev control-8">&lt;</label>
                    <label for="carousel-9" class="carousel-control next control-8">&gt;</label>
                    <label for="carousel-8" class="carousel-control prev control-9">&lt;</label>
                    <label for="carousel-10" class="carousel-control next control-9">&gt;</label>
                    <label for="carousel-9" class="carousel-control prev control-10">&lt;</label>
                    <label for="carousel-1" class="carousel-control next control-10">&gt;</label>

                    <ol class="carousel-indicators">
                        <li>
                            <label for="carousel-1" class="carousel-bullet">&#8226;</label>
                        </li>
                        <li>
                            <label for="carousel-2" class="carousel-bullet">&#8226;</label>
                        </li>
                        <li>
                            <label for="carousel-3" class="carousel-bullet">&#8226;</label>
                        </li>
                        <li>
                            <label for="carousel-4" class="carousel-bullet">&#8226;</label>
                        </li>
                        <li>
                            <label for="carousel-5" class="carousel-bullet">&#8226;</label>
                        </li>
                        <li>
                            <label for="carousel-6" class="carousel-bullet">&#8226;</label>
                        </li>
                        <li>
                            <label for="carousel-7" class="carousel-bullet">&#8226;</label>
                        </li>
                        <li>
                            <label for="carousel-8" class="carousel-bullet">&#8226;</label>
                        </li>
                        <li>
                            <label for="carousel-9" class="carousel-bullet">&#8226;</label>
                        </li>
                        <li>
                            <label for="carousel-10" class="carousel-bullet">&#8226;</label>
                        </li>
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