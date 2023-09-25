package com.fssa.dynamicdesign.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.dynamicdesign.model.Booking;
import com.fssa.dynamicdesign.model.User;
import com.fssa.dynamicdesign.service.BookingService;
import com.fssa.dynamicdesign.service.exception.ServiceException;

/**
 * Servlet implementation class UserCreateBooking
 */
@WebServlet("/UserCreateBooking")
public class UserCreateBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserCreateBookingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);
        if(session != null) {
        User user = (User) session.getAttribute("user");
        
        int userId = user.getUserId();
        System.out.println(userId);
        
        int architectId = Integer.parseInt(request.getParameter("architectId")); // Get architectId from parameter

        String designName = request.getParameter("DesignName");
        String designUrl = request.getParameter("DesignUrl");
        int expectedAmount = Integer.parseInt(request.getParameter("amount"));
        int expectedMonths = Integer.parseInt(request.getParameter("months"));
        String message = request.getParameter("message");

        // Create a Booking object
        Booking booking = new Booking();
       
        booking.setDesignName(designName);
        booking.setDesignUrl(designUrl);
        booking.setExpectedAmount(expectedAmount);
        booking.setExpectedMonths(expectedMonths);
        booking.setMessage(message);
        booking.setUserId(userId); 
        booking.setArchitectId(architectId);

        
        try {
           
                BookingService bookingService = new BookingService();
                bookingService.createBooking(booking);
                response.sendRedirect("UserListBookingServlet"); // Redirect to a success page
            
        } catch (ServiceException e) {
        	String msg = e.getMessage();
			String[] error = msg.split(":");
			request.setAttribute("DesignName", designName);
			request.setAttribute("DesignUrl", designUrl);
			request.setAttribute("amount",expectedAmount);
			request.setAttribute("months", expectedMonths);
			request.setAttribute("message", message);
			
			RequestDispatcher patcher = request.getRequestDispatcher("user_create_booking.jsp?error="+error[1]);
			patcher.forward(request, response);
			out.print(e.getMessage());
			    
        }
        } else {
			System.out.println("session invalid in the user create booking page you wants to login again");
			response.sendRedirect("user_login.jsp");
		}
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
