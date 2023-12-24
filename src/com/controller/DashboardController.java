package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DashboardController {
	@RequestMapping("/userDashboard")
	protected ModelAndView userDashboard(){
		ModelAndView model = new ModelAndView("userDashboard");
		return model;
	}
	@RequestMapping("/adminDashboard")
	protected ModelAndView adminDashboard(){
		ModelAndView model = new ModelAndView("adminDashboard");
		return model;
	}
}
