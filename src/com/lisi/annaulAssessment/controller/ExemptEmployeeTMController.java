/**
 * This Controller class is used to controls the To be completed by manager section
 */
package com.lisi.annaulAssessment.controller;

import java.util.Collections;
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
import com.lisi.annaualAssessment.orm.ExemptSection2;
import com.lisi.annaulAssessment.pojo.ExemptSection2Pojo;
import com.lisi.annaulAssessment.pojo.ManagerSkillsAssessment;
import com.lisi.annaulAssessment.service.ExemptSection2Service;
import com.lisi.annaulAssessment.service.ExemptTeamMemberService;
import com.lisi.annaulAssessment.util.Converters;
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

	private String exemptEmpClock, employeeYear;

	public void setEs(ExemptSection2Service exemptSection2Service) {
		this.exemptSection2Service = exemptSection2Service;
	}

	// Retrieving ObjectAchievemtScreen data from database
	@RequestMapping(value = "/objectiveAchievemtnScreen", method = RequestMethod.GET)
	public String fillExemptSection2Retrive(Model model, HttpSession session) {
		try {
			List<ExemptSection2> retrivedata = Collections.EMPTY_LIST;
			System.out.println("objectiveAchievemtnScreen");

			System.out.println(session.getAttribute("exemptEmp"));

			exemptEmpClock = (String) session.getAttribute("exemptEmp");
			employeeYear = (String) session.getAttribute("year");
			System.out.println("converted value " + exemptEmpClock);
			// retrieving data from database
			try {
				retrivedata = exemptSection2Service.retriveObjectAchievementData(exemptEmpClock.trim(),
						employeeYear.trim());

			} catch (Exception e) {

				throw new Exception("clock number is missing");
			}
			if (retrivedata.size() == 1) {

			} else if (retrivedata.size() > 1) {

				model.addAttribute("errormessage", "multiple records are found");
				throw new Exception("multiple records are found");
			}

			for (ExemptSection2 exemptSection2 : retrivedata) {

				System.out.println("exemptSection2 :: " + exemptSection2.getSection2A1Level());

			}

			model.addAttribute("objectiveAchievement", retrivedata);

			return "objectiveAchievement";
		} catch (Exception e) {

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

		String objectachievementoperatin = objectiveAchievmentOperation(exemptSection2Pojo, result, model, session);
		String objectachievementoperationr = fillExemptSection2Retrive(model, session);
		return "managersskillassessment";

	}

	// Inserting ObjectAchievement screen data into database
	public String objectiveAchievmentOperation(
			@ModelAttribute("exemptSection2Pojo") ExemptSection2Pojo exemptSection2Pojo, BindingResult result,
			Model model, HttpSession session) {
		ExemptSection2 exemptorm = new ExemptSection2();
		try {

			log.info("objectiveAchievementOperation");
			exemptEmpClock = (String) session.getAttribute("exemptEmp");

			System.out.println(exemptEmpClock);

			employeeYear = (String) session.getAttribute("year");
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
				exemptTeamMemberService.updateCensusForm("Started", exemptEmpClock);

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
		String fillexemptsection3Retrive = fillExemptSection3Retrive(exemptSection2Pojo, model, session);

		return "managersskillassessment";

	}

	// retrieving managerskillassessment data
	@RequestMapping(value = "/managerSkillAssessment", method = RequestMethod.GET)
	public String fillExemptSection3Retrive(ExemptSection2Pojo exemptsection2pojo, Model model, HttpSession session) {
		log.info("fillExemptSection3");
		exemptEmpClock = (String) session.getAttribute("exemptEmp");

		System.out.println(exemptEmpClock);

		employeeYear = (String) session.getAttribute("year");
		ExemptSection2 exemptorm = null;
		try {
			List<ExemptSection2> retrivedata = exemptSection2Service.retriveManagerSkillsAssessmentData(exemptEmpClock,
					employeeYear);
			System.out.println(retrivedata);
			for (ExemptSection2 exemptSection2pojo : retrivedata) {
				exemptorm = new ExemptSection2();
				System.out.println(String.valueOf(exemptSection2pojo.getSection2B1()));
				int i = 0;
				if (String.valueOf(exemptsection2pojo.getSection2B1()).isEmpty()
						|| String.valueOf(exemptSection2pojo.getSection2B1()).equalsIgnoreCase("null")) {
					return "managersskillassessment";
				}
				System.out.println("exemptSection2cur :: " + exemptSection2pojo.getSection2A1Level());
				System.out.println("exemptSection2skillcur :: " + exemptSection2pojo.getSection2B1());
				// getting comma seperated values for Section2B1 and set into
				// string
				String exemptsection = exemptSection2pojo.getSection2B1();
				String[] section2b1 = exemptsection.split(",");
				// getting comma seperated values for Section2B2 and set into
				// string
				String exemptsection1 = exemptSection2pojo.getSection2B2();
				String[] section2b2 = exemptsection1.split(",");
				// getting comma seperated values for Section2B3 and set into
				// string
				String exemptsection2 = exemptSection2pojo.getSection2B3();
				String[] section2b3 = exemptsection2.split(",");
				System.out.println("section2b1" + section2b1);
				ManagerSkillsAssessment manager = new ManagerSkillsAssessment();
				System.out.println(section2b1.length);
				System.out.println("length");

				for (String t : section2b1) {
					System.out.println("commaSeperatedValues is::::" + t);
					exemptorm = manager.setFields(exemptorm, t, i);
					System.out.println(exemptsection2pojo.getSkills1() + " for loop");
					i++;
				}
				i = 0;
				for (String t : section2b2) {
					System.out.println("commaSeperatedvalues in waysofworking is::::" + t);
					exemptorm = manager.setFieldsForwaysOfWorking(exemptorm, t, i);
					i++;
				}
				i = 0;
				for (String t : section2b3) {
					System.out.println("commaSeperatedvalues in " + t);
					exemptorm = manager.setFieldsForSelfManagementandLeadership(exemptorm, t, i);
					i++;
				}
				model.addAttribute("skill1", exemptorm);
				// commaSeperated.add(exemptorm);

			}
			return "managersskillassessment";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "managersskillassessment";
	}

	// calling managerSkillAssessmentAction() used for backandsave button action
	@RequestMapping(value = "/managerSkillAssessmentAction", params = "backandsave", method = RequestMethod.GET)
	public String fillExemptSection3InsertBack(
			@ModelAttribute("exemptSection2Pojo") ExemptSection2Pojo exemptSection2Pojo, BindingResult result,
			Model model, HttpSession session) {
		String managerSkillAction = managerSkillAssessmentAction(exemptSection2Pojo, result, model, session);

		return "objectiveAchievement";
	}

	// calling managerSkillAssessmentAction() used for nextandsave button action
	@RequestMapping(value = "/managerSkillAssessmentAction", params = "nextandsave", method = RequestMethod.GET)
	public String fillExemptSection3InsertNext(
			@ModelAttribute("exemptSection2Pojo") ExemptSection2Pojo exemptSection2Pojo, BindingResult result,
			Model model, HttpSession session) {
		String managerSkillAction = managerSkillAssessmentAction(exemptSection2Pojo, result, model, session);
		return "assessmentsummary";
	}

	// Inserting ManagerSkillAssessmentAction screen data into database
	public String managerSkillAssessmentAction(
			@ModelAttribute("exemptSection2Pojo") ExemptSection2Pojo exemptSection2Pojo, BindingResult result,
			Model model, HttpSession session) {
		try {

			ExemptSection2 exemptorm = new ExemptSection2();

			log.info("managerSkillAssessment");
			exemptEmpClock = (String) session.getAttribute("exemptEmp");
			employeeYear = (String) session.getAttribute("year");
			log.info(exemptEmpClock);

			log.info(exemptSection2Pojo.getSection2B1());
			log.info(exemptSection2Pojo.getSection2B2());
			log.info(exemptSection2Pojo.getSection2B3());
			exemptorm.setSection2B1(exemptSection2Pojo.getSection2B1());
			exemptorm.setSection2B2(exemptSection2Pojo.getSection2B2());
			exemptorm.setSection2B3(exemptSection2Pojo.getSection2B3());
			exemptorm.setEmpClockNumber(Integer.parseInt(exemptEmpClock.trim()));
			exemptorm.setAppraisalYear(employeeYear.trim());
			String year = exemptSection2Service.insertExemptSection2(exemptorm);
			if (year.isEmpty()) {
				System.out.println("year is empty ");
				System.out.println(year);
				year = " ";
			}
			exemptSection2Service.fillExemptSection3(exemptorm, year);

			List<ExemptSection2> retrivedata = exemptSection2Service.retriveAssessmentSummaryData(exemptorm);
			/*
			 * for (ExemptSection2 exemptSection2 : retrivedata) {
			 * 
			 * System.out.println("exemptSection2 :: " +
			 * exemptSection2.getSection2CSummeryStrength());
			 * 
			 * }
			 */
			model.addAttribute("assessmentsummary", retrivedata);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "assessmentsummary";

	}
	
	// Inserting assessment-summary screen data into database
	@RequestMapping(value = "/assessmentsummary",params="backandsave", method = RequestMethod.GET)
	public String fillAssessmentSummary(@ModelAttribute("exemptSection2Data") ExemptSection2Pojo exemptSection2Pojo,
			BindingResult result, Model model, HttpSession session) {
		String assessmentsummary=assessmentsummary(exemptSection2Pojo,result,model,session);
		String retriveAssessmentSummary=retriveAssessmentSummaryN(exemptSection2Pojo,model,session);
		return "managersskillassessment";
		
	}
	@RequestMapping(value = "/assessmentsummary",params="submit", method = RequestMethod.GET)
	public String fillAssessmentSummarys(@ModelAttribute("exemptSection2Data") ExemptSection2Pojo exemptSection2Pojo,
			BindingResult result, Model model, HttpSession session) {
		String assessmentsummary=assessmentsummary(exemptSection2Pojo,result,model,session);
		return "assessmentsummary";
		
	}
	public String assessmentsummary(@ModelAttribute("exemptSection2Data") ExemptSection2Pojo exemptSection2Pojo,
			BindingResult result, Model model, HttpSession session){
		try {
			System.out.println("assessmentsummary");
			exemptEmpClock = (String) session.getAttribute("exemptEmp");
			employeeYear = (String) session.getAttribute("year");
			System.out.println(exemptEmpClock);
			ExemptSection2 exemptorm = new ExemptSection2();
			log.info(exemptSection2Pojo.getSection2C1());
			log.info("AssessmentSummary");

			exemptorm.setSection2CSummeryImprovement(exemptSection2Pojo.getSection2C1());
			exemptorm.setSection2CSummeryStrength(exemptSection2Pojo.getSection2C2());
			exemptorm.setSection2DSummeryOfAccomplishmentAndAreasImprovement(exemptSection2Pojo.getSection2D1());
			exemptorm.setSection2EAssessmentSummary(exemptSection2Pojo.getSection2E1());
			exemptorm.setSection2EAssessmentcompared(exemptSection2Pojo.getSection2E2());
			exemptorm.setEmpClockNumber(Integer.parseInt(exemptEmpClock.trim()));
			exemptorm.setAppraisalYear(employeeYear.trim());
			String year = exemptSection2Service.insertExemptSection2(exemptorm);
			exemptSection2Service.fillAssessmentSummary(exemptorm, year);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "assessmentsummary";
	}
	// Retriving data from assessment-summary screen
	@RequestMapping(value = "/assessmentSummaryOperation",  method = RequestMethod.GET)
	public String retriveAssessmentSummaryN(@ModelAttribute("exemptSection2Pojo") ExemptSection2Pojo exemptSection2Pojo,
			Model model, HttpSession session) {
		log.info("Retrive AssessmentSummary");
		exemptEmpClock = (String) session.getAttribute("exemptEmp");
		employeeYear = (String) session.getAttribute("year");
		log.info(exemptEmpClock);
		ExemptSection2 exemptorm = new ExemptSection2();

		exemptorm.setEmpClockNumber(Integer.parseInt(exemptEmpClock.trim()));
		exemptorm.setAppraisalYear(employeeYear.trim());
		try {
			List<ExemptSection2> retrivedata = exemptSection2Service.retriveAssessmentSummaryData(exemptorm);
			for (ExemptSection2 exemptSection2 : retrivedata) {

				System.out.println("exemptSection2 :: " + exemptSection2.getSection2CSummeryStrength());

			}
			model.addAttribute("assessmentsummary", retrivedata);

			return "assessmentsummary";
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "assessmentsummary";
	}	

	
}
