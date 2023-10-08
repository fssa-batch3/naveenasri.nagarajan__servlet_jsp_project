<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.dynamicdesign.service.exception.ServiceException"%>
<%@ page import="com.fssa.dynamicdesign.service.ArchitectService"%>
<%@ page import="com.fssa.dynamicdesign.model.Architect"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" href="./assets/css/universe.css" />
    <link rel="stylesheet" href="./assets/css/architect_register.css" />
    <title>Architect Update</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<section class="all-form">
    <%
    String email = (String) request.getParameter("email");
    
   
    ArchitectService architectService = new ArchitectService();
    Architect architect = new Architect();

    try {
        architect = architectService.getArchitectByEmail(email);
    } catch (ServiceException e) {
        out.println(e.getMessage());
    }
    
	if (architect != null) {

    %>

    <form action="architect_update" method="post">
    <div class="head_div">
		<h2 class="head" style="margin-top: 0px;margin-bottom: 0px;
		">Architect Update</h2>
	</div>
        <div class="full_form">
        		
            <div class="form">
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
                <h2 style="margin-top: 0px;margin-bottom: 40px;">Personal Information</h2>
                <label for="profileImage">Photo:</label>
                <input type="url" value="<%=architect.getProfilePhoto()%>" id="profileImage" required name="profileImage" placeholder="Profile Image" /><br /><br />

                <label for="name">Name:</label>
                <input type="text" value="<%=architect.getName()%>" required name="name" id="name" placeholder="Enter your name" />
                <br />
                <br />

                <label for="gender">Gender:</label>
                <input list="Gender" value="<%=architect.getGender()%>" type="text" required id="gender" name="gender" placeholder="Male/Female" />
                <datalist id="Gender">
                    <option value="Male">
                    <option value="Female">
                    <option value="Transgender">
                    <option value="Others">
                </datalist>
                <br />
                <br />

                <label for="number">Phone Number:</label>
                <input type="number" value="<%=architect.getPhoneNumber()%>" required name="number" pattern="[6789]{1}[0-9]{9,15}"
                    title="Phone number with 6-9 and remaining 9 digits with 0-9" id="phonenumber"
                    placeholder="9218457240" />
                <br />
                <br />

                <label for="address">Address:</label>
                <input type="text" value="<%=architect.getAddress()%>" name="address" required id="address" />
                <br />
                <br />

                <label for="coverphoto">Cover Photo:</label>
                <input type="url" value="<%=architect.getCoverPhoto()%>" id="coverphoto" required name="coverPhoto" placeholder="Cover photo design" />
                <br />
                <br />
            </div>
            <div class="form">
                <h2 style="margin-top: 0px;margin-bottom: 40px;">Professional Information</h2>
                <label>Email:</label>
                <input type="email" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
                    title="Make sure email should be in the correct pattern" required id="email"
                    placeholder="abc@gmail.com" value="<%=email%>" />
                <br />
                <br />
                <label>Education:</label>
                <input list="Education" name="education" value="<%=architect.getEducation()%>" required id="education" placeholder="Bachelor of architects" />
                <datalist id="Education">
                    <option value="B.arch">
                    <option value="M.arch">
                </datalist>
                <br />
                <br />
                <label>Experience:</label>
                <input type="number" value="<%=architect.getExperience()%>" required name="experience" id="experience" placeholder="2 years" />
                <br />
                <br />
                <label for="document">Degree Certificate:</label>
                <input type="url" required id="document" value="<%=architect.getDegreeCertificate()%>" name="degreeCertificatePhoto" placeholder="b.arch certificate" />
                <br />
                <br />
                <label for="natacertificate">NATA Certificate:</label>
                <input type="url" required id="natacertificate" value="<%=architect.getNATACertificate()%>" name="nataCertificatePhoto" placeholder="nata certificate" />
                <br />
                <br />
                <button type="submit">Update Profile</button>
            </div>
        </div>
    </form>
    
</section>
 <%	} else {
			System.out.println("session invalid in the Architect update profile page you wants to login again");
			response.sendRedirect("architect_login.jsp");
		} %>
</body>
</html>
