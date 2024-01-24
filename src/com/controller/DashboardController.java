package com.controller;

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
import com.model.AreaCarbon;

import dbUtil.AreaCarbonDAO;
import dbUtil.ElectricBillDAO;

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
		double totalCF = 0;
		ElectricBillDAO ebilldao = new ElectricBillDAO();
		ElectricBill ebill = ebilldao.getApprovedElectricDataByMonthYear((int)session.getAttribute("user_id"), month, year);
		if (ebill != null) {
	        double eConsump = ebill.getElectric_consumption();
	        totalCF += eConsump;

	        // Later add water and recycle

	        model.addAttribute("electric_consumption", eConsump);
	        model.addAttribute("carbon_footprint", totalCF);
	    } else {
	        // Handle the case when ebill is not found (empty)
	        model.addAttribute("electric_consumption", 0);
	        model.addAttribute("water_consumption", 0);
	        model.addAttribute("recycle_weight", 0);
	        model.addAttribute("carbon_footprint", 0);
	        
	    }
		return "dashboard/myCarbonFootprint";
	}
}
