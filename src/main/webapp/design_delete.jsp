<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./assets/css/universe.css" />
<link rel="stylesheet" href="./assets/css/user_login.css">
<link rel="stylesheet" href="./assets/css/index.css" />

<title>Delete Design</title>
</head>
<body>
	<jsp:include page="architect_header.jsp"></jsp:include>

	<form action="deleteDesignServlet" method="post" id="form2"
		class="onlyreg">
		<label for="designId">Design Id:</label> <input type="number"
			name="designId" value="59" /><br />
		<br />
		<div>
		    <button class="signup" type="submit">Delete design</button>
		</div>
	</form>


	<div>
		<%
		String message = (String) request.getAttribute("message");
		%>
		<%
		if (message != null) {
		%>
		<p><%=message%></p>
		<%
		}
		%>
	</div>
</body>
</html>