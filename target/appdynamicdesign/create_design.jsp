<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./assets/css/universe.css" />
<link rel="stylesheet" href="./assets/css/user_login.css">
<link rel="stylesheet" href="./assets/css/index.css" />

<title>Create Design</title>
</head>
<body>
	<jsp:include page="architect_header.jsp"></jsp:include>

	<div class="main-container">
		<div>
			<form action="createDesign" method="post" id="form2" class="onlyreg">
				<label>Name:</label> <input type="text" name="name"
					placeholder="Enter design name" /> <br /> <br /> <label>URL:</label>
				<input type="text" name="url" placeholder="Enter design URL" /> <br />
				<br /> <label>Price:</label> <input type="number" name="price"
					placeholder="Enter design price" /> <br /> <br /> <label>Description:</label>
				<input type="text" name="description"
					placeholder="Enter description" /><br /> <br /> <label>No
					of Rooms:</label> <input type="number" name="noOfRooms"
					placeholder="Enter no of rooms" /> <br /> <br /> <label>Architect
					ID:</label> <input type="number" name="architectId"
					placeholder="Enter architect Id" /> <br /> <br />

				<div>
					<button class="signup" type="submit">Add Design</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>