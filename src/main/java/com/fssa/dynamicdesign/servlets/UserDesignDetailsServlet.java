package com.fssa.dynamicdesign.servlets;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.dynamicdesign.model.Architect;
import com.fssa.dynamicdesign.model.Design;
import com.fssa.dynamicdesign.service.DesignService;
import com.fssa.dynamicdesign.service.exception.ServiceException;
import com.fssa.dynamicdesign.service.ArchitectService;

@WebServlet("/UserDesignDetailServlet")
public class UserDesignDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the uniqueId from the request parameter
        String uniqueIdString = request.getParameter("uniqueId");
        System.out.println("uniqueIdString: " + uniqueIdString); // Add this line

        // Initialize the DesignService
        DesignService designService = new DesignService();
        ArchitectService architectService = new ArchitectService();
        List<Design> designs = null; // Initialize the designs list
        Architect architect = null; // Initialize the architect object

        try {
            long uniqueId = Long.parseLong(uniqueIdString);
            System.out.println(uniqueId);
            designs = designService.getDesignByUniqueId(uniqueId);
            
            // Check if any designs were found
            if (designs != null && !designs.isEmpty()) {
                int architectId = designs.get(0).getArchitectId(); // Assuming you want the architect from the first design
                architect = architectService.getArchitectById(architectId);
            } 
        } catch (ServiceException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error fetching design data.");
        } catch (NumberFormatException e) {
            System.out.println("Invalid uniqueIdString: " + uniqueIdString);
        }

        // Set the designs list as an attribute to be used in the JSP
        request.setAttribute("designs", designs);
        System.out.println(designs);

        // Check if architect is not null before accessing its methods
        if (architect != null) {
            request.setAttribute("architect", architect);
            System.out.println(architect);
        }

        // Forward the request to the design details JSP
        request.getRequestDispatcher("/user_design_detail.jsp").forward(request, response);
    }

    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle any POST requests if needed
    }
}
