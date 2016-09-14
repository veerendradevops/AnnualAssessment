package com.lisi.annaulAssessment.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lisi.annaualAssessment.orm.PresentYearObjectives;
import com.lisi.annaulAssessment.service.ManagerEmployeeService;

@Controller
public class ManagerAndEmployeeController {

	private static final Logger log = Logger.getLogger(ManagerAndEmployeeController.class);

	@Autowired
	private ManagerEmployeeService managerEmpService;

	@RequestMapping(value = "/presentYearObjectives", method = RequestMethod.GET)
	public String presentYearObjectivesScreen(Model model) {

		log.info("present Year Objectives");

		List<PresentYearObjectives> presentYear = managerEmpService.retrievePresentYearObjectives();

		log.info(presentYear);
		for (PresentYearObjectives present : presentYear) {

			log.info(present.getEmpClockNumber());
		}
		model.addAttribute("presentYearObjectives", presentYear);

		return "presentYearObjectives";
	}

	@RequestMapping(value = "/presentYearObjectivesAction", method = RequestMethod.POST)
	public String presentYearObjectivesAction(
			@ModelAttribute("presentYearObjectives") PresentYearObjectives presentYearObjectives, BindingResult br,
			Model model) {

		log.info("present Year Objectives action");

		String currentYearfromUser = "";

		// log.info(Integer.parseInt(ExemptEmployeeController.getClockNumber().trim()));
		log.info(ExemptEmployeeController.getAnnaylYear());

		presentYearObjectives.setEmpClockNumber(Integer.parseInt(ExemptEmployeeController.getClockNumber().trim()));
		presentYearObjectives.setAnnaulYear(ExemptEmployeeController.getAnnaylYear());

		// fetching development goals the record..
		List<PresentYearObjectives> presentYear = managerEmpService.retrievePresentYearObjectives();

		if (presentYear.size() == 1) {
			for (PresentYearObjectives year : presentYear) {

				currentYearfromUser = year.getAnnaulYear();

			}

		}
		log.info("database year");
		log.info(currentYearfromUser);
		managerEmpService.savePresentYearObjectives(presentYearObjectives, currentYearfromUser);

		model.addAttribute("devgoals", presentYear);

		return "goalsForNextYear";
	}

	@RequestMapping(value = "/developmentGoalsScreen")
	public String developmentGoalsScreen(Model model) {

		log.info("present Year Objectives screen");
		String currentYearfromUser = "";
		List<PresentYearObjectives> presentYear = managerEmpService.retrievePresentYearObjectives();

		if (presentYear.size() == 1) {

			// success only one record

		}
		model.addAttribute("devgoals", presentYear);

		return "goalsForNextYear";
	}

	@RequestMapping(value = "/developmentGoals", method = RequestMethod.POST)
	public String developmentGoalsAction(@ModelAttribute("devlopmentGoals") PresentYearObjectives devlopmentGoals,
			BindingResult br, Model model) {

		log.info("present Year Objectives action");

		String currentYearfromUser = "";

		// log.info(Integer.parseInt(ExemptEmployeeController.getClockNumber().trim()));
		log.info(ExemptEmployeeController.getAnnaylYear());

		devlopmentGoals.setEmpClockNumber(Integer.parseInt(ExemptEmployeeController.getClockNumber().trim()));
		devlopmentGoals.setAnnaulYear(ExemptEmployeeController.getAnnaylYear());

		// updating the record..
		List<PresentYearObjectives> presentYear = managerEmpService.retrievePresentYearObjectives();

		if (presentYear.size() == 1) {
			for (PresentYearObjectives year : presentYear) {

				currentYearfromUser = year.getAnnaulYear();

			}

		}
		model.addAttribute("presentYearObjectives", presentYear);
		log.info("database year");
		log.info(currentYearfromUser);
		// managerEmpService.savePresentYearObjectives(presentYearObjectives,
		// currentYearfromUser);

		managerEmpService.updateDevelopmentGoals(devlopmentGoals);

		model.addAttribute("meetingsummary", presentYear);

		return "meetingsummary";
	}

	@RequestMapping(value = "/meetingsummaryscreen")
	public String meetingSummary(Model model) {

		List<PresentYearObjectives> presentYear = managerEmpService.retrievePresentYearObjectives();

		if (presentYear.size() == 1) {

			// success

		}
		model.addAttribute("meetingsummary", presentYear);

		return "meetingsummary";
	}

	@RequestMapping(value = "/meetingsummary", method = RequestMethod.POST)
	public String meetingSummary(@ModelAttribute("meetingsummary") PresentYearObjectives devlopmentGoals,
			BindingResult br, Model model) {

		log.info("present Year Objectives action");

		String currentYearfromUser = "";

		// log.info(Integer.parseInt(ExemptEmployeeController.getClockNumber().trim()));
		log.info(ExemptEmployeeController.getAnnaylYear());

		devlopmentGoals.setEmpClockNumber(Integer.parseInt(ExemptEmployeeController.getClockNumber().trim()));
		devlopmentGoals.setAnnaulYear(ExemptEmployeeController.getAnnaylYear());

		// updating the record..
		List<PresentYearObjectives> presentYear = managerEmpService.retrievePresentYearObjectives();

		if (presentYear.size() == 1) {
			for (PresentYearObjectives year : presentYear) {

				currentYearfromUser = year.getAnnaulYear();

			}

		}
		model.addAttribute("presentYearObjectives", presentYear);
		log.info("database year");
		log.info(currentYearfromUser);
		// managerEmpService.savePresentYearObjectives(presentYearObjectives,
		// currentYearfromUser);

		managerEmpService.updateDevelopmentGoals(devlopmentGoals);

		model.addAttribute("meetingsummary", presentYear);

		return "meetingsummary";
	}
}
