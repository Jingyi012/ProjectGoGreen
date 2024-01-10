package com.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.model.ElectricBill;
import com.model.ElectricUserJoin;

import dbUtil.ElectricBillDAO;
import dbUtil.ElectricUserJoinDTO;


@Controller
public class ElectricBillValidateController {
    @RequestMapping("validateBill")
    public ModelAndView getBillValidatePage() {
        ModelAndView model = new ModelAndView("validateBill");
        return model;
    }

    @RequestMapping("validateElectricBill")
    public String getElectricBillValidatePage(Model model) {
		/*
		 * ElectricUserJoinDTO eu = new ElectricUserJoinDTO(); List<ElectricUserJoin>
		 * euList = eu.getAllPendingBill(); model.addAttribute("pendingValidateEList",
		 * euList);
		 */
        return "validateElectricBill";
    }
    
    @RequestMapping("validateElectricAction")
    public String validateElectricAction(@RequestParam("eid") int eid, @RequestParam("action") String action, RedirectAttributes redirectAttributes) {
    	
    	ElectricBillDAO ebilldao = new ElectricBillDAO();
    	ElectricBill ebill = ebilldao.getElectricDataById(eid);
    	ebill.setStatus(action);
    	ebilldao.updateElectricBill(ebill);
    	
    	redirectAttributes.addFlashAttribute("successMessage", "Electric bill id: "+ eid + " " + action + "successfully.");
    	return "redirect:/validateElectricBill";
    }
    
}
