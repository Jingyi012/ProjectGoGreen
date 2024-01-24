package com.controller;

import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model.ElectricBill;
import com.model.MonthlyCarbonFootprint;
import com.model.RecycleBill;
import com.model.AreaCarbon;

import dbUtil.AreaCarbonDAO;
import dbUtil.ElectricBillDAO;
import dbUtil.RecycleBillDAO;

@Controller
public class DashboardController {
	@RequestMapping("/userDashboard")
	protected ModelAndView userDashboard(){
		ModelAndView model = new ModelAndView("dashboard/userDashboard");
		AreaCarbonDAO acdao = new AreaCarbonDAO();
		int year = 2023;
		List<AreaCarbon> areaCarbonList = acdao.getAreaCarbonData(year);
		
		model.addObject("year", year);
		model.addObject("areaCarbonList", areaCarbonList);
		return model;
	}
	@RequestMapping("/adminDashboard")
	protected ModelAndView adminDashboard(){
		ModelAndView model = new ModelAndView("dashboard/adminDashboard");
		int year = 2023;
		AreaCarbonDAO acdao = new AreaCarbonDAO();
		List<AreaCarbon> areaCarbonList = acdao.getAreaCarbonData(year);
		
		AreaCarbon highestArea = acdao.getHighestLowestCFArea("DESC", year);
		AreaCarbon lowestArea = acdao.getHighestLowestCFArea("ASC", year);
		
		double totalCF = acdao.getTotalCFByYear(year);
		int totalParticipant = acdao.getTotalParticipant(year);
		
		//for graph
		List<MonthlyCarbonFootprint> mcf = acdao.getMonthlyTotalCFByYear(year);
		
		//category
		double housingHighRiseCF = acdao.carbonFootprintByCategory("Housing (High Rise)", year);
		double housingLandedCF = acdao.carbonFootprintByCategory("Housing (Landed)", year);
		double institutionCF = acdao.carbonFootprintByCategory("Institution", year);
		
		model.addObject("areaCarbonList", areaCarbonList);
		model.addObject("highestArea", highestArea);
		model.addObject("lowestArea", lowestArea);
		model.addObject("totalCF", totalCF);
		model.addObject("totalParticipant", totalParticipant);
		model.addObject("monthlyCarbonFootprint", mcf);
		model.addObject("housingHighRiseCF", housingHighRiseCF);
		model.addObject("housingLandedCF", housingLandedCF);
		model.addObject("institutionCF", institutionCF);
		model.addObject("year", year);
		return model;
	}
	
	@RequestMapping("/updateMyCarbonFootprint")
	protected String updateMyCarbonFootprint(@RequestParam("year") int year, @RequestParam("month") int month, HttpServletRequest request, HttpSession session, Model model) {
		int user_id = (int)session.getAttribute("user_id");
		double totalCF = 0;
		ElectricBillDAO ebilldao = new ElectricBillDAO();
		ElectricBill ebill = ebilldao.getApprovedElectricDataByMonthYear(user_id, month, year);
		RecycleBillDAO rbilldao = new RecycleBillDAO();
		RecycleBill rbill = rbilldao.getApprovedRecycleDataByMonthYear(user_id, month, year);
				
		if (ebill != null) {
	        double eConsump = ebill.getElectric_consumption();
	        model.addAttribute("electric_consumption", eConsump);
	        totalCF += ebill.getCarbon_footprint();
		}else {
        	model.addAttribute("electric_consumption", 0);
        }
		
		if (rbill != null) {
	        double rWeight = rbill.getRecycle_weight();
	        model.addAttribute("recycle_weight", rWeight);
	        totalCF += rbill.getCarbon_footprint();
		}else {
        	model.addAttribute("recycle_weight", 0);
        }
		
	        // Later add water and recycle
	    
	    model.addAttribute("water_consumption", 0);
	    
	    DecimalFormat df = new DecimalFormat("0.00");
	    model.addAttribute("carbon_footprint", df.format(totalCF));
	    
		return "dashboard/myCarbonFootprint";
	}
}
