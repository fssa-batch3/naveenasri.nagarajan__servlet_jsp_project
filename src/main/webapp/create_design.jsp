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
					placeholder="Enter design name" value="White Design" /> <br />
				<br /> <label>URL:</label> <input type="text" name="url"
					placeholder="Enter design URL"
					value="https://www.dumpsters.com/images/blog/interior-design-living-room-1200x600.webp" />
				<br /> <br /> <label>Price:</label> <input type="number"
					name="price" placeholder="Enter design price" value="100.00" /> <br />
				<br /> <label>Description:</label> <input type="text"
					name="description" placeholder="Enter description"
					value="Interior design is the art and science of enhancing the interior of a building to create a healthier and aesthetically" /><br />
				<br /> <label>No of Rooms:</label> <input type="number"
					name="noOfRooms" placeholder="Enter no of rooms" value="2" /> <br /> <br />
				<label>Architect ID:</label> <input type="number" name="architectId"
					placeholder="Enter architect Id" value="76"/> <br /> <br />

				<div>
					<button class="signup" type="submit">Add Design</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>