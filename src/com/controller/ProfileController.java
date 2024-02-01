package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.model.User;

import dbUtil.UserDao;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class ProfileController {

	private UserDao userDao = new UserDao();

	@RequestMapping("/profile")
	public ModelAndView getProfilePage(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("profile/profile");

		HttpSession session = request.getSession();

		if (session.getAttribute("user_id") != null) {
			
			int userId = (int)session.getAttribute("user_id");
			User user = userDao.getUserById(userId);

			if (user != null) {

				model.addObject("user", user);
				model.addObject("id", userId);
			} else {

				model.addObject("error", "User details not found for user ID: " + userId);
			}
		} else {

			model.addObject("error", "User ID not found in the session");
		}

		return model;
	}

	@RequestMapping("/editProfile")
	public ModelAndView getEditProfilePage(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("profile/editProfile");

		HttpSession session = request.getSession();

		if (session.getAttribute("user_id") != null) {

			int userId = (int)session.getAttribute("user_id");

			User user = userDao.getUserById(userId);

			if (user != null) {

				model.addObject("user", user);
				model.addObject("id", userId);
			} else {

				model.addObject("error", "User details not found for user ID: " + userId);
			}
		} else {

			model.addObject("error", "User ID not found in the session");
		}

		return model;
	}

	@RequestMapping("/updateProfile")
	public String updateProfile(@ModelAttribute("user") User user, 
			@RequestParam(value = "residency", required = false) MultipartFile residency, 
            @RequestParam(value = "icproof", required = false) MultipartFile icproof,
			HttpSession session) {
		
		User u = userDao.getUserById((int)session.getAttribute("user_id"));
		
		if(!u.getStatus().equals("approve")) {
			user.setStatus("pending");
		}
		
		try {
		if(residency == null || residency.getOriginalFilename().equals("")) {
			user.setFile(u.getFile());
		}
		else 
		{
			user.setFile(residency.getBytes());
		}
		
		if(icproof == null || icproof.getOriginalFilename().equals("")) {
			user.setIc_card(u.getIc_card());
		} 
		else 
		{
			user.setIc_card(icproof.getBytes());
		}
		
		userDao.updateUser(user);
		return "redirect:/profile";
			
		} catch (IOException e){
			e.printStackTrace();
			return "redirect:/errorPage";
		}

	}

}
