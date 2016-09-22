package com.lisi.annaulAssessment.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lisi.annaualAssessment.orm.PresentYearObjectives;
import com.lisi.annaulAssessment.service.ExemptTeamMemberService;
import com.lisi.annaulAssessment.service.ManagerEmployeeService;

@Controller
public class ManagerAndEmployeeController {

	private static final Logger log = Logger.getLogger(ManagerAndEmployeeController.class);

	@Autowired
	private ManagerEmployeeService managerEmpService;

	private String exemptEmpClock, employeeYear;
	
	@Autowired
	private LogoutController logoutController;
	
	@Autowired
	private ExemptTeamMemberService exemptTeamMemberService;
	 /*
	  * 
	  * present year objective anchor screeen..
	  * 
	  * */

	@RequestMapping(value = "/presentYearObjectives", method = RequestMethod.GET)
	public String presentYearObjectivesScreen(Model model, HttpSession session) {

		log.info("present Year Objectives");
		exemptEmpClock = (String) session.getAttribute("exemptEmp");
		employeeYear = (String) session.getAttribute("year");
		log.info(exemptEmpClock);
		try {
			PresentYearObjectives presentYear = managerEmpService.retrievePresentYearObjectives(exemptEmpClock.trim(),
					employeeYear.trim());

			log.info(presentYear);

			model.addAttribute("presentYearObjectives", presentYear);
		} catch (Exception e) {

			e.printStackTrace();
		}

		return "presentYearObjectives";
	}

	@RequestMapping(value = "/presentYearObjectivesAction", params = "nextAndSave", method = RequestMethod.POST)
	public String presentYearObjectivesNextAndSave(
			@ModelAttribute("presentYearObjectives") PresentYearObjectives presentYearObjectives, BindingResult br,
			Model model, HttpSession session) {

		presentYearObjectives(presentYearObjectives, model, session);

		log.info("present year Next and save");

		return "goalsForNextYear";
	}

	private void presentYearObjectives(PresentYearObjectives presentYearObjectives, Model model, HttpSession session) {

		exemptEmpClock = (String) session.getAttribute("exemptEmp");
		employeeYear = (String) session.getAttribute("year");

		String currentYearfromUser = "";

		// log.info(Integer.parseInt(ExemptEmployeeController.getClockNumber().trim()));

		presentYearObjectives.setEmpClockNumber(Integer.parseInt(exemptEmpClock.trim()));
		presentYearObjectives.setAnnaulYear(employeeYear);

		// fetching development goals the record..
		PresentYearObjectives presentYear = managerEmpService.retrievePresentYearObjectives(exemptEmpClock.trim(),
				employeeYear.trim());

		if (presentYear == null) {

			log.info("present year is null");
			currentYearfromUser = "";
		} else {
			log.info("yes i am having record");
			currentYearfromUser = presentYear.getAnnaulYear();
		}

		log.info("database year");
		log.info(currentYearfromUser);
		managerEmpService.savePresentYearObjectives(presentYearObjectives, currentYearfromUser);

		model.addAttribute("devgoals", presentYear);
	}

	 /*
	  * 
	  * developmentGoalsScreen anchor screeen..
	  * 
	  * */

	
	
	@RequestMapping(value = "/developmentGoalsScreen")
	public String developmentGoalsScreen(Model model, HttpSession session) {

		log.info("present Year Objectives screen");
		exemptEmpClock = (String) session.getAttribute("exemptEmp");
		employeeYear = (String) session.getAttribute("year");
		log.info(exemptEmpClock);

		String currentYearfromUser = "";
		PresentYearObjectives presentYear = managerEmpService.retrievePresentYearObjectives(exemptEmpClock.trim(),
				employeeYear.trim());

	
		model.addAttribute("devgoals", presentYear);

		return "goalsForNextYear";
	}

	@RequestMapping(value = "/developmentGoals", params = "backAndSave", method = RequestMethod.POST)
	public String developmentBacktAndSave(@ModelAttribute("devlopmentGoals") PresentYearObjectives devlopmentGoals,
			BindingResult br, Model model, HttpSession session) {

		log.info("Develpopment Goals for Next Year");
		
		String returnPage = developmentGoalsAction(devlopmentGoals, model, session);

		 String presentYearObjectivesScreen=presentYearObjectivesScreen( model,  session);

		return "presentYearObjectives";
	}

	@RequestMapping(value = "/developmentGoals", params = "nextAndSave", method = RequestMethod.POST)
	public String developmentNextAndSave(@ModelAttribute("devlopmentGoals") PresentYearObjectives devlopmentGoals,
			BindingResult br, Model model, HttpSession session) {

		log.info("Develpopment Goals for Next Year");

		String returnPage = developmentGoalsAction(devlopmentGoals, model, session);

		return returnPage;
	}

	public String developmentGoalsAction(PresentYearObjectives devlopmentGoals, Model model, HttpSession session) {

		exemptEmpClock = (String) session.getAttribute("exemptEmp");
		employeeYear = (String) session.getAttribute("year");
		log.info(exemptEmpClock);

		String currentYearfromUser = "";
		try {

			devlopmentGoals.setEmpClockNumber(Integer.parseInt(exemptEmpClock.trim()));
			devlopmentGoals.setAnnaulYear(employeeYear.trim());

			// updating the record..
			PresentYearObjectives presentYear = managerEmpService.retrievePresentYearObjectives(exemptEmpClock.trim(),
					employeeYear.trim());

			if (presentYear == null) {

				String error = "<h6 style=color:red>please insert the objectives screes.</h6>";

				model.addAttribute("status", error);
				log.info("if " + presentYear);
				currentYearfromUser = "";
				return "goalsForNextYear";
			} else {
				log.info("else");
				currentYearfromUser = presentYear.getAnnaulYear();
			}

			model.addAttribute("presentYearObjectives", presentYear);
			log.info("database year");
			log.info(currentYearfromUser);
			// managerEmpService.savePresentYearObjectives(presentYearObjectives,
			// currentYearfromUser);

			managerEmpService.updateDevelopmentGoals(devlopmentGoals, exemptEmpClock.trim(), currentYearfromUser);

			model.addAttribute("meetingsummary", presentYear);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "meetingsummary";
	}

	@RequestMapping(value = "/meetingsummaryscreen")
	public String meetingSummary(Model model, HttpSession session) {

		log.info("metting screen");
		exemptEmpClock = (String) session.getAttribute("exemptEmp");
		employeeYear = (String) session.getAttribute("year");
		log.info(exemptEmpClock);
		PresentYearObjectives presentYear = managerEmpService.retrievePresentYearObjectives(exemptEmpClock.trim(),
				employeeYear);

	
		model.addAttribute("meetingsummary", presentYear);

		return "meetingsummary";
	}

	@RequestMapping(value = "/meetingsummary", params = "backAndSave", method = RequestMethod.POST)
	public String meetingSummaryBackAndNext(@ModelAttribute("meetingsummary") PresentYearObjectives devlopmentGoals,
			BindingResult br, Model model, HttpSession session) {

		String meetingResult = meetingSummaryAction(devlopmentGoals, model, session);
		String developmentGoalsScreen = developmentGoalsScreen( model,  session);

		return developmentGoalsScreen;
	}

	@RequestMapping(value = "/meetingsummary", params = "save", method = RequestMethod.POST)
	public String meetingSummarySaveAndNext(@ModelAttribute("meetingsummary") PresentYearObjectives devlopmentGoals,
			BindingResult br, Model model, HttpSession session) {

		log.info("meetingSummarySaveAndNext");

		String meetingResult = meetingSummaryAction(devlopmentGoals, model, session);

		

		return meetingResult;
	}
	
	//completed

	private String meetingSummaryAction(PresentYearObjectives devlopmentGoals, Model model, HttpSession session) {

		exemptEmpClock = (String) session.getAttribute("exemptEmp");
		employeeYear = (String) session.getAttribute("year");
		log.info(exemptEmpClock);

		String currentYearfromUser = "";

		try {
			

			devlopmentGoals.setEmpClockNumber(Integer.parseInt(exemptEmpClock.trim()));
			devlopmentGoals.setAnnaulYear(employeeYear.trim());

			// updating the record..
			PresentYearObjectives presentYear = managerEmpService.retrievePresentYearObjectives(exemptEmpClock.trim(),
					employeeYear.trim());

			
			if(presentYear==null){
				
			//	exemptTeamMemberService.updateCensusForm("SUBMITED TO MANAGER", exemptEmpClock.trim());
			}
			
			model.addAttribute("presentYearObjectives", presentYear);
			
			log.info("database year");
			log.info(currentYearfromUser);
			

			managerEmpService.updateMeetingSummary(devlopmentGoals);
			
			

			model.addAttribute("meetingsummary", presentYear);
		} catch (Exception e) {

			e.printStackTrace();

			// meeting summary errors

			return "meetingsummary";
		}

		//return "managerScreen"
		return "acknowledgment";

	}
	
	
	@RequestMapping(value = "/meetingsummary", params = "completed", method = RequestMethod.POST)
	public String managerCompleted(@ModelAttribute("meetingsummary") PresentYearObjectives devlopmentGoals,
			BindingResult br, Model model, HttpSession session) {

		log.info("managercompleted");

		exemptEmpClock = (String) session.getAttribute("exemptEmp");
		employeeYear = (String) session.getAttribute("year");

		PresentYearObjectives presentYear = managerEmpService.retrievePresentYearObjectives(exemptEmpClock.trim(),
				employeeYear.trim());

		
	//	if(presentYear==null){
			
			exemptTeamMemberService.updateCensusForm("MANAGER COMPLETED", exemptEmpClock.trim());
	//	}
		
		logoutController.backController(model, session);

		return "managerScreen";
	}

	@RequestMapping(value = "/acknowledgmentScreen", method = RequestMethod.GET)
	public String acknowledgmentSection(Model model, HttpSession session) {

		return "acknowledgment";
	}
}
