<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.List" %>
<%@ page import="com.fssa.dynamicdesign.model.*" %>
<%@ page import="com.fssa.dynamicdesign.service.BookingService" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./assets/css/universe.css">
<link rel="stylesheet" href="./assets/css/booking_list.css">
<style type="text/css">
h1 {
  text-align: center;
  font-family: Tahoma, Arial, sans-serif;
  color: #06D85F;
  margin: 80px 0;
}

.box {
  width: 40%;
  margin: 0 auto;
  background: rgba(255,255,255,0.2);
  padding: 35px;
  border: 2px solid #fff;
  border-radius: 20px/50px;
  background-clip: padding-box;
  text-align: center;
}

.button {
      font-size: 15px;
    padding: 7px;
    color: black;
    border: 2px solid #28467f;
    text-decoration: none;
    cursor: pointer;
    transition: all 0.3s ease-out;
}
.button:hover {
    color: #fff;
  background: #28467f;
}

.overlay {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.7);
  transition: opacity 500ms;
  visibility: hidden;
  opacity: 0;
}
.overlay:target {
  visibility: visible;
  opacity: 1;
}

.popup {
    margin: 200px auto;
    padding: 20px;
    background: #fff;
    background: linear-gradient( 214deg, rgb(147, 174, 249) 10%, rgba(178, 197, 255, 1) 60%, rgb(202, 215, 254) 100% );
    border-radius: 5px;
    width: 35%;
    position: relative;
    transition: all 5s ease-in-out;
}

.popup h2 {
font-size: 30px;
  margin-top: 0;
  color: #333;
  font-family: Tahoma, Arial, sans-serif;
}
.popup .close {
  position: absolute;
  top: 20px;
  right: 30px;
  transition: all 200ms;
  font-size: 30px;
  font-weight: bold;
  text-decoration: none;
  color: #333;
}
.popup .close:hover {
  color: #28467f;
}
.popup .content {
    font-size: 21px;
  max-height: 30%;
  overflow: auto;
}

@media screen and (max-width: 700px){
  .box{
    width: 70%;
  }
  .popup{
    width: 70%;
  }
}
</style>
<title>Ordered list</title>
</head>
<body>
  <jsp:include page="header.jsp"></jsp:include>

    <div class="container">
        <div class="list-of-customer">
       <%
			List<Booking> listBookings = (List<Booking>) request.getAttribute("bookings");
			if (listBookings != null && !listBookings.isEmpty()) {
			    for (Booking booking : listBookings) {
			        User user = booking.getUser();
			        String[] arr = booking.getDate().split(" ");

			%>
    <div id="a-form" class="design-form">
        <img class="designurl" id="designUrl" src="<%=booking.getDesignUrl()%>" />
        <div>
            <pre>Name             : <span id="name"><%=user != null ? user.getUsername() : "" %></span></pre>
        </div>
        <div>
            <pre>Email            : <span id="mail"><%=user != null ? user.getEmail() : "" %></span></pre>
        </div>
        <div>
            <pre>Phone number     : <span id="phoneNumber"><%=user != null ? user.getPhonenumber() : "" %></span></pre>
        </div>
        <div>
            <pre>Design name      : <span id="designName"><%=booking.getDesignName()%></span></pre>
        </div>
        <div>
            <pre>Budget           : <span id="amount"><%=booking.getExpectedAmount()%></span></pre>
        </div>
        <div>
            <pre>Expected Months  : <span id="time"><%=booking.getExpectedMonths()%></span></pre>
        </div>
          <div>
            <pre>Date             : <span id="time"><%=arr[0]%></span></pre>
        </div>
         <div style="display:flex">
            <div style="margin-top:-20px"><pre>Message          : </pre></div><div ><a class="button" href="#popup1">View Message</a></div><div id="popup1" class="overlay"><div class="popup"><h2>Message</h2><a class="close" href="#">&times;</a><div class="content"><%=booking.getMessage()%></div></div></div>
        </div>
       <div class="both-btn">
		    <% if (booking.getStatus().equals("Pending")) { %>
		        <a class="verifybtn" href="UpdateBookingStatusServlet?bookingId=<%=booking.getBookingId()%>&newStatus=Accepted">Accepted</a>
		        <a class="verifybtn" href="UpdateBookingStatusServlet?bookingId=<%=booking.getBookingId()%>&newStatus=Rejected">Rejected</a>
		    <% } else { %>
		        <a class="verifybtn"><%= booking.getStatus() %></a>
		    <% } %>
		</div>

    </div>
			<%
			    }
			} else {
			%>
			  <img alt="interior design" class="free_img" Style="width: auto;height: auto;margin-left: 17px;" src="./assets/image/common/appoinments.png">

			<%
			}
			%>
        </div>
    </div>
</body>
</html>