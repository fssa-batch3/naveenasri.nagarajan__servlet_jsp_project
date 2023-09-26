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

@WebServlet("/SearchDesignServlet")
public class SearchDesignServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session != null) {
            // Retrieve the search query parameter from the request
            String searchQuery = request.getParameter("search");

            if (searchQuery != null && !searchQuery.isEmpty()) {
                // Create an instance of your DesignService (replace with your actual service instantiation)
                DesignService designService = new DesignService();

                try {
                    // Call the searchDesignsByName method to search for designs by name
                    List<Design> searchResults = designService.searchDesignsByName(searchQuery);

                    // Set the search results as an attribute in the request
                    request.setAttribute("designs", searchResults);

                    // Forward the request and response to your JSP page for displaying the results
                    request.getRequestDispatcher("/user_design_list.jsp").forward(request, response);
                } catch (ServiceException e) {
                    // Handle the exception or rethrow it as a ServletException if needed
                    throw new ServletException("Error while searching designs by name", e);
                }
            } else {
                // Handle the case where no search query is provided
                request.setAttribute("errorMessage", "Please enter a search query.");
                request.getRequestDispatcher("userdesignlistservlet").forward(request, response);
            }
        } else {
            System.out.println("Session invalid on the user update page; you need to log in again.");
            response.sendRedirect("user_login.jsp");
        }
    }
}
