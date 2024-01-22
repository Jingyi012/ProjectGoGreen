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

import dbUtil.AreaCarbonDTO;
import dbUtil.ElectricBillDAO;

@Controller
public class DashboardController {
	@RequestMapping("/userDashboard")
	protected ModelAndView userDashboard(){
		ModelAndView model = new ModelAndView("userDashboard");
		AreaCarbonDTO acdto = new AreaCarbonDTO();
		List<AreaCarbon> areaCarbonList = acdto.getAreaCarbonData(2023);
		
		model.addObject("areaCarbonList", areaCarbonList);
		return model;
	}
	@RequestMapping("/adminDashboard")
	protected ModelAndView adminDashboard(){
		ModelAndView model = new ModelAndView("adminDashboard");
		AreaCarbonDTO acdto = new AreaCarbonDTO();
		List<AreaCarbon> areaCarbonList = acdto.getAreaCarbonData(2023);
		
		AreaCarbon highestArea = acdto.getHighestLowestCFArea("DESC", 2023);
		AreaCarbon lowestArea = acdto.getHighestLowestCFArea("ASC", 2023);
		
		double totalCF = acdto.getTotalCF();
		int totalParticipant = acdto.getTotalParticipant();
		
		//for graph
		List<MonthlyCarbonFootprint> mcf = acdto.getMonthlyTotalCFByYear(2023);
		
		//category
		double housingHighRiseCF = acdto.carbonFootprintByCategory("Housing (High Rise)", 2023);
		double housingLandedCF = acdto.carbonFootprintByCategory("Housing (Landed)", 2023);
		double institutionCF = acdto.carbonFootprintByCategory("Institution", 2023);
		
		model.addObject("areaCarbonList", areaCarbonList);
		model.addObject("highestArea", highestArea);
		model.addObject("lowestArea", lowestArea);
		model.addObject("totalCF", totalCF);
		model.addObject("totalParticipant", totalParticipant);
		model.addObject("monthlyCarbonFootprint", mcf);
		model.addObject("housingHighRiseCF", housingHighRiseCF);
		model.addObject("housingLandedCF", housingLandedCF);
		model.addObject("institutionCF", institutionCF);
		
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
	        model.addAttribute("electric_consumption", 0); // or any default value
	        model.addAttribute("carbon_footprint", 0); // or any default value
	    }
		return "myCarbonFootprint";
	}
}
