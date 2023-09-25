package com.fssa.dynamicdesign.servlets;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.dynamicdesign.model.Design;
import com.fssa.dynamicdesign.service.DesignService;
import com.fssa.dynamicdesign.service.exception.ServiceException;

/**
 * Servlet implementation class FilterDesignsServlet
 */
@WebServlet("/FilterDesignsServlet")
public class FilterDesignsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	HttpSession session = request.getSession(false);

		if (session != null) {
        // Retrieve the selected category from the request parameters
        String selectedCategory = request.getParameter("selectrooms");
        System.out.println("Selcted category===========================================");
        System.out.println("Selcted category" + selectedCategory);
        
        // Create an instance of your DesignService (replace with your actual service instantiation)

        try {
            DesignService designService = new DesignService();

            // Call the service method to get designs by category
            List<Design> filteredDesigns = designService.getDesignByCategory(selectedCategory);

            // Set the filtered designs as an attribute in the request
            request.setAttribute("designs", filteredDesigns);

            // Forward the request and response to your JSP page for displaying the filtered designs
            request.getRequestDispatcher("user_design_list.jsp").forward(request, response);
        } catch (ServiceException e) {
            // Handle the exception or rethrow it as a ServletException if needed
            throw new ServletException("Error while filtering designs by category", e);
        }

		} else {
			System.out.println("session invalid in the user Filter  page you wants to login again");
			response.sendRedirect("user_login.jsp");
		}
    }
}
