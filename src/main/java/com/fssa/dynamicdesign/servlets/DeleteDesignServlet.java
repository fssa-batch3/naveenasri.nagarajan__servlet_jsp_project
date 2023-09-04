package com.fssa.dynamicdesign.servlets;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.dynamicdesign.service.DesignService;
import com.fssa.dynamicdesign.service.exception.ServiceException;

@WebServlet("/deleteDesignServlet")
public class DeleteDesignServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the design ID from the request parameter
        int designId = Integer.parseInt(request.getParameter("designId"));
        
        // Set the response content type to HTML
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        
        // Create an instance of your DesignService class (assuming you have one) to access the deleteDesign method
        DesignService designService = new DesignService();
        
        try {
            // Call the deleteDesign method to delete the design
            boolean deleted = designService.deleteDesign(designId);
            
            if (deleted) {
                out.println("<h1>Design successfully deleted.</h1>");
                // Design was successfully deleted
                response.getWriter().write("Design with ID " + designId + " was deleted successfully.");
            } else {
                // Design was not found or deletion failed
                response.getWriter().write("Design with ID " + designId + " was not found or deletion failed.");
            }
        } catch (ServiceException e) {
            // Handle database error
            e.printStackTrace();
            response.getWriter().write("An error occurred while deleting the design.");
        }
    }
}
