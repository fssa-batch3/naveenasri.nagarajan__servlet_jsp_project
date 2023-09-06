<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./assets/css/universe.css" />
<link rel="stylesheet" href="./assets/css/user_login.css">
<link rel="stylesheet" href="./assets/css/index.css" />
    
    <title>Edit Design</title>
</head>
<body>
<jsp:include page="architect_header.jsp"></jsp:include>

	<div>
        <% String message = (String) request.getAttribute("message"); %>
        <% if (message != null) { %>
            <p><%= message %></p>
        <% } %>
    </div>
    <form action="DesignEditServlet" method="post" id="form2"
				class="onlyreg">
		 <label for="designId">Design Id:</label>
        <input type="number" name="designId" value="41" /><br /><br />
        
        <label for="designName">Design Name:</label>
        <input type="text" id="designName" name="designName" value="White Design" required /><br /><br />
        
        <label for="designUrl">Design URL:</label>
        <input type="text" id="designUrl" name="designUrl" value="https://www.dumpsters.com/images/blog/interior-design-living-room-1200x600.webp" required /><br /><br />
        
        <label for="price">Price:</label>
        <input type="number" id="price" name="price" value="200.00" required /><br /><br />
        
        <label for="description">Description:</label>
        <input type="text" id="description" name="description" value="Interior design is the art and science of enhancing the interior of a building to create a healthier and aesthetically" required /><br /><br />
        
        <label for="noOfRooms">Number of Rooms:</label>
        <input type="number" id="noOfRooms" name="noOfRooms" value="4" required /><br /><br />
        
       <div>
		    <button class="signup" type="submit">Update design</button>
		</div>
		<div class="signupbtn_div">
			<a class="signupbtn" href="design_delete.jsp">Delete Design </a>
		</div>
    </form>
    
     
  
</body>
</html>
