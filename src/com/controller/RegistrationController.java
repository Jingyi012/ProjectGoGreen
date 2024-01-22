package com.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.model.User;
import dbUtil.UserDao;

@Controller
public class RegistrationController {
    
    private UserDao userDao = new UserDao();

    @RequestMapping("/register")
    protected ModelAndView getRegistrationForm() {
        ModelAndView model = new ModelAndView("register");
        return model;
    }
    
 

    @RequestMapping("/register/submit")
    protected String submitRegistrationForm(HttpServletRequest request,
                                             HttpServletResponse response,
                                             @RequestParam("fileUpload") MultipartFile fileUpload,
                                             @RequestParam("Identification_Card") String identificationCard,
                                             @RequestParam("ic_card") MultipartFile fileUpload1,
                                             @RequestParam("people") int people) throws IOException { 
        
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String password = request.getParameter("password");
        String address = request.getParameter("Address");
        String contact = request.getParameter("phoneNo");
        String category = request.getParameter("category");
        String area = request.getParameter("area");
        String email = request.getParameter("email");
        
       
        	if (userDao.isIcExists(identificationCard)) {
        	    return "redirect:/register?error=IC already exists. Please fill in the form again.";
        	}

        
        
        if(userDao.isIcAndPasswordExists(identificationCard,password))
        		{
        	  return "redirect:/register?error=IC and password already exists. Please fill in the form again.";
        		}
        	
        
            try {
                byte[] file = fileUpload.getBytes(); 
                byte[] file1 = fileUpload1.getBytes(); 

                User user = new User();
                user.setFirstName(firstName);
                user.setLastName(lastName);
                user.setPassword(password);
                user.setAddress(address);
                user.setPhoneNo(contact);
                user.setCategory(category);
                user.setEmail(email);
                user.setIc(identificationCard);
                user.setFile(file);
                user.setArea(area);
                user.setIc_card(file1);
                user.setPeople(people);

                userDao.add(user);
                
               
                return "redirect:/login";
            
            }catch (IOException e) {
                e.printStackTrace();
               
                request.setAttribute("error", "Error processing the registration. Please try again.");
                return "forward:/register"; 
            }
    }
}









