package com.fssa.dynamicdesign.servlets;

import java.io.IOException;

import java.util.Arrays;
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

@WebServlet("/DesignEditServlet")
public class DesignEditServlet extends HttpServlet {
   

	private static final long serialVersionUID = 1L;

	
	 @Override
 	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
 		// TODO Auto-generated method stub
 		doPost(req, resp);
 	}
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	HttpSession session = request.getSession(false);

		if (session != null) {
        long uniqueId = Long.parseLong(request.getParameter("uniqueId"));

        // Retrieve form parameters
        String designName = request.getParameter("designName");
        System.out.println(designName);

        String style = request.getParameter("style");
        int squareFeet = Integer.parseInt(request.getParameter("sqft"));
        double pricePerSqFt = Double.parseDouble(request.getParameter("priceppersqft"));
        String category = request.getParameter("category");
        String floorPlan = request.getParameter("floorPlan");
        int timeRequired = Integer.parseInt(request.getParameter("timeRequired"));
        String bio = request.getParameter("bio");
        String brief = request.getParameter("brief");
        
        // Retrieve image URLs as an array
        String[] imageUrlsArray = request.getParameterValues("field[]");
        List<String> imageUrlsList = (imageUrlsArray != null) ? Arrays.asList(imageUrlsArray) : null;
        System.out.println(imageUrlsArray);
        
        // Create a Design object with the updated values
        Design updatedDesign = new Design();
        updatedDesign.setUniqueId(uniqueId);
        updatedDesign.setDesignName(designName);
        updatedDesign.setStyle(style);
        updatedDesign.setSquareFeet(squareFeet);
        updatedDesign.setPricePerSqFt(pricePerSqFt);
        updatedDesign.setCategory(category);
        updatedDesign.setFloorPlan(floorPlan);
        updatedDesign.setTimeRequired(timeRequired);
        updatedDesign.setBio(bio);
        updatedDesign.setBrief(brief);
        updatedDesign.setDesignUrls(imageUrlsList);

        DesignService designService = new DesignService();
        try {
            boolean updated = designService.updateDesign(uniqueId, updatedDesign);
            if (updated) {
                response.sendRedirect("architectdesignlistservlet"); // Redirect to the design list page after successful update
            } 
        } catch (ServiceException e) {
            // Handle service exception
            response.sendRedirect("design_edit.jsp?uniqueId=" + uniqueId + "&error=" + e.getMessage());
        }
		} else {
			System.out.println("session invalid in the architect design update page you wants to login again");
			response.sendRedirect("architect_login.jsp");
		}
       
    }
}
