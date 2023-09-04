package com.fssa.dynamicdesign.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.dynamicdesign.model.Architect;
import com.fssa.dynamicdesign.service.ArchitectService;
import com.fssa.dynamicdesign.service.exception.ServiceException;

@WebServlet("/architectlistservlet")
public class ArchitectListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ArchitectService architectService = new ArchitectService();
            List<Architect> architects = architectService.listArchitects();
            request.setAttribute("architects", architects);
        } catch (ServiceException e) {
            request.setAttribute("error", "Error fetching or displaying Architects data: " + e.getMessage());
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("architect_list.jsp");
        dispatcher.forward(request, response);
    }
}
