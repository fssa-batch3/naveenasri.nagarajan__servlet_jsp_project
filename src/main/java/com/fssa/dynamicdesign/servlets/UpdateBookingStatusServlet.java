package com.fssa.dynamicdesign.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.dynamicdesign.service.BookingService;
import com.fssa.dynamicdesign.service.exception.ServiceException;

/**
 * Servlet implementation class UpdateBookingStatusServlet
 */
@WebServlet("/UpdateBookingStatusServlet")
public class UpdateBookingStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBookingStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  // Get the booking ID and new status from the request parameters
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        System.out.println(bookingId);
        String newStatus = request.getParameter("newStatus");
        System.out.println(newStatus);
        // Call your service method to update the booking status
        BookingService bookingService = new BookingService();
        try {
            boolean updated = bookingService.updateBookingStatus(bookingId, newStatus);
            if (updated) {
                // Update was successful, you can redirect to a success page
                response.sendRedirect("ArchitectOrderListServlet");
            } 
        } catch (ServiceException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
	}

	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	      doGet(request, response);
	    }

}
