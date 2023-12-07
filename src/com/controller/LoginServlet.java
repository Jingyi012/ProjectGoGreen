package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LoginServlet() {
        super();
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nric = request.getParameter("NRIC");
		String password = request.getParameter("password");
		
		HttpSession session = request.getSession();
		
		if(nric.equals("1111") && password.equals("1111")) {
			session.setAttribute("userRole", "admin");
			response.sendRedirect(request.getContextPath() + "/adminDashboard.jsp");
		} else {
			session.setAttribute("userRole", "user");
			response.sendRedirect(request.getContextPath() + "/userDashboard.jsp");
		}
	}

}
