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

import com.model.User;

import dbUtil.UserDao;


@Controller
public class UserController {
	private UserDao userDao=new UserDao();
	@RequestMapping("/manageUser")
	public ModelAndView getManageUserPage(HttpServletRequest request) {
	    ModelAndView model = new ModelAndView("manageUser");

	    List<User> users = userDao.getUsersByStatus();

	    model.addObject("users", users);
	    return model;
	}

    
    @RequestMapping("/manageUserProfile")
    public ModelAndView getManageUserProfilePage(HttpServletRequest request) {
        ModelAndView model = new ModelAndView("manageUserProfile");
        String firstName = request.getParameter("firstName");
        int id = Integer.parseInt(request.getParameter("id"));
        List<User> users = userDao.getUsersByIdAndName(id,firstName);

        if (!users.isEmpty()) {
            User user = users.get(0);
            model.addObject("user", user);
        } else {
            model.addObject("errorMessage", "No user found with the name: " + firstName);
        }

        return model;
    }

    
    @RequestMapping("/Approve")
    public String updateStatus(@RequestParam("userId") int userId, HttpSession session, HttpServletRequest request) {
        User user = new User();
        user.setId(userId);
        userDao.updateStatusToApproved(user);
        return "redirect:/manageUser";
    }
    
    @RequestMapping("/Reject")
    public String updateStatus1(@RequestParam("userId") int userId, HttpSession session, HttpServletRequest request) {
        User user = new User();
        user.setId(userId);
        userDao.updateStatusToReject(user);
        return "redirect:/manageUser";
    }


    
}
