package com.fssa.dynamicdesign.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fssa.dynamicdesign.model.Design;
import com.fssa.dynamicdesign.service.DesignService;
import com.fssa.dynamicdesign.service.exception.ServiceException;

@WebServlet("/createDesign")
public class CreateDesignServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String url = request.getParameter("url");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        int noOfRooms = Integer.parseInt(request.getParameter("noOfRooms"));
        int architectId = Integer.parseInt(request.getParameter("architectId"));
        
        PrintWriter out = response.getWriter();
        DesignService designService = new DesignService();
        
        Design design = new Design(name, url, price, description, noOfRooms, architectId);
        try {
            designService.createDesign(design);
            out.println("<h1>Design Created Successfully</h1>");
            response.sendRedirect("architectdesignlistservlet"); // Redirect to the design list page after successful creation
        } catch (ServiceException e) {
            out.println("<h1>Error: " + e.getMessage() + "</h1>");
        }
    }
}
