<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./assets/css/universe.css">
<link rel="stylesheet" href="./assets/css/booking_list.css">
<title>booking page</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<!-- maincontainer is started -->
	<div class="container">
		<div class="list-of-customer">
			<div class="a-form bookingpage">
				<%
				String architectId = request.getParameter("architectId");
				%>
				<form id="bookingform"
					action="UserCreateBooking?architectId=<%=architectId%>"
					method="post">
					<%
					String errorMessage = request.getParameter("error");
					if (errorMessage != null) {
					%>

					<div class="styledbutton">
						<%=errorMessage%>
						<!-- this will change based on invalid field entered -->
					</div>
					<br /> <br />
					<%
					}
					%>
					<label>Design name :</label> <input id="designname" required
						type="text" name="DesignName" placeholder="design name"
						value="Modern bedroom" value="${DesignName}" /> <br />
					<br /> <label>Design url :</label> <input id="designurl" required
						type="text" placeholder="url" name="DesignUrl"
						value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTD50suxgtUSpg_ZYR2w_gf4UyCKWLUkq9Cqw&usqp=CAU"
						value="${DesignUrl}" /> <br />
					<br /> <label>Expected amount:</label> <input id="amount" required
						type="number" name="amount" value="${amount}" min="10" max="9999999" value="50000" /> <br />
					<br /> <label>Expected months:</label> <input id="time" required
						type="number" name="months" value="${months}" min="1" max="60" value="12" /> <br />
					<br /> <label for="textarea">Message :</label>
					<textarea id="messagetextarea" required name="message"
						value="${message}" rows="2" cols="40"> I like this design can you please do this same design for me 
                    </textarea>
					<br />
					<div class="both-btn">
						<button id="dessubmit" type="submit">submit</button>
					</div>
				</form>
			</div>


		</div>

	</div>
</body>
</html>