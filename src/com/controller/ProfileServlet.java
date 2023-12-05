package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/ProfileServlet")
@MultipartConfig
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String phoneNo = request.getParameter("phoneNo");
            String email = request.getParameter("email");
            String category = request.getParameter("category");
            String numberOfPeople = request.getParameter("Number of People Living In The House");
            String address = request.getParameter("Address");
            String area = request.getParameter("Area");

            Part fileUploadPart = request.getPart("fileUpload");
            Part fileUpload1Part = request.getPart("fileUpload1");
            
         
      
            request.setAttribute("firstName", firstName);
            request.setAttribute("lastName", lastName);
            request.setAttribute("phoneNo", phoneNo);
            request.setAttribute("email", email);
            request.setAttribute("category", category);
            request.setAttribute("numberOfPeople", numberOfPeople);
            request.setAttribute("address", address);
            request.setAttribute("area", area);

            request.setAttribute("fileUploadName", fileUploadPart.getSubmittedFileName());
            request.setAttribute("fileUpload1Name", fileUpload1Part.getSubmittedFileName());

            request.getRequestDispatcher("editProfile.jsp").forward(request, response);
        } finally {
            out.close();
        }
    }
}
