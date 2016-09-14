/**
 * This Controller class is used to controls the To be completed by manager section
 */
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
import com.lisi.annaualAssessment.orm.ExemptSection2;
import com.lisi.annaulAssessment.pojo.ExemptSection2Pojo;
import com.lisi.annaulAssessment.pojo.ManagerSkillsAssessment;
import com.lisi.annaulAssessment.service.ExemptSection2Service;
import com.lisi.annaulAssessment.util.Converters;

/**
 * @author manikanta.b
 *
 */
@Controller
public class ExemptEmployeeTMController {
	private static final Logger log = Logger.getLogger(ExemptEmployeeTMController.class);

	@Autowired
	private ExemptSection2Service exemptSection2Service;

	public void setEs(ExemptSection2Service exemptSection2Service) {
		this.exemptSection2Service = exemptSection2Service;
	}

	// Retrieving ObjectAchievemtScreen data from database
	@RequestMapping(value = "/objectiveAchievemtnScreen", method = RequestMethod.GET)
	public String fillExemptSection2Retrive(Model model) {
		try {
			// retrieving data from database
			List<ExemptSection2> retrivedata = exemptSection2Service.retriveObjectAchievementData();

			for (ExemptSection2 exemptSection2 : retrivedata) {

				System.out.println("exemptSection2 :: " + exemptSection2.getSection2A1Level());

			}
			model.addAttribute("objectiveAchievement", retrivedata);

			return "objectiveAchievement";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "objectiveAchievement";
	}

	// Inserting ObjectAchievement screen data into database
	@RequestMapping(value = "/objectiveAchievementOperation", method = RequestMethod.POST)
	public String fillExemptSection2insert(@ModelAttribute("exemptSection2Pojo") ExemptSection2Pojo exemptSection2Pojo,
			BindingResult result, Model model) {
		ExemptSection2 exemptorm = new ExemptSection2();
		try {

			log.info("objectiveAchievementOperation");
			// ExemptSection2 exemptorm = new ExemptSection2();
			exemptorm.setEmpClockNumber(Integer.parseInt(ExemptEmployeeController.getClockNumber().trim()));
			exemptorm.setSection2A1Objective(exemptSection2Pojo.getSection2A1Objective());
			exemptorm.setSection2A1Level(exemptSection2Pojo.getSection2A1Level());
			exemptorm.setSection2A2Objective(exemptSection2Pojo.getSection2A2Objective());
			exemptorm.setSection2A2Level(exemptSection2Pojo.getSection2A1Level());
			exemptorm.setSection2A3Objective(exemptSection2Pojo.getSection2A3Objective());
			exemptorm.setSection2A3Level(exemptSection2Pojo.getSection2A3Level());
			exemptorm.setSection2A4Objective(exemptSection2Pojo.getSection2A4Objective());
			exemptorm.setSection2A4Level(exemptSection2Pojo.getSection2A4Level());
			exemptorm.setSection2A5Objective(exemptSection2Pojo.getSection2A5Objective());
			exemptorm.setSection2A5Level(exemptSection2Pojo.getSection2A5Level());
			exemptorm.setSection2AdditionalComments(exemptSection2Pojo.getSection2AdditionalComments());
			exemptorm.setOverallScore(exemptSection2Pojo.getOverallScore());
			exemptorm.setAppraisalYear(Converters.getCurrentYear());

			String year = exemptSection2Service.insertExemptSection2();
			log.info("year is:::" + year);
			// calls fillExemptSection2(-,-)
			exemptSection2Service.fillExemptSection2(exemptorm, year);

		} catch (Exception e) {
			e.printStackTrace();
		}

		// Calling fillExemptSection3Retrive(-,-) method
		String fillexemptsection3Retrive = fillExemptSection3Retrive(exemptSection2Pojo, model);

		return "managersskillassessment";
	}

	// retrieving managerskillassessment data
	@RequestMapping(value = "/managerSkillAssessment", method = RequestMethod.GET)
	public String fillExemptSection3Retrive(ExemptSection2Pojo exemptsection2pojo, Model model) {
		log.info("fillExemptSection3");
		ExemptSection2 exemptorm = new ExemptSection2();
		try {
			List<ExemptSection2> retrivedata = exemptSection2Service.retriveManagerSkillsAssessmentData();
			System.out.println(retrivedata);
			for (ExemptSection2 exemptSection2pojo : retrivedata) {
				System.out.println(String.valueOf(exemptSection2pojo.getSection2B1()));
				int i = 0;
				if (String.valueOf(exemptsection2pojo.getSection2B1()).isEmpty()
						|| String.valueOf(exemptSection2pojo.getSection2B1()).equalsIgnoreCase("null")) {
					return "managersskillassessment";
				}
				System.out.println("exemptSection2cur :: " + exemptSection2pojo.getSection2A1Level());
				System.out.println("exemptSection2skillcur :: " + exemptSection2pojo.getSection2B1());
				String exemptsection = exemptSection2pojo.getSection2B1();
				String[] section2b1 = exemptsection.split(",");
				System.out.println("section2b1" + section2b1);
				ManagerSkillsAssessment manager = new ManagerSkillsAssessment();
				System.out.println(section2b1.length);
				System.out.println("length");

				for (String t : section2b1) {
					System.out.println("commaSeperatedValues is::::" + t);
					/* List<ExemptSection2> */ exemptorm = manager.setFields(exemptorm, t, i);
					System.out.println(exemptorm.getSkills1() + " for loop");
					i++;
				}
				// commaSeperated.add(exemptorm);

				model.addAttribute("skill1", exemptorm.getSkills1());
				model.addAttribute("skill2", exemptorm.getSkills2());
				model.addAttribute("skill3", exemptorm.getSkills3());
				model.addAttribute("skill4", exemptorm.getSkills4());
				model.addAttribute("skill5", exemptorm.getSkills5());
				model.addAttribute("skill6", exemptorm.getSkills6());
				model.addAttribute("skill7", exemptorm.getSkills7());
				model.addAttribute("skill8", exemptorm.getSkills8());
				model.addAttribute("skill9", exemptorm.getSkills9());
				model.addAttribute("skill10", exemptorm.getSkills10());
				model.addAttribute("waysOfWorking1", exemptorm.getWaysOfWorking1());
				model.addAttribute("waysOfWorking2", exemptorm.getWaysOfWorking2());
				model.addAttribute("waysOfWorking3", exemptorm.getWaysOfWorking3());
				model.addAttribute("waysOfWorking4", exemptorm.getWaysOfWorking4());
				model.addAttribute("waysOfWorking5", exemptorm.getWaysOfWorking5());
				model.addAttribute("waysOfWorking6", exemptorm.getWaysOfWorking6());
				model.addAttribute("waysOfWorking7", exemptorm.getWaysOfWorking7());
				model.addAttribute("selfManagementandLeadership1", exemptorm.getSelfManagementandLeadership1());
				model.addAttribute("selfManagementandLeadership2", exemptorm.getSelfManagementandLeadership2());
				model.addAttribute("selfManagementandLeadership3", exemptorm.getSelfManagementandLeadership3());
				model.addAttribute("selfManagementandLeadership4", exemptorm.getSelfManagementandLeadership4());
				model.addAttribute("selfManagementandLeadership5", exemptorm.getSelfManagementandLeadership5());
				model.addAttribute("selfManagementandLeadership6", exemptorm.getSelfManagementandLeadership6());
				model.addAttribute("selfManagementandLeadership7", exemptorm.getSelfManagementandLeadership7());
			}
			return "managersskillassessment";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "managersskillassessment";
	}

	// Inserting ManagerSkillAssessmentAction screen data into database
	@RequestMapping(value = "/managerSkillAssessmentAction", method = RequestMethod.GET)
	public String fillExemptSection3Insert(@ModelAttribute("exemptSection2Pojo") ExemptSection2Pojo exemptSection2Pojo,
			BindingResult result,Model model) {
		try {

			ExemptSection2 exemptorm = new ExemptSection2();

			log.info("managerSkillAssessment");

			log.info(exemptSection2Pojo.getSection2B1());
			log.info(exemptSection2Pojo.getSection2B2());
			log.info(exemptSection2Pojo.getSection2B3());
			exemptorm.setSection2B1(exemptSection2Pojo.getSection2B1());
			exemptorm.setSection2B2(exemptSection2Pojo.getSection2B2());
			exemptorm.setSection2B3(exemptSection2Pojo.getSection2B3());
			exemptSection2Service.fillExemptSection3(exemptorm);
			
			List<ExemptSection2> retrivedata = exemptSection2Service.retriveAssessmentSummaryData();
			/*for (ExemptSection2 exemptSection2 : retrivedata) {

				System.out.println("exemptSection2 :: " + exemptSection2.getSection2CSummeryStrength());

			}*/
			model.addAttribute("assessmentsummary", retrivedata);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "assessmentsummary";

	}

	// Inserting assessment-summary screen data into database
	@RequestMapping(value = "/assessmentsummary", method = RequestMethod.GET)
	public String fillAssessmentSummary(@ModelAttribute("exemptSection2Data") ExemptSection2Pojo exemptSection2Pojo,
			BindingResult result,Model model) {
		try {
			ExemptSection2 exemptorm = new ExemptSection2();
			log.info(exemptSection2Pojo.getSection2C1());
			log.info("AssessmentSummary");
			exemptorm.setSection2CSummeryImprovement(exemptSection2Pojo.getSection2C1());
			exemptorm.setSection2CSummeryStrength(exemptSection2Pojo.getSection2C2());
			exemptorm.setSection2DSummeryOfAccomplishmentAndAreasImprovement(exemptSection2Pojo.getSection2D1());
			exemptorm.setSection2EAssessmentSummary(exemptSection2Pojo.getSection2E1());
			exemptorm.setSection2EAssessmentcompared(exemptSection2Pojo.getSection2E2());
			String year = exemptSection2Service.insertExemptSection2();
			exemptSection2Service.fillAssessmentSummary(exemptorm, year);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "assessmentsummary";
	}

	// Retriving data from assessment-summary screen
	@RequestMapping(value = "/assessmentSummaryOperation", method = RequestMethod.GET)
	public String retriveAssessmentSummary(@ModelAttribute("exemptSection2Pojo") ExemptSection2Pojo exemptSection2Pojo,
			Model model) {
		log.info("Retrive AssessmentSummary");
		ExemptSection2 exemptorm = new ExemptSection2();

		try {
			List<ExemptSection2> retrivedata = exemptSection2Service.retriveAssessmentSummaryData();
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
