package com.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.model.RecycleBill;
import com.model.RecycleUserJoin;

import dbUtil.RecycleBillDAO;
import dbUtil.RecycleUserJoinDAO;

@Controller
public class RecycleBillValidateController {
	
	@RequestMapping("validateRecycleBill")
	protected ModelAndView validateRecycleBillPage() {
		
		RecycleUserJoinDAO ruDAO = new RecycleUserJoinDAO(); 
		List<RecycleUserJoin> ruList = ruDAO.getAllPendingBill(); 
		
		ModelAndView modelAndView = new ModelAndView("validateBill/validateRecycleBill");
		modelAndView.addObject("pendingValidateRList", ruList);
		
		return modelAndView;
	}
	
	@RequestMapping("validateRecycleAction")
    public ModelAndView validateRecycleAction(@RequestParam("rid") int rid, @RequestParam("action") String action, RedirectAttributes redirectAttributes) {
    	
    	RecycleBillDAO recycleBillDAO = new RecycleBillDAO();
    	RecycleBill recycleBill = recycleBillDAO.getRecycleDataById(rid);
    	
    	recycleBill.setStatus(action);
    	recycleBillDAO.editRecycleBill(recycleBill);
    	
    	ModelAndView modelAndView = new ModelAndView("redirect:/validateRecycleBill");
    	redirectAttributes.addFlashAttribute("successMessage", "Recycle bill id: "+ rid + " " + action + " successfully.");
   	
    	return modelAndView;
    }
}
