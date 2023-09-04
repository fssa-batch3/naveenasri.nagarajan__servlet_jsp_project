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

import com.fssa.dynamicdesign.model.Design;
import com.fssa.dynamicdesign.service.DesignService;
import com.fssa.dynamicdesign.service.exception.ServiceException;

@WebServlet("/architectdesignlistservlet")
public class ArchitectListDesignServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
        	PrintWriter out = response.getWriter();
            DesignService designService = new DesignService();
        	out.println("Design Lists");
            List<Design> designs = designService.listDesigns();
            request.setAttribute("designs", designs);
        } catch (ServiceException e) {
            request.setAttribute("error", "Error fetching or displaying Designs data: " + e.getMessage());
            e.printStackTrace();
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("architect_design_list.jsp");
        dispatcher.forward(request, response);
    }
}
