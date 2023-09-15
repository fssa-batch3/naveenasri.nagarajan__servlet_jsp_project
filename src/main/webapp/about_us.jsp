<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/universe.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/about_us.css" />

		<title>About us</title>
		<style>
			#section1 {
				background-image:
					url("<%=request.getContextPath()%>/assets/image/login_as_customer/about_us/image 1.webp");

			}
		</style>
	</head>

	<body>
		<jsp:include page="header.jsp"></jsp:include>

		<div id="section1">
			<div class="section1">
				<div class="hold">
					<div class="img2">About</div>
					<div class="img3">us</div>
				</div>
				<div class="holder">
					<div class="img2">
						<img src="<%=request.getContextPath()%>/assets/image/login_as_customer/about_us/image 2.webp"
							alt="interior design" width="250px" height="170px" />
					</div>
					<div class="img3">
						<img src="<%=request.getContextPath()%>/assets/image/login_as_customer/about_us/image 3.webp"
							alt="interior design" width="250px" height="170px" />
					</div>
				</div>
			</div>
		</div>
		<!-- header is completed -->

		<section>
			<div class="section3 border">
				<div>
					<img class="about-img1"
						src="<%=request.getContextPath()%>/assets/image/login_as_customer/about_us/image 4.webp"
						alt="interior design" height="500px" width="400px" style="border-radius: 12px" />
				</div>
				<div class="para">
					<h2>Works</h2>
					<p>Interior design is a fast-growing enterprise rendering
						cutting edge solutions across the domains of architecture, interior
						design and continuum. The new age organization powered by a synergy
						of skills, expertise, experience and top end infrastructure
						executes projects on both turnkey basis and assignment wise. The
						range of services provided include planning, designing, interior
						design, engineering and construction of commercial and residential
						spaces.Interior design, a design-oriented firm with a reputation
						for excellence in a wide variety of project types, is a unit of
						Seamless Speciality Infra Projects which has a market standing of
						almost four decades. Seamless created a distinct footprint in the
						areas of warehouse building, infrastructure development, property
						development, asset management and real estate.</p>
				</div>
			</div>
		</section>
		<section>
			<div class="section4 border">
				<div class="review">
					<img src="<%=request.getContextPath()%>/assets/image/login_as_customer/about_us/1st.gif"
						alt="interior design" width="400px" height="250px" style="border-radius: 12px" />
					<p style="text-align: left">Interior design offers holistic
						office interior solutions by incorporating space planning and
						ergonomic design, that combine cohesively to create a work
						environment that enhances productivity.</p>
				</div>
				<div class="review">
					<img src="<%=request.getContextPath()%>/assets/image/login_as_customer/about_us/2nd.gif
					" alt="interior design" width="400px" height="250px" style="border-radius: 12px" />
					<p style="text-align: left">Interior design crafts living spaces
						of the highest quality as care is taken to incorporate the best
						interior design which is incredibly important for people in their
						quest for an ideal home.</p>
				</div>
			</div>
		</section>

		<section>
			<div class="section5 border" style="margin-bottom: 30px">
				<div class="review">
					<div>
						<img src="<%=request.getContextPath()%>/assets/image/common/person.png" alt="interior design"
							class="reviewer" />
						<h3 class="reviewer-name">Meena</h3>
						<p>Our experience with interior design was pleasurable because
							of the project managers. The work got done before 45 days just the
							way we wanted it to be.</p>
					</div>
				</div>
				<div class="review">
					<div>
						<img src="<%=request.getContextPath()%>/assets/image/common/person.png" alt="interior design"
							class="reviewer" />
						<h3 class="reviewer-name">John peter</h3>
						<p>I am really happy with the materials that were used and the
							timeline for the project. The reaction we got from our friends
							when they first saw our place was priceless</p>
					</div>
				</div>
				<div class="review">
					<div>
						<img src="<%=request.getContextPath()%>/assets/image/common/person.png" alt="interior design"
							class="reviewer" />
						<h3 class="reviewer-name">Rohit Prasad</h3>
						<p>A place where I can find peace. A home. That's exactly what
							interior design has helped me with. I'm very happy with the
							outcome.</p>
					</div>
				</div>
			</div>
		</section>
		<!-- footer -->

		<!-- footer -->
		<jsp:include page="footer.jsp"></jsp:include>
	</body>

	</html>