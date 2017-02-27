package com.lisi.annualassessment.controller;

import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.bag.SynchronizedSortedBag;
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
public class HRManagerController {

	private static final Logger log = Logger.getLogger(HRManagerController.class);

	@Autowired
	private HRManagerService hRManagerService;

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private LoginUser loginUser;

	@Autowired
	private HRManagerEmployees hrManagerEmployee;

	@Autowired
	private EmployeeService empService;

	@RequestMapping(value = "/hrManagerDashboard")
	public String getHREmployeeList(@RequestParam("clockNumber") String empClockNumber, Model model,
			HttpSession session) {

		System.out.println("Hr Manager Employees");
		System.out.println(empClockNumber);

		if (session.getAttribute("employeeRoles") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

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

		model.addAttribute("hrDashboard", "Manager");
		hrManagerEmployees(empClockNumber, model);
		model.addAttribute("loginUser", loginUser);
		return "hrDashboard";
	}

	@RequestMapping(value = "/hrGeneralistEmployees")
	public String getHRGeneralistEmployeeList(@RequestParam("clockNumber") String empClockNumber, Model model,
			HttpSession session) {

		System.out.println("Hr Manager Employees");
		System.out.println(empClockNumber);

		System.out.println(String.valueOf(session.getAttribute("employeeRoles")));

		if (session.getAttribute("employeeRoles") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		StringBuffer employeeHirerachy = (StringBuffer) session.getAttribute("employeeRoles");

		String employeeRole = employeeHirerachy.toString();

		String clockNumber = (String) session.getAttribute("loginClockNumber");

		if (employeeRole.contains("HRGeneralist")) {

			model.addAttribute("hrGeneralist", empClockNumber);
			hrGeneralistEmployees(empClockNumber, model);
		}

		if (employeeRole.contains("HrManager")) {

			model.addAttribute("hrManager", empClockNumber);
			hrManagerEmployees(empClockNumber, model);
		}

		if (employeeRole.contains("HRAdmin")) {

			model.addAttribute("hrAdmin", empClockNumber);

			hrManagerEmployee.getHREmployeeList(empClockNumber, model, session);
		}

		model.addAttribute("hrDashboard", "Generalist");

		model.addAttribute("loginUser", loginUser);

		return "hrDashboard";
	}

	/*
	 * @RequestMapping(value = "/hrGeneralistEmployees") public String
	 * getHRGeneralistEmployeeYear(@RequestParam("clockNumber") String
	 * empClockNumber, Model model, HttpSession session) {
	 * 
	 * 
	 * 
	 * return "hrDashboard"; }
	 */

	@RequestMapping(value = "/hrManagerEmployee", method = RequestMethod.GET)
	public String getHRManagerEmployee(@RequestParam("empClock") String empClockNumber, Model model,
			HttpSession session) {

		log.info("hrManagerEmployee");
		if (session.getAttribute("loginClockNumber") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		List<CensusForm> supervisor = Collections.EMPTY_LIST;

		List<CensusForm> hrEmployeeList = Collections.EMPTY_LIST;

		String hrClock = (String) session.getAttribute("loginClockNumber");

		String loginYear = (String) session.getAttribute("loginYear");

		log.info("hrClock " + hrClock);

		log.info("employee clokc " + empClockNumber);

		supervisor = hRManagerService.getSupervisorEmployees(Integer.parseInt(empClockNumber.trim()), loginYear.trim());

		hrManagerEmployees(hrClock, model);

		log.info("supervisor employees " + supervisor.size());

		model.addAttribute("supervisor", supervisor);
		// model.addAttribute("hrEmployeeList", hrEmployeeList);
		model.addAttribute("loginUser", loginUser);
		return "hrDashboard";
	}

	public void hrManagerEmployees(String clockNumber, Model model) {

		System.out.println("hrManagerEmployeess. " + clockNumber + " " + model);
		String loginClock = loginUser.getClockNumber();
		HttpSession session = request.getSession(true);

		String year = (String) session.getAttribute("loginYear");

		List<CensusForm> hrEmployeeList = hRManagerService.getHrManagerEmployees(Integer.parseInt(clockNumber),
				year.trim());

		System.out.println(Converters.getCurrentYear());
		List<CensusForm> loginEmpDataForAllYears = hRManagerService.getYearsInDatabase(loginClock);

		model.addAttribute("AllYears", loginEmpDataForAllYears);

		// model.addAttribute("hrEmployeeList", hrEmployeeList);
		model.addAttribute("empDetails", hrEmployeeList);

	}

	public void hrGeneralistEmployees(String clockNumber, Model model) {

		System.out.println("hr Generalist role");
		HttpSession session = request.getSession(true);
		String loginClock = loginUser.getClockNumber();
		String year = (String) session.getAttribute("loginYear");
		System.out.println("Year::" + year);
		log.info("hrGeneralistEmployees. " + clockNumber + " ");
		System.out.println("generalist clock " + clockNumber);
		List<CensusForm> hrGeneralist = hRManagerService.getHRGeneralist(Integer.parseInt(clockNumber), year.trim());
		List<CensusForm> loginEmpDataForAllYears = hRManagerService.getYearsInDatabase(loginClock);

		model.addAttribute("AllYears", loginEmpDataForAllYears);
		model.addAttribute("empDetails", hrGeneralist);

	}

	/*
	 * @RequestMapping("/getSupervisorEmployeesOne") public @ResponseBody String
	 * getHREmployeeDetails(
	 * 
	 * @RequestParam(value = "supervisorClockNumber") Integer
	 * supervisorClockNumber, Model model) {
	 * log.info("getSupervisorEmployeesOne"); StringBuffer result = new
	 * StringBuffer();
	 * 
	 * result.append( "<table class=\"table table-bordered\" id=\"sample_1\">");
	 * result.append("<thead>"); result.append("<tr bgcolor=\"#eee\">");
	 * result.append("<tr bgcolor=\"#F5F5F5\">"); result.append(
	 * "<th><center>Clock ID<center></th>"); result.append(
	 * "<th><center>Emp. Name</center></th>");
	 * 
	 * result.append("<th><center>Not Started</center></th>");
	 * result.append("<th><center>Started</center></th>");
	 * result.append("<th><center>Completed</center></th>"); result.append(
	 * "<th><center>Manager Review</center></th>"); result.append(
	 * "<th><center>Submitted to HR</center></th>");
	 * 
	 * result.append("</tr>"); result.append("</thead>");
	 * 
	 * String supervisor3 = ""; if (supervisorClockNumber != null) { try {
	 * log.info("getSupervisorEmployeesOne" + supervisorClockNumber);
	 * List<CensusForm> employeeList =
	 * empService.getSupervorsEmployeesList(supervisorClockNumber);
	 * 
	 * Iterator<CensusForm> employeeListItr = employeeList.iterator();
	 * 
	 * if (!employeeListItr.hasNext()) {
	 * 
	 * } int numberofemp = 999999; int numberofEmployeeRecords = 9999; String
	 * supervisor2 = "supervisor2"; while (employeeListItr.hasNext()) {
	 * 
	 * 
	 * supervisor2 +=(supervisor2+String.valueOf(numberofEmployeeRecords));
	 * result.append("<tr id='"+supervisor2+"'></tr>");
	 * 
	 * CensusForm employeeDetails = employeeListItr.next();
	 * 
	 * 
	 * if(!String.valueOf(employeeDetails.getEmpClockNumber()). isEmpty()){
	 * 
	 * numberofemp++;
	 * 
	 * System.out.println("supervisor1 " + numberofemp); }
	 * 
	 * 
	 * String status = employeeDetails.getStatus();
	 * 
	 * // if (status.equalsIgnoreCase("NOT STARTED")) {
	 * 
	 * 
	 * result.append("<tr><td>" +
	 * "<a href=/AnnualAssessmenT/teamMemberPersonalInfo.do?clockNum=" +
	 * employeeDetails.getEmpClockNumber() + "" + "&year=" +
	 * employeeDetails.getAnnaulYear() + "" + "&status=" +
	 * employeeDetails.getStatus() + " target=\"_blank\">" + "<center>" +
	 * employeeDetails.getEmpClockNumber() + "</center>" + "</a>" + "</td><td>"
	 * + "<a href=/#.do?EmpclockNum=" + employeeDetails.getEmpClockNumber() +
	 * ">" + "<center>" + employeeDetails.getEmplastName() + "," +
	 * employeeDetails.getEmpfirstName() + "</center>" + "</a>" +
	 * "</td><td><font size=\"5\"><center>&#x25C6;</center></font></td><td>" +
	 * "&nbsp;" + "</td><td>" + "&nbsp;" + "</td><td>" + "&nbsp;" + "</td><td>"
	 * + "&nbsp;" + "</td></tr>");
	 * 
	 * 
	 * <td><a href=
	 * "javascript:showHrEmployees(<%=i %>,'${hrEmployee.empClockNumber}');"
	 * ><c:out value="${hrEmployee.emplastName }" ></c:out></a></td>
	 * 
	 * showSupervisorEmployees
	 * 
	 * 
	 * if(!String.valueOf(employeeDetails.getEmpClockNumber()). isEmpty()){
	 * 
	 * System.out.println(employeeDetails.getEmpClockNumber()); supervisor3 +=
	 * (String.valueOf(numberofemp));
	 * 
	 * result.append("<tr id='"+supervisor3+"'></tr>"); System.out.println(
	 * "supervisor3 " + supervisor3); numberofemp--;
	 * 
	 * }
	 * 
	 * 
	 * result.append("<br><td>" +
	 * "<a href=javascript:showSupervisorEmployeesTwo('" + supervisor2 + "','" +
	 * employeeDetails.getEmpClockNumber() + "');>" +
	 * employeeDetails.getEmpClockNumber() + "</a></td>");
	 * 
	 * numberofEmployeeRecords--; supervisor2 = ""; supervisor2 = "supervisor2";
	 * // }
	 * 
	 * if (status.equalsIgnoreCase("STARTED")) {
	 * 
	 * result.append("<tr><td>" + "<a href=/#.do?EmpclockNum=" +
	 * employeeDetails.getEmpClockNumber() + ">"
	 * +"<center>"+employeeDetails.getEmpClockNumber()+ "</center>" + "</a>" +
	 * "</td><td>" + "<a href=/#.do?EmpclockNum=" +
	 * employeeDetails.getEmpClockNumber() +
	 * ">"+"<center>"+employeeDetails.getEmplastName() + "," +
	 * employeeDetails.getEmpfirstName()+"</center>" + "</a>"+"&nbsp;" +
	 * "</td><td><font size=\"5\"><center>&#x25C6;</center></font></td><td>" +
	 * "&nbsp;" + "</td><td>" + "&nbsp;" + "</td><td>" + "&nbsp;" +
	 * "</td></tr><br/>"); } if (status.equalsIgnoreCase("COMPLETED")) {
	 * 
	 * result.append("<tr><td>" + "<a href=/#.do?EmpclockNum=" +
	 * employeeDetails.getEmpClockNumber() + ">"
	 * +"<center>"+employeeDetails.getEmpClockNumber()+ "</center>"+ "</a>" +
	 * "</td><td>" + "<a href=/#.do?EmpclockNum=" +
	 * employeeDetails.getEmpClockNumber() + ">"+"<center>"
	 * +employeeDetails.getEmplastName() + "," +
	 * employeeDetails.getEmpfirstName() +"</center>"+ "</a>"+"</td><td>" +
	 * "&nbsp;" + "</td><td>" + "&nbsp;" +
	 * "</td><td><font size=\"5\"><center>&#x25C6;</center></font></td><td>" +
	 * "&nbsp;" + "</td></tr><br/>"); } if (status.equalsIgnoreCase(
	 * "MANAGER COMPLETED")) {
	 * 
	 * result.append("<tr><td>" + "<a href=/#.do?EmpclockNum=" +
	 * employeeDetails.getEmpClockNumber() + ">"+"<center>" +
	 * employeeDetails.getEmpClockNumber() +"</center>"+ "</a>" + "</td><td>" +
	 * "<a href=/#.do?EmpclockNum=" + employeeDetails.getEmpClockNumber() +
	 * ">"+"<center>"+employeeDetails.getEmplastName() + "," +
	 * employeeDetails.getEmpfirstName() +"</center>"+"</a>" +"</td><td>" +
	 * "&nbsp;" + "</td><td>" + "&nbsp;" + "</td><td>" + "&nbsp;" +
	 * "</td><td><font size=\"5\"><center>&#x25C6;</center></font></td><td>" +
	 * "&nbsp;" + "</td></tr><br/>"); } if (status.equalsIgnoreCase(
	 * "HR COMPLETED")) {
	 * 
	 * result.append("<tr><td>" + "<a href=/#.do?EmpclockNum=" +
	 * employeeDetails.getEmpClockNumber() + ">" +"<center>"+
	 * employeeDetails.getEmpClockNumber() +"</center>"+ "</a>" + "</td><td>" +
	 * "<a href=/#.do?EmpclockNum=" + employeeDetails.getEmpClockNumber() +
	 * ">"+"<center>" +employeeDetails.getEmplastName() + "," +
	 * employeeDetails.getEmpfirstName() + "</center>"+"</a>"+"</td><td>" +
	 * "&nbsp;" + "</td><td>" + "&ndsp;" + "</td><td>" + "&nbsp;" + "</td><td>"
	 * + "&nbsp;" +
	 * "</td><td><font size=\"5\"><center>&#x25C6;</center></font></td></tr><br/>"
	 * ); }
	 * 
	 * numberofEmployeeRecords++;
	 * 
	 * }
	 * 
	 * result.append("</table>");
	 * 
	 * } catch (Exception e) { log.error("Error:::::" + e.getMessage());
	 * result.append("Fail"); } finally {
	 * 
	 * } } log.info("End getSupervisorEmployeeDetails()."); return
	 * result.toString();
	 * 
	 * }
	 * 
	 * @RequestMapping(value = "/getSupervisorEmployeeTwo", method =
	 * RequestMethod.POST) public @ResponseBody String
	 * getSupervisorEmployeeDetails(
	 * 
	 * @RequestParam(value = "supervisorClockNumber") Integer
	 * supervisorClockNumber, Model model) { log.info(
	 * "Start getSupervisorEmployeeDetails()."); StringBuffer result = new
	 * StringBuffer(); try { log.info("supervisorClockNumber :::::::::  " +
	 * supervisorClockNumber); List<CensusForm> employeeList =
	 * empService.getSupervorsEmployeesList(supervisorClockNumber);
	 * 
	 * Iterator<CensusForm> employeeListItr = employeeList.iterator();
	 * 
	 * if (!employeeListItr.hasNext()) {
	 * 
	 * } int numberofEmployeeRecords = 0; int numberofemp = 0; String supervisor
	 * = "supervisor2"; while (employeeListItr.hasNext()) {
	 * 
	 * CensusForm employeeDetails = employeeListItr.next(); String status =
	 * employeeDetails.getStatus();
	 * 
	 * String suprevisor2 = "supervisor2"; result.append("<td>" +
	 * "<a href=javascript:showSupervisorEmployees('supervisor3','" +
	 * employeeDetails.getEmpClockNumber() + "');>" +
	 * employeeDetails.getEmpClockNumber() + "</a></td>");
	 * 
	 * // numberofEmployeeRecords++;
	 * 
	 * }
	 * 
	 * result.append("</table>");
	 * 
	 * } catch (Exception e) { log.error("Error:::::" + e.getMessage());
	 * result.append("Fail"); } finally {
	 * 
	 * }
	 * 
	 * return result.toString();
	 * 
	 * }
	 */
	@RequestMapping(value = "yearOnHrDashboard")
	public String getHrDashboaardBasedOnYear(@RequestParam("dropdownYear") String selectedYear, Model model,
			HttpSession session) {
		if (loginUser.getClockNumber() != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}
		System.out.println("selected year" + selectedYear);
		int loginClockNumber = Integer.parseInt(loginUser.getClockNumber());
		String loginClock = loginUser.getClockNumber();
		model.addAttribute("loginUser", loginUser);

		String employeeRole = loginUser.getRoles();
		if (employeeRole.contains("HRAdmin")) {
			List<CensusForm> adminSupervisorsList = hRManagerService.getHrAdminEmployees(loginClockNumber,
					selectedYear);
			model.addAttribute("empDetails", adminSupervisorsList);
			model.addAttribute("hrAdmin", loginClockNumber);
		}
		if (employeeRole.contains("HRGeneralist")) {
			List<CensusForm> generalistSupervisors = hRManagerService.getHRGeneralist(loginClockNumber, selectedYear);
			model.addAttribute("empDetails", generalistSupervisors);
			model.addAttribute("hrGeneralist", loginClockNumber);
		}
		if (employeeRole.contains("HrManager")) {
			List<CensusForm> managerEmployeeList = hRManagerService.getHrManagerEmployees(loginClockNumber,
					selectedYear);
			model.addAttribute("empDetails", managerEmployeeList);
			model.addAttribute("hrManager", loginClockNumber);
		}
		model.addAttribute("selectedYear", selectedYear);
	
		List<CensusForm> loginEmpDataForAllYears = hRManagerService.getYearsInDatabase(loginClock);

		model.addAttribute("AllYears", loginEmpDataForAllYears);
		
		return "hrDashboard";

	}
	
	/*
	 * Added by Sriramulu.kanithi Search or Filter Controller
	 */
	@RequestMapping(value = "/hrDashboardSearch", method = RequestMethod.GET)
	public String hrDashboardALLL(@RequestParam("filter") String filterContent, Model model, HttpSession session) {
		if (loginUser.getClockNumber() != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}
		List<CensusForm> employeeList = Collections.EMPTY_LIST;
		log.info(" ::::  Enter Search in dashboard :::: ");
		StringBuffer result = new StringBuffer();
		String loginClock = loginUser.getClockNumber();
		// String drop_Down_Year = null;
		if (loginClock != null) {
			try {
				int clockNumber = Integer.parseInt(loginUser.getClockNumber());
				String year = loginUser.getLoginYear();
				String employerole = loginUser.getRoles();
				employerole = String.valueOf(employerole);
				String role = loginUser.getRoles();
				// Session Year
				String dropdownYear = (String) session.getAttribute("dropDownYear");

				
				if(filterContent.length() ==0 || String.valueOf(filterContent).equalsIgnoreCase("NULL"))
				{
					System.out.println("Lenght of filtercontent :::: "+filterContent.length());
				if (employerole.contains("HRAdmin")) 
				{
					
					role="hrAdmin";
					employeeList = hRManagerService.getHrAdminEmployees(clockNumber, year.trim());
					model.addAttribute("hrAdmin", clockNumber);
				}
				if (employerole.contains("HRGeneralist")) 
				{
					role="hrGeneralistClockNumber";
					employeeList = hRManagerService.getHRGeneralist(clockNumber, year.trim());
					
					model.addAttribute("hrGeneralist", clockNumber);
					model.addAttribute("hrGeneralistclock", clockNumber);
				}
				if (employerole.contains("HrManager"))
				{
					role="hrManagerClockNumber";
					model.addAttribute("hrManager", clockNumber);
					model.addAttribute("hrManagerclock", clockNumber);
					employeeList = hRManagerService.getHrManagerEmployees(clockNumber, year.trim());
			}
				model.addAttribute("empDetails", employeeList);
				}
				
				if(filterContent.length() >= 3)
				{
				if (employerole.contains("HRAdmin")) {

					role = "hrAdmin";
					employeeList = hRManagerService.getHrAdminEmployees(clockNumber, dropdownYear.trim());
					model.addAttribute("hrAdmin", clockNumber);
				}
				if (employerole.contains("HRGeneralist")) {
					role = "hrGeneralistClockNumber";
					employeeList = hRManagerService.getHRGeneralist(clockNumber, dropdownYear.trim());

					model.addAttribute("hrGeneralist", clockNumber);
					model.addAttribute("hrGeneralistclock", clockNumber);
				}
				if (employerole.contains("HrManager")) {
					role = "hrManagerClockNumber";
					model.addAttribute("hrManager", clockNumber);
					model.addAttribute("hrManagerclock", clockNumber);
					employeeList = hRManagerService.getHrManagerEmployees(clockNumber, dropdownYear.trim());
				}

				CensusForm employeeDetails = null;

				List<CensusForm> searchDetails = Collections.EMPTY_LIST;
				Iterator<CensusForm> employeeListItr = employeeList.iterator();
				Set<Integer> clockId = new HashSet<Integer>();
				Set<String> jobTitle_Search = new HashSet<String>();
				Set<String> empName = new HashSet<String>();
				while (employeeListItr.hasNext()) {

					employeeDetails = employeeListItr.next();
					/*
					 * Adding ClockId ,JobTiltle and EmpName to set
					 */
					clockId.add(employeeDetails.getEmpClockNumber());

					jobTitle_Search.add(employeeDetails.getJobTitle());

					empName.add(employeeDetails.getEmplastName());
				}
				// If value empty or lenght zero.
				if (filterContent.length() == 0 || filterContent.isEmpty()) {

					if (employerole.contains("HRAdmin")) {

						role = "hrAdmin";
						employeeList = hRManagerService.getHrAdminEmployees(clockNumber, dropdownYear.trim());
						model.addAttribute("hrAdmin", clockNumber);
					}
					if (employerole.contains("HRGeneralist")) {
						role = "hrGeneralistClockNumber";
						employeeList = hRManagerService.getHRGeneralist(clockNumber, dropdownYear.trim());

						model.addAttribute("hrGeneralist", clockNumber);
						model.addAttribute("hrGeneralistclock", clockNumber);
					}
					if (employerole.contains("HrManager")) {
						role = "hrManagerClockNumber";
						model.addAttribute("hrManager", clockNumber);
						model.addAttribute("hrManagerclock", clockNumber);
						employeeList = hRManagerService.getHrManagerEmployees(clockNumber, dropdownYear.trim());
					}
				}
				if (filterContent.length() >= 3) {
					if (String.valueOf(clockId).contains(filterContent)) {
						System.out.println("ClockId ::::::::: " + clockId);
						System.out.println("Search based  on the Clock number ");
						searchDetails = hRManagerService.getSearchClockId(clockNumber, role, dropdownYear.trim(),
								filterContent);
						System.out.println("searchDetails ::: " + searchDetails);
						model.addAttribute("empDetails", searchDetails);

					}
					if (String.valueOf(jobTitle_Search).contains(filterContent)) {
						System.out.println("job Title :::: " + jobTitle_Search);
						System.out.println("Search based  on the job title ");
						searchDetails = hRManagerService.getSearchJobTitle(clockNumber, role, dropdownYear.trim(),
								filterContent);
						model.addAttribute("empDetails", searchDetails);
					}
					if (String.valueOf(empName).contains(filterContent)) {
						System.out.println("Search based  on the name ");
						searchDetails = hRManagerService.getSearchName(clockNumber, role, dropdownYear.trim(),
								filterContent);
						model.addAttribute("empDetails", searchDetails);
					}

					model.addAttribute("filterContent", filterContent);
				}
				
				
			} 
				List<CensusForm> loginEmpDataForAllYears = hRManagerService.getYearsInDatabase(loginClock);
				model.addAttribute("loginUser", loginUser);
				model.addAttribute("AllYears", loginEmpDataForAllYears);
				model.addAttribute("selectedYear", dropdownYear);
			}catch (Exception e) {
				log.error("Error:::::" + e.getMessage());
				e.printStackTrace();

			}
		}

		return "hrDashboard";

	}
}
