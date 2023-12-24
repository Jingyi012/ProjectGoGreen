package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RegistrationController {
	@RequestMapping("/register")
	protected ModelAndView getRegistrationForm() {
		ModelAndView model = new ModelAndView("register");
		return model;
	}
	
	@RequestMapping("register/submit")
	protected String submitRegistrationForm(){
		
		return "redirect:/userDashboard";
	}
}
