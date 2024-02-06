package com.controller;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.model.User;

import dbUtil.UserDao;


@Controller
public class UserController {
	private UserDao userDao=new UserDao();
	@RequestMapping("/manageUser")
	public ModelAndView getManageUserPage(HttpServletRequest request) {
	    ModelAndView model = new ModelAndView("userManage/manageUser");

	    List<User> users = userDao.getUsersByStatus();

	    model.addObject("users", users);
	    return model;
	}

    
    @RequestMapping("/manageUserProfile")
    public ModelAndView getManageUserProfilePage(HttpServletRequest request) {
        ModelAndView model = new ModelAndView("userManage/manageUserProfile");

        int id = Integer.parseInt(request.getParameter("id"));

        User user = userDao.getUserById(id);
        
        if (user!=null) {
            model.addObject("user", user);
        } else {
            model.addObject("errorMessage", "No user found with the id: " + id);
        }

        return model;
    }

    
    @RequestMapping("/Approve")
    public String updateStatus(@RequestParam("userId") int userId, HttpSession session, HttpServletRequest request,RedirectAttributes redirectAttributes) {
        userDao.updateUserStatus(userId, "approve");
    	redirectAttributes.addFlashAttribute("approveMessage", "Approved Successfully");
    	return "redirect:/manageUser";
    }
    
    @RequestMapping("/Reject")
    public String updateStatus1(@RequestParam("userId") int userId, HttpSession session, HttpServletRequest request,RedirectAttributes redirectAttributes) {
        userDao.updateUserStatus(userId, "reject");
        redirectAttributes.addFlashAttribute("rejectMessage", "Reject Successfully");
        return "redirect:/manageUser";
    }


    
}
