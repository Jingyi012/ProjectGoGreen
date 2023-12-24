package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ElectricBillValidateController {
    @RequestMapping("validateBill")
    public ModelAndView getBillValidatePage() {
        ModelAndView model = new ModelAndView("validateBill");
        return model;
    }

    @RequestMapping("validateElectricBill")
    public ModelAndView getElectricBillValidatePage() {
        ModelAndView model = new ModelAndView("validateElectricBill");
        return model;
    }
    
}
