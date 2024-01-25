package com.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.model.WaterBill;
import com.model.WaterUserJoin;

import dbUtil.WaterBillDAO;
import dbUtil.WaterUserJoinDAO;

@Controller
public class WaterBillValidateController {

	
	@RequestMapping("validateWaterBill")
	public String getWaterBillValidatePage(Model model) {
		WaterUserJoinDAO wu = new WaterUserJoinDAO();
		List<WaterUserJoin> wuList =wu.getAllPendingBill();
		model.addAttribute("pendingValidateWList", wuList);
		return "validateBill/validateWaterBill";
	}
	
	@RequestMapping("validateWaterAction")
	public String validateWaterAction(@RequestParam("waterId") int waterId, @RequestParam("action")String action, RedirectAttributes redirectAttributes) {
		
		WaterBillDAO wbilldao = new WaterBillDAO();
		WaterBill wbill = wbilldao.getWaterDataById(waterId);
		
		wbill.setStatus(action);
		wbilldao.updateWaterBill(wbill);
		
		redirectAttributes.addFlashAttribute("successMessage", "Water bill id: "+ waterId + " " + action + " successfully.");
    	return "redirect:/validateWaterBill";	}

}
