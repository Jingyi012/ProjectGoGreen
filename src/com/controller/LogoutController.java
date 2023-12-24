package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LogoutController {
	
	@RequestMapping("/logout")
	protected String logout(HttpSession session){
		if(session!=null) {
			session.invalidate();		
		}
		return "redirect:/";
	}

}
