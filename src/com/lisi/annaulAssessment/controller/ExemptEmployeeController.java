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
import com.lisi.annaulAssessment.util.Converters;

@Controller
public class ExemptEmployeeController {

	private static final Logger log = Logger.getLogger(ExemptEmployeeController.class);

	@Autowired
	private EmployeeService empServie;

	@Autowired
	private TMPersonalInformationService tmservice;

	/*private static String clockNumber;

	private static String annaylYear;*/

	// anchor tag link
	
	@RequestMapping(value = "/teamMemberPersonalInfo", method = RequestMethod.GET)
	public String teamMemberPersonalInfo(@RequestParam("clockNum") String empClockNumber,
			@RequestParam("year") String year,@RequestParam("status") String empStatus, Model model,HttpSession session) {

		log.info("teamMemberPersonalInfo");
		log.info(empClockNumber);
		try {
		//	ExemptEmployeeController.setClockNumber(empClockNumber);
			
			session.setAttribute("exemptEmp", empClockNumber);
			session.setAttribute("year", year.trim());
	//		session.setAttribute("loginEmployeeStatus", empStatus);
			
			session.setAttribute("supervisorstatus", empStatus);
			
		//	session.removeAttribute("loginClockNumber");
		//	ExemptEmployeeController.setAnnaylYear(year);
		
			List<CensusForm> employeeDetails = tmservice.getEmployeeDetails(empClockNumber,year.trim());

			for (CensusForm c : employeeDetails) {

				log.info("if");
			}

			session.setAttribute("onlyEmployee", "EmployeeSupervisor");
			model.addAttribute("employeeDetails", employeeDetails);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// return "exemptEmployee";

		return "exemptEmployee";
	}
	
	// supervisor form...

	@RequestMapping(value = "/exemptEmployee", method = RequestMethod.GET)
	public String exemptEmployee(@RequestParam("clockNum") String loginEmpClock, Model model) {

		log.info("exemptEmp");
		log.info(loginEmpClock);

		List<CensusForm> census = empServie.getExemptEmployees(Integer.parseInt(loginEmpClock.trim()),"exempt",Converters.getCurrentYear());

		double yellowHourlyRate = 0;
		double yellowAnnaulRate = 0;
		int numberOfEmployees=0;

		for (CensusForm c : census) {

			if (c.getCurrentHrlyRate().isEmpty()) {

			} else {
				yellowHourlyRate += Double.parseDouble(c.getCurrentHrlyRate().trim());
			}
			
			if(c.getAnnaulRate().isEmpty()){
				
				
			}else{
				yellowAnnaulRate += Double.parseDouble(c.getAnnaulRate().trim());
			}
			numberOfEmployees++;
			System.out.println("yes");
		}

		model.addAttribute("yellowHourlyRate", yellowHourlyRate);
		model.addAttribute("yellowAnnaulRate" , yellowAnnaulRate);
		model.addAttribute("numberofemployees", numberOfEmployees);
		
		model.addAttribute("empDetails", census);

		return "managerScreen";
	}

	

	// method call happens when an employee is assocated with employee and supervisor.

	@RequestMapping(value = "/employeeForm", method = RequestMethod.GET)
	public String employeeForm(Model model, HttpSession session) {

		log.info("directly accessing the TeamMember Form.. from the supervisor screen.");
	//	log.info(LoginController.getLoginClockNumber());
		StringBuffer roleBased = new StringBuffer("");
		String loginClockNumber =(String)session.getAttribute("loginClockNumber");
		log.info(loginClockNumber);
		try{
		List<CensusForm> employeeDetails = tmservice.getEmployeeDetails
				(loginClockNumber.trim(),Converters.getCurrentYear());

		if(employeeDetails.size()==1){
			
			for(CensusForm c : employeeDetails){
				
					
			}
			
			
		}else if(employeeDetails.size()>1){
			
			throw new Exception("multiple records are found");
		}
		session.setAttribute("onlyEmployee", "Employee");

		model.addAttribute("employeeDetails", employeeDetails);
		}
		
		catch(Exception e){
			e.printStackTrace();
			
			if(e.getMessage().contains("multiple records are found")){
				model.addAttribute("wrongUser", "<h6 style=color:red>multiple user's found with this username</h6>");
				return "managerScreen";
			}
		}
		// session.setAttribute("onlyEmployee", "forEmployee");

		// return "exemptEmployee";

		return "exemptEmployee";
		// return "oneexemptEmployee";
	}

}
