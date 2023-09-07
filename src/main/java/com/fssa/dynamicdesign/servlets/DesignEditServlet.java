package com.fssa.dynamicdesign.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.dynamicdesign.model.Design;
import com.fssa.dynamicdesign.service.DesignService;
import com.fssa.dynamicdesign.service.exception.ServiceException;

@WebServlet("/DesignEditServlet")
public class DesignEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the form parameters
        int designId = Integer.parseInt(request.getParameter("designId"));
        String designName = request.getParameter("designName");
        String designUrl = request.getParameter("designUrl");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        int noOfRooms = Integer.parseInt(request.getParameter("noOfRooms"));

        // Create a Design object with the updated information
        Design updatedDesign = new Design(designId, designName, designUrl, price, description, noOfRooms);

        DesignService designService = new DesignService();
        try {
            boolean updated = designService.updateDesign(updatedDesign);

            if (updated) {
                // Set a success message and forward back to the edit page
               // request.setAttribute("message", "Design successfully updated");
             //   request.getRequestDispatcher("architectdesignlistservlet").forward(request, response);
           	 	response.sendRedirect("architectdesignlistservlet");
            } else {
                // Set an error message and forward back to the edit page
                request.setAttribute("message", "Failed to update design");
                request.getRequestDispatcher("design_edit.jsp").forward(request, response);
            }
        } catch (ServiceException e) {
            // Handle exceptions and set an error message
            e.printStackTrace();
            request.setAttribute("message", "Error: " + e.getMessage());
            request.getRequestDispatcher("design_edit.jsp").forward(request, response);
        }
    }
}
