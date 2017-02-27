package com.lisi.annualassessment.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.jfree.util.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.pojo.LoginUser;
import com.lisi.annualassessment.service.EmployeeService;
import com.lisi.annualassessment.service.HRManagerService;
import com.lisi.annualassessment.util.Converters;

@Controller
public class LogoutController {
	
	private static final Logger log = Logger.getLogger(LogoutController.class);

	@Autowired
	private EmployeeService empService;
	
	@Autowired
	private LoginUser loginUser;

	@Autowired
	private HRManagerService hRManagerService;

	@Autowired
	private HRManagerController hrdashboard;
	
	@Autowired
	private HRManagerEmployees hrManagerEmployees;

	@RequestMapping(value = "/logout")
	public String logoutController(Model model, HttpSession session) {

		session.invalidate();

		return "loginScreen";
	}

	@RequestMapping(value = "/back")
	public String backController(Model model, HttpSession session) {

		List<CensusForm> census = Collections.EMPTY_LIST;

		// session.setAttribute("exemptEmp", empClockNumber);

		session.removeAttribute("exemptEmp");
		session.removeAttribute("nonExemptYear");

		System.out.println("back");

		if (session.getAttribute("loginClockNumber") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		String clockNumber = (String) session.getAttribute("loginClockNumber");
		String employeeYear = (String)session.getAttribute("loginYear");

		System.out.println(String.valueOf(clockNumber));

		census = empService.getExemptEmployees(Integer.parseInt(clockNumber.trim()), "exempt",
				employeeYear.trim());

		StringBuffer employeeHirerachy = (StringBuffer) session.getAttribute("employeeRoles");

		String employeeRole = employeeHirerachy.toString();

		if (employeeRole.contains("HRGeneralist")) {
			
			log.info("Generalist roles");

			String hrGeneralistClock = (String) session.getAttribute("loginClockNumber");

			model.addAttribute("hrGeneralist", hrGeneralistClock);

		}

		if (employeeRole.contains("HrManager")) {
			
			log.info("HrManager roles");

			String hrManager = (String) session.getAttribute("loginClockNumber");
			List<CensusForm> hrEmployeeList = hRManagerService.getHrManagerEmployees(Integer.parseInt(clockNumber),
					employeeYear.trim());

			// model.addAttribute("hrEmployeeList", hrEmployeeList);
			model.addAttribute("empDetails", hrEmployeeList);

			model.addAttribute("hrManager", hrManager);
		}

		if (employeeRole.contains("HRAdmin")) {
			
			log.info("HrAdmin roles");

			String hrAdmin = (String) session.getAttribute("loginClockNumber");

			List<CensusForm> hrGeneralist = hRManagerService.getHRGeneralist(Integer.parseInt(clockNumber),
					employeeYear.trim());

			model.addAttribute("empDetails", hrGeneralist);

			model.addAttribute("hrAdmin", hrAdmin);
		}

		model.addAttribute("employeeDetails", census);
		model.addAttribute("loginUser", loginUser);
		return "managerScreen";

	}

	@RequestMapping(value = "/supervisorDashboard")
	public String supervisorDashboard(Model model, HttpSession session) {

		List<CensusForm> census = Collections.EMPTY_LIST;


		System.out.println("back");

		if (session.getAttribute("loginClockNumber") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		String clockNumber = (String) session.getAttribute("loginClockNumber");

		String year = (String)session.getAttribute("loginYear");
		
		System.out.println(String.valueOf(clockNumber));

		census = empService.getExemptEmployees(Integer.parseInt(clockNumber.trim()), "exempt",
				year.trim());

		StringBuffer employeeHirerachy = (StringBuffer) session.getAttribute("employeeRoles");

		String employeeRole = employeeHirerachy.toString();

		if (employeeRole.contains("HRGeneralist")) {

			String hrGeneralistClock = (String) session.getAttribute("loginClockNumber");

			model.addAttribute("hrGeneralist", hrGeneralistClock);

		}

		if (employeeRole.contains("HrManager")) {

			String hrManager = (String) session.getAttribute("loginClockNumber");

			model.addAttribute("hrManager", hrManager);
		}

		if (employeeRole.contains("HRAdmin")) {

			String hrAdmin = (String) session.getAttribute("loginClockNumber");

			model.addAttribute("hrAdmin", hrAdmin);
		}
		
		/*if(employeeRole.contains("Supervisor")){
			
			
			model.addAttribute("supervisorrole", "supervisor");
		}*/

		model.addAttribute("hrGeneralistclock", "");
		model.addAttribute("hrManagerclock", "");
		
		// to show the supervisor clock numbers..
		model.addAttribute("hrAdmin", "");
		//session.setAttribute("employeeRoles", roleBased);
		

		model.addAttribute("employeeDetails", census);
		model.addAttribute("loginUser", loginUser);
		
		return "managerScreen";

	}

	public void hrDashboard(String clockNumber, HttpSession session, Model model) {

		System.out.println("----------------------------------------------------------");
		
		StringBuffer employeeHirerachy = (StringBuffer) session.getAttribute("employeeRoles");

		String employeeRole = employeeHirerachy.toString();

		if (employeeRole.contains("HRGeneralist")) {

			String hrGeneralistClock = (String) session.getAttribute("loginClockNumber");
			hrdashboard.hrGeneralistEmployees(String.valueOf(clockNumber), model);

			model.addAttribute("hrGeneralist", hrGeneralistClock);

		}

		if (employeeRole.contains("HrManager")) {

			String hrManager = (String) session.getAttribute("loginClockNumber");
			hrdashboard.hrManagerEmployees(String.valueOf(clockNumber), model);

			model.addAttribute("hrManager", hrManager);
		}

		if (employeeRole.contains("HRAdmin")) {

			String hrAdmin = (String) session.getAttribute("loginClockNumber");

			hrManagerEmployees.getHREmployeeList(String.valueOf(clockNumber), model, session);
			
			model.addAttribute("hrAdmin", hrAdmin);

		}

	}

}
