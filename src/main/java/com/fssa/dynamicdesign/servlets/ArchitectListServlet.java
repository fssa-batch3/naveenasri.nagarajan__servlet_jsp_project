package com.fssa.dynamicdesign.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.dynamicdesign.model.Architect;
import com.fssa.dynamicdesign.service.ArchitectService;
import com.fssa.dynamicdesign.service.exception.ServiceException;

@WebServlet("/architectlistservlet")
public class ArchitectListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	HttpSession session = request.getSession(false);

		if (session != null) {
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
		} else {
			System.out.println("session invalid in the architect list page you wants to login again");
			response.sendRedirect("architect_login.jsp");
		}
    }
}
