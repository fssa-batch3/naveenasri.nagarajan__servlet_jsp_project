<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/universe.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/contact_us.css" />
<title>contact us</title>
<style>
#section8 {
  width: 100%;
  background-size: cover;
  background-position: center;
  margin: 0px;
	background-image:
		url("<%=request.getContextPath()%>/assets/image/login_as_customer/about_us/image 1.jpg");
}
</style>


</head>

<body>
	<!-- header jsp page  -->
	<jsp:include page="header.jsp"></jsp:include>

	<section id="section8">
		<div class="section1">
			<div class="hold">
				<div class="img2">Contact</div>
				<div class="img3">us</div>
			</div>
			<div class="holder">
				<div class="img2">
					<img
						src="<%=request.getContextPath()%>/assets/image/login_as_customer/contact_us/image 2.jpg"
						alt="interior design" width="250px" height="170px" />
				</div>
				<div class="img3">
					<img
						src="<%=request.getContextPath()%>/assets/image/login_as_customer/contact_us/image 3.jpg"
						alt="interior design" width="250px" height="170px" />
				</div>
			</div>
		</div>
	</section>
	<!-- header is completed -->

	<section>
		<div class="section2">
			<div class="footdiv3">
				<h3>CONTACT US</h3>
				<h4>Branch office</h4>
				<p>
					Annai nagar Block-D, trace, <br />70, GR Main Rd, vadivasal
					,Madurai,<br /> Tamil Nadu 607706.
				</p>
				<p>
					sathiya nagar Dtrace, <br />90, Main Rd, mangalapuram ,selam,<br />
					Tamil Nadu 637001.
				</p>
				<h4>Phone number</h4>
				<p>
					9678453665,<br />9677583780,<br />9345046547,<br />9794327443
				</p>
				<h4>Email us</h4>
				<p>interiordesign@gmail.com</p>
			</div>
			<div>
				<form id="emailForm" class="form">
					<label>Name</label> <input type="text" id="name" required
						placeholder="enter your name " /> <br /> <label>Email</label> <input
						type="email" id="email" required placeholder="enter your email" />
					<br /> <label>Phone number</label> <input type="tel" id="phoneno"
						required pattern="[6789]{1}[0-9]{9,15}"
						placeholder="enter your phone number"
						title="Phone number with 6-9 and remaing more then 9 and less than 15 digit with in  0-9" />
					<br /> <label for="textarea">Subject</label>
					<textarea id="subject" required name="textarea" rows="2" cols="21"></textarea>
					<br /> <label for="textarea">Your message</label>
					<textarea id="message" required name="textarea" rows="6" cols="21"></textarea>
					<br />
					<button type="submit" id="send" onclick="sende()">Send</button>
				</form>
			</div>
		</div>
	</section>

	<!-- Footer jsp page  -->
	<jsp:include page="footer.jsp"></jsp:include>


	<script src="https://smtpjs.com/v3/smtp.js" async></script>
	<script src="<%=request.getContextPath()%>/assets/js/contact_us.js">
		
	</script>
</body>

</html>