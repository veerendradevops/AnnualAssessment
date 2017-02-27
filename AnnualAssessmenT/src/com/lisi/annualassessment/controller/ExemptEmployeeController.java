package com.lisi.annualassessment.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.pojo.LoginUser;
import com.lisi.annualassessment.service.EmployeeService;
import com.lisi.annualassessment.service.TMPersonalInformationService;
import com.lisi.annualassessment.util.Converters;

@Controller
public class ExemptEmployeeController {

	private static final Logger log = Logger.getLogger(ExemptEmployeeController.class);

	@Autowired
	private EmployeeService empServie;
	
	@Autowired
	private LoginUser loginUser;
	
	@Autowired
	private LoginUser luser;

	@Autowired
	private TMPersonalInformationService tmservice;
	
	@InitBinder
	public void initBinder(HttpServletRequest request, HttpServletResponse response) {
		log.info("Start . initBinder......................");
		
	
		log.info("End .");
	}

	@RequestMapping(value = "/teamMemberPersonalInfo", method = RequestMethod.GET)
	public String teamMemberPersonalInfo(@RequestParam("clockNum") String empClockNumber,
			@RequestParam("year") String year, @RequestParam("status") String empStatus, Model model,
			HttpSession session) {

		
		try {

			session.setAttribute("exemptEmp", empClockNumber);
			
			loginUser.setExemptEmployeeClock(empClockNumber.trim());
			
			
			session.setAttribute("year", year.trim());
			
			loginUser.setExemptEmployeeYear(year.trim());
			

			session.setAttribute("supervisorstatus", empStatus);
			
			loginUser.setExemptEmployeeFormStatus(empStatus);

			session.setAttribute("supervisor", "supervisor");
		
			
			List<CensusForm> employeeDetails = tmservice.getEmployeeDetails(empClockNumber, year.trim());

			String salaryrole = "";
			for(CensusForm census : employeeDetails){
				
				salaryrole = String.valueOf(census.getRole());
			}
			
			session.setAttribute("onlyEmployee", "EmployeeSupervisor");
			
		//	loginUser.setRoles("EmployeeSupervisor");
			
			session.setAttribute("salaryReview", String.valueOf(salaryrole));
			model.addAttribute("employeeDetails", employeeDetails);
			
			model.addAttribute("loginUser", loginUser);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	

		return "exemptEmployee";
	}
	
	@RequestMapping(value = "/hrEmployeeExempt", method = RequestMethod.GET)
	public String hrEmployeeExempt(@RequestParam("clockNum") String empClockNumber,
			@RequestParam("year") String year, @RequestParam("status") String empStatus, Model model,
			HttpSession session) {

		log.info("teamMemberPersonalInfo");
		log.info(empClockNumber);
		try {

			session.setAttribute("exemptEmp", empClockNumber);
			loginUser.setExemptEmployeeClock(empClockNumber.trim());
			
			
			session.setAttribute("year", year.trim());
			loginUser.setExemptEmployeeYear(year.trim());
		
			// session.setAttribute("loginEmployeeStatus", empStatus);

			session.setAttribute("supervisorstatus", empStatus);

			loginUser.setExemptEmployeeFormStatus(empStatus);
			
			session.setAttribute("supervisor", "supervisor");
			

			List<CensusForm> employeeDetails = tmservice.getEmployeeDetails(empClockNumber, year.trim());

			// this session will disable to manager links..
			session.setAttribute("onlyEmployee", "SupervisorEmployee");
			loginUser.setRoles("SupervisorEmployee");
	//		loginUser.setRoles("HRAdmin");
			model.addAttribute("loginUser", loginUser);
			model.addAttribute("employeeDetails", employeeDetails);
		} catch (Exception e) {
			e.printStackTrace();
		}

	

		return "exemptEmployee";
	}

	// supervisor form...

	@RequestMapping(value = "/exemptEmployee", method = RequestMethod.GET)
	public String exemptEmployee(@RequestParam("clockNum") String loginEmpClock, Model model) {

		log.info("exemptEmp");
		log.info(loginEmpClock);

		List<CensusForm> census = empServie.getExemptEmployees(Integer.parseInt(loginEmpClock.trim()), "exempt",
				Converters.getCurrentYear());

		double yellowHourlyRate = 0;
		double yellowAnnaulRate = 0;
		int numberOfEmployees = 0;

		for (CensusForm c : census) {

			log.info("EmpClockNumber :: " + c.getEmpClockNumber());
			log.info("FirstName :::" + c.getEmpfirstName());

			if (c.getCurrentHrlyRate().isEmpty()) {

			} else {
				yellowHourlyRate += Double.parseDouble(c.getCurrentHrlyRate().trim());
			}

			if (c.getAnnaulRate().isEmpty()) {

			} else {
				yellowAnnaulRate += Double.parseDouble(c.getAnnaulRate().trim());
			}
			numberOfEmployees++;
			System.out.println("yes");
		}

		model.addAttribute("yellowHourlyRate", yellowHourlyRate);
		model.addAttribute("yellowAnnaulRate", yellowAnnaulRate);
		model.addAttribute("numberofemployees", numberOfEmployees);
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("employeeDetails", census);

		return "managerScreen";
	}

	// method call happens when an employee is assocated with employee and
	// supervisor.

	@RequestMapping(value = "/employeeForm", method = RequestMethod.GET)
	public String employeeForm(Model model, HttpSession session) {

		log.info("directly accessing the TeamMember Form.. from the supervisor screen.");
		// log.info(LoginController.getLoginClockNumber());
		StringBuffer roleBased = new StringBuffer("");
		if (session.getAttribute("loginClockNumber") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}
		String loginClockNumber = (String) session.getAttribute("loginClockNumber");
		String employeeYear = (String)session.getAttribute("loginYear");
		
		log.info(loginClockNumber);
		try {
			List<CensusForm> employeeDetails = tmservice.getEmployeeDetails(loginClockNumber.trim(),
					employeeYear.trim());

			if (employeeDetails.size() == 1) {

				for (CensusForm c : employeeDetails) {

				}

			} else if (employeeDetails.size() > 1) {

				throw new Exception("multiple records are found");
			}
			session.setAttribute("onlyEmployee", "Employee");

		//	loginUser.setRoles("Employee");
			model.addAttribute("loginUser", loginUser);
			
			model.addAttribute("employeeDetails", employeeDetails);
		}

		catch (Exception e) {
			e.printStackTrace();

			if (e.getMessage().contains("multiple records are found")) {
				model.addAttribute("wrongUser", "<h6 style=color:red>multiple user's found with this username</h6>");
				return "managerScreen";
			}
		}


		return "exemptEmployee";
		// return "oneexemptEmployee";
	}

}
