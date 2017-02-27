package com.lisi.annualassessment.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
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
import com.lisi.annualassessment.orm.ExemptTeamMember;
import com.lisi.annualassessment.pojo.DropDownValues;
import com.lisi.annualassessment.pojo.ExemptTeamMemberPojo;
import com.lisi.annualassessment.pojo.ExemptTeamMemberPojoVariables;
import com.lisi.annualassessment.pojo.LoginUser;
import com.lisi.annualassessment.service.ExemptTeamMemberService;
import com.lisi.annualassessment.service.NonExemptEmployeeService;
import com.lisi.annualassessment.service.SkillsSelfAssessmentService;
import com.lisi.annualassessment.service.TMPersonalInformationService;
import com.lisi.annualassessment.util.Converters;

@Controller
public class ExemptExployeeInfoReviewOfPastYearController {

	private static final Logger log = Logger.getLogger(ExemptEmployeeInfoController.class);

	@Autowired
	private ExemptEmployeeInfoController exemptInfo;

	@Autowired
	private ExemptTeamMemberService exemptTeamMemberService;

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

	@RequestMapping(value = "/reviewOfPastYear", method = RequestMethod.GET)
	public String reviewOfPastYear(Model model, HttpSession session) {

		log.info("Review of past year screen");

		String[] commaSeparatedCountrys = null;
		if (session.getAttribute("loginClockNumber") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}
		// String year = (String) session.getAttribute("year");
		employeeYear = (String) loginUser.getExemptEmployeeYear();
		System.out.println("reviewOfPastYear");

		try {

			if (!String.valueOf(loginUser.getExemptEmployeeClock()).equalsIgnoreCase("null")) {

				System.out.println("if");

				empClockNumber = loginUser.getExemptEmployeeClock();

			} else {
				System.out.println("else");
				empClockNumber = (String) loginUser.getClockNumber();
				employeeYear = (String) loginUser.getLoginYear();

			}

			log.info("review of past year");
			log.info(empClockNumber);

			/* start Narasimha */

			List<ExemptTeamMember> exempt_TeamMember = exemptTeamMemberService
					.getReviewOfPastYearDetails(empClockNumber.trim(), employeeYear.trim());

			if (exempt_TeamMember.size() == 0) {

				model.addAttribute("imessage", "novalidation");
			}

			System.out.println("exemptTeamMemberDetails :: " + exempt_TeamMember.toString());

			ExemptTeamMemberPojoVariables exemptTeamMemberDetails = null;

			for (ExemptTeamMember orm : exempt_TeamMember) {
				exemptTeamMemberDetails = new ExemptTeamMemberPojoVariables();
				System.out.println("yes, i have few records..");
				System.out.println("second radio button " + orm.getSection1F3A());
				int i = 0;

				if (String.valueOf(orm.getSection1F3B()).equalsIgnoreCase("null")
						|| String.valueOf(orm.getSection1F3B()).isEmpty()) {

				} else {

					String getCountrys = orm.getSection1F3B();
					commaSeparatedCountrys = getCountrys.split(",");

					System.out.println("Enter null value");
					DropDownValues countryValues = new DropDownValues();
					for (String t : commaSeparatedCountrys) {
						System.out.println("Countrys  is::::" + t);
						exemptTeamMemberDetails = countryValues.ReviewOfPastYearCountryVaribles(exemptTeamMemberDetails,
								t, i);
						System.out.println(exemptTeamMemberDetails + "====");
						i++;
					}

				}

				System.out.println(orm.getEffectivenessOfB1() + " effectivenessOfB1");

				exemptTeamMemberDetails.setEffectivenessOfB1(orm.getEffectivenessOfB1());
				exemptTeamMemberDetails.setEffectivenessOfB2(orm.getEffectivenessOfB2());
				exemptTeamMemberDetails.setEffectivenessOfB3(orm.getEffectivenessOfB3());
				exemptTeamMemberDetails.setEffectivenessOfB4(orm.getEffectivenessOfB4());

				exemptTeamMemberDetails.setSection1A(orm.getSection1A());

				exemptTeamMemberDetails.setSection1B1(orm.getSection1B1());
				exemptTeamMemberDetails.setSection1B2(orm.getSection1B2());
				exemptTeamMemberDetails.setSection1B3(orm.getSection1B3());

				exemptTeamMemberDetails.setSection1B4(orm.getSection1B4());

				exemptTeamMemberDetails.setSection1C(orm.getSection1C());

				exemptTeamMemberDetails.setOther(orm.getOther());

				exemptTeamMemberDetails.setSection1D1(orm.getSection1D1());
				exemptTeamMemberDetails.setSection1D2(orm.getSection1D2());

				exemptTeamMemberDetails.setSection1F1(orm.getSection1F1());

				exemptTeamMemberDetails.setSection1F2ONE(orm.getSection1F2ONE());

				exemptTeamMemberDetails.setSection1F2TWO(orm.getSection1F2TWO());

				exemptTeamMemberDetails.setSection1F3A(orm.getSection1F3A());

				exemptTeamMemberDetails.setSection1F3B1(orm.getSection1F3B1());

				exemptTeamMemberDetails.setSection1F3B2(orm.getSection1F3B2());
				exemptTeamMemberDetails.setOther(orm.getOther());
				System.out.println("other values :: " + orm.getOther());

				System.out.println("validating the user");
				System.out.println(orm.getSection1A());

				System.out.println(loginUser.getFormSubmissionStatus() + " lgin user...");

				if (String.valueOf(loginUser.getFormSubmissionStatus()).equalsIgnoreCase("null")) {

					if (orm.getSection1A().isEmpty() || orm.getSection1A() == null) {

						model.addAttribute("imessage", "novalidation");
					} else if (orm.getSection1C().isEmpty() || orm.getSection1C() == null) {

						model.addAttribute("imessage", "novalidation");

					} else if (orm.getSection1D1().isEmpty() || orm.getSection1D1() == null) {

						model.addAttribute("imessage", "novalidation");
					} else if (orm.getSection1D2().isEmpty() || orm.getSection1D2() == null) {

						model.addAttribute("imessage", "novalidation");
					}

					// carrier mobility first radio button.
					else if (orm.getSection1F1() == null || orm.getSection1F1().isEmpty()) {
						model.addAttribute("imessage", "novalidation");
					} else if (orm.getSection1F1() != null && orm.getSection1F1().equalsIgnoreCase("yes")) {

						if (orm.getSection1F2ONE().isEmpty() || orm.getSection1F2ONE() == null) {
							model.addAttribute("imessage", "novalidation");
						}

					}

					// carrier mobility second radio button..
					else if (orm.getSection1F3A() == null || orm.getSection1F3A().isEmpty()) {
						model.addAttribute("imessage", "novalidation");
					}

					else if (!orm.getSection1F3A().isEmpty() && orm.getSection1F3A().equalsIgnoreCase("yes")) {

						if (orm.getSection1F3B() == null || orm.getSection1F3B() == null
								|| orm.getSection1F3B2() == null || orm.getSection1F3B().isEmpty()
								|| orm.getSection1F3B1().isEmpty() || orm.getSection1F3B2().isEmpty()) {

							model.addAttribute("imessage", "novalidation");
						}
					}
				}
			}

			System.out.println("exemptTMDetails" + exemptTeamMemberDetails);

			String status = getStatus(empClockNumber, employeeYear.trim());
			model.addAttribute("status", status);

			model.addAttribute("exemptTMDetails", exemptTeamMemberDetails);

			model.addAttribute("loginUser", loginUser);
		}

		catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("loginUser", loginUser);
			model.addAttribute("errorStatus", "your data was not successful updated, please contact IT team.");
			log.error("getting error :: " + e.getMessage());
			return "review-of-past-year";

		}
		return "review-of-past-year";
	}

	@RequestMapping(value = "/saveReviewOfPastYearDetails", params = "backAndSave", method = RequestMethod.POST)
	public String BackToSaveTemMember(@ModelAttribute("exemptTeamMember") ExemptTeamMember exemptTeamMember,
			Model model, HttpSession session) {
		if (session.getAttribute("loginClockNumber") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		log.info("Enter review of Saveandback ::");

		// saving review of past year details.
		reviewofPastYearAction(exemptTeamMember, model, session);

		// fetching Team member personal information.
		String teamMemberPersonalInfo = exemptInfo.teamMemberPersonalInfo(model, session);
		model.addAttribute("loginUser", loginUser);
		return teamMemberPersonalInfo;
	}

	@RequestMapping(value = "/saveReviewOfPastYearDetails", params = "nextAndSave", method = RequestMethod.POST)
	public String BackToSaveReviewSaveDB(@ModelAttribute("exemptTeamMember") ExemptTeamMember exemptTeamMember,
			BindingResult result, Model model, HttpSession sessions) {

		log.info("Enter review of Saveandback ::");

		if (sessions.getAttribute("loginClockNumber") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		// saving review of past year details..
		String reviewofPastYear = reviewofPastYearAction(exemptTeamMember, model, sessions);
		model.addAttribute("loginUser", loginUser);

		return reviewofPastYear;
	}

	public String reviewofPastYearAction(ExemptTeamMember exemptTeamMember, Model model, HttpSession session) {

		System.out.println("Enter save ExemptTeamMemberDetails  :::: ");

		if (session.getAttribute("loginClockNumber") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

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

		System.out.println("user clock number");

		System.out.println(empClockNumber);
		ExemptTeamMemberPojo exemptTeamMemberPojo = new ExemptTeamMemberPojo();

		exemptTeamMemberPojo.setEffectivenessOfB1(exemptTeamMember.getEffectivenessOfB1());
		exemptTeamMemberPojo.setEffectivenessOfB2(exemptTeamMember.getEffectivenessOfB2());
		exemptTeamMemberPojo.setEffectivenessOfB3(exemptTeamMember.getEffectivenessOfB3());
		exemptTeamMemberPojo.setEffectivenessOfB4(exemptTeamMember.getEffectivenessOfB4());

		System.out.println(exemptTeamMember.getSection1B1());
		System.out.println("testing");

		

		if (String.valueOf(exemptTeamMember.getSection1B1()).equalsIgnoreCase("null")) {

			exemptTeamMemberPojo.setSection1B1(" ");
		} else {
			exemptTeamMemberPojo.setSection1B1(exemptTeamMember.getSection1B1());
		}

		
		
		if (String.valueOf(exemptTeamMember.getSection1B2()).equalsIgnoreCase("null")) {

			exemptTeamMemberPojo.setSection1B2(" ");
		} else {
			exemptTeamMemberPojo.setSection1B2(exemptTeamMember.getSection1B2());
		}

		
		System.out.println(exemptTeamMember.getSection1B3() + "one b3");

		if (String.valueOf(exemptTeamMember.getSection1B3()).equalsIgnoreCase("null")) {

			exemptTeamMemberPojo.setSection1B3(" ");
		} else {
			exemptTeamMemberPojo.setSection1B3(exemptTeamMember.getSection1B3());
		}
		if (String.valueOf(exemptTeamMember.getSection1B4()).equalsIgnoreCase("null")) {

			exemptTeamMemberPojo.setSection1B4(" ");
		} else {
			exemptTeamMemberPojo.setSection1B4(exemptTeamMember.getSection1B4());
		}

		// Dynamically set clockNumber
		exemptTeamMember.setEmpClockNumber(Integer.parseInt(empClockNumber.trim()));

		exemptTeamMemberPojo.setSection1A(exemptTeamMember.getSection1A());

		exemptTeamMemberPojo.setSection1C(exemptTeamMember.getSection1C());

		exemptTeamMemberPojo.setOther(exemptTeamMember.getOther());

		exemptTeamMemberPojo.setSection1D1(exemptTeamMember.getSection1D1());
		exemptTeamMemberPojo.setSection1D2(exemptTeamMember.getSection1D2());

		exemptTeamMemberPojo.setSection1F1(exemptTeamMember.getSection1F1());

		exemptTeamMemberPojo.setSection1F2ONE(exemptTeamMember.getSection1F2ONE());

		exemptTeamMemberPojo.setSection1F2TWO(exemptTeamMember.getSection1F2TWO());

		exemptTeamMemberPojo.setSection1F3A(exemptTeamMember.getSection1F3A());

		exemptTeamMemberPojo.setSection1F3B(exemptTeamMember.getSection1F3B());

		exemptTeamMemberPojo.setSection1F3B1(exemptTeamMember.getSection1F3B1());

		exemptTeamMemberPojo.setSection1F3B2(exemptTeamMember.getSection1F3B2());

		exemptTeamMember.setAppraisalYear(employeeYear.trim());

		try {

			int year = exemptTeamMemberService.fetchYearOfAnEmployee(exemptTeamMember.getEmpClockNumber(),
					employeeYear);
			log.info("year is :: " + year);

			if (year == 0) {

				year = 0;
			} else {

			}

			boolean status = exemptTeamMemberService.updateReviewOfPastYearDetails(exemptTeamMember, year);

			exemptInfo.SkillsSelfAassessment(model, session);
			if (status == false) {

				return "review-of-past-year";
			}

			// updating the census form details

			System.out.println(exemptTeamMember.getSection1A());
			System.out.println(
					"exemptTeamMember.getSection1A().isEmpty()" + exemptTeamMember.getSection1A().trim().isEmpty());
			if (exemptTeamMember.getSection1A().trim().isEmpty() == false) {

				// if (exemptTeamMember.getSection1B1() != null) {

				if ((exemptTeamMember.getSection1C().trim().isEmpty() == false
						&& exemptTeamMember.getSection1D1().trim().isEmpty() == false
						&& exemptTeamMember.getSection1D2().trim().isEmpty() == false)) {

					if (String.valueOf(exemptTeamMember.getSection1F1()).equalsIgnoreCase("no")
							&& String.valueOf(exemptTeamMember.getSection1F3A()).equalsIgnoreCase("no")) {

						exemptTeamMemberService.updateCensusForm("STARTED", empClockNumber, employeeYear);
					} else if (String.valueOf(exemptTeamMember.getSection1F1()).equalsIgnoreCase("yes")
							&& String.valueOf(exemptTeamMember.getSection1F3A()).equalsIgnoreCase("yes")) {

						System.out.println(exemptTeamMember.getOther().trim() + " other");
						System.out.println(exemptTeamMember.getSection1F2ONE().trim().isEmpty());
						if ((exemptTeamMember.getSection1F2ONE().trim().isEmpty() == false)
								&& (exemptTeamMember.getSection1F3B() != null
										|| exemptTeamMember.getOther().trim().isEmpty() == false)
								&& exemptTeamMember.getSection1F3B1() != null
								&& exemptTeamMember.getSection1F3B2() != null) {

							exemptTeamMemberService.updateCensusForm("STARTED", empClockNumber, employeeYear);
						} else {
							exemptTeamMemberService.updateCensusForm("Not Started", empClockNumber, employeeYear);
						}

					} else if (String.valueOf(exemptTeamMember.getSection1F1()).equalsIgnoreCase("yes")
							&& String.valueOf(exemptTeamMember.getSection1F3A()).equalsIgnoreCase("no")) {

						if (exemptTeamMember.getSection1F2ONE().isEmpty() == false
								|| exemptTeamMember.getSection1F2ONE() != null) {
							exemptTeamMemberService.updateCensusForm("STARTED", empClockNumber, employeeYear);
						} else {
							exemptTeamMemberService.updateCensusForm("Not Started", empClockNumber, employeeYear);
						}

					} else if (String.valueOf(exemptTeamMember.getSection1F1()).equalsIgnoreCase("no")
							&& String.valueOf(exemptTeamMember.getSection1F3A()).equalsIgnoreCase("yes")) {

						if ((exemptTeamMember.getSection1F3B() != null
								|| exemptTeamMember.getOther().trim().isEmpty() == false)
								&& exemptTeamMember.getSection1F3B1() != null
								&& exemptTeamMember.getSection1F3B2() != null) {

							exemptTeamMemberService.updateCensusForm("STARTED", empClockNumber, employeeYear);
						} else {
							exemptTeamMemberService.updateCensusForm("Not Started", empClockNumber, employeeYear);
						}
					}

				}
				log.info(exemptTeamMember.getSection1B1().isEmpty() + ": exemptTeamMem section 1B1");
				log.info(!exemptTeamMember.getSection1B1().isEmpty() + ": exemptTeamMem section 1B1");
				if (exemptTeamMember.getSection1B1().trim().isEmpty() == false
						&& !exemptTeamMember.getSection1B1().equalsIgnoreCase("null")) {
					System.out.println("first text field is not empty");
					log.info(exemptTeamMember.getEffectivenessOfB1());
					System.out.println(exemptTeamMember.getEffectivenessOfB1());
					if (exemptTeamMember.getEffectivenessOfB1().equalsIgnoreCase("null")
							|| exemptTeamMember.getEffectivenessOfB1().trim().isEmpty() == true) {
						System.out.println("first drop drown is  empty");
						exemptTeamMemberService.updateCensusForm("Not Started", empClockNumber, employeeYear);
					}
				}
				System.out.println(String.valueOf(exemptTeamMember.getSection1B2()).trim().isEmpty());
				if (String.valueOf(exemptTeamMember.getSection1B2()).trim().isEmpty() == false
						&& !String.valueOf(exemptTeamMember.getSection1B2()).equalsIgnoreCase("null")) {
					System.out.println("second text field is not empty");
					if (exemptTeamMember.getEffectivenessOfB2().equalsIgnoreCase("null")
							|| exemptTeamMember.getEffectivenessOfB2().trim().isEmpty() == true) {
						System.out.println("second drop drown is  empty");
						exemptTeamMemberService.updateCensusForm("Not Started", empClockNumber, employeeYear);
					}
				}
				if (String.valueOf(exemptTeamMember.getSection1B3()).trim().isEmpty() == false
						&& !String.valueOf(exemptTeamMember.getSection1B3()).equalsIgnoreCase("null")) {
					System.out.println("third text field is not empty");
					if (exemptTeamMember.getEffectivenessOfB3().equalsIgnoreCase("null")
							|| exemptTeamMember.getEffectivenessOfB3().trim().isEmpty() == true) {
						System.out.println("third drop drown is  empty");
						exemptTeamMemberService.updateCensusForm("Not Started", empClockNumber, employeeYear);
					}
				}
				if (String.valueOf(exemptTeamMember.getSection1B4()).trim().isEmpty() == false
						&& !String.valueOf(exemptTeamMember.getSection1B4()).equalsIgnoreCase("null")) {
					if (exemptTeamMember.getEffectivenessOfB4().equalsIgnoreCase("null")
							|| exemptTeamMember.getEffectivenessOfB4().trim().isEmpty() == true) {
						exemptTeamMemberService.updateCensusForm("Not Started", empClockNumber, employeeYear);
					}
				}
				/*
				 * else { exemptTeamMemberService.updateCensusForm("Not Started"
				 * , empClockNumber, employeeYear);
				 * 
				 * }
				 */
				// }
			} else {
				exemptTeamMemberService.updateCensusForm("Not Started", empClockNumber, employeeYear);

			}

			// exemptTeamMemberService.reviewOfPastYear(exemptTeamMember);

			System.out.println("saveReviewOfPastYearDetails value flag :: ");
			System.out.println("boolen value is :: ");
			String statusOfEmp = getStatus(empClockNumber, employeeYear.trim());

			model.addAttribute("status", statusOfEmp);

			model.addAttribute("loginUser", loginUser);
			return "SkillsSelfAssessment";
		} catch (Exception e) {

			e.printStackTrace();
			// model.addAttribute("successorerror", "Data Not Insert
			// successfully ");
			log.error("error :: " + e.getMessage());
			return "review-of-past-year";
		}

	}

	@RequestMapping(value = "/saveReviewOfPastYearDetails", params = "save", method = RequestMethod.POST)
	public String saveInSamePage(@ModelAttribute("exemptTeamMember") ExemptTeamMember exemptTeamMember, Model model,
			HttpSession session) {
		if (session.getAttribute("loginClockNumber") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		log.info("Enter review of save ::");

		reviewofPastYearAction(exemptTeamMember, model, session);
		reviewOfPastYear(model, session);

		return "review-of-past-year";
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

}
