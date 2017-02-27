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
import com.lisi.annualassessment.pojo.ManagerSkillsAssessment;
import com.lisi.annualassessment.service.ExemptSection2Service;
import com.lisi.annualassessment.service.ExemptTeamMemberService;
import com.lisi.annualassessment.service.TMPersonalInformationService;

@Controller
public class ManagerSkillAssessmentController {

	private static final Logger log = Logger.getLogger(ManagerSkillAssessmentController.class);
	@Autowired
	private ExemptTeamMemberService exemptTeamMemberService;

	@Autowired
	private ExemptEmployeeTMController exemptTMController;

	@Autowired
	private SummaryOfAccomplishmentController summaryOfAccomplish;
	
	@Autowired
	private ExemptSection2Service exemptSection2Service;

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

	@RequestMapping(value = "/managerSkillAssessment", method = RequestMethod.GET)
	public String fillExemptSection3Retrive(ExemptSection2Pojo exemptsection2pojo, Model model, HttpSession session) {
		log.info("fillExemptSection3");

		if (session.getAttribute("exemptEmp") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}
		exemptEmpClock = (String) loginUser.getExemptEmployeeClock();
		employeeYear = (String) loginUser.getExemptEmployeeYear();

		ExemptSection2 exemptorm = null;
		try {
			List<ExemptSection2> retrivedata = exemptSection2Service.retriveManagerSkillsAssessmentData(exemptEmpClock,
					employeeYear);

			if (retrivedata.size() == 0) {

				model.addAttribute("imessage", "no validation");
			}

			if (!String.valueOf(loginUser.getFormSubmissionStatus()).equalsIgnoreCase("null")) {

				model.addAttribute("imessage", "");
			}

			System.out.println(retrivedata);

			for (ExemptSection2 exemptSection2pojo : retrivedata) {
				exemptorm = new ExemptSection2();
				System.out.println(String.valueOf(exemptSection2pojo.getSection2B1()));
				int i = 0;
				if (String.valueOf(exemptsection2pojo.getSection2B1()).isEmpty()
						|| String.valueOf(exemptSection2pojo.getSection2B1()).equalsIgnoreCase("null")) {

					model.addAttribute("imessage", "no validation");
					model.addAttribute("loginUser", loginUser);
					model.addAttribute("skill1", exemptorm);
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
					// System.out.println(exemptsection2pojo.getSkills1() + "
					// for loop");
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

				// validating the user.
				// String validate = new
				// Validator().validateUser(exemptorm,model,loginUser);

				// commaSeperated.add(exemptorm);

			}
			String status = getStatus((String) session.getAttribute("exemptEmp"),
					(String) session.getAttribute("year"));
			model.addAttribute("status", status);
			model.addAttribute("loginUser", loginUser);
			model.addAttribute("skill1", exemptorm);
			return "managersskillassessment";
		} catch (Exception e) {
			model.addAttribute("loginUser", loginUser);
			e.printStackTrace();
		}
		return "managersskillassessment";
	}

	// calling managerSkillAssessmentAction() used for backandsave button action
	@RequestMapping(value = "/managerSkillAssessmentAction", params = "backandsave", method = RequestMethod.GET)
	public String fillExemptSection3InsertBack(
			@ModelAttribute("exemptSection2Pojo") ExemptSection2Pojo exemptSection2Pojo, BindingResult result,
			Model model, HttpSession session) {

		if (session.getAttribute("exemptEmp") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		String managerSkillAction = managerSkillAssessmentAction(exemptSection2Pojo, result, model, session);

		/*
		 * if (managerSkillAction.equalsIgnoreCase("exception")) {
		 * 
		 * model.addAttribute("managerskillassessment",
		 * "<h6 style=color:red>Please fill the objective-achievement</h6>");
		 * 
		 * return "managersskillassessment"; }
		 */

		exemptTMController.fillExemptSection2Retrive(model, session);
		model.addAttribute("loginUser", loginUser);
		return "objectiveAchievement";
	}

	// calling managerSkillAssessmentAction() used for nextandsave button action
	@RequestMapping(value = "/managerSkillAssessmentAction", params = "nextandsave", method = RequestMethod.GET)
	public String fillExemptSection3InsertNext(
			@ModelAttribute("exemptSection2Pojo") ExemptSection2Pojo exemptSection2Pojo, BindingResult result,
			Model model, HttpSession session) {

		if (session.getAttribute("exemptEmp") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		String managerSkillAction = managerSkillAssessmentAction(exemptSection2Pojo, result, model, session);

		/*
		 * if (managerSkillAction.equalsIgnoreCase("exception")) {
		 * 
		 * model.addAttribute("managerskillassessment",
		 * "<h6 style=color:red>Please fill the objective-achievement</h6>");
		 * 
		 * return "managersskillassessment"; }
		 */

		summaryOfAccomplish.retriveAssessmentSummaryN(exemptSection2Pojo, model, session);
		model.addAttribute("loginUser", loginUser);
		return "assessmentsummary";
	}

	// Inserting ManagerSkillAssessmentAction screen data into database
	public String managerSkillAssessmentAction(
			@ModelAttribute("exemptSection2Pojo") ExemptSection2Pojo exemptSection2Pojo, BindingResult result,
			Model model, HttpSession session) {
		if (session.getAttribute("exemptEmp") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}
		try {

			ExemptSection2 exemptorm = new ExemptSection2();

			log.info("managerSkillAssessment");
			exemptEmpClock = (String) loginUser.getExemptEmployeeClock();
			employeeYear = (String) loginUser.getExemptEmployeeYear();
			log.info(exemptEmpClock);

			exemptorm.setSection2B1(exemptSection2Pojo.getSkills1() + "," + exemptSection2Pojo.getSkills2() + ","
					+ exemptSection2Pojo.getSkills3() + "," + exemptSection2Pojo.getSkills4() + ","
					+ exemptSection2Pojo.getSkills5() + "," + exemptSection2Pojo.getSkills6() + ","
					+ exemptSection2Pojo.getSkills7() + "," + exemptSection2Pojo.getSkills8() + ","
					+ exemptSection2Pojo.getSkills9() + "," + exemptSection2Pojo.getSkills10());
			exemptorm.setSection2B2(exemptSection2Pojo.getWaysOfWorking1() + ","
					+ exemptSection2Pojo.getWaysOfWorking2() + "," + exemptSection2Pojo.getWaysOfWorking3() + ","
					+ exemptSection2Pojo.getWaysOfWorking4() + "," + exemptSection2Pojo.getWaysOfWorking5() + ","
					+ exemptSection2Pojo.getWaysOfWorking6() + "," + exemptSection2Pojo.getWaysOfWorking7());
			exemptorm.setSection2B3(exemptSection2Pojo.getSelfManagementandLeadership1() + ","
					+ exemptSection2Pojo.getSelfManagementandLeadership2() + ","
					+ exemptSection2Pojo.getSelfManagementandLeadership3() + ","
					+ exemptSection2Pojo.getSelfManagementandLeadership4() + ","
					+ exemptSection2Pojo.getSelfManagementandLeadership5() + ","
					+ exemptSection2Pojo.getSelfManagementandLeadership6() + ","
					+ exemptSection2Pojo.getSelfManagementandLeadership7());
			exemptorm.setEmpClockNumber(Integer.parseInt(exemptEmpClock.trim()));
			exemptorm.setAppraisalYear(employeeYear.trim());

			String year = exemptSection2Service.insertExemptSection2(exemptorm);
			if (year.isEmpty()) {
				System.out.println("year is empty ");
				System.out.println(year);
				year = "";
			}

			String status = exemptSection2Service.fillExemptSection3(exemptorm, year);

			if (status.equalsIgnoreCase("success")) {

			} else {

				return "exception";
			}

			List<ExemptSection2> retrivedata = exemptSection2Service.retriveAssessmentSummaryData(exemptorm);

			model.addAttribute("assessmentsummary", retrivedata);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "assessmentsummary";

	}

	@RequestMapping(value = "/managerSkillAssessmentAction", params = "save", method = RequestMethod.GET)
	public String managerSkillAssessmentSaveMethod(
			@ModelAttribute("exemptSection2Pojo") ExemptSection2Pojo exemptSection2Pojo, BindingResult result,
			Model model, HttpSession session) {

		System.out.println("SAVE FUNCTIONALITY FOR MANAGER SKILL ASSESSMENTaCTION");
		if (session.getAttribute("exemptEmp") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		String managerSkillAction = managerSkillAssessmentAction(exemptSection2Pojo, result, model, session);

		fillExemptSection3Retrive(exemptSection2Pojo, model, session);
		// fillExemptSection3Retrive
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

}
