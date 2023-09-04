<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <link rel="stylesheet" href="./assets/css/universe.css" />
    <link rel="stylesheet" href="./assets/css/architect_register.css" />
    <title>architect apply form</title></head>
<body>
<jsp:include page="architect_header.jsp"></jsp:include>

    <section class="all-form">
        <form action="architect_register" method="post" id="architectForm1">
            <div class="full_form">
                <div class="form">
                    <h2>personal information</h2>
                    <label for="image">Photo:</label>
                    <input type="url" id="image" required name="profileImage" placeholder="Profileimage" /><br /><br />

                    <label>Name:</label>
                    <input type="text" required required name="name" id="name" placeholder="enter your name" />
                    <br />
                    <br />

                    <label>Gender:</label>
                    <input list="Gender" type="text" required id="gender" name="gender" placeholder="Male/Female" />
                    <datalist id="Gender">
                        <option value="Male">
                        <option value="Female">
                        <option value="Others">

                    </datalist>
                    <br />
                    <br />

                    <label>Phone number:</label>
                    <input type="number" required name="number" pattern="[6789]{1}[0-9]{9,15}"
                        title="Phone number with 6-9 and remaing 9 digit with 0-9" id="phonenumber"
                        placeholder="9218457240" />
                    <br />
                    <br />

                    <label>Address:</label>
                    <input type="text" name="address" required id="address" />
                    <br />
                    <br />
                    <label for="image">Cover Photo:</label>
                    <input type="url" id="coverphoto" required name="coverPhoto" placeholder="Cover photo design" />
                    <br />
                    <br />

                </div>
                <div class="form">
                    <h2>professional information</h2>
                    <label>Email:</label>
                    <input type="email" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
                        title="Make sure email should be in the correct pattern" required id="email"
                        placeholder="abc@gmail.com" />
                    <br />
                    <br />
                    <label>Password:</label>
                    <input type="password" pattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\S+$).{8,}$" name="password"
                        title="Must contain at least one number and one uppercase and lowercase letter,at least 8 or more characters and must not contain space "
                        required id="password" />
                    <br />
                    <br />
                    <label>Education:</label>
                    <input list="Education" name="education" required id="education" placeholder="Bachelor of architects" />
                    <datalist id="Education">
                        <option value="Bachelor of Architecture">
                        <option value="Master of Architecture">
                    </datalist>
                    <br />
                    <br />
                    <label>Experience:</label>
                    <input type="number" required name="experience" id="experience" placeholder="2 years" />
                    <br />
                    <br />
                    <label for="image">Degree certificate:</label>
                    <input type="url" required id="document" name="degreeCertificatePhoto" placeholder="b.arch certificate" />
                    <br />
                    <br />
                    <label for="image">NATA certificate:</label>
                    <input type="url" required id="natacertificate" name="nataCertificatePhoto" placeholder="nata certificate" />
                    <br />
                    <br />
                    <button type="submit">Apply now / sign up

                    </button>
                </div>
            </div>

            <a class="logbtn" href="architect_login.jsp">
                Log in
            </a>

        </form>

    </section>

</body>

</html>