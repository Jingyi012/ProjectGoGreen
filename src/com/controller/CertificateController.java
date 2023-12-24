package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class CertificateController {
    @RequestMapping("/certificate")
    public ModelAndView getCertificatePage() {
        ModelAndView model = new ModelAndView("certificate");
        return model;
    }
    
}
