package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model.User;

import dbUtil.UserDao;

@Controller
public class passwordController {
	private UserDao userDao = new UserDao();

	@RequestMapping("/forgotPassword")
	public ModelAndView getManagePasswordPage(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("forgotPassword");
		return model;
	}

	@RequestMapping("/resetPassword")
	public String resetPassword(@RequestParam("email") String email, Model model, HttpSession session) {

		System.out.println("Email from the form: " + email);
		session.setAttribute("email", email);

		model.addAttribute("resetSuccess", true);

		return "resetPassword";
	}

	@RequestMapping("/resetPassword/submit")
	public String changePassword(@RequestParam("NRIC") String ic, @RequestParam("password") String password,
			Model model, HttpSession session) {
		Object userIdObj = session.getAttribute("email");

		if (userIdObj != null && userIdObj instanceof String) {
			String userEmail = (String) userIdObj;

			User user = userDao.getUserByIc(ic, userEmail);

			if (user != null) {

				user.setPassword(password);
				userDao.ResetPassword(user);

			} else {

				model.addAttribute("errorMessage", "User not found with the provided IC and email.");
				return "/errorPage";
			}
		} else {

			model.addAttribute("errorMessage", "Session error: User ID not available.");
			return "/errorPage";
		}

		return "login";
	}

	@RequestMapping("/errorPage")
	public ModelAndView getErrorPage(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("errorPage");
		return model;
	}

}
