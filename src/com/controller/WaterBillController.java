package com.controller;

import com.model.WaterBill;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.model.User;

import dbUtil.UserDao;
import dbUtil.WaterBillDAO;

@Controller
@RequestMapping("/bills")

public class WaterBillController {

	@RequestMapping("/waterBill")
	protected ModelAndView waterBillPage() {
		ModelAndView model = new ModelAndView("waterBill/waterBill");
		return model;
	}

	@RequestMapping("/waterBill/{year}/{month}")
	protected String waterMonthForm(@PathVariable("year") String year, @PathVariable("month") String month,
			Model model) {
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		return "waterBill/waterMonthForm";

	}

	@RequestMapping("/updateWaterCalendar")
	protected ModelAndView updateWaterCalendar(HttpServletRequest request, HttpSession session) {
		String year = request.getParameter("year");

		int selectedYear = 2023;
		if (year != null) {
			selectedYear = Integer.parseInt(year);
		} else {
			selectedYear = 2023;
		}

		boolean databaseError = false;
		WaterBillDAO wbilldao = new WaterBillDAO();
		List<WaterBill> wList = wbilldao.getUserMonthBillByYear(selectedYear, (int) session.getAttribute("user_id"));
		Map<String, String> waterBillMap = new HashMap<>();
		if (wList != null) {
			for (WaterBill bill : wList) {
				waterBillMap.put("month-" + bill.getMonth(), bill.getStatus());
			}

		} else {
			databaseError = true;
		}

		ModelAndView model = new ModelAndView("waterBill/waterCalendar");
		Calendar cal = Calendar.getInstance();
		int currentYear = cal.get(Calendar.YEAR);
		int currentMonth = cal.get(Calendar.MONTH) + 1;
		String[] monthArray = { "January", "February", "March", "April", "May", "June", "July", "August", "September",
				"October", "November", "December" };
		model.addObject("selectedYear", selectedYear);
		model.addObject("currentYear", currentYear);
		model.addObject("currentMonth", currentMonth);
		model.addObject("waterBillList", wList);
		model.addObject("waterBillStatusMap", waterBillMap);
		model.addObject("monthArray", monthArray);
		model.addObject("databaseError", databaseError);
		return model;
	}

	@RequestMapping("/editWaterBill/{year}/{month}")
	protected ModelAndView editWaterMonthForm(@PathVariable("year") String year, @PathVariable("month") String month,
			HttpSession session) {
		int imonth = monthStringConvertToInt(month);
		int iyear = Integer.parseInt(year);
		WaterBillDAO wbilldao = new WaterBillDAO();
		WaterBill wbill = wbilldao.getWaterDataByMonthYear((int) session.getAttribute("user_id"), imonth, iyear);

		if (wbill.getStatus().equals("pending") || wbill.getStatus().equals("reject")) {
			ModelAndView mv = new ModelAndView("waterBill/editWaterMonthForm");
			mv.addObject("month", month);
			mv.addObject("year", year);
			mv.addObject("waterbill", wbill);

			return mv;
		} else {
			ModelAndView mv = new ModelAndView("redirect:/bills/waterBill");
			return mv;
		}
	}

	@RequestMapping("/waterMonthForm/submit")
	protected String waterMonthFormSubmit(@RequestParam(name = "wBill", defaultValue = "0.0") double wBill,
			@RequestParam("wFile") MultipartFile wFile, @RequestParam("year") int year,
			@RequestParam("month") String month, HttpSession session, RedirectAttributes redirectAttributes) {

		try {
			int imonth = monthStringConvertToInt(month);

			WaterBill bill = new WaterBill();
			bill.setWater_consumption(wBill);

			if (!wFile.isEmpty()) {
				byte[] fileBytes = wFile.getBytes();
				bill.setWater_proof(fileBytes);
			}

			bill.setYear(year);
			bill.setMonth(imonth);
			bill.setCarbon_footprint(wBill * 0.419);
			bill.setStatus("pending");
			bill.setUser_id((int) session.getAttribute("user_id"));

			WaterBillDAO wbilldao = new WaterBillDAO();
			int row = wbilldao.add(bill);

			redirectAttributes.addFlashAttribute("successMessage", "Water bill " + month + " updated successfully.");
			return "redirect:/bills/waterBill";
		} catch (Exception e) {
			System.out.println(e);
			redirectAttributes.addFlashAttribute("errorMessage", "Water bill "+ month +" updated failed.");
			return "redirect:/bills/waterBill";
		}
	}

	@RequestMapping("/editWaterMonthForm/submit")
	protected String editWaterMonthFormSubmit(@RequestParam(name = "wBill", defaultValue = "0.0") double wBill,
			@RequestParam("wFile") MultipartFile wFile, @RequestParam("year") int year,
			@RequestParam("month") String month, HttpSession session, RedirectAttributes redirectAttributes) {
		try {
			int imonth = monthStringConvertToInt(month);

			WaterBillDAO wbilldao = new WaterBillDAO();
			WaterBill bill = wbilldao.getWaterDataByMonthYear((int) session.getAttribute("user_id"), imonth, year);
			bill.setWater_consumption(wBill);

			if (!wFile.isEmpty()) {
				byte[] fileBytes = wFile.getBytes();
				bill.setWater_proof(fileBytes);
			}

			bill.setCarbon_footprint(wBill * 0.419);
			bill.setStatus("pending");

			int row = wbilldao.updateWaterBill(bill);
			redirectAttributes.addFlashAttribute("successMessage", "Water Bill" + month + "updated successfully.");
			return "redirect:/bills/waterBill";

		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("errorMessage", "Water bill "+ month +" updated failed.");
			return "redirect:/bills/waterBill";
		}
	}

	@RequestMapping("/waterMonthReport/{year}/{month}")
	protected String waterMonthReportPage(@PathVariable("year") String year, @PathVariable("month") String month,
			Model model, HttpSession session) {
		int imonth = monthStringConvertToInt(month);
		int iyear = Integer.parseInt(year);
		int user_id = (int) session.getAttribute("user_id");

		WaterBillDAO wbilldao = new WaterBillDAO();
		WaterBill wbill = wbilldao.getWaterDataByMonthYear(user_id, imonth, iyear);

		UserDao udao = new UserDao();
		User u = udao.getUserById(user_id);

		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("waterBill", wbill);
		model.addAttribute("user", u);
		return "waterBill/waterMonthReport";

	}

	private int monthStringConvertToInt(String smonth) {
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