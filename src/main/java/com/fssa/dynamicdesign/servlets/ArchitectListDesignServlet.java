package com.fssa.dynamicdesign.servlets;
import java.io.IOException;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.dynamicdesign.model.Architect;
import com.fssa.dynamicdesign.model.Design;
import com.fssa.dynamicdesign.service.DesignService;
import com.fssa.dynamicdesign.service.ArchitectService;
import com.fssa.dynamicdesign.service.exception.ServiceException;

@WebServlet("/architectdesignlistservlet")
public class ArchitectListDesignServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();
            DesignService designService = new DesignService();
          
            String architectEmail = (String) request.getSession().getAttribute("loggedInEmail");
            System.out.println(architectEmail);
            ArchitectService architectService = new ArchitectService(); // Create an instance of your service class
            Architect architect = architectService.getArchitectByEmail(architectEmail); // Call the method on the instance

            // store that architect Id here architectId
            int architectId = architect.getArchitectID();
            
            out.println("Design Lists for Architect with ID: " + architectId);
            
            // Fetch the designs for the specific architect
            List<Design> designs = designService.listDesignsByArchitectId(architectId); // Implement this method
            
            request.setAttribute("designs", designs);
        } catch (ServiceException e) {
            request.setAttribute("error", "Error fetching or displaying Designs data: " + e.getMessage());
            e.printStackTrace();
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("architect_design_list.jsp");
        dispatcher.forward(request, response);
    }

}
