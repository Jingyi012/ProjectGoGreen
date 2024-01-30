package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.model.User;

import dbUtil.UserDao;

@Controller
public class LoginController {
	private UserDao userDao=new UserDao();
	
	@RequestMapping("/")
	protected ModelAndView landingPage(){
		ModelAndView model = new ModelAndView("index");
		return model;
	}
	
	@RequestMapping("/login")
	protected ModelAndView getLoginForm(){
		ModelAndView model = new ModelAndView("login");
		return model;
	}
	
	@RequestMapping("/login/submit")
	protected String submitLoginForm(
	        @RequestParam("NRIC") String nric,
	        @RequestParam("password") String password,
	        HttpSession session, Model model) {
	    
	    User user = userDao.getUserByIcAndPassword(nric, password);

	    if(user != null) {
	        String role = user.getRole();

	        session.setAttribute("userRole", role);
	        session.setAttribute("user_id", user.getId());
	        session.setAttribute("username", user.getFirstName() + " " + user.getLastName());
	        
	        if(role.equals("user")) {
	            return "redirect:/userDashboard";
	        } else if(role.equals("admin")) {
	            return "redirect:/adminDashboard";
	        } else {
	            return "redirect:/login";
	        }
	    } 
	    else 
	    {
	        model.addAttribute("error", "Invalid credentials. Please try again.");
	        return "forward:/login";
	    }
	}


	 

}
		
		

	


