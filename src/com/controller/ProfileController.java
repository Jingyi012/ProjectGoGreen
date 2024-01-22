package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.model.User;

import dbUtil.UserDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class ProfileController {
      
	private UserDao userDao=new UserDao();
	  @RequestMapping("/profile")
	    public ModelAndView getProfilePage(HttpServletRequest request) {
	        ModelAndView model = new ModelAndView("profile");

	        HttpSession session = request.getSession();
	        Object userIdObj = session.getAttribute("user_id");

	        if (userIdObj != null) {
	           
	            int userId = Integer.parseInt(userIdObj.toString());

	            
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
	        ModelAndView model = new ModelAndView("editProfile");
	    
	        HttpSession session = request.getSession();
	        Object userIdObj = session.getAttribute("user_id");

	        if (userIdObj != null) {
	         
	            int userId = Integer.parseInt(userIdObj.toString());

	        
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
	  public String updateProfile(@ModelAttribute("user") User user, HttpSession session) {
	      
	      Object userIdObj = session.getAttribute("user_id");

	      if (userIdObj != null) {

	          int userId = Integer.parseInt(userIdObj.toString());
              
	          System.out.print(userId);
	       
	          user.setId(userId);

	
	          userDao.updateUser(user);

	          return "redirect:/profile";
	      } else {
	     
	          return "redirect:/error";
	      }
	  }

	  
	  
	    
	  
	  
	  
	  
	    }
	  
	 




