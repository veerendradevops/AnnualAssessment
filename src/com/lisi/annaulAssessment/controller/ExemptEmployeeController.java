package com.lisi.annaulAssessment.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lisi.annaualAssessment.orm.CensusForm;
import com.lisi.annaulAssessment.service.EmployeeService;
import com.lisi.annaulAssessment.service.TMPersonalInformationService;

@Controller
public class ExemptEmployeeController {

	private static final Logger log = Logger.getLogger(ExemptEmployeeController.class);

	
	@Autowired
	private EmployeeService empServie;
	
	@Autowired
	private TMPersonalInformationService tmservice;

	private static String clockNumber;

	private static String annaylYear;

	@RequestMapping(value = "/teamMemberPersonalInfo", method = RequestMethod.GET)
	public String teamMemberPersonalInfo(@RequestParam("clockNum") String empClockNumber,
			@RequestParam("year") String year, Model model) {

		log.info("teamMemberPersonalInfo");
		log.info(empClockNumber);
		ExemptEmployeeController.setClockNumber(empClockNumber);
		ExemptEmployeeController.setAnnaylYear(year);

		List<CensusForm> employeeDetails = tmservice.getEmployeeDetails(empClockNumber);

		for(CensusForm c : employeeDetails){
			
			log.info("if");
		}
		
		model.addAttribute("employeeDetails", employeeDetails);

		// return "exemptEmployee";

		return "exemptEmployee";
	}

	@RequestMapping(value = "/exemptEmployee", method = RequestMethod.GET)
	public String exemptEmployee(@RequestParam("clockNum") String loginEmpClock,Model model) {

		log.info("exemptEmp");
		log.info(loginEmpClock);

		List<CensusForm> census = empServie.getExemptEmployees(Integer.parseInt(loginEmpClock.trim()));

		model.addAttribute("empDetails", census);

		return "managerScreen";
	}

	public static String getClockNumber() {
		return clockNumber;
	}

	public static void setClockNumber(String clockNumber) {
		ExemptEmployeeController.clockNumber = clockNumber;
	}

	public static String getAnnaylYear() {
		return annaylYear;
	}

	public static void setAnnaylYear(String annaylYear) {
		ExemptEmployeeController.annaylYear = annaylYear;
	}
	
	// employee and supervisor forms
	
	@RequestMapping(value = "/employeeForm", method = RequestMethod.GET)
	public String employeeForm( Model model,HttpSession session) {

		log.info("employeeForm");
		
		
		List<CensusForm> employeeDetails = tmservice.getEmployeeDetails(LoginController.getLoginClockNumber().trim());

		for(CensusForm c : employeeDetails){
			
			log.info("if");
		}
		
		model.addAttribute("employeeDetails", employeeDetails);

	//	session.setAttribute("onlyEmployee", "forEmployee");
		
		// return "exemptEmployee";

		return "exemptEmployee";
	//	return "oneexemptEmployee";
	}

}
