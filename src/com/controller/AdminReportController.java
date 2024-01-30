package com.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model.AreaCarbon;
import com.model.MonthlyCarbonFootprint;

import dbUtil.AreaCarbonDAO;
import dbUtil.ElectricBillDAO;
import dbUtil.RecycleBillDAO;
import dbUtil.WaterBillDAO;

@Controller
public class AdminReportController {
	@RequestMapping("/adminReport")
	protected ModelAndView getAdminReportPage() {
		ModelAndView model = new ModelAndView("adminReport/adminReport");
		return model;
	}
	
	@RequestMapping("/monthReport")
	protected ModelAndView getMonthReportPage(@RequestParam("month") int month, @RequestParam("year") int year) {
		ModelAndView model = new ModelAndView("adminReport/monthReport");
		String [] months = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
		double totalCF = 0.0;
		ElectricBillDAO ebilldao = new ElectricBillDAO();
		Map<String, Double> electric = ebilldao.getElectricConsumpAndTotalCF(year, month);
		totalCF += electric.get("electric_CF");
		
		RecycleBillDAO rbilldao = new RecycleBillDAO();
		Map<String, Double> recycle = rbilldao.getRecycleWeightAndTotalCF(year, month);
		totalCF += recycle.get("recycle_CF");
		
		WaterBillDAO wbilldao = new WaterBillDAO();
		Map<String, Double> water = wbilldao.getWaterConsumpAndTotalCF(year, month);
		totalCF += water.get("water_CF");
		
		model.addObject("month", months[month-1]);
		model.addObject("year", year);
		model.addObject("electric", electric);
		model.addObject("recycle", recycle);
		model.addObject("water", water);
		model.addObject("totalCF", totalCF);
		return model;
	}
	
	@RequestMapping("/yearReport")
	protected ModelAndView getYearReportPage(@RequestParam("year") int year) {
		ModelAndView model = new ModelAndView("adminReport/yearReport");
		
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
}


