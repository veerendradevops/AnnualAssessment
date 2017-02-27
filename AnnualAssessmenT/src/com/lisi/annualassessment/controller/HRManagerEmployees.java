package com.lisi.annualassessment.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.pojo.LoginUser;
import com.lisi.annualassessment.service.EmployeeService;
import com.lisi.annualassessment.service.HRManagerService;
import com.lisi.annualassessment.util.Converters;

@Controller
public class HRManagerEmployees {

	private static final Logger log = Logger.getLogger(HRManagerEmployees.class);

	@Autowired
	private EmployeeService empService;

	@Autowired
	private LoginUser loginUser;

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private HRManagerService hRManagerService;

	@RequestMapping(value = "/getSupervisorDashboard", method = RequestMethod.GET)
	public String getSupervisorDashboard(@RequestParam("clockNum") String clockNumber,
			@RequestParam("year") String year, @RequestParam("status") String status, Model model,
			HttpSession session) {

		List<CensusForm> supervisor = Collections.EMPTY_LIST;
		if (session.getAttribute("employeeRoles") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		String loginemp = (String) session.getAttribute("loginClockNumber");

		String loginYear = (String) session.getAttribute("loginYear");

		String userRole = "";
		String dropdownYear = (String) session.getAttribute("dropDownYear");

		StringBuffer employeeHirerachy = (StringBuffer) session.getAttribute("employeeRoles");

		String employeeRole = employeeHirerachy.toString();

		if (employeeRole.contains("HRGeneralist")) {

			model.addAttribute("hrGeneralist", clockNumber);
			model.addAttribute("hrGeneralistclock", clockNumber);

			userRole = "hrGeneralistClockNumber";
		}

		if (employeeRole.contains("HrManager")) {

			model.addAttribute("hrManager", clockNumber);
			model.addAttribute("hrManagerclock", clockNumber);
			userRole = "hrManagerClockNumber";
		}

		if (employeeRole.contains("HRAdmin")) {

			model.addAttribute("hrAdmin", clockNumber);
			userRole = "hrAdmin";
		}

		supervisor = hRManagerService.getSupervisorEmployees(Integer.parseInt(clockNumber.trim()), dropdownYear, userRole,
				loginemp);

		System.out.println(supervisor.toString());

		List<CensusForm> censusform = empService.getEmployeeRole(loginYear);

		StringBuffer supervisorsClock = new StringBuffer();

		for (CensusForm c : censusform) {

			supervisorsClock.append(String.valueOf(c.getSupervisorClockNumber()));
			supervisorsClock.append(",");
		}

		model.addAttribute("dashboard", "noDashboard");

		model.addAttribute("supervisor", supervisorsClock.toString());
		// model.addAttribute("supervisor", censusform);
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("employeeDetails", supervisor); // employeeDetails

		return "managerScreen";
	}

	@RequestMapping(value = "/hrAdmin")
	public String getHREmployeeList(@RequestParam("clockNumber") String empClockNumber, Model model,
			HttpSession session) {

		System.out.println("Hr Manager Employees");
		if (session.getAttribute("employeeRoles") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}
		System.out.println(empClockNumber);

		StringBuffer employeeHirerachy = (StringBuffer) session.getAttribute("employeeRoles");

		String employeeRole = employeeHirerachy.toString();

		if (employeeRole.contains("HRGeneralist")) {

			model.addAttribute("hrGeneralist", empClockNumber);

		}

		if (employeeRole.contains("HrManager")) {

			model.addAttribute("hrManager", empClockNumber);
		}

		if (employeeRole.contains("HRAdmin")) {

			model.addAttribute("hrAdmin", empClockNumber);
		}

		model.addAttribute("hrDashboard", "Admin");
		hrAdminEmployees(empClockNumber, model);
		model.addAttribute("loginUser", loginUser);
		return "hrDashboard";
	}

	public void hrAdminEmployees(String empClockNumber, Model model) {

		System.out.println("hr admin role");
		HttpSession session = request.getSession(true);
		String loginClock = loginUser.getClockNumber();
		String year = (String) session.getAttribute("loginYear");

		log.info(year);

		List<CensusForm> hrEmployeeList = hRManagerService.getHrAdminEmployees(Integer.parseInt(empClockNumber),
				year.trim());

		List<CensusForm> loginEmpDataForAllYears = hRManagerService.getYearsInDatabase(loginClock);

		model.addAttribute("AllYears", loginEmpDataForAllYears);

		// model.addAttribute("hrEmployeeList", hrEmployeeList);
		model.addAttribute("empDetails", hrEmployeeList);

	}

	@RequestMapping(value = "/hrEmployeesView")
	public String getHREmployeeView(@RequestParam("clockNumber") String empClockNumber, Model model,
			HttpSession session) {
		System.out.println(String.valueOf(session.getAttribute("employeeRoles")));

		if (session.getAttribute("employeeRoles") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		String loginYear = (String) session.getAttribute("loginYear");

		List<CensusForm> hrEmployeeList = Collections.EMPTY_LIST;
		StringBuffer employeeHirerachy = (StringBuffer) session.getAttribute("employeeRoles");
		
		String dropdownYear = (String) session.getAttribute("dropDownYear");

		String employeeRole = employeeHirerachy.toString();

		String role = "";

		if (employeeRole.contains("HRGeneralist")) {

			role = "hrGeneralistClockNumber";
			model.addAttribute("hrGeneralist", empClockNumber);
			hrEmployeeList = hRManagerService.getHrEmployeeViews(Integer.parseInt(empClockNumber), dropdownYear,
					"MANAGER COMPLETED", role);
		}

		if (employeeRole.contains("HrManager")) {

			role = "hrManagerClockNumber";
			model.addAttribute("hrManager", empClockNumber);
			hrEmployeeList = hRManagerService.getHrEmployeeViews(Integer.parseInt(empClockNumber), dropdownYear,
					"MANAGER COMPLETED", role);

		}

		if (employeeRole.contains("HRAdmin")) {
			// hrAdmin
			role = "hrAdmin";
			model.addAttribute("hrAdmin", empClockNumber);
			hrEmployeeList = hRManagerService.getHrEmployeeViews(Integer.parseInt(empClockNumber), dropdownYear,
					"MANAGER COMPLETED", role);
		}

		model.addAttribute("empDetails", hrEmployeeList);

		model.addAttribute("hrDashboard", "Generalist");
		// session.setAttribute("onlyEmployee", "EmployeeSupervisor");

		// loginUser.setRoles("EmployeeSupervisor");
		model.addAttribute("loginUser", loginUser);

		return "hrDashboardEmployeeView";
	}

}
