package com.lisi.annualassessment.controller;

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
import com.lisi.annualassessment.service.ExemptSection2Service;
import com.lisi.annualassessment.service.ExemptTeamMemberService;
import com.lisi.annualassessment.service.TMPersonalInformationService;

@Controller
public class SummaryOfAccomplishmentController {

	
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
	
	
	// Inserting assessment-summary screen data into database
		@RequestMapping(value = "/assessmentsummary", params = "backandsave", method = RequestMethod.GET)
		public String fillAssessmentSummary(@ModelAttribute("exemptSection2Data") ExemptSection2Pojo exemptSection2Pojo,
				BindingResult result, Model model, HttpSession session) {

			if (session.getAttribute("exemptEmp") != null) {
				System.out.println("is Not Null");
			} else {

				return "loginScreen";
			}
			String assessmentsummary = assessmentsummary(exemptSection2Pojo, result, model, session);

			/*
			 * if(assessmentsummary.equalsIgnoreCase("exception")){
			 * 
			 * model.addAttribute("summary",
			 * "<h6 style=color:red>Please fill Manager Skill Assessment Screen befor you fill summary screen</h6>"
			 * );
			 * 
			 * return "assessmentsummary"; }
			 */

			String retriveAssessmentSummary = retriveAssessmentSummaryN(exemptSection2Pojo, model, session);
			managerSkillAssessment.fillExemptSection3Retrive(exemptSection2Pojo, model, session);
			model.addAttribute("loginUser", loginUser);
			return "managersskillassessment";

		}

		@RequestMapping(value = "/assessmentsummary", params = "nextAndSave", method = RequestMethod.GET)
		public String fillAssessmentSummarys(@ModelAttribute("exemptSection2Data") ExemptSection2Pojo exemptSection2Pojo,
				BindingResult result, Model model, HttpSession session) {

			if (session.getAttribute("exemptEmp") != null) {
				System.out.println("is Not Null");
			} else {

				return "loginScreen";
			}
			String assessmentsummary = assessmentsummary(exemptSection2Pojo, result, model, session);

			/*
			 * if(assessmentsummary.equalsIgnoreCase("exception")){
			 * 
			 * model.addAttribute("summary",
			 * "<h6 style=color:red>Please fill Manager Skill Assessment Screen befor you fill summary screen</h6>"
			 * ); return "assessmentsummary"; }
			 */

			String retriveAssessmentSummary = retriveAssessmentSummaryN(exemptSection2Pojo, model, session);

			managerAndEmployee.presentYearObjectivesScreen(model, session);

			return "presentYearObjectives";

		}

		public String assessmentsummary(ExemptSection2Pojo exemptSection2Pojo, BindingResult result, Model model,
				HttpSession session) {

			if (session.getAttribute("exemptEmp") != null) {
				System.out.println("is Not Null");
			} else {

				return "loginScreen";
			}

			try {
				System.out.println("assessmentsummary");
				exemptEmpClock = (String) loginUser.getExemptEmployeeClock();
				employeeYear = (String) loginUser.getExemptEmployeeYear();
				System.out.println(exemptEmpClock);
				ExemptSection2 exemptorm = new ExemptSection2();
				log.info(exemptSection2Pojo.getSection2C1());
				log.info("AssessmentSummary");

				exemptorm.setSection2CSummeryImprovement(exemptSection2Pojo.getSection2C2());
				exemptorm.setSection2CSummeryStrength(exemptSection2Pojo.getSection2C1());
				exemptorm.setSection2DSummeryOfAccomplishmentAndAreasImprovement(exemptSection2Pojo.getSection2D1());
				exemptorm.setSection2EAssessmentSummary(exemptSection2Pojo.getSection2E1());
				exemptorm.setSection2EAssessmentcompared(exemptSection2Pojo.getSection2E2());
				exemptorm.setEmpClockNumber(Integer.parseInt(exemptEmpClock.trim()));
				exemptorm.setAppraisalYear(employeeYear.trim());
				String year = exemptSection2Service.insertExemptSection2(exemptorm);

				String status = exemptSection2Service.fillAssessmentSummary(exemptorm, year);

				if (status.equalsIgnoreCase("success")) {

				} else {

					return "exception";
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			return "assessmentsummary";
			// return "presentYearObjectives";
		}
		
		@RequestMapping(value = "/assessmentsummary", params = "save", method = RequestMethod.GET)
		public String assessmentSummarySaveMethod(
				@ModelAttribute("exemptSection2Data") ExemptSection2Pojo exemptSection2Pojo, BindingResult result,
				Model model, HttpSession session) {

			if (session.getAttribute("exemptEmp") != null) {
				System.out.println("is Not Null");
			} else {

				return "loginScreen";
			}
			String assessmentsummary = assessmentsummary(exemptSection2Pojo, result, model, session);
			String retriveAssessmentSummary = retriveAssessmentSummaryN(exemptSection2Pojo, model, session);

			return "assessmentsummary";

		}
		
		
		// Retriving data from assessment-summary screen
		@RequestMapping(value = "/assessmentSummaryOperation", method = RequestMethod.GET)
		public String retriveAssessmentSummaryN(ExemptSection2Pojo exemptSection2Pojo, Model model, HttpSession session) {
			if (session.getAttribute("exemptEmp") != null) {
				System.out.println("is Not Null");
			} else {

				return "loginScreen";
			}
			log.info("Retrive AssessmentSummary");
			exemptEmpClock = (String) loginUser.getExemptEmployeeClock();
			employeeYear = (String) loginUser.getExemptEmployeeYear();
			log.info(exemptEmpClock);
			ExemptSection2 exemptorm = new ExemptSection2();

			exemptorm.setEmpClockNumber(Integer.parseInt(exemptEmpClock.trim()));
			exemptorm.setAppraisalYear(employeeYear.trim());
			try {
				List<ExemptSection2> retrivedata = exemptSection2Service.retriveAssessmentSummaryData(exemptorm);

				if (retrivedata.size() == 0) {

					model.addAttribute("imessage", "no validation");
				}

				if (!String.valueOf(loginUser.getFormSubmissionStatus()).equalsIgnoreCase("null")) {

					model.addAttribute("imessage", "");
				}

				for (ExemptSection2 exemptSection2 : retrivedata) {

					System.out.println("exemptSection2 :: " + exemptSection2.getSection2CSummeryStrength());

					if (String.valueOf(loginUser.getFormSubmissionStatus()).equalsIgnoreCase("null")) {

						if (exemptorm.getSection2CSummeryImprovement() == null) {

							model.addAttribute("imessage", "no validation");
						}
						if (exemptorm.getSection2CSummeryStrength() == null) {

							model.addAttribute("imessage", "no validation");
						}
						if (exemptorm.getSection2DSummeryOfAccomplishmentAndAreasImprovement() == null) {

							model.addAttribute("imessage", "no validation");
						}
						if (exemptorm.getSection2EAssessmentcompared() == null) {

							model.addAttribute("imessage", "no validation");
						}
						if (exemptorm.getSection2EAssessmentSummary() == null) {

							model.addAttribute("imessage", "no validation");
						}
					}

				}

				String status = getStatus(exemptEmpClock, employeeYear);

				model.addAttribute("status", status);
				model.addAttribute("loginUser", loginUser);
				model.addAttribute("assessmentsummary", retrivedata);

				return "assessmentsummary";
				// return "presentYearObjectives";
			} catch (Exception e) {
				model.addAttribute("loginUser", loginUser);
				e.printStackTrace();
			}

			return "assessmentsummary";
			// return "presentYearObjectives";
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
	
}
