package com.lisi.annaulAssessment.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lisi.annaualAssessment.orm.CensusForm;
import com.lisi.annaualAssessment.orm.ExemptTeamMember;
import com.lisi.annaualAssessment.orm.SkillsSelfAssessment;
import com.lisi.annaulAssessment.pojo.DropDownValues;
import com.lisi.annaulAssessment.pojo.ExemptSection2Pojo;
import com.lisi.annaulAssessment.pojo.ExemptTeamMemberPojo;
import com.lisi.annaulAssessment.pojo.ExemptTeamMemberPojoVariables;
import com.lisi.annaulAssessment.pojo.ManagerSkillsAssessment;
import com.lisi.annaulAssessment.pojo.SkillsSelfAssesmentVariables;
import com.lisi.annaulAssessment.pojo.SkillsSelfAssessmentPojo;
import com.lisi.annaulAssessment.service.EmployeeService;
import com.lisi.annaulAssessment.service.ExemptTeamMemberService;
import com.lisi.annaulAssessment.service.SkillsSelfAssessmentService;
import com.lisi.annaulAssessment.service.TMPersonalInformationService;
import com.lisi.annaulAssessment.util.Converters;

@Controller
public class ExemptEmployeeInfoController {

	private static final Logger log = Logger.getLogger(ExemptEmployeeInfoController.class);

	@Autowired
	private ExemptTeamMemberService exemptTeamMemberService;

	@Autowired
	private SkillsSelfAssessmentService skillsSelfAssessmentService;

	@Autowired
	private TMPersonalInformationService employeeInfo;

	@Autowired
	private EmployeeService empServie;

	private String exemptEmpClock, employeeYear;

	String empClockNumber;

	@InitBinder
	public void initBinder() {
		log.info("Start .");
		/*
		 * if (String.valueOf(ExemptEmployeeController.getClockNumber()).
		 * equalsIgnoreCase("null")) {
		 * 
		 * System.out.println("if");
		 * 
		 * empClockNumber = LoginController.getLoginClockNumber();
		 * 
		 * } else { System.out.println("else"); empClockNumber =
		 * ExemptEmployeeController.getClockNumber();
		 * 
		 * }
		 */
		log.info("End .");
	}

	@RequestMapping(value = "/censusFormDetails", method = RequestMethod.GET)
	public String teamMemberPersonalInfo(Model model, HttpSession session) {

		log.info("censusFormDetails");
		log.info(Converters.getCurrentYear().trim());

		exemptEmpClock = (String) session.getAttribute("exemptEmp");
		employeeYear = (String) session.getAttribute("year");

		log.info(exemptEmpClock);

		try {
			if (!String.valueOf(exemptEmpClock).equalsIgnoreCase("null")) {

				System.out.println("if");

				empClockNumber = exemptEmpClock;

			} else {
				System.out.println("else");
				empClockNumber = (String) session.getAttribute("loginClockNumber");
				log.info(empClockNumber);
			}

			List<CensusForm> employeeDetails = employeeInfo.getEmployeeDetails(String.valueOf(empClockNumber),
					Converters.getCurrentYear().trim());

			model.addAttribute("employeeDetails", employeeDetails);
		} catch (Exception e) {

			e.printStackTrace();
		}

		return "exemptEmployee";

		// return "review-of-past-year";
	}

	@RequestMapping(value = "/reviewOfPastYear", method = RequestMethod.GET)
	public String reviewOfPastYear(
			 Model model, HttpSession session) {

		String[] commaSeparatedCountrys = null;
		String year = (String) session.getAttribute("year");
		exemptEmpClock = (String) session.getAttribute("exemptEmp");

		try {
			if (!String.valueOf(exemptEmpClock).equalsIgnoreCase("null")) {

				System.out.println("if");

				empClockNumber = exemptEmpClock;

			} else {
				System.out.println("else");
				empClockNumber = (String) session.getAttribute("loginClockNumber");

			}

			log.info("review of past year");
			log.info(empClockNumber);

			/* start Narasimha */

			List<ExemptTeamMember> exempt_TeamMember = exemptTeamMemberService
					.getReviewOfPastYearDetails(empClockNumber.trim(), Converters.getCurrentYear().trim());

			System.out.println("exemptTeamMemberDetails :: " + exempt_TeamMember.toString());

			ExemptTeamMemberPojoVariables exemptTeamMemberDetails = null;
			for (ExemptTeamMember orm : exempt_TeamMember) {
				exemptTeamMemberDetails = new ExemptTeamMemberPojoVariables();
				System.out.println("yes, i have few records..");
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

			}

			System.out.println("exemptTMDetails" + exemptTeamMemberDetails);

			model.addAttribute("exemptTMDetails", exemptTeamMemberDetails);
		}

		catch (Exception e) {
			e.printStackTrace();
			log.error("getting error :: " + e.getMessage());
			return "review-of-past-year";

		}
		return "review-of-past-year";
	}



	@RequestMapping(value = "/SkillsSelfAssessment", method = RequestMethod.GET)
	public String SkillsSelfAassessment( Model model,
			HttpSession session) {
		log.info("**** Enter SkillsSelfAssessment Screen Controller ****");

		String empFetchedYear = (String) session.getAttribute("year");
		exemptEmpClock = (String) session.getAttribute("exemptEmp");

		if (!String.valueOf(exemptEmpClock).equalsIgnoreCase("null")) {

			System.out.println("if");

			empClockNumber = exemptEmpClock;

		} else {
			System.out.println("else");
			empClockNumber = (String) session.getAttribute("loginClockNumber");

		}

		try {
			log.info(" ::: Enter try getSkillsSelfAssessmentDetails :::");
			List<SkillsSelfAssessment> skillsSelfAssessmentDetails = skillsSelfAssessmentService
					.getSkillsSelfAssessmentDetails(empClockNumber.trim(), Converters.getCurrentYear().trim());

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

			}
			// model.addAttribute("skillsSelfAssessmentDetails",
			// skillsSelfAssessmentDetails);
			// model.addAttribute("success" , "Data Insert successfully !");
			model.addAttribute("skillsSelfAssessmentDetails", skills);

			return "SkillsSelfAssessment";

		} catch (Exception e) {
			e.printStackTrace();
			log.error("error is :: " + e.getMessage());
			// model.addAttribute("successorerror", "Data Not Insert
			// successfully !");
		}
		return "review-of-past-year";
	}

	
	// New Added by Narasimha
	
	
	
	@RequestMapping(value = "/getSkillsSelfAssessment", params = "backAndSave", method = RequestMethod.POST)
	public String skillAssessmentBackAndSave(
			@ModelAttribute("skillsSelfAssessment") SkillsSelfAssessment skillsSelfAssessment, BindingResult result,
			Model model, HttpSession session){
		
		 skillAssessmentSave(skillsSelfAssessment,result,model,session);
		 String reviewofPastYear= reviewOfPastYear(model,  session);
		
		
		return reviewofPastYear;
		
		
	}
	
	@RequestMapping(value = "/getSkillsSelfAssessment", params = "save", method = RequestMethod.POST)
	public String saveButtonToskillAssessment(@ModelAttribute("skillsSelfAssessment") SkillsSelfAssessment skillsSelfAssessment, BindingResult result,
			Model model, HttpSession session)
	{
		
		
		skillAssessmentSave(skillsSelfAssessment,result, model, session);
		String saveButtonToSkillAssessment =  SkillsSelfAassessment(  model,session);

		return saveButtonToSkillAssessment;
		
	}
	
	
	public String skillAssessmentSave(@ModelAttribute("getSkillsSelfAssessment") SkillsSelfAssessment skillsSelfAssessment, BindingResult result,
			Model model, HttpSession session){
		

		System.out.println("enter save button to skillAssessmentSave");

		String employeeYear = (String) session.getAttribute("year");
		exemptEmpClock = (String) session.getAttribute("exemptEmp");
		if (!String.valueOf(exemptEmpClock).equalsIgnoreCase("null")) {

			System.out.println("if");

			empClockNumber = exemptEmpClock;

		} else {
			System.out.println("else");
			empClockNumber = (String) session.getAttribute("loginClockNumber");
			System.out.println(empClockNumber);
		}

		skillsSelfAssessment.setEmpClockNumber(Integer.parseInt(empClockNumber.trim()));

		SkillsSelfAssessmentPojo skillsSelfAssessmentPojo = new SkillsSelfAssessmentPojo();

		skillsSelfAssessmentPojo.setSection1G1(skillsSelfAssessment.getSection1G1());
		skillsSelfAssessmentPojo.setSection1G2(skillsSelfAssessment.getSection1G2());
		skillsSelfAssessmentPojo.setSection1G3(skillsSelfAssessment.getSection1G3());
		skillsSelfAssessmentPojo.setSection1G4(skillsSelfAssessment.getSection1G4());
		skillsSelfAssessmentPojo.setSection1G5(skillsSelfAssessment.getSection1G5());
		skillsSelfAssessment.setAppraisalYear(Converters.getCurrentYear().trim());

		try {

			int year = skillsSelfAssessmentService.fetchYearOfAnSkillsSelfAssessment(
					skillsSelfAssessment.getEmpClockNumber(), Converters.getCurrentYear());

			log.info("Year is :: " + year);

			if (year == 0) {

			//	exemptTeamMemberService.updateCensusForm("completed", empClockNumber);
				year = 0;
			} else {
				year = Integer.parseInt(Converters.getCurrentYear());
			}

			boolean status = skillsSelfAssessmentService.updateSkillsSelfAssessmentDetails(skillsSelfAssessment, year);

			if (status == false) {
				return "SkillsSelfAssessment";
			}

			log.info("update the same clock Number");

			model.addAttribute("successorerror", "Data insert  successfully !");

			return "SkillsSelfAssessment";
		} catch (Exception e) {

			e.printStackTrace();
			System.out.println("error :: " + e.getMessage());
			// model.addAttribute("successorerror", "Data Not Insert
			// successfully !");
			return "SkillsSelfAssessment";
		}

	}
	
	
	
	
	
	

	@RequestMapping(value = "/saveReviewOfPastYearDetails", params = "backAndSave", method = RequestMethod.POST)
	public String BackToSaveTemMember(@ModelAttribute("exemptTeamMember") ExemptTeamMember exemptTeamMember,
			Model model, HttpSession session) {

		log.info("Enter review of Saveandback ::");

		
		 reviewofPastYearAction(exemptTeamMember, model, session);
		 String teamMemberPersonalInfo=teamMemberPersonalInfo( model,  session);

		return teamMemberPersonalInfo;
	}

	@RequestMapping(value = "/saveReviewOfPastYearDetails", params = "nextAndSave", method = RequestMethod.POST)
	public String BackToSaveReviewSaveDB(@ModelAttribute("exemptTeamMember") ExemptTeamMember exemptTeamMember,
			BindingResult result, Model model, HttpSession sessions) {

		log.info("Enter review of Saveandback ::");

		String reviewofPastYear = reviewofPastYearAction(exemptTeamMember, model, sessions);

		return reviewofPastYear;
	}

	private String reviewofPastYearAction(ExemptTeamMember exemptTeamMember, Model model, HttpSession session) {

		System.out.println("Enter save ExemptTeamMemberDetails  :::: ");

		String employeeYear = (String) session.getAttribute("year");

		exemptEmpClock = (String) session.getAttribute("exemptEmp");

		if (!String.valueOf(exemptEmpClock).equalsIgnoreCase("null")) {

			System.out.println("if");

			empClockNumber = exemptEmpClock;

		} else {
			System.out.println("else");
			empClockNumber = (String) session.getAttribute("loginClockNumber");

		}
		System.out.println("user clock number");

		System.out.println(empClockNumber);
		ExemptTeamMemberPojo exemptTeamMemberPojo = new ExemptTeamMemberPojo();

		exemptTeamMemberPojo.setEffectivenessOfB1(exemptTeamMember.getEffectivenessOfB1());
		exemptTeamMemberPojo.setEffectivenessOfB2(exemptTeamMember.getEffectivenessOfB2());
		exemptTeamMemberPojo.setEffectivenessOfB3(exemptTeamMember.getEffectivenessOfB3());
		exemptTeamMemberPojo.setEffectivenessOfB4(exemptTeamMember.getEffectivenessOfB4());

		// Dynamically set clockNumber
		exemptTeamMember.setEmpClockNumber(Integer.parseInt(empClockNumber.trim()));

		exemptTeamMemberPojo.setSection1A(exemptTeamMember.getSection1A());

		exemptTeamMemberPojo.setSection1B1(exemptTeamMember.getSection1B1());
		exemptTeamMemberPojo.setSection1B2(exemptTeamMember.getSection1B2());
		exemptTeamMemberPojo.setSection1B3(exemptTeamMember.getSection1B3());

		exemptTeamMemberPojo.setSection1B4(exemptTeamMember.getSection1B4());

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

		exemptTeamMember.setAppraisalYear(Converters.getCurrentYear().trim());
		System.out.println("Current_Year ::: " + Converters.getCurrentYear());
		System.out.println("getSection1A() :::: " + exemptTeamMember.getSection1A());

		try {

			int year = exemptTeamMemberService.fetchYearOfAnEmployee(exemptTeamMember.getEmpClockNumber());
			log.info("year is :: " + year);

			if (year == 0) {

				year = 0;
			} else {
				year = Integer.parseInt(Converters.getCurrentYear());
			}

			boolean status = exemptTeamMemberService.updateReviewOfPastYearDetails(exemptTeamMember, year);

	//		SkillsSelfAssessment skillsSelfAssessment = new SkillsSelfAssessment();
			SkillsSelfAassessment( model, session);
			if (status == false) {

				return "review-of-past-year";
			}

			// updating the census form details

			if (year == 0) {
				System.out.println("new record");
				exemptTeamMemberService.updateCensusForm("STARTED", empClockNumber);
			}

			// exemptTeamMemberService.reviewOfPastYear(exemptTeamMember);

			System.out.println("saveReviewOfPastYearDetails value flag :: ");
			System.out.println("boolen value is :: ");
			// model.addAttribute("successorerror", "Data Insert successfully
			// ");
			return "SkillsSelfAssessment";
		} catch (Exception e) {

			e.printStackTrace();
			// model.addAttribute("successorerror", "Data Not Insert
			// successfully ");
			log.error("error :: " + e.getMessage());
			return "review-of-past-year";
		}

	}


	//saveSubmit
	
	@RequestMapping(value = "/getSkillsSelfAssessment", params="saveSubmit" ,method = RequestMethod.GET)
	public String employeesumbmit(@ModelAttribute("exemptSection2Pojo") ExemptSection2Pojo exemptSection2Pojo,
			Model model, HttpSession session) {
		
		String employeeYear = (String) session.getAttribute("year");

		exemptEmpClock = (String) session.getAttribute("exemptEmp");
		
		exemptTeamMemberService.updateCensusForm("COMPLETED", empClockNumber);
		
		return "loginScreen";
	}
	
	
}
