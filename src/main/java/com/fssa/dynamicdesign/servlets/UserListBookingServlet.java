package com.fssa.dynamicdesign.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.dynamicdesign.model.Architect;
import com.fssa.dynamicdesign.model.Booking;
import com.fssa.dynamicdesign.model.User;
import com.fssa.dynamicdesign.service.ArchitectService;
import com.fssa.dynamicdesign.service.BookingService;
import com.fssa.dynamicdesign.service.exception.ServiceException;

/**
 * Servlet implementation class UserListBookingServlet
 */
@WebServlet("/UserListBookingServlet")
public class UserListBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserListBookingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);
    	if (session != null) {
        User user = (User) session.getAttribute("user");
        
        int userId = user.getUserId();
        
        BookingService bookingService = new BookingService();

        try {
            List<Booking> architectBookings = new ArrayList<>();  

            // Call the service method to retrieve bookings by user ID
            List<Booking> bookings = bookingService.listBookingsByUserId(userId);

            for(Booking booking : bookings) {
                ArchitectService architectService = new ArchitectService();
            	Architect architect = architectService.getArchitectById(booking.getArchitectId());
            	booking.setArchitect(architect);
            	architectBookings.add(booking);            	
            	
            }
            // Set the retrieved bookings as an attribute in the request
            request.setAttribute("bookings", architectBookings);

        } catch (ServiceException e) {
			out.print(e.getMessage());
            e.printStackTrace(); 
            response.sendRedirect("/user_profile.jsp");
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("my_booking.jsp");
        dispatcher.forward(request, response);
    	} else {
			System.out.println("session invalid in the user list booking  page you wants to login again");
			response.sendRedirect("user_login.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
