package com.controller;

import java.util.Calendar;
import java.util.*;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model.ElectricBill;
import com.mysql.cj.Session;

import dbUtil.ElectricBillDAO;


@Controller
@RequestMapping("/bills")
public class ElectricBillController {
	@RequestMapping("")
	public ModelAndView billSelectionPage(HttpSession session) {
		ModelAndView model=new ModelAndView("bills");
		System.out.print(session.getAttribute("user_id"));
		return model;
	}
	
	
	@RequestMapping("/electricBill")
	protected ModelAndView electricBillPage(){
		ModelAndView model = new ModelAndView("electricBill");
		return model;
	}
	
	@RequestMapping("/electricBill/{year}/{month}")
	protected String electricMonthFormPage(@PathVariable("year") String year, @PathVariable("month") String month, Model model){
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		return "electricMonthForm";
	}
	
	@RequestMapping("/editElectricBill/{year}/{month}")
	protected String editElectricMonthFormPage(@PathVariable("year") String year, @PathVariable("month") String month, HttpSession session, Model model){
		int imonth = monthStringConvertToInt(month);
		int iyear = Integer.parseInt(year);
		ElectricBillDAO ebilldao = new ElectricBillDAO();
		ElectricBill ebill = ebilldao.getElectricDataByMonthYear((int)session.getAttribute("user_id"), imonth, iyear);
		
		if(ebill.getStatus().equals("pending") || ebill.getStatus().equals("reject")) {
			model.addAttribute("month", month);
			model.addAttribute("year", year);
			model.addAttribute("electricbill", ebill);
			
			return "editElectricMonthForm";
		} else {
			return "redirect:/bills/electricBill";
		}

	}
	
	@RequestMapping("/updateElectricCalendar")
	protected ModelAndView updateElectricCalendar(HttpServletRequest request, HttpSession session){
		String year = request.getParameter("year");

		int selectedYear = 2023;
		if(year != null){
			selectedYear = Integer.parseInt(year);
		} else {
			selectedYear = 2023;
		}
		
		ElectricBillDAO ebilldao = new ElectricBillDAO();
		List<ElectricBill> eList = ebilldao.getUserMonthBillByYear(selectedYear, (int)session.getAttribute("user_id"));
		Map<String, String> electricBillMap = new HashMap<>();
		for (ElectricBill bill : eList) {
		    electricBillMap.put("month-" + bill.getMonth(), bill.getStatus());
		}

		
		ModelAndView model = new ModelAndView("electricCalendar");
       	Calendar cal = Calendar.getInstance();
       	
		int currentYear = cal.get(Calendar.YEAR);
		int currentMonth = cal.get(Calendar.MONTH) + 1;

		model.addObject("selectedYear", selectedYear);
		model.addObject("currentYear", currentYear);
		model.addObject("currentMonth", currentMonth);
		model.addObject("electricBillList", eList);
		model.addObject("electricBillStatusMap", electricBillMap);
		return model;
	}
	
	@RequestMapping("/electricMonthForm/submit")
	protected String electricMonthFormSubmit(HttpServletRequest request){
		int year = Integer.parseInt(request.getParameter("year"));
		String month = request.getParameter("month");
		double eBill = Double.parseDouble(request.getParameter("eBill"));
		byte[] eFile = request.getParameter("eFile").getBytes();
		int imonth = monthStringConvertToInt(month);
		HttpSession session = request.getSession(false);
		
		ElectricBill bill = new ElectricBill();
		bill.setElectric_consumption(eBill);
		bill.setElectricBill_proof(eFile);
		bill.setYear(year);
		bill.setMonth(imonth);
		bill.setCarbon_footprint(eBill*0.584);
		bill.setStatus("pending");
		bill.setUser_id((int)session.getAttribute("user_id"));
		
		ElectricBillDAO ebilldao = new ElectricBillDAO();
		int row = ebilldao.add(bill);
		
		return "redirect:/bills/electricMonthReport/"+year+"/"+month;
		
	}
	
	@RequestMapping("/editElectricMonthForm/submit")
	protected String editElectricMonthFormSubmit(HttpServletRequest request, HttpSession session){
		int year = Integer.parseInt(request.getParameter("year"));
		String month = request.getParameter("month");
		double eBill = Double.parseDouble(request.getParameter("eBill"));
		byte[] eFile = request.getParameter("eFile").getBytes();
		int imonth = monthStringConvertToInt(month);
		
		ElectricBillDAO ebilldao = new ElectricBillDAO();
		ElectricBill bill = ebilldao.getElectricDataByMonthYear((int)session.getAttribute("user_id"), imonth, year);
		bill.setElectric_consumption(eBill);
		bill.setElectricBill_proof(eFile);
		bill.setCarbon_footprint(eBill*0.584);
		bill.setStatus("pending");
		
		int row = ebilldao.updateElectricBill(bill);
		
		return "redirect:/bills/electricMonthReport/"+year+"/"+month;
		
	}
	
	@RequestMapping("/electricMonthReport/{year}/{month}")
	protected ModelAndView electricMonthReportPage(@PathVariable("year") String year, @PathVariable("month") String month) {
		ModelAndView model = new ModelAndView("electricMonthReport");
		model.addObject("year", year);
		model.addObject("month", month);
		return model;
	}
	
	public int monthStringConvertToInt(String smonth) {
		int imonth = 0;
		switch (smonth) {
			case "January":
				imonth = 1;
				break;
			case "February": 
				imonth = 2;
				break;
			case "March": 
				imonth = 3;
				break;
			case "April": 
				imonth = 4;
				break;
			case "May": 
				imonth = 5;
				break;
			case "June": 
				imonth = 6;
				break;
			case "July": 
				imonth = 7;
				break;
			case "August": 
				imonth = 8;
				break;
			case "September": 
				imonth = 9;
				break;
			case "October": 
				imonth = 10;
				break;
			case "November": 
				imonth = 11;
				break;
			case "December": 
				imonth = 12;
				break;
		}
			
		return imonth;	
	}
	
}
