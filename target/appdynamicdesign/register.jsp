<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Register user here</title>

<link rel="stylesheet" href="./index.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

	<div>

		<div class="main-container">
			<div>
				<form action="register" method="post" id="form2" class="onlylog">

					
					<label>email :</label> <input type="email" name="email" placeholder="Enter email" /> <br />
					<br />
					<label>User Name :</label><input name="name"
						placeholder="enter your name" /> <br /> <br /> 
						
					 <label>password :</label> <input type="password"
						name="password" placeholder="Enter password" /> <br /> <br />
						
					 <label>Phone Number :</label> <input type="number"
						name="phoneNumber" placeholder="Enter Phone Number" /> <br /> <br />
						
					 <label>Type :</label> <input 
						name="type" placeholder="Enter type" /> <br /> <br />

					<div>
						<button class="signup" type="submit">Sign up</button>
					</div>
				</form>
			</div>

		</div>


	</div>
</body>
</html>