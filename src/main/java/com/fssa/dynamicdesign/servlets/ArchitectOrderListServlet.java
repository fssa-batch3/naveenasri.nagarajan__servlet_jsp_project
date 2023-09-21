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

import com.fssa.dynamicdesign.model.Architect;
import com.fssa.dynamicdesign.model.Booking;
import com.fssa.dynamicdesign.model.User;
import com.fssa.dynamicdesign.service.ArchitectService;
import com.fssa.dynamicdesign.service.BookingService;
import com.fssa.dynamicdesign.service.UserService;
import com.fssa.dynamicdesign.service.exception.ServiceException;

/**
 * Servlet implementation class ArchitectOrderListServlet
 */
@WebServlet("/ArchitectOrderListServlet")
public class ArchitectOrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArchitectOrderListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String architectEmail = (String) request.getSession().getAttribute("loggedInEmail");
        System.out.println(architectEmail);
        ArchitectService architectService = new ArchitectService();
        try {    // Create an instance of your service class
        Architect architect = architectService.getArchitectByEmail(architectEmail); // Call the method on the instance

        // store that architect Id here architectId
        int architectId = architect.getArchitectID();
        
        System.out.println("Design Lists for Architect with ID: " + architectId);
        
        
        BookingService bookingService = new BookingService();

       
            // Call the service method to retrieve bookings by user ID
        List<Booking> userBookings = new ArrayList<>();  
            List<Booking> bookings = bookingService.listBookingsByArchitectId(architectId);
            

            for(Booking booking : bookings) {
                UserService userService = new UserService();
            	User user = userService.getUserById(booking.getUserId());
            	booking.setUser(user);
            	userBookings.add(booking);            	
            	
            	
            	
            	
            }
            
            // Set the retrieved bookings as an attribute in the request
            request.setAttribute("bookings", userBookings);
          //  response.sendRedirect("/my_order.jsp");


        } catch (ServiceException e) {
			out.print(e.getMessage());
            e.printStackTrace(); 
         //   response.sendRedirect("/architect_profile.jsp");
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("my_order.jsp");
        dispatcher.forward(request, response);
        
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
