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

    <form action="DesignEditServlet" method="post" id="form2"
				class="onlyreg">
		 <label for="designId">Design Id:</label>
        <input type="number" name="designId" /><br /><br />
        
        <label for="designName">Design Name:</label>
        <input type="text" id="designName" name="designName" required /><br /><br />
        
        <label for="designUrl">Design URL:</label>
        <input type="text" id="designUrl" name="designUrl" required /><br /><br />
        
        <label for="price">Price:</label>
        <input type="number" id="price" name="price"  required /><br /><br />
        
        <label for="description">Description:</label>
        <input type="text" id="description" name="description" required /><br /><br />
        
        <label for="noOfRooms">Number of Rooms:</label>
        <input type="number" id="noOfRooms" name="noOfRooms" required /><br /><br />
        
       <div>
		    <button class="signup" type="submit">Update design</button>
		</div>
		<div class="signupbtn_div">
			<a class="signupbtn" href="design_delete.jsp">Delete Design </a>
		</div>
    </form>
    
     
  	<div>
        <% String message = (String) request.getAttribute("message"); %>
        <% if (message != null) { %>
            <p><%= message %></p>
        <% } %>
    </div>
</body>
</html>
