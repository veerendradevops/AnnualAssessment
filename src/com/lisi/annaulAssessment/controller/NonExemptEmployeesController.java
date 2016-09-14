package com.lisi.annaulAssessment.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.lisi.annaualAssessment.orm.AcknowledgmentSection;
import com.lisi.annaualAssessment.orm.CensusForm;
import com.lisi.annaualAssessment.orm.InterpersonalSkills;
import com.lisi.annaualAssessment.orm.JobKnowledgeAndSkill;
import com.lisi.annaualAssessment.orm.TrainingAndDevelopment;
import com.lisi.annaulAssessment.pojo.AcknowledgementBean;
import com.lisi.annaulAssessment.pojo.InterpersonalSkillsBean;
import com.lisi.annaulAssessment.pojo.JobKnowledgeAndSkillsBean;
import com.lisi.annaulAssessment.pojo.TrainingAndDevelopmentBean;
import com.lisi.annaulAssessment.service.NonExemptEmployeeService;
import com.lisi.annaulAssessment.util.Converters;

@Controller
public class NonExemptEmployeesController {

	private static final Logger log = Logger.getLogger(NonExemptEmployeesController.class);

	private static String empClockNumber;
	private static String annaulYear;
	private static String loginEmpClock;

	@Autowired
	private NonExemptEmployeeService nonExemptEmployeeService;

	// To get All nonexempt employee list
	@RequestMapping(value = "/team-members-information", method = RequestMethod.GET)
	public String getEmployeeList(@RequestParam("clockNum") String loginEmpClock,ModelMap modelMap) {
		try {

			
			NonExemptEmployeesController.setLoginEmpClock(loginEmpClock);
			List<CensusForm> employeeList = nonExemptEmployeeService.getEmployeeList();

			modelMap.addAttribute("employee", employeeList);
		} catch (Exception e) {
			log.info("im in catch..");
			e.printStackTrace();
		}
		log.info("getEmployeeList() successfully executed");
		return "nonExemptEmployeeList";
	}

	@RequestMapping(value = "/teamMemberPersonalInformation", method = RequestMethod.GET)
	public String getList(@RequestParam("clockNum") String clockNumber, @RequestParam("annualYear") String annualYear,
			Model modelMap) {
		try {

			NonExemptEmployeesController.setEmpClockNumber(Converters.decrypt(clockNumber));

			NonExemptEmployeesController.setAnnaulYear(annualYear);

			String originalValue = Converters.decrypt(clockNumber);

			List<CensusForm> nonExemptList = nonExemptEmployeeService.getNonExemptEmployeeList(originalValue);

			modelMap.addAttribute("employee", nonExemptList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		log.info("getList() successfully executed");

		return "teammemberInformation";

	}

	// to get interpersonal-skills form
	@RequestMapping(value = "/interpersonal-skills", method = RequestMethod.GET)
	public String getInterpersonalSkills(Model model) {
		try {

			String currentYear = String.valueOf(Converters.getCurrentYear());

			if (currentYear.equals(NonExemptEmployeesController.getAnnaulYear())) {

				List<InterpersonalSkills> interpersonalList = nonExemptEmployeeService
						.getInterpersonalData(NonExemptEmployeesController.getEmpClockNumber());

				model.addAttribute("interpersonalData", interpersonalList);

			} else {

				model.addAttribute(new InterpersonalSkillsBean());

			}

		}

		catch (Exception e) {
			e.printStackTrace();
		}
		log.info("getInterpersonalSkills() successfully executed");
		return "interpersonal-skills";
	}

	// InterpersonalSkillsBean method
	@RequestMapping(value = "/interpersonalForm", method = RequestMethod.POST)
	public ModelAndView interPersonalSkills(
			@ModelAttribute("interpersonal") InterpersonalSkillsBean interpersonalSkillsBean, Model model) {

		InterpersonalSkills interpersonalSkills = new InterpersonalSkills();

		try {
			List<JobKnowledgeAndSkill> jobKnowledge = nonExemptEmployeeService
					.getjobknowledgeData(NonExemptEmployeesController.getEmpClockNumber());

			model.addAttribute("jobKnowledgeData", jobKnowledge);

			interpersonalSkills.setClockId(Integer.parseInt(NonExemptEmployeesController.getEmpClockNumber()));

			String currentYear = NonExemptEmployeesController.getAnnaulYear();

			interpersonalSkills.setAnnualYear(currentYear);

			interpersonalSkills.setResponsibilityScore(interpersonalSkillsBean.getAdaptabilityScore());
			interpersonalSkills.setResponsibilitySupervisorsComments(
					interpersonalSkillsBean.getResponsibilitySupervisorsComments());

			interpersonalSkills.setAdaptabilityScore(interpersonalSkillsBean.getAdaptabilityScore());
			interpersonalSkills
					.setAdaptabilitySupervisorsComments(interpersonalSkillsBean.getAdaptabilitySupervisorsComments());

			interpersonalSkills.setInitiativeScore(interpersonalSkillsBean.getInitiativeScore());
			interpersonalSkills
					.setInitiativeSupervisorsComments(interpersonalSkillsBean.getInitiativeSupervisorsComments());

			interpersonalSkills.setJudgementScore(interpersonalSkillsBean.getJudgementScore());
			interpersonalSkills
					.setJudgementSupervisorsComments(interpersonalSkillsBean.getJudgementSupervisorsComments());

			interpersonalSkills
					.setWrittenAndOralCommunicationScore(interpersonalSkillsBean.getWrittenAndOralCommunicationScore());
			interpersonalSkills.setWrittenAndOralCommunicationSupervisorsComments(
					interpersonalSkillsBean.getWrittenAndOralCommunicationSupervisorsComments());

			interpersonalSkills
					.setPunctualityAndCommitmentScore(interpersonalSkillsBean.getPunctualityAndCommitmentScore());
			interpersonalSkills.setPunctualityAndCommitmentSupervisorsComments(
					interpersonalSkillsBean.getPunctualityAndCommitmentSupervisorsComments());

			interpersonalSkills.setAvgScore(interpersonalSkillsBean.getAvgScore().trim());

			String ormClass = "InterpersonalSkills";

			String year = nonExemptEmployeeService.getYear(ormClass);
			nonExemptEmployeeService.addInterpersonalSkillsData(interpersonalSkills, year);

			// String year=nonExemptEmployeeService.getYear();

			return new ModelAndView("job-knowledge-skills");

		}

		catch (Exception e) {

			model.addAttribute("message", "Your data is not inserted..");

			/*
			 * nonExemptEmployeeService.deleteEmp(Integer.parseInt(
			 * NonExemptEmployeesController.getEmpClockNumber()));
			 */

			return new ModelAndView("interpersonal-skills");

		}

	}

	// log.info("interPersonalSkills() successfully executed");

	// to get job-knowledge-skills form
	@RequestMapping(value = "job-knowledge-skills")
	public String getJobKnowledgeSkills(Model model) {

		try {
			String currentYear = String.valueOf(Converters.getCurrentYear());

			if (currentYear.equals(NonExemptEmployeesController.getAnnaulYear())) {

				List<JobKnowledgeAndSkill> jobKnowledge = nonExemptEmployeeService
						.getjobknowledgeData(NonExemptEmployeesController.getEmpClockNumber());

				model.addAttribute("jobKnowledgeData", jobKnowledge);

			} else {

				model.addAttribute(new JobKnowledgeAndSkillsBean());

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "job-knowledge-skills";
	}

	// log.info("getJobKnowledgeSkills() successfully executed");

	// JobKnowledgeAndSkillsBean method
	@RequestMapping(value = "/jobknowledgeForm", method = RequestMethod.POST)
	public ModelAndView jobKnowledgeAndSkills(@ModelAttribute("jobknowledge") JobKnowledgeAndSkillsBean jkasBean,
			Model model) {

		JobKnowledgeAndSkill jobKnowledgeAndSkill = new JobKnowledgeAndSkill();

		try {

			jobKnowledgeAndSkill.setClockId(Integer.parseInt(NonExemptEmployeesController.getEmpClockNumber()));

			String currentYear = NonExemptEmployeesController.getAnnaulYear();

			jobKnowledgeAndSkill.setAnnualYear(currentYear);

			jobKnowledgeAndSkill.setSafetyScore(jkasBean.getSafetyScore());
			jobKnowledgeAndSkill.setSafetySupervisorsComments(jkasBean.getSafetySupervisorsComments());

			jobKnowledgeAndSkill.setQualityScore(jkasBean.getQualityScore());
			jobKnowledgeAndSkill.setQualitySupervisorsComments(jkasBean.getQualitySupervisiorsComments());

			jobKnowledgeAndSkill.setProductivityScore(jkasBean.getProductivityScore());
			jobKnowledgeAndSkill.setProductivitySupervisorsComments(jkasBean.getProductivitySupervisorsComments());

			jobKnowledgeAndSkill.setJobKnowledgeAndSkillsScore(jkasBean.getJobKnowledgeAndSkillsScore());
			jobKnowledgeAndSkill.setJobKnowledgeAndSkillsSupervisorsComments(
					jkasBean.getJobKnowledgeAndSkillsSupervisorsComments());

			jobKnowledgeAndSkill.setSupervisorsOverallComments(jkasBean.getSupervisorsOveralComments());

			jobKnowledgeAndSkill.setAvgScore(jkasBean.getAvgScore().trim());

			String ormClass = "JobKnowledgeAndSkill";

			String year = nonExemptEmployeeService.getYear(ormClass);

			nonExemptEmployeeService.addJobKnowledgeAndSkillsData(jobKnowledgeAndSkill, year);

			return new ModelAndView("training-development");

		} catch (Exception e) {
			log.info("this is catch block");
			model.addAttribute("message", "your data not inserted successfully");

			// e.getprin();

			System.out.println(e.getMessage());
			e.printStackTrace();
			/*
			 * nonExemptEmployeeService
			 * .deleteJobKnowledgeService(Integer.parseInt(
			 * NonExemptEmployeesController.getEmpClockNumber()));
			 */

			return new ModelAndView("job-knowledge-skills");
		}

	}
	// log.info(jobKnowledgeAndSkills() successfully executed");

	/*
	 * // to get SummaryOfPerformance form
	 * 
	 * @RequestMapping(value = "/summary-of-performance-review") public String
	 * getNonExemptSummary(Model model) {
	 * 
	 * try { String currentYear = String.valueOf(Converters.getDate());
	 * 
	 * if (currentYear.equals("2016")) {
	 * 
	 * List<SummaryOfPerformanceReview> summaryOfPerformanceReviewList =
	 * nonExemptEmployeeService
	 * .getSummaryOfPerformanceReviewData(NonExemptEmployeesController.
	 * getEmpClockNumber());
	 * 
	 * model.addAttribute("summaryOfPerformanceReviewList",
	 * summaryOfPerformanceReviewList);
	 * 
	 * } else {
	 * 
	 * model.addAttribute(new SummaryOfPerformanceBean());
	 * 
	 * } } catch (Exception e) {
	 * 
	 * }
	 * 
	 * return "summary-of-performance-review";
	 * 
	 * }
	 * 
	 * // log.info("getNonExemptSummary() successfully executed");
	 * 
	 * // SummaryOfPerformanceBean method
	 * 
	 * @RequestMapping(value = "/summaryPerformace", method =
	 * RequestMethod.POST) public ModelAndView addNonExemptSummaryData(
	 * 
	 * @ModelAttribute("summarybean") SummaryOfPerformanceBean nonExemptSummary,
	 * Model model) {
	 * 
	 * SummaryOfPerformanceReview nonExemptSummaryOrm = new
	 * SummaryOfPerformanceReview(); try {
	 * 
	 * nonExemptSummaryOrm.setClockId(Integer.parseInt(
	 * NonExemptEmployeesController.empClockNumber));
	 * 
	 * String currentYear = String.valueOf(Converters.getDate());
	 * 
	 * nonExemptSummaryOrm.setAnnualPerformance(currentYear);
	 * 
	 * nonExemptSummaryOrm.setSupervisorsOverallComments(nonExemptSummary.
	 * getSupervisorsOveralComments());
	 * 
	 * String str = nonExemptSummaryOrm.getSupervisorsOverallComments();
	 * System.out.println(str);
	 * 
	 * nonExemptEmployeeService.addNonExemptSummaryData(nonExemptSummaryOrm);
	 * 
	 * }
	 * 
	 * catch (Exception e) {
	 * 
	 * String s = "could not insert";
	 * 
	 * if (s.contains(e.getMessage())) {
	 * 
	 * }
	 * 
	 * model.addAttribute("status", "your data not inserted successfully");
	 * 
	 * nonExemptEmployeeService.deleteNonExemptSummaryService(
	 * NonExemptEmployeesController.getEmpClockNumber());
	 * 
	 * return new ModelAndView("summary-of-performance-review"); } return new
	 * ModelAndView("training-development");
	 * 
	 * }
	 */

	@RequestMapping(value = "training-development", method = RequestMethod.GET)
	public String getNonExemptTrainingorDevelopment(Model model) {

		try {
			String currentYear = String.valueOf(Converters.getCurrentYear());

			if (currentYear.equals(NonExemptEmployeesController.getAnnaulYear())) {

				List<TrainingAndDevelopment> trainingAndDevelopement = nonExemptEmployeeService
						.getTrainingAndDevelopmentData(NonExemptEmployeesController.getEmpClockNumber());

				model.addAttribute(" trainingAndDevelopement", trainingAndDevelopement);
				
				
			} else {
				log.info("this is catch block");
				model.addAttribute(new TrainingAndDevelopmentBean());

			}
		} catch (Exception e) {

			e.printStackTrace();

		}

		return "training-development";
	}

	// neethu

	// TrainingAndDevelopementBean method
	@RequestMapping(value = "/training-developmentForm", method = RequestMethod.POST)
	public ModelAndView addNonExemptTrainingorDevelopmenData(
			@ModelAttribute("trainingAndDevelopment") TrainingAndDevelopmentBean trainingAndDevelopmentBean) {

		TrainingAndDevelopment trainingAndDevelopement = new TrainingAndDevelopment();

		log.info("/training-developmentForm");
		try {
			log.info(trainingAndDevelopmentBean.getFirstAreaorFocus());

			trainingAndDevelopement.setClockId(Integer.parseInt(NonExemptEmployeesController.getEmpClockNumber()));

			trainingAndDevelopement.setFirstAreaorFocus(trainingAndDevelopmentBean.getFirstAreaorFocus());
			/*
			 * trainingAndDevelopement.setFirstDateDue(
			 * trainingAndDevelopmentBean .getFirstDateDue());
			 */
			trainingAndDevelopement
					.setFirstDateDue(Converters.getNonExemptDate((trainingAndDevelopmentBean.getFirstDateDue())));

			trainingAndDevelopement.setfirstTrainingTopic(trainingAndDevelopmentBean.getfirstTrainingTopic());
			trainingAndDevelopement
					.setfirstTrainingDescription(trainingAndDevelopmentBean.getfirstTrainingDescription());

			trainingAndDevelopement.setSecondAreaorFocus(trainingAndDevelopmentBean.getSecondAreaorFocus());
			trainingAndDevelopement
					.setSecondDateDue(Converters.getNonExemptDate(trainingAndDevelopmentBean.getSecondfDateDue()));

			trainingAndDevelopement.setSecondTrainingTopic(trainingAndDevelopmentBean.getSecondTrainingTopic());
			trainingAndDevelopement
					.setSecondTrainingDescription(trainingAndDevelopmentBean.getSecondTrainingDescription());

			trainingAndDevelopement.setThirdAreaorFocus(trainingAndDevelopmentBean.getThirdAreaorFocus());
			trainingAndDevelopement
					.setThirdDateDue(Converters.getNonExemptDate(trainingAndDevelopmentBean.getThirdDateDue()));

			trainingAndDevelopement.setThirdTrainingTopic(trainingAndDevelopmentBean.getThirdTrainingTopic());
			trainingAndDevelopement
					.setThirdTrainingDescription(trainingAndDevelopmentBean.getThirdTrainingDescription());
			trainingAndDevelopement.setAnnualYear(NonExemptEmployeesController.getAnnaulYear());

			String ormClass = "TrainingAndDevelopment";

			String year = nonExemptEmployeeService.getYear(ormClass);

			nonExemptEmployeeService.addNonExemptTrainingorDevelopmenData(trainingAndDevelopement, year);

		}

		catch (Exception e) {
			return new ModelAndView("training-development");
		}
		return new ModelAndView("acknowledgment-section");

	}

	// log.info("addNonExemptSummaryData() successfully executed");

	// To get NonExemptacknowledgment form
	@RequestMapping(value = "acknowledgment-section")
	public String getNonExemptAcknowledgmentSection(Model model) {

		try {
			String currentYear = String.valueOf(Converters.getCurrentYear());

			if (currentYear.equals(NonExemptEmployeesController.getAnnaulYear())) {

				List<AcknowledgmentSection> acknowledgement = nonExemptEmployeeService
						.getAcknowledgementData(NonExemptEmployeesController.getEmpClockNumber());

				model.addAttribute("acknowledgement", acknowledgement);

			} else {

				model.addAttribute(new AcknowledgementBean());

			}
		} catch (Exception e) {

		}
		return "acknowledgment-section";
	}

	// AcknowledgementBean method
	@RequestMapping(value = "/acknowledgment-section", method = RequestMethod.POST)
	public String addNonExemptAcknowledgmentSectionData(
			@ModelAttribute("acknowledgment") AcknowledgementBean acknowledgementBean, Model model) {

		AcknowledgmentSection acknowledgmentSection = new AcknowledgmentSection();

		try {

			String currentYear = String.valueOf(Converters.getCurrentYear());

			acknowledgmentSection.setClockId(Integer.parseInt(NonExemptEmployeesController.getEmpClockNumber()));
			acknowledgmentSection.setAnnualYear(currentYear);
			acknowledgmentSection.setTeamMembersComments(acknowledgementBean.getTeamMembersComments());

			nonExemptEmployeeService.addNonExemptAcknowledgmentSectionData(acknowledgmentSection);

		} catch (Exception e) {

			model.addAttribute("status", "your data not inserted successfully");

			nonExemptEmployeeService.deleteAcknowledgmentSectionData(NonExemptEmployeesController.getEmpClockNumber());
			return "acknowledgment-section";
		}
		return "training-development";

	}

	// ===============================================================================================================================
	/*
	 * // To get TrainingAndDevelopement form
	 * 
	 * @RequestMapping(value = "training-development", method =
	 * RequestMethod.GET) public String getNonExemptTrainingorDevelopment(Model
	 * model) { model.addAttribute(new TrainingAndDevelopmentBean()); return
	 * "training-development"; }
	 * 
	 * // TrainingAndDevelopementBean method
	 * 
	 * @RequestMapping(value = "/training-developmentForm", method =
	 * RequestMethod.POST) public ModelAndView
	 * addNonExemptTrainingorDevelopmenData(
	 * 
	 * @ModelAttribute("trainingAndDevelopment") TrainingAndDevelopmentBean
	 * trainingAndDevelopmentBean, HttpServletRequest request) {
	 * 
	 * TrainingAndDevelopment trainingAndDevelopement = new
	 * TrainingAndDevelopment();
	 * 
	 * try {
	 * 
	 * trainingAndDevelopement.setFirstAreaorFocus(trainingAndDevelopmentBean.
	 * getFirstAreaorFocus());
	 * trainingAndDevelopement.setFirstDateDue(trainingAndDevelopmentBean.
	 * getFirstDateDue()); trainingAndDevelopement.setFirstMethodofTraining(
	 * trainingAndDevelopmentBean.getFirstMethodofTraining());
	 * 
	 * trainingAndDevelopement.setSecondAreaorFocus(trainingAndDevelopmentBean.
	 * getSecondAreaorFocus());
	 * trainingAndDevelopement.setSecondfDateDue(trainingAndDevelopmentBean.
	 * getSecondfDateDue()); trainingAndDevelopement.setSecondMethodofTraining(
	 * trainingAndDevelopmentBean.getSecondMethodofTraining());
	 * 
	 * trainingAndDevelopement.setThirdAreaorFocus(trainingAndDevelopmentBean.
	 * getThirdAreaorFocus());
	 * trainingAndDevelopement.setThirdDateDue(trainingAndDevelopmentBean.
	 * getThirdDateDue()); trainingAndDevelopement.setThirdMethodofTraining(
	 * trainingAndDevelopmentBean.getThirdMethodofTraining());
	 * 
	 * nonExemptEmployeeService.addNonExemptTrainingorDevelopmenData(
	 * trainingAndDevelopement);
	 * 
	 * }
	 * 
	 * catch (Exception e) { return new ModelAndView("training-development"); }
	 * return new ModelAndView("...");
	 * 
	 * }
	 */

	public static String getEmpClockNumber() {
		return empClockNumber;
	}

	public static void setEmpClockNumber(String empClockNumber) {
		NonExemptEmployeesController.empClockNumber = empClockNumber;
	}

	public static String getAnnaulYear() {
		return annaulYear;
	}

	public static void setAnnaulYear(String annaulYear) {
		NonExemptEmployeesController.annaulYear = annaulYear;
	}
	/*
	 * public static int getYear(){ int year=nonExemptEmployeeService.getYear();
	 * return year; }
	 */

	public static String getLoginEmpClock() {
		return loginEmpClock;
	}

	public static void setLoginEmpClock(String loginEmpClock) {
		NonExemptEmployeesController.loginEmpClock = loginEmpClock;
	}
	
	
	
}
