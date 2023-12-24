package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class UserController {
    @RequestMapping("/manageUser")
    public ModelAndView getManageUserPage() {
        ModelAndView model = new ModelAndView("manageUser");
        return model;
    }
    
    @RequestMapping("/manageUserProfile")
    public ModelAndView getManageUserProfilePage() {
        ModelAndView model = new ModelAndView("manageUserProfile");
        return model;
    }
}
