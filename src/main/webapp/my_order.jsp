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
            <pre>Expected Amount  : <span id="amount"><%=booking.getExpectedAmount()%></span></pre>
        </div>
        <div>
            <pre>Expected Months  : <span id="time"><%=booking.getExpectedMonths()%></span></pre>
        </div>
        <div>
            <pre>Message          : <span id="message"><%=booking.getMessage()%></span></pre>
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
			    <h1>No Booking available.</h1>
			<%
			}
			%>
        </div>
    </div>
</body>
</html>