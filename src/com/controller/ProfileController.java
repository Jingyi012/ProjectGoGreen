package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProfileController {
    @RequestMapping("/profile")
    public ModelAndView getProfilePage() {
        ModelAndView model = new ModelAndView("profile2");
        return model;
    }
    
    @RequestMapping("/editProfile")
    public ModelAndView getEditProfilePage() {
        ModelAndView model = new ModelAndView("editProfile2");
        return model;
    }
}
