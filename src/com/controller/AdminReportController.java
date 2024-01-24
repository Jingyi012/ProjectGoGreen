package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminReportController {
	@RequestMapping("/adminReport")
	protected ModelAndView getAdminReportPage() {
		ModelAndView model = new ModelAndView("adminReport");
		return model;
	}
}


