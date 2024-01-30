package com.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.model.RecycleBill;
import com.model.User;

import dbUtil.RecycleBillDAO;
import dbUtil.UserDao;

@Controller
@RequestMapping("/bills")
public class RecycleBillController {
	
	@RequestMapping("/recycleBill")
	protected ModelAndView recycleBillPage() {
		ModelAndView model = new ModelAndView("recycleBill/recycleBill");
		return model;
	}
	
	@RequestMapping("/updateRecycleCalendar")
	protected ModelAndView updateRecycleCalendar(HttpServletRequest request, HttpSession session) {
		String year = request.getParameter("year");

		int selectedYear = 2023;
		if (year != null) {
			selectedYear = Integer.parseInt(year);
		} else {
			selectedYear = 2023;
		}
		boolean dbError=false;
		RecycleBillDAO rbilldao = new RecycleBillDAO();
		List<RecycleBill> rList = rbilldao.getUserMonthBillByYear(selectedYear, (int) session.getAttribute("user_id"));
		Map<String, String> recycleBillMap = new HashMap<>();
		if(rList!=null) {
			for (RecycleBill bill : rList) {
				recycleBillMap.put("month-" + bill.getMonth(), bill.getStatus());
			}
		}else {
			dbError=true;
		}
		
		ModelAndView model = new ModelAndView("recycleBill/recycleCalendar");
		Calendar cal = Calendar.getInstance();

		int currentYear = cal.get(Calendar.YEAR);
		int currentMonth = cal.get(Calendar.MONTH) + 1;
		String[] monthArray = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
		model.addObject("selectedYear", selectedYear);
		model.addObject("currentYear", currentYear);
		model.addObject("currentMonth", currentMonth);
		model.addObject("recycleBillList", rList);
		model.addObject("recycleBillStatusMap", recycleBillMap);
		model.addObject("monthArray", monthArray);
		model.addObject("dbError",dbError);
		return model;
	}
	
	@RequestMapping("/recycleBill/{year}/{month}")
	protected String recycleMonthFormPage(@PathVariable("year") String year, @PathVariable("month") String month,
			Model model) {
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		return "recycleBill/recycleMonthForm";
	}
	
	@RequestMapping("/recycleMonthForm/submit")
	protected ModelAndView submitRecycleForm(@RequestParam("rFile") MultipartFile rFile, 
			@RequestParam("smonth") String smonth, RecycleBill recycleBill, HttpSession session, RedirectAttributes redirectAttributes) {
		
		try {
			if (!rFile.isEmpty()) {
				byte[] fileBytes = rFile.getBytes();
	            recycleBill.setRecycleBill_proof(fileBytes);
			}
			
			int year = recycleBill.getYear();
			int imonth = monthStringConvertToInt(smonth);
			
			recycleBill.setMonth(imonth);
			recycleBill.setCarbon_footprint(recycleBill.getRecycle_weight() * 2.860);
			recycleBill.setStatus("pending");
			recycleBill.setUser_id((int) session.getAttribute("user_id"));
			
			RecycleBillDAO recycleBillDAO = new RecycleBillDAO();
			int rowsAffected = recycleBillDAO.add(recycleBill);
					
			ModelAndView modelAndView = new ModelAndView("redirect:/bills/recycleBill");
			redirectAttributes.addFlashAttribute("successMessage", "Recycle bill " + smonth + " updated successfully.");
		
			return modelAndView;
			
		} catch (Exception e) {
			System.out.println(e);
			redirectAttributes.addFlashAttribute("errorMessage", "Recycle bill "+ smonth +" updated failed.");
			ModelAndView modelAndView = new ModelAndView("redirect:/bills/recycleBill");
			
			return modelAndView;
		}
		
	}
	
	@RequestMapping("/recycleMonthReport/{year}/{month}")
	protected ModelAndView recycleFormReport(@PathVariable("year") String year,
			@PathVariable("month") String month, HttpSession session) {
		
		RecycleBillDAO recycleBillDAO = new RecycleBillDAO();
		int userId = (int) session.getAttribute("user_id");
		int imonth = monthStringConvertToInt(month);
		int iyear = Integer.parseInt(year);
		
		RecycleBill recycleBill = recycleBillDAO.getRecycleDataByMonthYear(userId, imonth, iyear);
		
		UserDao userDAO = new UserDao();
		User user = userDAO.getUserById(userId);
		
		ModelAndView modelAndView = new ModelAndView("recycleBill/recycleMonthReport");
		modelAndView.addObject("recycleBill", recycleBill);
		modelAndView.addObject("month", month);
		modelAndView.addObject("year", year);
		modelAndView.addObject("user", user);
		
		return modelAndView;		
	}
	
	@RequestMapping("/editRecycleBill/{year}/{month}")
	protected ModelAndView editRecycleMonthFormPage(@PathVariable("year") String year, @PathVariable("month") String smonth, 
			HttpSession session) {
		
		int imonth = monthStringConvertToInt(smonth);
		int iyear = Integer.parseInt(year);
		int userId = (int) session.getAttribute("user_id");
		
		RecycleBillDAO recycleBillDAO = new RecycleBillDAO();			
		RecycleBill recycleBill = recycleBillDAO.getRecycleDataByMonthYear(userId, imonth, iyear);
		
		if (recycleBill.getStatus().equals("pending") || recycleBill.getStatus().equals("reject")) {
			ModelAndView modelAndView = new ModelAndView("recycleBill/editRecycleMonthForm");
			modelAndView.addObject("month", smonth);
			modelAndView.addObject("year", year);
			modelAndView.addObject("recycleBill", recycleBill);
			
			return modelAndView;

		} else {
			ModelAndView modelAndView = new ModelAndView("redirect:/bills/electricBill");
			return modelAndView;
		}
	}
	
	@RequestMapping("/editRecycleMonthForm/submit")
	protected ModelAndView submitEditRecycleForm(@RequestParam("recycle_weight") double recycle_weight, @RequestParam("rFile") MultipartFile rFile, 
			@RequestParam("smonth") String smonth, @RequestParam("year") int year, HttpSession session, RedirectAttributes redirectAttributes) {
		
		try {
			RecycleBillDAO recycleBillDAO = new RecycleBillDAO();			
			
			int imonth = monthStringConvertToInt(smonth);			
			int userId = (int) session.getAttribute("user_id");
			
			RecycleBill recycleBill = recycleBillDAO.getRecycleDataByMonthYear(userId, imonth, year);
					
			if (!rFile.isEmpty()) {
				byte[] fileBytes = rFile.getBytes();
	            recycleBill.setRecycleBill_proof(fileBytes);
			}
			
			recycleBill.setRecycle_weight(recycle_weight);	
			recycleBill.setCarbon_footprint(recycle_weight * 2.860);
			recycleBill.setStatus("pending");
				
			int rowsAffected = recycleBillDAO.editRecycleBill(recycleBill);
			
			ModelAndView modelAndView = new ModelAndView("redirect:/bills/recycleBill");
			redirectAttributes.addFlashAttribute("successMessage", "Recycle bill " + smonth + " updated successfully.");
			
			return modelAndView;
			
		} catch (Exception e) {
			System.out.println(e);
			redirectAttributes.addFlashAttribute("errorMessage", "Recycle bill "+ smonth +" updated failed.");
			ModelAndView modelAndView = new ModelAndView("redirect:/bills/recycleBill");
			return modelAndView;
		}
		
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
