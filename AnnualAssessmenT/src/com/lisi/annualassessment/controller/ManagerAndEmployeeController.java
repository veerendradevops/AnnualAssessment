package com.lisi.annualassessment.controller;

import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lisi.annualassessment.emp.form.EncryptDecryptProcess;
import com.lisi.annualassessment.orm.AppraisalMailConfig;
import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.orm.ExemptSection2;
import com.lisi.annualassessment.orm.PresentYearObjectives;
import com.lisi.annualassessment.pojo.ExemptSection2Pojo;
import com.lisi.annualassessment.pojo.LoginUser;
import com.lisi.annualassessment.pojo.ManagerSkillsAssessment;
import com.lisi.annualassessment.service.EmployeeService;
import com.lisi.annualassessment.service.ExemptSection2Service;
import com.lisi.annualassessment.service.ExemptTeamMemberService;
import com.lisi.annualassessment.service.ManagerEmployeeService;
import com.lisi.annualassessment.service.NonExemptEmployeeService;
import com.lisi.annualassessment.service.TMPersonalInformationService;
import com.lisi.annualassessment.util.Converters;
import com.lisi.annualassessment.util.EmailConfig;
import com.lisi.annualassessment.util.Validator;

@Controller
public class ManagerAndEmployeeController {

	private static final Logger log = Logger.getLogger(ManagerAndEmployeeController.class);

	@Autowired
	private ManagerEmployeeService managerEmpService;

	@Autowired
	private ExemptSection2Service exemptSection2Service;

	@Autowired
	private SummaryOfAccomplishmentController summaryOfAccomplishment;

	@Autowired
	private TMPersonalInformationService employeeInfo;

	private String exemptEmpClock, employeeYear;

	@Autowired
	private TMPersonalInformationService tmservice;

	@Autowired
	private LogoutController logoutController;

	@Autowired
	private ExemptEmployeeTMController exemptTmController;
	
	

	@Autowired
	private NonExemptEmployeeService nonExemptService;

	@Autowired
	private ExemptTeamMemberService exemptTeamMemberService;

	@Autowired
	private ExemptEmployeeTMController exemptEmployeeTMController;

	@Autowired
	private EmployeeService empService;

	@Autowired
	private LoginUser loginUser;

	/*
	 * 
	 * present year objective anchor screeen..
	 * 
	 */

	@RequestMapping(value = "/presentYearObjectives", method = RequestMethod.GET)
	public String presentYearObjectivesScreen(Model model, HttpSession session) {

		log.info("present Year Objectives");
		if (session.getAttribute("exemptEmp") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}
		exemptEmpClock = (String) loginUser.getExemptEmployeeClock();
		employeeYear = (String) loginUser.getExemptEmployeeYear();

		log.info(exemptEmpClock);
		try {
			PresentYearObjectives presentYear = managerEmpService.retrievePresentYearObjectives(exemptEmpClock.trim(),
					employeeYear.trim());

			log.info(presentYear);

			String status = getStatus(exemptEmpClock, employeeYear);
			model.addAttribute("status", status);
			model.addAttribute("loginUser", loginUser);
			model.addAttribute("presentYearObjectives", presentYear);
		} catch (Exception e) {
			model.addAttribute("loginUser", loginUser);
			e.printStackTrace();
		}

		return "presentYearObjectives";
	}

	@RequestMapping(value = "/presentYearObjectivesAction", params = "nextAndSave", method = RequestMethod.POST)
	public String presentYearObjectivesNextAndSave(
			@ModelAttribute("presentYearObjectives") PresentYearObjectives presentYearObjectives, BindingResult br,
			Model model, HttpSession session) {
		if (session.getAttribute("exemptEmp") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		presentYearObjectives(presentYearObjectives, model, session);

		log.info("present year Next and save");

		return "goalsForNextYear";
	}

	// newly add by verinon

	@RequestMapping(value = "/presentYearObjectivesAction", params = "backAndSave", method = RequestMethod.POST)
	public String presentYearObjectivesBackAndSave(
			@ModelAttribute("presentYearObjectives") PresentYearObjectives presentYearObjectives, BindingResult br,
			Model model, HttpSession session) {
		log.info("present year back and save");
		if (session.getAttribute("exemptEmp") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		presentYearObjectives(presentYearObjectives, model, session);

		// ExemptSection2Pojo exemptSection2Pojo;
		ExemptSection2Pojo exemptSection2Pojo = new ExemptSection2Pojo();

		summaryOfAccomplishment.retriveAssessmentSummaryN(exemptSection2Pojo, model, session);
		model.addAttribute("loginUser", loginUser);
		return "assessmentsummary";
	}

	private void presentYearObjectives(PresentYearObjectives presentYearObjectives, Model model, HttpSession session) {

		exemptEmpClock = (String) loginUser.getExemptEmployeeClock();
		employeeYear = (String) loginUser.getExemptEmployeeYear();

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
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("devgoals", presentYear);
	}

	/*
	 * 
	 * developmentGoalsScreen anchor screeen..
	 * 
	 */

	@RequestMapping(value = "/developmentGoalsScreen")
	public String developmentGoalsScreen(Model model, HttpSession session) {

		log.info("present Year Objectives screen");
		if (session.getAttribute("exemptEmp") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}
		exemptEmpClock = (String) loginUser.getExemptEmployeeClock();
		employeeYear = (String) loginUser.getExemptEmployeeYear();

		log.info(exemptEmpClock);

		String currentYearfromUser = "";
		PresentYearObjectives presentYear = managerEmpService.retrievePresentYearObjectives(exemptEmpClock.trim(),
				employeeYear.trim());

		String status = getStatus(exemptEmpClock, employeeYear);
		model.addAttribute("status", status);

		model.addAttribute("loginUser", loginUser);
		model.addAttribute("devgoals", presentYear);

		return "goalsForNextYear";
	}

	@RequestMapping(value = "/developmentGoals", params = "backAndSave", method = RequestMethod.POST)
	public String developmentBacktAndSave(@ModelAttribute("devlopmentGoals") PresentYearObjectives devlopmentGoals,
			BindingResult br, Model model, HttpSession session) {

		log.info("Develpopment Goals for Next Year");
		if (session.getAttribute("exemptEmp") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		String returnPage = developmentGoalsAction(devlopmentGoals, model, session);

		if (returnPage.equalsIgnoreCase("goalsForNextYear")) {

			return "goalsForNextYear";
		}

		String presentYearObjectivesScreen = presentYearObjectivesScreen(model, session);
		model.addAttribute("loginUser", loginUser);
		return "presentYearObjectives";
	}

	@RequestMapping(value = "/developmentGoals", params = "nextAndSave", method = RequestMethod.POST)
	public String developmentNextAndSave(@ModelAttribute("devlopmentGoals") PresentYearObjectives devlopmentGoals,
			BindingResult br, Model model, HttpSession session) {

		log.info("Develpopment Goals for Next Year");

		String returnPage = developmentGoalsAction(devlopmentGoals, model, session);
		model.addAttribute("loginUser", loginUser);
		return returnPage;
	}

	public String developmentGoalsAction(PresentYearObjectives devlopmentGoals, Model model, HttpSession session) {

		if (session.getAttribute("exemptEmp") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		exemptEmpClock = (String) loginUser.getExemptEmployeeClock();
		employeeYear = (String) loginUser.getExemptEmployeeYear();

		log.info(exemptEmpClock);

		String currentYearfromUser = "";
		try {

			devlopmentGoals.setEmpClockNumber(Integer.parseInt(exemptEmpClock.trim()));
			devlopmentGoals.setAnnaulYear(employeeYear.trim());

			// updating the record..
			PresentYearObjectives presentYear = managerEmpService.retrievePresentYearObjectives(exemptEmpClock.trim(),
					employeeYear.trim());

			if (presentYear == null) {/*
										 * 
										 * log.info(
										 * "present year is null, so please insert the objective screen"
										 * );
										 * 
										 * String error =
										 * "<h6 style=color:red>please insert data first in the objectives screes.</h6>"
										 * ;
										 * 
										 * model.addAttribute("objscreen",
										 * error); log.info("if " +
										 * presentYear); currentYearfromUser =
										 * ""; return "goalsForNextYear";
										 */
				currentYearfromUser = "";
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

		if (session.getAttribute("exemptEmp") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		log.info("metting screen");

		exemptEmpClock = (String) loginUser.getExemptEmployeeClock();
		employeeYear = (String) loginUser.getExemptEmployeeYear();

		log.info(exemptEmpClock);
		PresentYearObjectives presentYear = managerEmpService.retrievePresentYearObjectives(exemptEmpClock.trim(),
				employeeYear);

		String status = getStatus((String) session.getAttribute("exemptEmp"), (String) session.getAttribute("year"));
		model.addAttribute("status", status);

		model.addAttribute("meetingsummary", presentYear);
		model.addAttribute("loginUser", loginUser);
		return "meetingsummary";
	}

	@RequestMapping(value = "/meetingsummary", params = "backAndSave", method = RequestMethod.POST)
	public String meetingSummaryBackAndNext(@ModelAttribute("meetingsummary") PresentYearObjectives devlopmentGoals,
			BindingResult br, Model model, HttpSession session) {

		// String meetingResult = meetingSummaryAction(devlopmentGoals, model,
		// session);
		String developmentGoalsScreen = developmentGoalsScreen(model, session);

		return developmentGoalsScreen;
	}

	@RequestMapping(value = "/meetingsummary", params = "save", method = RequestMethod.POST)
	public String meetingSummarySaveAndNext(@ModelAttribute("meetingsummary") PresentYearObjectives devlopmentGoals,
			BindingResult br, Model model, HttpSession session) {

		if (session.getAttribute("exemptEmp") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		log.info("meetingSummarySaveAndNext");

		String meetingResult = meetingSummaryAction(devlopmentGoals, model, session);

		meetingSummary(model, session);
		model.addAttribute("loginUser", loginUser);
		return "meetingsummary";

		// return meetingResult;
	}

	// completed

	private String meetingSummaryAction(PresentYearObjectives devlopmentGoals, Model model, HttpSession session) {

		if (session.getAttribute("exemptEmp") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}
		exemptEmpClock = (String) loginUser.getExemptEmployeeClock();
		employeeYear = (String) loginUser.getExemptEmployeeYear();

		log.info(exemptEmpClock);

		String currentYearfromUser = "";

		try {

			devlopmentGoals.setEmpClockNumber(Integer.parseInt(exemptEmpClock.trim()));
			devlopmentGoals.setAnnaulYear(employeeYear.trim());

			// updating the record..
			PresentYearObjectives presentYear = managerEmpService.retrievePresentYearObjectives(exemptEmpClock.trim(),
					employeeYear.trim());

			if (presentYear == null) {

				// exemptTeamMemberService.updateCensusForm("SUBMITED TO
				// MANAGER", exemptEmpClock.trim());
			}

			model.addAttribute("presentYearObjectives", presentYear);

			log.info("database year");
			log.info(currentYearfromUser);

			managerEmpService.updateMeetingSummary(devlopmentGoals);
			model.addAttribute("loginUser", loginUser);
			model.addAttribute("meetingsummary", presentYear);
		} catch (Exception e) {

			model.addAttribute("loginUser", loginUser);
			e.printStackTrace();

			// meeting summary errors

			return "meetingsummary";
		}

		// return "managerScreen"
		return "acknowledgment";

	}

	@RequestMapping(value = "/meetingsummary", params = "completed", method = RequestMethod.POST)
	public String managerCompleted(@ModelAttribute("meetingsummary") PresentYearObjectives devlopmentGoals,
			BindingResult br, Model model, HttpSession session) {

		/*
		 * log.info("managercompleted");
		 * 
		 * exemptEmpClock = (String) session.getAttribute("exemptEmp");
		 * employeeYear = (String) session.getAttribute("year");
		 * 
		 * PresentYearObjectives presentYear =
		 * managerEmpService.retrievePresentYearObjectives(exemptEmpClock.trim()
		 * , employeeYear.trim());
		 * 
		 * String meetingResult = meetingSummaryAction(devlopmentGoals, model,
		 * session);
		 * 
		 * // if(presentYear==null){
		 * 
		 * exemptTeamMemberService.updateCensusForm("MANAGER COMPLETED",
		 * exemptEmpClock.trim()); // }
		 * 
		 * logoutController.backController(model, session);
		 */

		// return "managerScreen";

		acknowledgmentSection(model, session);
		model.addAttribute("loginUser", loginUser);
		return "acknowledgment";
	}

	@RequestMapping(value = "/acknowledgmentScreen", method = RequestMethod.GET)
	public String acknowledgmentSection(Model model, HttpSession session) {

		exemptEmpClock = (String) loginUser.getExemptEmployeeClock();
		employeeYear = (String) loginUser.getExemptEmployeeYear();

		if (session.getAttribute("loginClockNumber") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		System.out.println("Enter acknowledgmentScreen :: " + exemptEmpClock);

		try {
			List<CensusForm> employeeList = tmservice.getEmployeeDetails(exemptEmpClock, employeeYear.trim());

			String loginClockNumber = String.valueOf(session.getAttribute("loginClockNumber"));

			log.info("LoginClock : " + loginClockNumber);
			model.addAttribute("logonClockNumber", loginClockNumber);
			String exemptHrManagerClock = "";
			for (CensusForm census : employeeList) {

				exemptHrManagerClock = String.valueOf(census.getHrManagerClockNumber());
			}

			log.info("exempthr " + exemptHrManagerClock);

			model.addAttribute("exemptHr", exemptHrManagerClock);
			System.out.println("employeeList ::: " + employeeList);

			model.addAttribute("loginUser", loginUser);

			model.addAttribute("employeeList", employeeList);
		} catch (Exception e) {
			log.info("im in catch..");
			model.addAttribute("loginUser", loginUser);

			e.printStackTrace();
		}

		return "acknowledgment";
	}
	// acknowledgmentPage

	@RequestMapping(value = "/acknowledgmentScreenNext", method = RequestMethod.GET)
	public String acknowledgmentSectionNext(Model model, HttpSession session) {

		acknowledgmentSection(model, session);
		model.addAttribute("loginUser", loginUser);
		return "acknowledgment";
	}

	@RequestMapping(value = "/acknowledgmentPage", params = "submit", method = RequestMethod.GET)
	public String acknowledgmentSubmitPage(Model model, HttpSession session)
			throws AddressException, MessagingException {

		loginUser.setFormSubmissionStatus("null");
		acknowledgmentSection(model, session);
		System.out.println("acknowledgmentPage");

		loginUser.setFormSubmissionStatus("submitted");
		List<ExemptSection2> retrivedata = Collections.EMPTY_LIST;

		exemptEmpClock = (String) loginUser.getExemptEmployeeClock();
		employeeYear = (String) loginUser.getExemptEmployeeYear();
		model.addAttribute("loginUser", loginUser);
		if (session.getAttribute("exemptEmp") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		PresentYearObjectives presentYear = managerEmpService.retrievePresentYearObjectives(exemptEmpClock.trim(),
				employeeYear.trim());

		if (presentYear != null) {

			if (Integer.parseInt(presentYear.getOverallScore().trim()) != 100) {

				acknowledgmentSection(model, session);
				model.addAttribute("email", "<h6 style=color:red>Please fill all the MANAGER screens </h6>");
				loginUser.setFormSubmissionStatus("submitted");
				return "acknowledgment";
			}
		}

		retrivedata = exemptSection2Service.retriveObjectAchievementData(exemptEmpClock.trim(), employeeYear.trim());

		if (retrivedata.size() == 0 || retrivedata.isEmpty()) {

			model.addAttribute("email", "<h6 style=color:red>Please fill all the MANAGER screens </h6>");

			acknowledgmentSection(model, session);
			loginUser.setFormSubmissionStatus("submitted");
			return "acknowledgment";

		}

		if (retrivedata.size() == 1) {

			ExemptSection2Pojo exemptsection2pojo = new ExemptSection2Pojo();
			String validation = fillExemptSection3Retrive(exemptsection2pojo, model, session);

			System.out.println("validation " + validation);

			if (validation.equalsIgnoreCase("no validation")) {

				System.out.println("ExemptSection3 is null");

				model.addAttribute("email", "<h6 style=color:red>Please fill all the MANAGER screens</h6>");

				acknowledgmentSection(model, session);
				loginUser.setFormSubmissionStatus("submitted");
				return "acknowledgment";
			}

		}

		System.out.println("checking ExemptSection3 screen is filled or not.");

		if (presentYear == null) {

			System.out.println("ExemptSection3 is null");

			model.addAttribute("email", "<h6 style=color:red>Please fill all the MANAGER screens</h6>");

			acknowledgmentSection(model, session);
			loginUser.setFormSubmissionStatus("submitted");
			return "acknowledgment";

		}

		String response = new Validator().validateExemptSection(retrivedata, model, loginUser);

		if (response.equalsIgnoreCase("no validation")) {

			model.addAttribute("email", "<h6 style=color:red>Please fill all the MANAGER screens</h6>");

			acknowledgmentSection(model, session);
			loginUser.setFormSubmissionStatus("submitted");
			return "acknowledgment";

		}

		/*
		 * ExemptSection2Pojo exemptSection2Pojo=new ExemptSection2Pojo();
		 * exemptTmController.retriveAssessmentSummaryN( exemptSection2Pojo,
		 * model, session);
		 */

		loginUser.setFormSubmissionStatus("submitted");

		exemptTeamMemberService.updateCensusForm("MANAGER COMPLETED", exemptEmpClock.trim(), employeeYear.trim());

		String loginClock = (String) session.getAttribute("loginClockNumber");

		CensusForm supervisor = empService.getLoginEmployeeDetails(Integer.parseInt(loginClock), "",
				employeeYear.trim());

		String formStatus = "MANAGER COMPLETED";
		String role = "Exempt";

		AppraisalMailConfig mailData = nonExemptService.getEMpMailData(formStatus, role);

		log.info(mailData.getMail_subject());

		List<CensusForm> employeeDetails = tmservice.getEmployeeDetails(exemptEmpClock, employeeYear.trim());

		for (CensusForm censusForm : employeeDetails) {

			CensusForm supervisorMailId = nonExemptService.getSupervisorMailId(
					exemptEmpClock.trim(), "hrGeneralistClockNumber", employeeYear.trim());

			CensusForm hrManager = nonExemptService.getSupervisorMailId(
					exemptEmpClock.trim(), "hrManagerClockNumber", employeeYear.trim());

			try {

				System.out.println("to : "+hrManager.getEmpEmailAddress() );
				System.out.println("cc : "+ supervisorMailId.getEmpEmailAddress());
				System.out.println("from : " + supervisor.getEmpEmailAddress());
				
				EmailConfig.getInstance().sendMail(
						mailData.getMail_subject() + " " + censusForm.getEmplastName() + ","
								+ censusForm.getEmpfirstName(),
						mailData.getMail_body(), hrManager.getEmpEmailAddress(), supervisorMailId.getEmpEmailAddress(),
						supervisor.getEmpEmailAddress());

			} catch (Exception e) {

				if (e.getMessage().contains("javax.mail.MessagingException: Could not connect to SMTP host")) {

					model.addAttribute("email", "failed to send mail");

					return "acknowledgment";
				}
			}
		}

		logoutController.backController(model, session);

		return "managerScreen";
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

	@RequestMapping(value = "/managerStatusExempt", method = RequestMethod.GET)
	public String getManagerStatus(@RequestParam("managerStatus") String managerStatus, HttpSession session,
			Model model) throws AddressException, MessagingException {

		System.out.println("This is getManagerStatus method.. ");
		if (session.getAttribute("exemptEmp") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		String loginClockId = (String) session.getAttribute("loginClockNumber");

		exemptEmpClock = (String) loginUser.getExemptEmployeeClock();
		employeeYear = (String) loginUser.getExemptEmployeeYear();

		model.addAttribute("loginUser", loginUser);

		if (String.valueOf(exemptEmpClock).equalsIgnoreCase("null")) {

			return "loginScreen";
		}

		if (managerStatus.equalsIgnoreCase("managerApproved")) {
			System.out.println("IF block.....");

			exemptTeamMemberService.updateCensusForm("HR APPROVED", exemptEmpClock, employeeYear.trim());

			String formStatus = "HR APPROVED";
			String role = "Exempt";

			AppraisalMailConfig mailData = nonExemptService.getEMpMailData(formStatus, role);

			log.info(mailData.getMail_subject());

			List<CensusForm> employeeDetails = tmservice.getEmployeeDetails(exemptEmpClock, employeeYear.trim());

			for (CensusForm censusForm : employeeDetails) {

				CensusForm supervisorMailId = nonExemptService.getSupervisorMailId(exemptEmpClock,
						"supervisorClockNumber", employeeYear.trim());
				// hrManagerClockNumber
			/*	CensusForm hrManagerClockNumber = nonExemptService.getSupervisorMailId(exemptEmpClock,
						"hrManagerClockNumber", employeeYear.trim());*/
				

				CensusForm hrManagerClockNumber = empService.getLoginEmployeeDetails(Integer.parseInt(loginUser.getClockNumber()), "",
						loginUser.getLoginYear().trim());
				String ccAddress = "";

				try {
					System.out.println("emails");
					log.info(hrManagerClockNumber.getEmpEmailAddress() + " hr mail");
					log.info(supervisorMailId.getEmpEmailAddress() + " supervisor");
					log.info("test");
					EmailConfig.getInstance().sendMail(
							mailData.getMail_subject() + " " + censusForm.getEmplastName() + ","
									+ censusForm.getEmpfirstName(),
							mailData.getMail_body(), supervisorMailId.getEmpEmailAddress(), ccAddress,
							hrManagerClockNumber.getEmpEmailAddress());

				} catch (Exception e) {

					if (e.getMessage().contains("javax.mail.MessagingException: Could not connect to SMTP host")) {

						model.addAttribute("email", "failed to send mail");

						return "acknowledgment";
					}
				}
			}

		} else {

			exemptTeamMemberService.updateCensusForm("COMPLETED", exemptEmpClock, employeeYear.trim());

			String formStatus = "HR REJECTED";
			String role = "Exempt";

			AppraisalMailConfig mailData = nonExemptService.getEMpMailData(formStatus, role);

			log.info(mailData.getMail_subject());

			List<CensusForm> employeeDetails = tmservice.getEmployeeDetails(exemptEmpClock, employeeYear.trim());

			for (CensusForm censusForm : employeeDetails) {

				CensusForm supervisorMailId = nonExemptService.getSupervisorMailId(exemptEmpClock,
						"supervisorClockNumber", employeeYear.trim());
				String ccAddress = "";
				// hrManagerClockNumber
			/*	CensusForm hrManagerClockNumber = nonExemptService.getSupervisorMailId(exemptEmpClock.trim(),
						"hrManagerClockNumber", employeeYear.trim());*/
				
				CensusForm hrManagerClockNumber = empService.getLoginEmployeeDetails(Integer.parseInt(loginUser.getClockNumber()), "",
						loginUser.getLoginYear().trim());
				try {
					System.out.println("emails");
					log.info(hrManagerClockNumber.getEmpEmailAddress());
					log.info(supervisorMailId.getEmpEmailAddress());

					EmailConfig.getInstance().sendMail(
							mailData.getMail_subject() + " " + censusForm.getEmplastName() + ","
									+ censusForm.getEmpfirstName(),
							mailData.getMail_body(), supervisorMailId.getEmpEmailAddress(), ccAddress,
							hrManagerClockNumber.getEmpEmailAddress());

				} catch (Exception e) {

					if (e.getMessage().contains("javax.mail.MessagingException: Could not connect to SMTP host")) {

						model.addAttribute("email", "failed to send mail");

						return "acknowledgment";
					}
				}
			}

			System.out.println("else block.....");
		}

		// logoutController.backController(model, session);

		logoutController.hrDashboard(loginClockId, session, model);

		return "hrDashboard";
	}

	// salary-review page
	@RequestMapping(value = "/salaryreviewpage", method = RequestMethod.GET)
	public String salaryReviewPage(Model model, HttpSession session) {

		exemptEmpClock = (String) loginUser.getExemptEmployeeClock();
		employeeYear = (String) loginUser.getExemptEmployeeYear();

		try{
		System.out.println("Enter salaryReviewPage ::: ");
		if (String.valueOf(exemptEmpClock).equalsIgnoreCase("null")) {

			return "loginScreen";
		}

		model.addAttribute("loginUser", loginUser);
		CensusForm employeeDetails = employeeInfo.getEmployeeForm(String.valueOf(exemptEmpClock), employeeYear.trim());

		employeeDetails.setMinValue(EncryptDecryptProcess.decryptTechnique(employeeDetails.getMinValue()));
		employeeDetails.setMidValue(EncryptDecryptProcess.decryptTechnique(employeeDetails.getMidValue()));
		employeeDetails.setMaxValue(EncryptDecryptProcess.decryptTechnique(employeeDetails.getMaxValue()));
		employeeDetails
				.setCurrentHrlyRate(EncryptDecryptProcess.decryptTechnique(employeeDetails.getCurrentHrlyRate()));
		employeeDetails.setAnnaulRate(EncryptDecryptProcess.decryptTechnique(employeeDetails.getAnnaulRate()));
		employeeDetails
				.setNextYearHourlyRate(EncryptDecryptProcess.decryptTechnique(employeeDetails.getNextYearHourlyRate()));
		employeeDetails
				.setNextYearAnnualRate(EncryptDecryptProcess.decryptTechnique(employeeDetails.getNextYearAnnualRate()));

		model.addAttribute("empDetail", employeeDetails);

		if (String.valueOf(employeeDetails.getNextYearHourlyRate()).equalsIgnoreCase("null")
				|| employeeDetails.getNextYearHourlyRate().isEmpty()) {

			model.addAttribute("nextYearHourlyRate", "null");
		} else {

			model.addAttribute("nextYearHourlyRate",
					EncryptDecryptProcess.decryptTechnique(employeeDetails.getNextYearHourlyRate()));
		}

		if (String.valueOf(employeeDetails.getNextYearAnnualRate()).equalsIgnoreCase("null")
				|| employeeDetails.getNextYearAnnualRate().isEmpty()) {

			model.addAttribute("nextYearAnnualRate", "null");
		} else {

			model.addAttribute("nextYearAnnualRate",
					EncryptDecryptProcess.decryptTechnique(employeeDetails.getNextYearAnnualRate()));

		}
		if (String.valueOf(employeeDetails.getPercentageOfIncrease()).equalsIgnoreCase("null")
				|| employeeDetails.getPercentageOfIncrease().isEmpty()) {
			model.addAttribute("percentageOfIncrease", "null");
		} else {
			model.addAttribute("percentageOfIncrease", employeeDetails.getPercentageOfIncrease());
		}

		}
		catch(Exception e){
		
			model.addAttribute("loginUser", loginUser);
			return "salaryreview";
		}
		// String salaryreview;
		return "salaryreview";
	}

	@RequestMapping(value = "/salaryreview", params = "submit", method = RequestMethod.POST)
	public String salaryReviewPageSubmit(Model model, HttpSession session, CensusForm employee) {

		exemptEmpClock = (String) loginUser.getExemptEmployeeClock();
		employeeYear = (String) loginUser.getExemptEmployeeYear();

		try{
		System.out.println("Enter salaryReviewPageSubmit :: ");
		if (String.valueOf(exemptEmpClock).equalsIgnoreCase("null")) {

			return "loginScreen";
		}
		model.addAttribute("loginUser", loginUser);
		System.out.println("getPercentageOfIncrease :: " + employee.getPercentageOfIncrease());
		System.out.println("getNextYearHourlyRate :: " + employee.getNextYearHourlyRate());
		System.out.println("getNextYearAnnualRate :: " + employee.getNextYearAnnualRate());

		String percentage = employee.getPercentageOfIncrease();

		if (employee.getNextYearHourlyRate().contains("$")) {
			System.out.println("In IF Condition::::::::::::" + employee.getNextYearHourlyRate());
			String hourlyRate = employee.getNextYearHourlyRate().replace("$", "");
			System.out.println(hourlyRate);
			String nxtHrlyRate = EncryptDecryptProcess.encryptTechnique(hourlyRate.trim());
			employee.setNextYearHourlyRate(nxtHrlyRate);
		} else {
			double inputValue = Double.parseDouble(employee.getNextYearHourlyRate().trim());
			String encryptValue = String.valueOf(inputValue);
			String encryptTechnique = EncryptDecryptProcess.encryptTechnique(String.valueOf(encryptValue));
			System.out.println("Final Encrypt for given input value:::" + inputValue + ":::" + encryptTechnique);
			employee.setNextYearHourlyRate(encryptTechnique);
		}

		if (employee.getNextYearAnnualRate().contains("$")) {
			System.out.println("In IF Condition::::::::::::" + employee.getNextYearAnnualRate());
			String annualRate = employee.getNextYearAnnualRate().replace("$", "");
			String nxtAnnualRate = EncryptDecryptProcess.encryptTechnique(annualRate.trim());
			System.out.println(nxtAnnualRate);
			employee.setNextYearAnnualRate(nxtAnnualRate);
		} else {

			double inputValue = Double.parseDouble(employee.getNextYearAnnualRate().trim());
			String encryptValue = String.valueOf(inputValue);
			String encryptTechnique = EncryptDecryptProcess.encryptTechnique(String.valueOf(encryptValue));
			System.out.println("Final Encrypt for given input value:::" + inputValue + ":::" + encryptTechnique);
			employee.setNextYearAnnualRate(encryptTechnique);

		}

		employeeInfo.insertSalaryReview(employee, exemptEmpClock, employeeYear);

		model.addAttribute("employeeDetails", employee);
		salaryReviewPage(model, session);
		}
		catch(Exception e){
			
			model.addAttribute("error", "Data was not sucessfully updated.");
			model.addAttribute("employeeDetails", employee);
			salaryReviewPage(model, session);
			model.addAttribute("loginUser", loginUser);
			return "salaryreview";
		}
		return "salaryreview";
	}

	// exempt section 2 tester..

	public String fillExemptSection3Retrive(ExemptSection2Pojo exemptsection2pojo, Model model, HttpSession session) {
		log.info("fillExemptSection3");
		model.addAttribute("loginUser", loginUser);
		String validate = "";
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

			System.out.println(retrivedata);

			for (ExemptSection2 exemptSection2pojo : retrivedata) {
				exemptorm = new ExemptSection2();
				System.out.println(String.valueOf(exemptSection2pojo.getSection2B1()));
			int section1count=0;
			int section2count=0;
			int section3count=0;

				System.out.println(exemptSection2pojo.getSection2B2());
				System.out.println(exemptSection2pojo.getSection2B3());
				System.out.println(exemptSection2pojo.getSection2B1());

				String section2B1 = exemptSection2pojo.getSection2B1().replaceAll(",", "");
				String section2B2 = exemptSection2pojo.getSection2B2().replaceAll(",", "");
				String section2B3 = exemptSection2pojo.getSection2B3().replaceAll(",", "");

				if (section2B1.isEmpty() == true || section2B2.isEmpty() == true || section2B3.isEmpty() == true) {

					return "no validation";
				}

				/*
				 * if
				 * ((!String.valueOf(exemptsection2pojo.getSection2B1()).isEmpty
				 * () || !String.valueOf(exemptSection2pojo.getSection2B1()).
				 * equalsIgnoreCase("null")) &&
				 * (!String.valueOf(exemptSection2pojo.getSection2B2()).
				 * equalsIgnoreCase("null") ||
				 * !String.valueOf(exemptsection2pojo.getSection2B2().trim()).
				 * isEmpty()) &&
				 * (!String.valueOf(exemptSection2pojo.getSection2B3()).
				 * equalsIgnoreCase("null") ||
				 * !String.valueOf(exemptsection2pojo.getSection2B3().trim()).
				 * isEmpty())) {
				 * 
				 * }
				 */
				
				int totalScore = 0;

				if (exemptSection2pojo != null) {
					System.out.println("exemptSection2 :: " + exemptSection2pojo.getSection2A1Level());

					totalScore += exemptSection2pojo.getSection2A1Level();

					totalScore += exemptSection2pojo.getSection2A2Level();
					totalScore += exemptSection2pojo.getSection2A3Level();
					totalScore += exemptSection2pojo.getSection2A4Level();
					totalScore += exemptSection2pojo.getSection2A5Level();

					System.out.println(loginUser.getFormSubmissionStatus());
					System.out.println(totalScore + " total score");

				}

				if (totalScore != 100) {

					

					//	model.addAttribute("imessage", "no validation");
						
						return "no validation";
				
				}
				if(exemptSection2pojo.getSection2CSummeryStrength().isEmpty() || exemptSection2pojo.getSection2CSummeryImprovement().isEmpty() ||
						exemptSection2pojo.getSection2DSummeryOfAccomplishmentAndAreasImprovement().isEmpty() || 
						exemptSection2pojo.getSection2EAssessmentSummary().isEmpty() ||exemptSection2pojo.getSection2EAssessmentcompared().isEmpty()){
					
					return "no validation";
				}
				

				System.out.println(exemptSection2pojo.getSection2B2());
				System.out.println(exemptSection2pojo.getSection2B3());
				System.out.println(exemptSection2pojo.getSection2B1());

				System.out.println("exemptSection2cur :: " + exemptSection2pojo.getSection2A1Level());
				System.out.println("exemptSection2skillcur :: " + exemptSection2pojo.getSection2B1());
				// getting comma seperated values for Section2B1 and set
				// into
				// string
				String exemptsection = exemptSection2pojo.getSection2B1();
				String[] section2b1 = exemptsection.split(",");
				for(String section2b1data:section2b1){
					if(String.valueOf(section2b1data).isEmpty()||String.valueOf(section2b1data).equals(" ")){
						
					}
					else{
						section1count++;
					}
				}

				System.out.println(section2b1.length);
				// getting comma seperated values for Section2B2 and set
				// into
				// string
				String exemptsection1 = exemptSection2pojo.getSection2B2();
				String[] section2b2 = exemptsection1.split(",");
				
				for(String section2b2data:section2b2){
					if(String.valueOf(section2b2data).isEmpty()||String.valueOf(section2b2data).equals(" ")){
						
					}
					else{
						section2count++;
					}
				}
				// getting comma seperated values for Section2B3 and set
				// into
				// string
				String exemptsection2 = exemptSection2pojo.getSection2B3();
				String[] section2b3 = exemptsection2.split(",");
				for(String section2b3data:section2b3){
					if(String.valueOf(section2b3data).isEmpty()||String.valueOf(section2b3data).equals(" ")){
						
					}
					else{
						section3count++;
					}
				}
				System.out.println("section2b1" + section2b1);
				ManagerSkillsAssessment manager = new ManagerSkillsAssessment();
				System.out.println(section2b1.length);
				System.out.println(section2b1.toString());
				System.out.println("length");
				System.out.println(section2b2.length);
				System.out.println("LenghtCheck"+section2b3.length);
				
				
				if (section1count != 10 || section2count!= 7 || section3count != 7) {

					return "no validation";
				}

				
				
				/*
				 * } else {
				 * 
				 * return "no validation"; }
				 */

				// validating the user. 

				String status = getStatus(exemptEmpClock, employeeYear);
				model.addAttribute("status", status);
				model.addAttribute("loginUser", loginUser);
				model.addAttribute("skill1", exemptorm);
				// commaSeperated.add(exemptorm);
				System.out.println(validate);
			}
			return validate;
		} catch (Exception e) {
			model.addAttribute("loginUser", loginUser);
			e.printStackTrace();
		}
		return validate;
	}

	@RequestMapping(value = "/presentYearObjectivesAction", params = "save", method = RequestMethod.POST)
	public String presentYearObjectivesSave(
			@ModelAttribute("presentYearObjectives") PresentYearObjectives presentYearObjectives, BindingResult br,
			Model model, HttpSession session) {
		if (session.getAttribute("exemptEmp") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		presentYearObjectives(presentYearObjectives, model, session);
		presentYearObjectivesScreen(model, session);
		log.info("present year Save");

		return "presentYearObjectives";
	}

	@RequestMapping(value = "/developmentGoals", params = "save", method = RequestMethod.POST)
	public String developmentSave(@ModelAttribute("devlopmentGoals") PresentYearObjectives devlopmentGoals,
			BindingResult br, Model model, HttpSession session) {

		log.info("Develpopment Goals for Next Year Save method");
		if (session.getAttribute("exemptEmp") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		String returnPage = developmentGoalsAction(devlopmentGoals, model, session);

		developmentGoalsScreen(model, session);
		return "goalsForNextYear";
	}

}
