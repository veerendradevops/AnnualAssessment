package com.lisi.annualassessment.controller;

import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lisi.annualassessment.orm.AppraisalMailConfig;
import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.orm.ExemptTeamMember;
import com.lisi.annualassessment.orm.SkillsSelfAssessment;
import com.lisi.annualassessment.pojo.DropDownValues;
import com.lisi.annualassessment.pojo.ExemptTeamMemberPojo;
import com.lisi.annualassessment.pojo.ExemptTeamMemberPojoVariables;
import com.lisi.annualassessment.pojo.LoginUser;
import com.lisi.annualassessment.pojo.SkillsSelfAssesmentVariables;

import com.lisi.annualassessment.service.ExemptTeamMemberService;
import com.lisi.annualassessment.service.NonExemptEmployeeService;
import com.lisi.annualassessment.service.SkillsSelfAssessmentService;
import com.lisi.annualassessment.service.TMPersonalInformationService;
import com.lisi.annualassessment.util.Converters;
import com.lisi.annualassessment.util.EmailConfig;

@Controller
public class ExemptEmployeeInfoController {

	private static final Logger log = Logger.getLogger(ExemptEmployeeInfoController.class);

	@Autowired
	private ExemptTeamMemberService exemptTeamMemberService;

	@Autowired
	private ExemptExployeeInfoReviewOfPastYearController reviewOfPastYear;

	@Autowired
	private NonExemptEmployeeService nonExemptService;

	@Autowired
	private SkillsSelfAssessmentService skillsSelfAssessmentService;

	@Autowired
	private TMPersonalInformationService employeeInfo;

	@Autowired
	private TMPersonalInformationService tmservice;

	@Autowired
	private LoginUser loginUser;

	private String exemptEmpClock, employeeYear;

	String empClockNumber;

	@Autowired
	ServletContext servletContext;

	@InitBinder
	public void initBinder(HttpServletRequest request, HttpServletResponse response) {
		log.info("Start . initBinder......................");

		// String user = (String) request.getSession().getAttribute("active");

		System.out.println("user");

		log.info("End .");
	}

	@RequestMapping(value = "/censusFormDetails", method = RequestMethod.GET)
	public String teamMemberPersonalInfo(Model model, HttpSession session) {

		log.info("censusFormDetails");

		if (session.getAttribute("loginClockNumber") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		try {

			employeeYear = (String) loginUser.getExemptEmployeeYear();

			System.out.println(loginUser);

			System.out.println(loginUser.getExemptEmployeeClock());

			System.out.println("login clock " + loginUser.getClockNumber());

			if (!String.valueOf(loginUser.getExemptEmployeeClock()).equalsIgnoreCase("null")) {

				System.out.println("if");

				empClockNumber = loginUser.getExemptEmployeeClock();

			} else {
				System.out.println("else");
				empClockNumber = (String) loginUser.getClockNumber();
				employeeYear = (String) loginUser.getLoginYear();

			}

			List<CensusForm> employeeDetails = employeeInfo.getEmployeeDetails(String.valueOf(empClockNumber),
					employeeYear.trim());

			for (CensusForm censusForm : employeeDetails) {
				System.out.println("censusForm" + censusForm);

			}
			model.addAttribute("employeeDetails", employeeDetails);
			model.addAttribute("loginUser", loginUser);
		} catch (Exception e) {

			e.printStackTrace();

			model.addAttribute("errorStatus", "your data was not successful updated, please contact IT team.");
			model.addAttribute("loginUser", loginUser);
			return "exemptEmployee";
		}

		return "exemptEmployee";

		// return "review-of-past-year";
	}

	@RequestMapping(value = "/SkillsSelfAssessment", method = RequestMethod.GET)
	public String SkillsSelfAassessment(Model model, HttpSession session) {
		log.info("**** Enter SkillsSelfAssessment Screen Controller ****");
		if (session.getAttribute("loginClockNumber") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		// String year = (String) session.getAttribute("year");
		employeeYear = (String) loginUser.getExemptEmployeeYear();

		if (!String.valueOf(loginUser.getExemptEmployeeClock()).equalsIgnoreCase("null")) {

			System.out.println("if");

			empClockNumber = loginUser.getExemptEmployeeClock();

		} else {
			System.out.println("else");
			empClockNumber = (String) loginUser.getClockNumber();
			employeeYear = (String) loginUser.getLoginYear();

		}

		try {
			log.info(" ::: Enter try getSkillsSelfAssessmentDetails :::");
			List<SkillsSelfAssessment> skillsSelfAssessmentDetails = skillsSelfAssessmentService
					.getSkillsSelfAssessmentDetails(empClockNumber.trim(), employeeYear.trim());

			if (skillsSelfAssessmentDetails.size() == 0) {

				model.addAttribute("imessage", "no validation");
			}

			System.out.println("skillsSelfAssessmentDetails :: " + skillsSelfAssessmentDetails.toString());
			SkillsSelfAssesmentVariables skills = null;
			for (SkillsSelfAssessment s : skillsSelfAssessmentDetails) {
				skills = new SkillsSelfAssesmentVariables();
				System.out.println("yes, i have few records..");
				int i = 0;

				String exemptsection = s.getSection1G1();
				String[] section2b1 = exemptsection.split(",");
				// getting comma seperated values for Section2B2 and set into
				// string
				String exemptsection1 = s.getSection1G2();
				String[] section2b2 = exemptsection1.split(",");
				// getting comma seperated values for Section2B3 and set into
				// string
				String exemptsection2 = s.getSection1G3();
				String[] section2b3 = exemptsection2.split(",");
				DropDownValues manager = new DropDownValues();
				for (String t : section2b1) {
					System.out.println("skill  is::::" + t);
					skills = manager.setFields(skills, t, i);
					i++;
				}
				i = 0;
				for (String t : section2b2) {
					System.out.println("commaSeperatedvalues in waysofworking is::::" + t);
					skills = manager.setFieldsForwaysOfWorking(skills, t, i);
					i++;
				}
				i = 0;
				for (String t : section2b3) {
					System.out.println("Self-Management and Leadership in " + t);
					skills = manager.setFieldsForSelfManagementandLeadership(skills, t, i);
					i++;
				}

				skills.setSection1G4(s.getSection1G4());
				skills.setSection1G5(s.getSection1G5());

				String validatefields = validateFields(skills, model);

			}
			// model.addAttribute("skillsSelfAssessmentDetails",
			// skillsSelfAssessmentDetails);
			// model.addAttribute("success" , "Data Insert successfully !");
			String status = getStatus(empClockNumber, employeeYear.trim());
			model.addAttribute("status", status);

			model.addAttribute("skillsSelfAssessmentDetails", skills);
			model.addAttribute("loginUser", loginUser);
			return "SkillsSelfAssessment";

		} catch (Exception e) {
			e.printStackTrace();
			log.error("error is :: " + e.getMessage());
			// model.addAttribute("successorerror", "Data Not Insert
			// successfully !");
		}
		return "review-of-past-year";
	}

	private String validateFields(SkillsSelfAssesmentVariables skills, Model model) {

		if (String.valueOf(loginUser.getFormSubmissionStatus()).equalsIgnoreCase("null")) {
			if (skills.getSkills1() == null) {

				model.addAttribute("imessage", "no validation");
			}

			if (skills.getSkills2() == null) {

				model.addAttribute("imessage", "no validation");
			}

			if (skills.getSkills3() == null) {

				model.addAttribute("imessage", "no validation");
			}

			if (skills.getSkills4() == null) {

				model.addAttribute("imessage", "no validation");
			}

			if (skills.getSkills5() == null) {

				model.addAttribute("imessage", "no validation");
			}

			if (skills.getSkills6() == null) {

				model.addAttribute("imessage", "no validation");
			}

			if (skills.getSkills7() == null) {

				model.addAttribute("imessage", "no validation");
			}

			if (skills.getSkills8() == null) {

				model.addAttribute("imessage", "no validation");
			}

			if (skills.getSkills9() == null) {

				model.addAttribute("imessage", "no validation");
			}

			if (skills.getSkills10() == null) {

				model.addAttribute("imessage", "no validation");
			}

			// WaysOfWorking1
			if (skills.getWaysOfWorking1() == null) {

				model.addAttribute("imessage", "no validation");
			}
			if (skills.getWaysOfWorking2() == null) {

				model.addAttribute("imessage", "no validation");
			}
			if (skills.getWaysOfWorking3() == null) {

				model.addAttribute("imessage", "no validation");
			}
			if (skills.getWaysOfWorking4() == null) {

				model.addAttribute("imessage", "no validation");
			}
			if (skills.getWaysOfWorking5() == null) {

				model.addAttribute("imessage", "no validation");
			}
			if (skills.getWaysOfWorking6() == null) {

				model.addAttribute("imessage", "no validation");
			}
			if (skills.getWaysOfWorking7() == null) {

				model.addAttribute("imessage", "no validation");
			}

			// SelfManagementandLeadership
			if (skills.getSelfManagementandLeadership1() == null) {

				model.addAttribute("imessage", "no validation");
			}
			if (skills.getSelfManagementandLeadership2() == null) {

				model.addAttribute("imessage", "no validation");
			}

			if (skills.getSelfManagementandLeadership3() == null) {

				model.addAttribute("imessage", "no validation");
			}
			if (skills.getSelfManagementandLeadership4() == null) {

				model.addAttribute("imessage", "no validation");
			}

			if (skills.getSelfManagementandLeadership5() == null) {

				model.addAttribute("imessage", "no validation");
			}
			if (skills.getSelfManagementandLeadership6() == null) {

				model.addAttribute("imessage", "no validation");
			}

			if (skills.getSelfManagementandLeadership7() == null) {

				model.addAttribute("imessage", "no validation");
			}
		}else{
			
			model.addAttribute("imessage", "");
		}
		
		return "";
	}

	// New Added by Narasimha

	@RequestMapping(value = "/getSkillsSelfAssessment", params = "backAndSave", method = RequestMethod.POST)
	public String skillAssessmentBackAndSave(
			@ModelAttribute("SkillsSelfAssesmentVariables") SkillsSelfAssesmentVariables skillsSelfAssessment,
			BindingResult result, Model model, HttpSession session) {

		// String year = (String) session.getAttribute("year");
		if (session.getAttribute("loginClockNumber") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		employeeYear = (String) loginUser.getExemptEmployeeYear();

		if (!String.valueOf(loginUser.getExemptEmployeeClock()).equalsIgnoreCase("null")) {

			System.out.println("if");

			empClockNumber = loginUser.getExemptEmployeeClock();

		} else {
			System.out.println("else");
			empClockNumber = (String) loginUser.getClockNumber();
			employeeYear = (String) loginUser.getLoginYear();

		}

		List<ExemptTeamMember> exempt_TeamMember = exemptTeamMemberService
				.getReviewOfPastYearDetails(empClockNumber.trim(), employeeYear.trim());

		skillAssessmentSave(skillsSelfAssessment, result, model, session);
		/*
		 * if (exempt_TeamMember.size() == 0) {
		 * 
		 * SkillsSelfAassessment( model, session);
		 * model.addAttribute("reviewOfPastYear",
		 * "<h6 style=color:red>All required fields not have not been completed. "
		 * +
		 * " Please check on prior pages if any requirements weren't completed.</h6>"
		 * );
		 * 
		 * return "SkillsSelfAssessment"; }
		 */

		String reviewofPastYear = reviewOfPastYear.reviewOfPastYear(model, session);
		model.addAttribute("loginUser", loginUser);
		return reviewofPastYear;

	}

	@RequestMapping(value = "/getSkillsSelfAssessment", params = "save", method = RequestMethod.POST)
	public String saveButtonToskillAssessment(
			@ModelAttribute("SkillsSelfAssesmentVariables") SkillsSelfAssesmentVariables skillsSelfAssessment,
			BindingResult result, Model model, HttpSession session) {

		// String year = (String) session.getAttribute("year");

		if (session.getAttribute("loginClockNumber") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		employeeYear = (String) loginUser.getExemptEmployeeYear();

		if (!String.valueOf(loginUser.getExemptEmployeeClock()).equalsIgnoreCase("null")) {

			System.out.println("if");

			empClockNumber = loginUser.getExemptEmployeeClock();

		} else {
			System.out.println("else");
			empClockNumber = (String) loginUser.getClockNumber();
			employeeYear = (String) loginUser.getLoginYear();

		}

		List<ExemptTeamMember> exempt_TeamMember = exemptTeamMemberService
				.getReviewOfPastYearDetails(empClockNumber.trim(), employeeYear.trim());

		skillAssessmentSave(skillsSelfAssessment, result, model, session);
		/*
		 * if (exempt_TeamMember.size() == 0) {
		 * 
		 * SkillsSelfAassessment(model, session);
		 * 
		 * model.addAttribute("reviewOfPastYear",
		 * "<h6 style=color:red>All required fields not have not been completed. "
		 * +
		 * " Please check on prior pages if any requirements weren't completed.</h6>"
		 * );
		 * 
		 * return "SkillsSelfAssessment"; }
		 */

		String saveButtonToSkillAssessment = SkillsSelfAassessment(model, session);
		model.addAttribute("loginUser", loginUser);
		return saveButtonToSkillAssessment;

	}

	public String skillAssessmentSave(SkillsSelfAssesmentVariables skillsSelfAssessment, BindingResult result,
			Model model, HttpSession session) {
		if (session.getAttribute("loginClockNumber") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		System.out.println("enter save button to skillAssessmentSave");

		// String employeeYear = (String) session.getAttribute("year");

		employeeYear = (String) loginUser.getExemptEmployeeYear();

		if (!String.valueOf(loginUser.getExemptEmployeeClock()).equalsIgnoreCase("null")) {

			System.out.println("if");

			empClockNumber = loginUser.getExemptEmployeeClock();

		} else {
			System.out.println("else");
			empClockNumber = (String) loginUser.getClockNumber();
			employeeYear = (String) loginUser.getLoginYear();

		}

		skillsSelfAssessment.setEmpClockNumber(Integer.parseInt(empClockNumber.trim()));

		SkillsSelfAssessment skillsSelfAssessmentorm = new SkillsSelfAssessment();

		skillsSelfAssessmentorm.setEmpClockNumber(Integer.parseInt(empClockNumber));

		skillsSelfAssessmentorm
				.setSection1G1(skillsSelfAssessment.getSkills1() + "," + skillsSelfAssessment.getSkills2() + ","
						+ skillsSelfAssessment.getSkills3() + "," + skillsSelfAssessment.getSkills4() + ","
						+ skillsSelfAssessment.getSkills5() + "," + skillsSelfAssessment.getSkills6() + ","
						+ skillsSelfAssessment.getSkills7() + "," + skillsSelfAssessment.getSkills8() + ","
						+ skillsSelfAssessment.getSkills9() + "," + skillsSelfAssessment.getSkills10());
		skillsSelfAssessmentorm.setSection1G2(skillsSelfAssessment.getWaysOfWorking1() + ","
				+ skillsSelfAssessment.getWaysOfWorking2() + "," + skillsSelfAssessment.getWaysOfWorking3() + ","
				+ skillsSelfAssessment.getWaysOfWorking4() + "," + skillsSelfAssessment.getWaysOfWorking5() + ","
				+ skillsSelfAssessment.getWaysOfWorking6() + "," + skillsSelfAssessment.getWaysOfWorking7());
		skillsSelfAssessmentorm.setSection1G3(skillsSelfAssessment.getSelfManagementandLeadership1() + ","
				+ skillsSelfAssessment.getSelfManagementandLeadership2() + ","
				+ skillsSelfAssessment.getSelfManagementandLeadership3() + ","
				+ skillsSelfAssessment.getSelfManagementandLeadership4() + ","
				+ skillsSelfAssessment.getSelfManagementandLeadership5() + ","
				+ skillsSelfAssessment.getSelfManagementandLeadership6() + ","
				+ skillsSelfAssessment.getSelfManagementandLeadership7());

		skillsSelfAssessmentorm.setSection1G4(skillsSelfAssessment.getSection1G4());
		skillsSelfAssessmentorm.setSection1G5(skillsSelfAssessment.getSection1G5());
		skillsSelfAssessmentorm.setAppraisalYear(employeeYear.trim());

		try {

			int year = skillsSelfAssessmentService
					.fetchYearOfAnSkillsSelfAssessment(skillsSelfAssessment.getEmpClockNumber(), employeeYear.trim());

			log.info("Year is :: " + year);

			if (year == 0) {

				// exemptTeamMemberService.updateCensusForm("completed",
				// empClockNumber);
				year = 0;
			} else {

			}

			boolean status = skillsSelfAssessmentService.updateSkillsSelfAssessmentDetails(skillsSelfAssessmentorm,
					year);

			if (status == false) {

				return "SkillsSelfAssessment";
			}

			log.info("update the same clock Number");

			model.addAttribute("successorerror", "Data insert  successfully !");
			model.addAttribute("loginUser", loginUser);
			return "SkillsSelfAssessment";
		} catch (Exception e) {

			e.printStackTrace();
			System.out.println("error :: " + e.getMessage());
			// model.addAttribute("successorerror", "Data Not Insert
			// successfully !");
			return "SkillsSelfAssessment";
		}

	}

	// saveSubmit

	@RequestMapping(value = "/getSkillsSelfAssessment", params = "saveSubmit", method = RequestMethod.POST)
	public String employeesumbmit(
			@ModelAttribute("SkillsSelfAssesmentVariables") SkillsSelfAssesmentVariables skillsSelfAssessment,
			BindingResult result, Model model, HttpSession session) throws AddressException, MessagingException {

		// String employeeYear = (String) session.getAttribute("year");

		List<CensusForm> census = Collections.EMPTY_LIST;

		if (session.getAttribute("loginClockNumber") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}
		employeeYear = (String) loginUser.getExemptEmployeeYear();

		if (!String.valueOf(loginUser.getExemptEmployeeClock()).equalsIgnoreCase("null")) {

			System.out.println("if");

			empClockNumber = loginUser.getExemptEmployeeClock();

		} else {

			System.out.println("else");
			empClockNumber = (String) loginUser.getClockNumber();
			employeeYear = (String) loginUser.getLoginYear();

		}

		List<ExemptTeamMember> exempt_TeamMember = exemptTeamMemberService
				.getReviewOfPastYearDetails(empClockNumber.trim(), employeeYear.trim());

		if (exempt_TeamMember.size() == 0) {

			model.addAttribute("reviewOfPastYear",
					"<h6 style=color:red>Please fill the review of past year screen before you fill this screen.</h6>");

			return "SkillsSelfAssessment";
		}

		skillAssessmentSave(skillsSelfAssessment, result, model, session);

		for (ExemptTeamMember orm : exempt_TeamMember) {

			String formStatus = "valid";

			if (orm.getSection1A().isEmpty() || orm.getSection1A() == null) {

				model.addAttribute("imessage", "novalidation");
				formStatus = "not valid";
			} else if (orm.getSection1C().isEmpty() || orm.getSection1C() == null) {

				model.addAttribute("imessage", "novalidation");
				formStatus = "not valid";
			} else if (orm.getSection1D1().isEmpty() || orm.getSection1D1() == null) {
				formStatus = "not valid";
				model.addAttribute("imessage", "novalidation");
			} else if (orm.getSection1D2().isEmpty() || orm.getSection1D2() == null) {
				formStatus = "not valid";
				model.addAttribute("imessage", "novalidation");
			}

			System.out.println(orm.getSection1B1() + "Section B1");
			System.out.println(orm.getEffectivenessOfB1() + "getEffectivenessOfB1");
			/*if (!String.valueOf(orm.getSection1B1()).equalsIgnoreCase("null") && orm.getSection1B1().trim().isEmpty()==false) {
				System.out.println("list of traing not null");
				if (String.valueOf(orm.getEffectivenessOfB1()).equalsIgnoreCase("null")
						|| orm.getEffectivenessOfB1().trim().isEmpty()==true
						) {
					System.out.println("getEffectivenessOfB1 null");
					formStatus = "not valid";
					model.addAttribute("imessage", "novalidation");
				}

			}

			System.out.println(orm.getSection1B2().trim().isEmpty());
			if (!String.valueOf(orm.getSection1B2().trim()).equalsIgnoreCase("null") && orm.getSection1B2().trim().isEmpty()==false) {
				if (String.valueOf(orm.getEffectivenessOfB2().trim()).equalsIgnoreCase("null")
						|| orm.getEffectivenessOfB2().trim().isEmpty()==true ) {
					formStatus = "not valid";
					model.addAttribute("imessage", "novalidation");
				}
			}

			if ( !String.valueOf(orm.getSection1B3().trim()).equalsIgnoreCase("null") && orm.getSection1B3().trim().isEmpty()==false ) {
				if ( String.valueOf(orm.getEffectivenessOfB3().trim()).equalsIgnoreCase("null")
						|| orm.getEffectivenessOfB3().trim().isEmpty()==true ) {
					formStatus = "not valid";
					model.addAttribute("imessage", "novalidation");
				}
			}
			System.out.println("four");
			

			if (!String.valueOf(orm.getSection1B4().trim()).equalsIgnoreCase("null") && orm.getSection1B4().trim().isEmpty()==false ) {
				if ( String.valueOf(orm.getEffectivenessOfB4().trim()).equalsIgnoreCase("null")
						||orm.getEffectivenessOfB4().trim().isEmpty()==true) {
					formStatus = "not valid";
					model.addAttribute("imessage", "novalidation");
				}
			}*/

			// carrier mobility first radio button.
			 if (String.valueOf(orm.getSection1F1()).isEmpty() || orm.getSection1F1() == null) {
				formStatus = "not valid";
				model.addAttribute("imessage", "novalidation");
			} else if (!String.valueOf(orm.getSection1F1()).isEmpty() && orm.getSection1F1().equalsIgnoreCase("yes")) {

				if (String.valueOf(orm.getSection1F2ONE()).isEmpty() || orm.getSection1F2ONE() == null) {
					formStatus = "not valid";
					model.addAttribute("imessage", "novalidation");
				}

			}

			// carrier mobility second radio button..
			else if (String.valueOf(orm.getSection1F3A()).isEmpty() || orm.getSection1F3A() == null) {
				System.out.println(orm.getSection1F3A());
				formStatus = "not valid";
				model.addAttribute("imessage", "novalidation");
			}

			else if (!String.valueOf(orm.getSection1F3A()).isEmpty()
					&& String.valueOf(orm.getSection1F3A()).equalsIgnoreCase("yes")) {

				if (String.valueOf(orm.getSection1F3B()).isEmpty() || String.valueOf(orm.getSection1F3B1()).isEmpty()
						|| String.valueOf(orm.getSection1F3B2()).isEmpty()) {

					formStatus = "not valid";
					model.addAttribute("imessage", "novalidation");
				}
			}

			SkillsSelfAassessment(model, session);

			if (formStatus.equals("not valid")) {

				loginUser.setFormSubmissionStatus("submitted");
				model.addAttribute("reviewOfPastYear",
						"<h6 style=color:red>All required fields have not been completed. Please verify the required fields have been completed for each page.</h6>");

				return "SkillsSelfAssessment";
			}

		}

		if (exempt_TeamMember.size() == 0) {

			SkillsSelfAassessment(model, session);

			model.addAttribute("reviewOfPastYear",
					"<h6 style=color:red>All required fields have not been completed. Please verify the required fields have been completed for each page.</h6>");

			return "SkillsSelfAssessment";
		}

		// skillAssessmentSave(skillsSelfAssessment, result, model, session);

		// exemptEmpClock = (String) session.getAttribute("exemptEmp");

		exemptTeamMemberService.updateCensusForm("COMPLETED", empClockNumber, employeeYear);

		String formStatus = "COMPLETED";
		String role = "Exempt";

		AppraisalMailConfig mailData = nonExemptService.getEMpMailData(formStatus, role);

		log.info(mailData.getMail_subject());

		List<CensusForm> employeeDetails = tmservice.getEmployeeDetails(empClockNumber, employeeYear.trim());

		for (CensusForm censusForm : employeeDetails) {

			CensusForm supervisorMailId = nonExemptService.getSupervisorMailId(
					String.valueOf(session.getAttribute("loginClockNumber")), "supervisorClockNumber",
					employeeYear.trim());

			String ccEmployee = "";

			System.out.println("contorller send mail");
			// System.out.println(exemptEmpClock);
			System.out.println(supervisorMailId.getEmpEmailAddress() + " to");
			System.out.println(censusForm.getEmpEmailAddress() + " from");

			EmailConfig.getInstance().sendMail(
					mailData.getMail_subject() + " " + censusForm.getEmplastName() + "," + censusForm.getEmpfirstName(),
					mailData.getMail_body(), supervisorMailId.getEmpEmailAddress(), ccEmployee,
					censusForm.getEmpEmailAddress());

		}

		StringBuffer supervisorDashBoard = (StringBuffer) session.getAttribute("employeeRoles");

		String employeeRoles = supervisorDashBoard.toString();

		loginUser.setFormSubmissionStatus("");

		return "loginScreen";
	}

	public String getStatus(String clockNo, String year) {

		System.out.println("get status");

		System.out.println(clockNo);
		System.out.println(year);
		if (String.valueOf(year).equalsIgnoreCase("null")) {

			year = Converters.getCurrentYear();
		}
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

	@RequestMapping(value = "/getSkillsSelfAssessment", params = "partialSubmit", method = RequestMethod.POST)
	public String savePartialData(
			@ModelAttribute("SkillsSelfAssesmentVariables") SkillsSelfAssesmentVariables skillsSelfAssessment,
			BindingResult result, Model model, HttpSession session) {

		// String year = (String) session.getAttribute("year");

		if (session.getAttribute("loginClockNumber") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		employeeYear = (String) loginUser.getExemptEmployeeYear();

		if (!String.valueOf(loginUser.getExemptEmployeeClock()).equalsIgnoreCase("null")) {

			System.out.println("if");

			empClockNumber = loginUser.getExemptEmployeeClock();

		} else {
			System.out.println("else");
			empClockNumber = (String) loginUser.getClockNumber();
			employeeYear = (String) loginUser.getLoginYear();

		}

		List<ExemptTeamMember> exempt_TeamMember = exemptTeamMemberService
				.getReviewOfPastYearDetails(empClockNumber.trim(), employeeYear.trim());

		skillAssessmentSave(skillsSelfAssessment, result, model, session);

		for (ExemptTeamMember orm : exempt_TeamMember) {
			System.out.println(
					String.valueOf("String.valueOf(orm.getSection1F3A()).trim());" + orm.getSection1F3A()).trim());
			System.out.println(" :: Radio button values :::");
			System.out.println("Section1F3A ::: " + String.valueOf(orm.getSection1F3A()).isEmpty());
			String formStatus = "valid";

			if (orm.getSection1A().isEmpty() || orm.getSection1A() == null) {

				model.addAttribute("imessage", "novalidation");
				formStatus = "not valid";
			} else if (orm.getSection1C().isEmpty() || orm.getSection1C() == null) {

				model.addAttribute("imessage", "novalidation");
				formStatus = "not valid";
			} else if (orm.getSection1D1().isEmpty() || orm.getSection1D1() == null) {
				formStatus = "not valid";
				model.addAttribute("imessage", "novalidation");
			} else if (orm.getSection1D2().isEmpty() || orm.getSection1D2() == null) {
				formStatus = "not valid";
				model.addAttribute("imessage", "novalidation");
			}

			// carrier mobility first radio button.
			else if (String.valueOf(orm.getSection1F1()).isEmpty() || orm.getSection1F1() == null) {
				System.out.println("orm.getSection1F1()" + orm.getSection1F1());
				formStatus = "not valid";
				model.addAttribute("imessage", "novalidation");
			} else if (!String.valueOf(orm.getSection1F1().trim()).isEmpty()
					&& String.valueOf(orm.getSection1F1()).equalsIgnoreCase("yes")) {

				if (String.valueOf(orm.getSection1F2ONE()).isEmpty() || orm.getSection1F2ONE() == null) {
					System.out.println("orm.getSection1F2ONE()" + orm.getSection1F2ONE());
					formStatus = "not valid";
					model.addAttribute("imessage", "novalidation");
				}

				if ((orm.getSection1F3B() != null || orm.getOther().trim().isEmpty() == false)
						&& orm.getSection1F3B1() != null && orm.getSection1F3B2() != null) {

				} else {
					formStatus = "not valid";
					model.addAttribute("imessage", "novalidation");

				}

			}

			// carrier mobility second radio button..
			else if (String.valueOf(orm.getSection1F3A()).isEmpty() || orm.getSection1F3A() == null) {
				System.out.println("can u please select second radio button");
				System.out.println("orm.getSection1F3A()" + orm.getSection1F3A());
				formStatus = "not valid";
				model.addAttribute("imessage", "novalidation");
			}

			else if (!String.valueOf(orm.getSection1F3A()).isEmpty()
					&& String.valueOf(orm.getSection1F3A()).equalsIgnoreCase("yes")) {
				System.out.println("u r selecting yes");
				if (String.valueOf(orm.getSection1F3B()).isEmpty() || String.valueOf(orm.getSection1F3B1()).isEmpty()
						|| String.valueOf(orm.getSection1F3B2()).isEmpty() || orm.getSection1F3B() == null
						|| orm.getSection1F3B1() == null || orm.getSection1F3B2() == null) {
					System.out.println("orm.getSection1F3B()" + orm.getSection1F3B());
					System.out.println("orm.getSection1F3B1()" + orm.getSection1F3B1());
					System.out.println("orm.getSection1F3B2()" + orm.getSection1F3B2());
					formStatus = "not valid";
					model.addAttribute("imessage", "novalidation");
				}
			}
			SkillsSelfAassessment(model, session);
			if (formStatus.equals("not valid")) {
				System.out.println("some fields are missing");
				loginUser.setFormSubmissionStatus("submitted");
			//	model.addAttribute("imessage", "novalidation");
				
				model.addAttribute("reviewOfPastYear",
						"<h6 style=color:red>All required fields have not been completed. Please verify the required fields have been completed for each page.</h6>");
				
				
				return "SkillsSelfAssessment";
				
				
			}

		}

		SkillsSelfAassessment(model, session);
		if (exempt_TeamMember.size() == 0) {
			System.out.println("no results found");
			SkillsSelfAassessment(model, session);

			model.addAttribute("reviewOfPastYear",
					"<h6 style=color:red>All required fields have not been completed. Please verify the required fields have been completed for each page.</h6>");

			return "SkillsSelfAssessment";
		}
		
		// in case not started status.
		model.addAttribute("reviewOfPastYear",
				"<h6 style=color:red>All required fields have not been completed. Please verify the required fields have been completed for each page.</h6>");

		String saveButtonToSkillAssessment = SkillsSelfAassessment(model, session);
		model.addAttribute("loginUser", loginUser);
		return saveButtonToSkillAssessment;

	}

}
