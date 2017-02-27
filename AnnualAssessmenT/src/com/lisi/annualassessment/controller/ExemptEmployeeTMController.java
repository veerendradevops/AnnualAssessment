/**
 * This Controller class is used to controls the To be completed by manager section
 */
package com.lisi.annualassessment.controller;

import java.util.Collections;
import java.util.Iterator;
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

import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.orm.ExemptSection2;
import com.lisi.annualassessment.pojo.ExemptSection2Pojo;
import com.lisi.annualassessment.pojo.LoginUser;
import com.lisi.annualassessment.pojo.ManagerSkillsAssessment;
import com.lisi.annualassessment.service.ExemptSection2Service;
import com.lisi.annualassessment.service.ExemptTeamMemberService;
import com.lisi.annualassessment.service.TMPersonalInformationService;
import com.lisi.annualassessment.util.Converters;
import com.lisi.annualassessment.util.Validator;
import com.sun.net.httpserver.HttpsConfigurator;

/**
 * @author manikanta.b
 *
 */
@Controller
public class ExemptEmployeeTMController {
	private static final Logger log = Logger.getLogger(ExemptEmployeeTMController.class);
	@Autowired
	private ExemptTeamMemberService exemptTeamMemberService;

	@Autowired
	private ExemptSection2Service exemptSection2Service;

	@Autowired
	private ManagerSkillAssessmentController managerSkillAssessment;

	@Autowired
	private TMPersonalInformationService employeeInfo;

	@Autowired
	private ManagerAndEmployeeController managerAndEmployee;

	@Autowired
	private LoginUser loginUser;

	private String exemptEmpClock, employeeYear;

	public void setEs(ExemptSection2Service exemptSection2Service) {
		this.exemptSection2Service = exemptSection2Service;
	}

	// Retrieving ObjectAchievemtScreen data from database
	@RequestMapping(value = "/objectiveAchievemtnScreen", method = RequestMethod.GET)
	public String fillExemptSection2Retrive(Model model, HttpSession session) {

		List<ExemptSection2> retrivedata = Collections.EMPTY_LIST;
		System.out.println("objectiveAchievemtnScreen");

		System.out.println(session.getAttribute("exemptEmp"));

		exemptEmpClock = (String) loginUser.getExemptEmployeeClock();
		employeeYear = (String) loginUser.getExemptEmployeeYear();

		System.out.println("converted value " + exemptEmpClock);
		// retrieving data from database
		try {
			retrivedata = exemptSection2Service.retriveObjectAchievementData(exemptEmpClock.trim(),
					employeeYear.trim());

			ExemptSection2 exemptSection = exemptSection2Service.fetchObjectAchievementData(exemptEmpClock.trim(),
					employeeYear.trim());

			if (exemptSection == null) {

				model.addAttribute("imessage", "no validation");
			}

			int totalScore = 0;

			if (exemptSection != null) {
				System.out.println("exemptSection2 :: " + exemptSection.getSection2A1Level());

				totalScore += exemptSection.getSection2A1Level();

				totalScore += exemptSection.getSection2A2Level();
				totalScore += exemptSection.getSection2A3Level();
				totalScore += exemptSection.getSection2A4Level();
				totalScore += exemptSection.getSection2A5Level();

				System.out.println(loginUser.getFormSubmissionStatus());
				System.out.println(totalScore + " total score");

			}

			if (totalScore != 100) {

				if (String.valueOf(loginUser.getFormSubmissionStatus()).equalsIgnoreCase("null")) {

					model.addAttribute("imessage", "no validation");
				}
			}

			System.out.println(retrivedata + " complete data.");

			String status = getStatus(exemptEmpClock, employeeYear);
			System.out.println("after status.");
			model.addAttribute("status", status);
			model.addAttribute("loginUser", loginUser);
			model.addAttribute("objData", exemptSection);
			return "objectiveAchievement";

		} catch (Exception e) {
			model.addAttribute("loginUser", loginUser);
			if (e.getMessage().contains("clock number is missing")) {
				System.out.println("if");
				model.addAttribute("errormssage", "you are missing with employee clock number");
			}
			System.out.println("i caught with an exception");
			e.printStackTrace();

			return "objectiveAchievement";
		}
		// return "objectiveAchievement";

	}

	// It calls objectiveAchievementOperation() used for nextandsave operation
	@RequestMapping(value = "/objectiveAchievementOperation", params = "nextandsave", method = RequestMethod.POST)
	public String fillExemptSection2insert(@ModelAttribute("exemptSection2Pojo") ExemptSection2Pojo exemptSection2Pojo,
			BindingResult result, Model model, HttpSession session) {

		if (session.getAttribute("exemptEmp") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		String objectachievementoperatin = objectiveAchievmentOperation(exemptSection2Pojo, result, model, session);
		String objectachievementoperationr = fillExemptSection2Retrive(model, session);
		model.addAttribute("loginUser", loginUser);
		return "managersskillassessment";

	}

	// Inserting ObjectAchievement screen data into database
	public String objectiveAchievmentOperation(ExemptSection2Pojo exemptSection2Pojo, BindingResult result, Model model,
			HttpSession session) {

		if (session.getAttribute("exemptEmp") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}
		ExemptSection2 exemptorm = new ExemptSection2();
		try {

			log.info("objectiveAchievementOperation");

			exemptEmpClock = (String) loginUser.getExemptEmployeeClock();
			employeeYear = (String) loginUser.getExemptEmployeeYear();

			// ExemptSection2 exemptorm = new ExemptSection2();
			exemptorm.setEmpClockNumber(Integer.parseInt(exemptEmpClock.trim()));
			exemptorm.setSection2A1Objective(exemptSection2Pojo.getSection2A1Objective());
			exemptorm.setSection2A1Level(exemptSection2Pojo.getSection2A1Level());
			exemptorm.setSection2A2Objective(exemptSection2Pojo.getSection2A2Objective());
			exemptorm.setSection2A2Level(exemptSection2Pojo.getSection2A2Level());
			exemptorm.setSection2A3Objective(exemptSection2Pojo.getSection2A3Objective());
			exemptorm.setSection2A3Level(exemptSection2Pojo.getSection2A3Level());
			exemptorm.setSection2A4Objective(exemptSection2Pojo.getSection2A4Objective());
			exemptorm.setSection2A4Level(exemptSection2Pojo.getSection2A4Level());
			exemptorm.setSection2A5Objective(exemptSection2Pojo.getSection2A5Objective());
			exemptorm.setSection2A5Level(exemptSection2Pojo.getSection2A5Level());
			exemptorm.setSection2AdditionalComments(exemptSection2Pojo.getSection2AdditionalComments());
			exemptorm.setOverallScore(exemptSection2Pojo.getOverallScore());
			exemptorm.setAppraisalYear(employeeYear.trim());
			String year = exemptSection2Service.insertExemptSection2(exemptorm);

			if (String.valueOf(year.trim()).equalsIgnoreCase("null") || String.valueOf(year.trim()).length() == 0) {
				System.out.println("new record");
				// exemptTeamMemberService.updateCensusForm("Started",
				// exemptEmpClock);

			}

			log.info("year is:::" + year);
			// calls fillExemptSection2(-,-)
			exemptSection2Service.fillExemptSection2(exemptorm, year);

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errormessage", "employee record was not inserted properly..");
			return "objectiveAchievement";
		}

		// Calling fillExemptSection3Retrive(-,-) method
		String fillexemptsection3Retrive = managerSkillAssessment.fillExemptSection3Retrive(exemptSection2Pojo, model,
				session);

		return "managersskillassessment";

	}

	

	public String getStatus(String clockNo, String year) {
		String status = null;
		List<CensusForm> employeeDetails = employeeInfo.getEmployeeDetails(String.valueOf(clockNo), year);
		Iterator<CensusForm> employeeDetailsItr = employeeDetails.iterator();
		while (employeeDetailsItr.hasNext()) {
			CensusForm censusForm = employeeDetailsItr.next();
			status = censusForm.getStatus();
			status = status.toUpperCase();
			System.out.println("In getStatus methos()::::::::::: " + status);
		}
		return status;
	}

	@RequestMapping(value = "/objectiveAchievementOperation", params = "save", method = RequestMethod.POST)
	public String objectiveAchivementSaveMethod(
			@ModelAttribute("exemptSection2Pojo") ExemptSection2Pojo exemptSection2Pojo, BindingResult result,
			Model model, HttpSession session) {

		if (session.getAttribute("exemptEmp") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		String objectachievementoperatin = objectiveAchievmentOperation(exemptSection2Pojo, result, model, session);
		String objectachievementoperationr = fillExemptSection2Retrive(model, session);

		fillExemptSection2Retrive(model, session);

		return "objectiveAchievement";

	}

	

}
