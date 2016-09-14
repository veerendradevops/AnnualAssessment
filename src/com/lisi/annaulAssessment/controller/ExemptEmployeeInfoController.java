package com.lisi.annaulAssessment.controller;

import java.util.Calendar;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lisi.annaualAssessment.orm.CensusForm;
import com.lisi.annaualAssessment.orm.ExemptTeamMember;
import com.lisi.annaualAssessment.orm.SkillsSelfAssessment;
import com.lisi.annaulAssessment.pojo.ExemptTeamMemberPojo;
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

	@RequestMapping(value = "/censusFormDetails", method = RequestMethod.GET)
	public String teamMemberPersonalInfo( Model model) {

//	log.info(LoginController.getLoginClockNumber());


		List<CensusForm> employeeDetails = employeeInfo.getEmployeeDetails(String.valueOf(ExemptEmployeeController.getClockNumber()));

		model.addAttribute("employeeDetails", employeeDetails); 
		
		return "exemptEmployee";

		// return "review-of-past-year";
	}
/*
	@RequestMapping(value = "/teamMemberPersonalInfo", method = RequestMethod.GET)
	public String exemptEmployee(@RequestParam("clockNum") String empClockNumber,
			@RequestParam("year") String annaulYear,Model model) {

		ExemptEmployeeController.setExemptClockNumber(Integer.parseInt(empClockNumber.trim()));

		ExemptEmployeeController.setAnnaulYear(annaulYear);

		List<CensusForm> census = empServie.listEmps();

		model.addAttribute("empDetails", census);
		
		List<CensusForm> employeeDetails = employeeInfo.getEmployeeDetails(empClockNumber);

		model.addAttribute("employeeDetails", employeeDetails);

		return "exemptEmployee";
	}
*/
	@RequestMapping(value = "/reviewOfPastYear", method = RequestMethod.GET)
	public String reviewOfPastYear(@ModelAttribute("exemptTeamMember") ExemptTeamMember exemptTeamMember,
			BindingResult result, Model model) {

		try {
			System.out.println("*** reviewOfPastYear *** ");
			List<ExemptTeamMember> exemptTeamMemberDetails = exemptTeamMemberService.getReviewOfPastYearDetails(ExemptEmployeeController.getClockNumber(),
					Converters.getCurrentYear());

			for (ExemptTeamMember exemptTeamMember12 : exemptTeamMemberDetails) {
				System.out.println("year :: " + exemptTeamMember12.getAppraisalYear());
				System.out.println("Section1F3B2 :: " + exemptTeamMember12.getSection1F3B2());
				System.out.println("Section1F3B1 :: " + exemptTeamMember12.getSection1F3B1());
				System.out.println("Section1F3A :: " + exemptTeamMember12.getSection1F3A());
				System.out.println("EffectivenessOfB4 :: " + exemptTeamMember12.getEffectivenessOfB4());

			}

			System.out.println("exemptTeamMemberDetails :: " + exemptTeamMemberDetails);
			model.addAttribute("exemptTeamMemberDetails", exemptTeamMemberDetails);

			return "review-of-past-year";
		} catch (Exception e) {
			log.error("getting error :: " + e.getMessage());
			model.addAttribute("successorerror", "Data Not Fetch successfully ");
			return "review-of-past-year";

		}
	}

	@RequestMapping(value = "/saveReviewOfPastYearDetails", method = RequestMethod.POST)
	public String saveExemptTeamMemberDetails(@ModelAttribute("exemptTeamMember") ExemptTeamMember exemptTeamMember,
			BindingResult result, Model model) {

		System.out.println("Enter saveExemptTeamMemberDetails  :::: ");

		ExemptTeamMemberPojo exemptTeamMemberPojo = new ExemptTeamMemberPojo();

		exemptTeamMemberPojo.setEffectivenessOfB1(exemptTeamMember.getEffectivenessOfB1());
		exemptTeamMemberPojo.setEffectivenessOfB2(exemptTeamMember.getEffectivenessOfB2());
		exemptTeamMemberPojo.setEffectivenessOfB3(exemptTeamMember.getEffectivenessOfB3());
		exemptTeamMemberPojo.setEffectivenessOfB4(exemptTeamMember.getEffectivenessOfB4());

		// Dynamically set clockNumber
		exemptTeamMember.setEmpClockNumber(Integer.parseInt(ExemptEmployeeController.getClockNumber().trim()));

		exemptTeamMemberPojo.setSection1A(exemptTeamMember.getSection1A());

		exemptTeamMemberPojo.setSection1B1(exemptTeamMember.getSection1B1());
		exemptTeamMemberPojo.setSection1B2(exemptTeamMember.getSection1B2());
		exemptTeamMemberPojo.setSection1B3(exemptTeamMember.getSection1B3());

		exemptTeamMemberPojo.setSection1B4(exemptTeamMember.getSection1B4());

		exemptTeamMemberPojo.setSection1C(exemptTeamMember.getSection1C());

		exemptTeamMemberPojo.setSection1D1(exemptTeamMember.getSection1D1());
		exemptTeamMemberPojo.setSection1D2(exemptTeamMember.getSection1D2());

		exemptTeamMemberPojo.setSection1F1(exemptTeamMember.getSection1F1());

		exemptTeamMemberPojo.setSection1F2ONE(exemptTeamMember.getSection1F2ONE());

		exemptTeamMemberPojo.setSection1F2TWO(exemptTeamMember.getSection1F2TWO());

		exemptTeamMemberPojo.setSection1F3A(exemptTeamMember.getSection1F3A());

		exemptTeamMemberPojo.setSection1F3B(exemptTeamMember.getSection1F3B());

		exemptTeamMemberPojo.setSection1F3B1(exemptTeamMember.getSection1F3B1());

		exemptTeamMemberPojo.setSection1F3B2(exemptTeamMember.getSection1F3B2());

		exemptTeamMember.setAppraisalYear(Converters.getCurrentYear());
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

			exemptTeamMemberService.updateReviewOfPastYearDetails(exemptTeamMember, year);

			
			// updating the census form details
			
			if(year==0){
			exemptTeamMemberService.updateCensusForm("Started");
			}
			// exemptTeamMemberService.reviewOfPastYear(exemptTeamMember);

			System.out.println("saveReviewOfPastYearDetails value flag :: ");
			System.out.println("boolen value is :: ");
			model.addAttribute("successorerror", "Data Insert successfully ");
			return "SkillsSelfAssessment";
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("successorerror", "Data Not Insert successfully ");
			log.error("error :: " + e.getMessage());
		}

		return "SkillsSelfAssessment";

	}

	@RequestMapping(value = "/SkillsSelfAssessment", method = RequestMethod.GET)
	public String SkillsSelfAassessment(
			@ModelAttribute("skillsSelfAssessment") SkillsSelfAssessment skillsSelfAssessment, BindingResult result,
			Model model) {
		log.info("**** Enter SkillsSelfAssessment Screen Controller ****");

		try {
			log.info(" ::: Enter try getSkillsSelfAssessmentDetails :::");
			List<SkillsSelfAssessment> skillsSelfAssessmentDetails = skillsSelfAssessmentService
					.getSkillsSelfAssessmentDetails(ExemptEmployeeController.getClockNumber().trim(), Converters.getCurrentYear());

			System.out.println("skillsSelfAssessmentDetails :: " + skillsSelfAssessmentDetails.toString());

			model.addAttribute("skillsSelfAssessmentDetails", skillsSelfAssessmentDetails);
			// model.addAttribute("success" , "Data Insert successfully !");

			return "SkillsSelfAssessment";

		} catch (Exception e) {
			log.error("error is :: " + e.getMessage());
			model.addAttribute("successorerror", "Data Not Insert successfully !");
		}
		return "SkillsSelfAssessment";
	}

	@RequestMapping(value = "/getSkillsSelfAssessment", method = RequestMethod.POST)
	public String getSkillsSelfAssessment(
			@ModelAttribute("skillsSelfAssessment") SkillsSelfAssessment skillsSelfAssessment, BindingResult result,
			Model model) {

		skillsSelfAssessment.setEmpClockNumber(Integer.parseInt(ExemptEmployeeController.getClockNumber()));

		SkillsSelfAssessmentPojo skillsSelfAssessmentPojo = new SkillsSelfAssessmentPojo();

		skillsSelfAssessmentPojo.setSection1G1(skillsSelfAssessment.getSection1G1());
		skillsSelfAssessmentPojo.setSection1G2(skillsSelfAssessment.getSection1G2());
		skillsSelfAssessmentPojo.setSection1G3(skillsSelfAssessment.getSection1G3());
		skillsSelfAssessmentPojo.setSection1G4(skillsSelfAssessment.getSection1G4());
		skillsSelfAssessmentPojo.setSection1G5(skillsSelfAssessment.getSection1G5());
		skillsSelfAssessment.setAppraisalYear(Converters.getCurrentYear());

		try {

			int year = skillsSelfAssessmentService
					.fetchYearOfAnSkillsSelfAssessment(skillsSelfAssessment.getEmpClockNumber());

			log.info("Year is :: " + year);

			if (year == 0) {

				year = 0;
			} else {
				year = Integer.parseInt(Converters.getCurrentYear());
			}

			skillsSelfAssessmentService.updateSkillsSelfAssessmentDetails(skillsSelfAssessment, year);
			log.info("update the same clock Number");

			model.addAttribute("successorerror", "Data insert  successfully !");

			return "SkillsSelfAssessment";
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error :: " + e.getMessage());
			model.addAttribute("successorerror", "Data Not Insert successfully !");
		}

		System.out.println("enter model success");
		return "SkillsSelfAssessment";

	}
}
