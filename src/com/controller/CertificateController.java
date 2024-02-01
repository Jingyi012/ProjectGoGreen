package com.controller;

import com.model.Certificate;
import com.model.RecycleBill;
import com.model.User;
import com.model.WaterBill;

import dbUtil.CertificateDAO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/certificate")
@SessionAttributes("user")
public class CertificateController {
	
	
	@RequestMapping("/certificate")
	protected ModelAndView certPage() {
		ModelAndView model = new ModelAndView("certificate");
		return model;
	}

	@RequestMapping("/updatecertificate")
	protected ModelAndView getCertificatePage(HttpServletRequest request, HttpSession session) {
	    String year = request.getParameter("year");

	    int selectedYear = 2023;
	    if (year != null) {
	        selectedYear = Integer.parseInt(year);
	    } else {
	        selectedYear = 2023;
	    }

	    boolean databaseError = false;
	    ModelAndView model = new ModelAndView("updatecertificate"); // Assuming "updatecertificate" is your JSP file name
	    CertificateDAO certDAO = new CertificateDAO();
	    List<Certificate> certificateList = certDAO.getUserCertByYear((int) session.getAttribute("user_id"), selectedYear);

	    boolean certificateEligible = checkCertificateEligibility(certificateList);

//	 
//	    // Assuming "u" is your user object retrieved from the session
//	    User u = (User) session.getAttribute("user");
//
//	    // Add the user object to the model
//	    model.addObject("user", u);
	    model.addObject("selectedYear", selectedYear);
	    model.addObject("certificates", certificateList);
	    model.addObject("certificateEligible", certificateEligible);

	    return model;
	}

    /*public ModelAndView getCertificatePage(@RequestParam(value = "selectedYear", required = false) Integer selectedYear, HttpSession session) {
        ModelAndView model = new ModelAndView("certificate");

        // Retrieve user from the session
       // User user = (User) model.getModel().get("user");
        User user=(User) session.getAttribute("user");

        if (user != null) {
            int userId = user.getId();


            // Initialize CertificateDAO
            CertificateDAO certDAO = new CertificateDAO();
            List<Certificate> certificateList = certDAO.getUserCertByYear(userId, selectedYear);
            boolean certificateEligible = checkCertificateEligibility(certificateList);
*/
           /* if (selectedYear != null) {
                certificateList = certDAO.getUserCertByYear(userId, selectedYear);
                certificateEligible = checkCertificateEligibility(userId, selectedYear);
            } else {
                // If no year is selected, get certificates for the current year
                certificateList = certDAO.getUserCertByYear(userId, null); // Pass null for the year
            }
            */
    
            
/*
            // Add the certificates and eligibility status to the model
            model.addObject("certificates", certificateList);
            model.addObject("certificateEligible", certificateEligible);
        }

        return model;
    }
*/
    private boolean checkCertificateEligibility(List<Certificate> certificates) {
    	
//        CertificateDAO certDAO = new CertificateDAO();
//
//        // Fetch certificates for the selected year and user
//        List<Certificate> certificates = certDAO.getUserCertByYear(userId, selectedYear);
//
//        // Check if the user has certificates for at least 6 months in the selected year
        return certificates != null && certificates.size() >= 6;
    }
}
