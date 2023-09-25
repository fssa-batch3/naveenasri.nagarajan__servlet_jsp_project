package com.fssa.dynamicdesign.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.dynamicdesign.model.Design;
import com.fssa.dynamicdesign.service.DesignService;
import com.fssa.dynamicdesign.service.exception.ServiceException;

@WebServlet("/createDesign")
public class CreateDesignServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		if (session != null) {
			int architectId = Integer.parseInt(request.getParameter("architectId"));
			String name = request.getParameter("name");
			String style = request.getParameter("style");
			int squarefeet = Integer.parseInt(request.getParameter("sqft"));
			double priceppersqft = Double.parseDouble(request.getParameter("priceppersqft"));
			String category = request.getParameter("category");
			String floorplan = request.getParameter("floorPlan");
			int timerequired = Integer.parseInt(request.getParameter("timerequired"));
			String bio = request.getParameter("bio");
			String brief = request.getParameter("brief");

			// Retrieve image URLs as an array
			List<String> imageUrlsList = Arrays.asList(request.getParameterValues("field[]"));

			Design design = new Design();
			design.setArchitectId(architectId);
			design.setDesignName(name);
			design.setStyle(style);
			design.setSquareFeet(squarefeet);
			design.setPricePerSqFt(priceppersqft);
			design.setCategory(category);
			design.setFloorPlan(floorplan);
			design.setTimeRequired(timerequired);
			design.setBio(bio);
			design.setBrief(brief);
			design.setDesignUrls(imageUrlsList); // Use the existing setter method that accepts a List<String>

			PrintWriter out = response.getWriter();
			DesignService designService = new DesignService();

			try {
				designService.createDesign(design);
				out.println("<h1>Design Created Successfully</h1>");
				response.sendRedirect("architectdesignlistservlet"); // Redirect to the design list page after
																		// successful creation
			} catch (ServiceException e) {
				String msg = e.getMessage();
				String[] error = msg.split(":");
				request.setAttribute("architectId", architectId);
				request.setAttribute("name", name);
				request.setAttribute("style", style);
				request.setAttribute("sqft", squarefeet);
				request.setAttribute("priceppersqft", priceppersqft);
				request.setAttribute("category", category);
				request.setAttribute("floorPlan", floorplan);
				request.setAttribute("timerequired", timerequired);
				request.setAttribute("bio", bio);
				request.setAttribute("brief", brief);
				request.setAttribute("field[]", imageUrlsList);

				RequestDispatcher patcher = request
						.getRequestDispatcher("create_design.jsp?error=" + error[error.length - 1]);
				patcher.forward(request, response);
			}
		} else {
			System.out.println("session invalid in the architect create design page you wants to login again");
			response.sendRedirect("architect_login.jsp");
		}

	}
}
