package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	
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
    protected String submitLoginForm(@RequestParam ("NRIC") String nric, @RequestParam ("password") String password, HttpSession session) {
		//ModelAndView model;
		
		if(nric.equals("1111") && password.equals("1111")) {
			session.setAttribute("userRole", "admin");
			//model = new ModelAndView("adminDashboard");
			return "redirect:/adminDashboard";
		} else {
			session.setAttribute("userRole", "user");
			//model = new ModelAndView("userDashboard");
			return "redirect:/userDashboard";
		}
		
		//return model;
	}
	
}
