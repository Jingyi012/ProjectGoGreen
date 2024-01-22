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

	    if (userDao.isAdminCredentialsValid(nric, password)) {

	    	session.setAttribute("userRole", "admin");
			session.setAttribute("user_id", 1);
		
			return "redirect:/adminDashboard";
	    }

	 
	    if (userDao.isUserCredentialsValid(nric, password)) {
	       
	        User user = userDao.getUserDataByIc(nric);

	        if (user != null) {
	         
	            session.setAttribute("userRole", "user");
	            session.setAttribute("user_id", user.getId());
	            model.addAttribute("user", user);
	            return "redirect:/userDashboard";
	        } else {
	        
	            return "redirect:/login";
	        }
	    } else {
	   
	        return "redirect:/login";
	    }
	}

	 

}
		
		

	


