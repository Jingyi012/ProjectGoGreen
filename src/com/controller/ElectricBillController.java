package com.controller;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/bills")
public class ElectricBillController {
	@RequestMapping("")
	public ModelAndView billSelectionPage() {
		ModelAndView model=new ModelAndView("bills");
		return model;
	}
	
	
	@RequestMapping("/electricBill")
	protected ModelAndView electricBillPage(){
		ModelAndView model = new ModelAndView("electricBill");
		return model;
	}
	
	@RequestMapping("/electricBill/{year}/{month}")
	protected ModelAndView electricMonthFormPage(@PathVariable("year") String year, @PathVariable("month") String month){
		
		ModelAndView model = new ModelAndView("electricMonthForm");
		model.addObject("year", year);
		model.addObject("month", month);
		return model;
	}
	
	@RequestMapping("/updateElectricCalendar")
	protected ModelAndView updateElectricCalendar(HttpServletRequest request){
		String year = request.getParameter("year");

		int selectedYear = 2023;
		if(year != null){
			selectedYear = Integer.parseInt(year);
		} else {
			selectedYear = 2023;
		}
		ModelAndView model = new ModelAndView("electricCalendar");
       	Calendar cal = Calendar.getInstance();
       	
		int currentYear = cal.get(Calendar.YEAR);
		int currentMonth = cal.get(Calendar.MONTH) + 1;

		model.addObject("selectedYear", selectedYear);
		model.addObject("currentYear", currentYear);
		model.addObject("currentMonth", currentMonth);
		
		return model;
	}
	
	@RequestMapping("/electricMonthReport/{year}/{month}")
	protected ModelAndView electricMonthReportPage(@PathVariable("year") String year, @PathVariable("month") String month){
		ModelAndView model = new ModelAndView("electricMonthReport");
		model.addObject("year", year);
		model.addObject("month", month);
		return model;
	}
}
