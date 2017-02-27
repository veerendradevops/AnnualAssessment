package com.lisi.annualassessment.controller;

import java.text.DecimalFormat;
import java.util.Iterator;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.lisi.annualassessment.emp.form.EncryptDecryptProcess;
import com.lisi.annualassessment.orm.AppraisalMailConfig;
import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.orm.InterpersonalSkills;
import com.lisi.annualassessment.orm.JobKnowledgeAndSkill;
import com.lisi.annualassessment.orm.TrainingAndDevelopment;
import com.lisi.annualassessment.pojo.AcknowledgementBean;
import com.lisi.annualassessment.pojo.InterpersonalSkillsBean;
import com.lisi.annualassessment.pojo.JobKnowledgeAndSkillsBean;
import com.lisi.annualassessment.pojo.LoginUser;
import com.lisi.annualassessment.pojo.TrainingAndDevelopmentBean;
import com.lisi.annualassessment.service.EmployeeService;
import com.lisi.annualassessment.service.ExemptTeamMemberService;
import com.lisi.annualassessment.service.NonExemptEmployeeService;
import com.lisi.annualassessment.service.TMPersonalInformationService;
import com.lisi.annualassessment.util.Converters;
import com.lisi.annualassessment.util.EmailConfig;

@Controller
public class NonExemptEmployeesController {

	private static final Logger log = Logger.getLogger(NonExemptEmployeesController.class);

	private String nonexemptEmpClock, employeeYear;

	@Autowired
	private ExemptTeamMemberService exemptTeamMemberService;

	@Autowired
	private NonExemptEmployeeService nonExemptEmployeeService;

	@Autowired
	private TMPersonalInformationService employeeInfo;

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private LogoutController logoutController;

	@Autowired
	private TMPersonalInformationService tmservice;

	@Autowired
	private LoginUser loginUser;

	@InitBinder
	public void initBinder(HttpSession session, HttpServletResponse response) {
		log.info("Start .");

		log.info("End .");
	}

	// To get All nonexempt employee list
	@RequestMapping(value = "/team-members-information", method = RequestMethod.GET)
	public String getEmployeeList(@RequestParam("clockNum") String loginEmpClock, ModelMap modelMap,
			HttpSession session) {
		try {

			// nonexemptEmpClock = (String) session.getAttribute("nonExempt");
			// employeeYear = (String) session.getAttribute("nonExemptYear");

			nonexemptEmpClock = loginUser.getNonExemptEmployeeClock();
			employeeYear = loginUser.getNonExemptEmployeeYear();

			if (nonexemptEmpClock != null) {
				System.out.println("is Not Null");
			} else {

				return "loginScreen";
			}

			System.out.println("non - exempt Team member info");
			List<CensusForm> employeeList = nonExemptEmployeeService.getEmployeeList(loginEmpClock);

			modelMap.addAttribute("employee", employeeList);

			modelMap.addAttribute("loginUser", loginUser);

		} catch (Exception e) {
			log.info("im in catch..");
			modelMap.addAttribute("loginUser", loginUser);
			e.printStackTrace();
		}
		log.info("getEmployeeList() successfully executed");
		return "nonExemptEmployeeList";
	}

	@RequestMapping(value = "/teamMemberPersonalInformation", method = RequestMethod.GET)
	public String getList(@RequestParam("clockNum") String clockNumber, @RequestParam("annualYear") String annualYear,
			Model modelMap, HttpSession session) {
		try {

			// session.setAttribute("nonExempt",
			// Converters.decrypt(clockNumber));
			session.setAttribute("nonExempt", clockNumber.trim());

			loginUser.setNonExemptEmployeeClock(clockNumber.trim());

			session.setAttribute("nonExemptYear", annualYear);

			loginUser.setNonExemptEmployeeYear(annualYear);

			// String originalValue = Converters.decrypt(clockNumber);

			List<CensusForm> nonExemptList = nonExemptEmployeeService.getNonExemptEmployeeList(clockNumber.trim(),
					annualYear);

			String salaryrole = "";
			for (CensusForm census : nonExemptList) {

				salaryrole = String.valueOf(census.getRole());
			}

			session.setAttribute("salaryReviewNonExempt", String.valueOf(salaryrole));
			modelMap.addAttribute("employee", nonExemptList);
			modelMap.addAttribute("loginUser", loginUser);
		} catch (Exception e) {
			modelMap.addAttribute("loginUser", loginUser);
			e.printStackTrace();

		}
		log.info("getList() successfully executed");

		return "teammemberInformation";

	}

	@RequestMapping(value = "/nonExemptPersonalInfo", method = RequestMethod.GET)
	public String nonExemptPersonalInfo(Model model, HttpSession session) {

		nonexemptEmpClock = loginUser.getNonExemptEmployeeClock();
		employeeYear = loginUser.getNonExemptEmployeeYear();
		if (nonexemptEmpClock != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		List<CensusForm> nonExemptList = nonExemptEmployeeService.getNonExemptEmployeeList(nonexemptEmpClock.trim(),
				employeeYear.trim());

		model.addAttribute("employee", nonExemptList);
		model.addAttribute("loginUser", loginUser);
		return "teammemberInformation";
	}

	// to get interpersonal-skills form
	@RequestMapping(value = "/interpersonal-skills", method = RequestMethod.GET)
	public String getInterpersonalSkills(Model model, HttpSession session) {
		try {

			nonexemptEmpClock = loginUser.getNonExemptEmployeeClock();
			employeeYear = loginUser.getNonExemptEmployeeYear();

			if (nonexemptEmpClock != null) {
				System.out.println("is Not Null");
			} else {

				return "loginScreen";
			}

			String status = getStatus(nonexemptEmpClock, employeeYear);

			model.addAttribute("status", status);
			model.addAttribute("loginUser", loginUser);
			// interpersonal skills data
			List<InterpersonalSkills> interpersonalList = nonExemptEmployeeService
					.getInterpersonalData(nonexemptEmpClock.trim(), employeeYear);

			InterpersonalSkills interpersonalObject = nonExemptEmployeeService
					.getInterpersonalObjectData(nonexemptEmpClock.trim(), employeeYear.trim());

			if (interpersonalObject != null) {

				model.addAttribute("idetails", interpersonalObject);
				if (interpersonalObject.getSupervisorstatus() == null
						|| interpersonalObject.getSupervisorstatus().isEmpty()) {

					if (interpersonalObject.getResponsibilityScore() == null
							|| interpersonalObject.getResponsibilitySupervisorsComments().isEmpty()
							|| interpersonalObject.getResponsibilityScore().isEmpty()
							|| interpersonalObject.getResponsibilitySupervisorsComments() == null) {

						model.addAttribute("imessage", "noValidation");

					}

					else if (interpersonalObject.getAdaptabilityScore() == null
							|| interpersonalObject.getAdaptabilitySupervisorsComments().isEmpty()
							|| interpersonalObject.getAdaptabilityScore().isEmpty()
							|| interpersonalObject.getAdaptabilitySupervisorsComments() == null) {

						model.addAttribute("imessage", "noValidation");

					} else if (interpersonalObject.getInitiativeScore() == null
							|| interpersonalObject.getInitiativeSupervisorsComments().isEmpty()
							|| interpersonalObject.getInitiativeScore().isEmpty()
							|| interpersonalObject.getInitiativeSupervisorsComments() == null) {

						model.addAttribute("imessage", "noValidation");

					} else if (interpersonalObject.getJudgementScore() == null
							|| interpersonalObject.getJudgementSupervisorsComments().isEmpty()
							|| interpersonalObject.getJudgementScore().isEmpty()
							|| interpersonalObject.getJudgementSupervisorsComments() == null) {

						model.addAttribute("imessage", "noValidation");

					}

					else if (interpersonalObject.getWrittenAndOralCommunicationScore() == null
							|| interpersonalObject.getWrittenAndOralCommunicationSupervisorsComments().isEmpty()
							|| interpersonalObject.getWrittenAndOralCommunicationScore().isEmpty()
							|| interpersonalObject.getWrittenAndOralCommunicationSupervisorsComments() == null) {

						model.addAttribute("imessage", "noValidation");

					}

					else if (interpersonalObject.getPunctualityAndCommitmentScore() == null
							|| interpersonalObject.getPunctualityAndCommitmentSupervisorsComments().isEmpty()
							|| interpersonalObject.getPunctualityAndCommitmentScore().isEmpty()
							|| interpersonalObject.getPunctualityAndCommitmentSupervisorsComments() == null) {

						model.addAttribute("imessage", "noValidation");

					}
				}

				return "interpersonal-skills";

			} else if (interpersonalObject == null) {

				model.addAttribute("idetails", interpersonalObject);
				model.addAttribute("imessage", "noValidation");
			}

			/* model.addAttribute("interpersonalData", interpersonalList); */

		}

		catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("loginUser", loginUser);
		}
		log.info("getInterpersonalSkills() successfully executed");
		return "interpersonal-skills";
	}

	// InterpersonalSkillsBean method for Next & Save
	@RequestMapping(value = "/interpersonalForm", params = "btnSubmitNextSave", method = RequestMethod.POST)
	public ModelAndView interPersonalSkillsNextSave(
			@ModelAttribute("interpersonal") InterpersonalSkillsBean interpersonalSkillsBean, Model model,
			HttpSession session) {
		log.info("interpersonal next and save");

		nonexemptEmpClock = loginUser.getNonExemptEmployeeClock();
		;
		employeeYear = loginUser.getNonExemptEmployeeYear();

		if (nonexemptEmpClock != null) {

			System.out.println("is Not Null");

		} else {

			return new ModelAndView("loginScreen");
		}

		InterpersonalSkills interpersonalSkills = new InterpersonalSkills();
		try {
			// saving the data
			saveInterPersonalSkills(interpersonalSkills, interpersonalSkillsBean, model, session);

			// getInterpersonalSkills(model, session);

			// job knowledge data.
			/*
			 * List<JobKnowledgeAndSkill> jobKnowledge =
			 * nonExemptEmployeeService.getjobknowledgeData(nonexemptEmpClock,
			 * employeeYear);
			 * 
			 * model.addAttribute("jobKnowledgeData", jobKnowledge);
			 */
			getJobKnowledgeSkills(model, session);
			model.addAttribute("loginUser", loginUser);
			return new ModelAndView("job-knowledge-skills");

		}

		catch (Exception e) {

			model.addAttribute("message", "Your data is not inserted..");
			model.addAttribute("loginUser", loginUser);
			e.printStackTrace();
			return new ModelAndView("interpersonal-skills");

		}

	}

	// InterpersonalSkillsBean method for Back & Save
	@RequestMapping(value = "/interpersonalForm", params = "btnSubmitBackSave", method = RequestMethod.POST)
	public ModelAndView interPersonalSkillsBackSave(
			@ModelAttribute("interpersonal") InterpersonalSkillsBean interpersonalSkillsBean, Model model,
			HttpSession session) {

		nonexemptEmpClock = loginUser.getNonExemptEmployeeClock();
		employeeYear = loginUser.getNonExemptEmployeeYear();

		if (nonexemptEmpClock != null) {
			System.out.println("is Not Null");
		} else {

			return new ModelAndView("loginScreen");
		}

		InterpersonalSkills interpersonalSkills = new InterpersonalSkills();
		try {
			// saving the data
			saveInterPersonalSkills(interpersonalSkills, interpersonalSkillsBean, model, session);
			List<CensusForm> nonExemptList = nonExemptEmployeeService.getNonExemptEmployeeList(nonexemptEmpClock,
					employeeYear);

			model.addAttribute("employee", nonExemptList);
			model.addAttribute("loginUser", loginUser);
			// getInterpersonalSkills(model, session);

			return new ModelAndView("teammemberInformation");
		}

		catch (Exception e) {
			model.addAttribute("message", "Your data is not inserted..");
			model.addAttribute("loginUser", loginUser);
			e.printStackTrace();
			return new ModelAndView("interpersonal-skills");

		}

	}

	public void saveInterPersonalSkills(InterpersonalSkills interpersonalSkills,
			InterpersonalSkillsBean interpersonalSkillsBean, Model model, HttpSession session) throws Exception {
		System.out.println("save interpersonal skills");
		nonexemptEmpClock = loginUser.getNonExemptEmployeeClock();
		employeeYear = loginUser.getNonExemptEmployeeYear();

		interpersonalSkills.setClockId(Integer.parseInt(nonexemptEmpClock.trim()));

		String currentYear = employeeYear;

		interpersonalSkills.setAnnualYear(currentYear);

		interpersonalSkills.setResponsibilityScore(interpersonalSkillsBean.getResponsibilityScore());
		interpersonalSkills
				.setResponsibilitySupervisorsComments(interpersonalSkillsBean.getResponsibilitySupervisorsComments());

		interpersonalSkills.setAdaptabilityScore(interpersonalSkillsBean.getAdaptabilityScore());
		interpersonalSkills
				.setAdaptabilitySupervisorsComments(interpersonalSkillsBean.getAdaptabilitySupervisorsComments());

		interpersonalSkills.setInitiativeScore(interpersonalSkillsBean.getInitiativeScore());
		interpersonalSkills
				.setInitiativeSupervisorsComments(interpersonalSkillsBean.getInitiativeSupervisorsComments());

		interpersonalSkills.setJudgementScore(interpersonalSkillsBean.getJudgementScore());
		interpersonalSkills.setJudgementSupervisorsComments(interpersonalSkillsBean.getJudgementSupervisorsComments());

		interpersonalSkills
				.setWrittenAndOralCommunicationScore(interpersonalSkillsBean.getWrittenAndOralCommunicationScore());
		interpersonalSkills.setWrittenAndOralCommunicationSupervisorsComments(
				interpersonalSkillsBean.getWrittenAndOralCommunicationSupervisorsComments());

		interpersonalSkills
				.setPunctualityAndCommitmentScore(interpersonalSkillsBean.getPunctualityAndCommitmentScore());
		interpersonalSkills.setPunctualityAndCommitmentSupervisorsComments(
				interpersonalSkillsBean.getPunctualityAndCommitmentSupervisorsComments());

		if (interpersonalSkillsBean.getAvgScore().isEmpty() || interpersonalSkillsBean.getAvgScore() == null) {

			interpersonalSkills.setAvgScore("0");
		} else {
			interpersonalSkills.setAvgScore(interpersonalSkillsBean.getAvgScore().trim());

		}
		String ormClass = "InterpersonalSkills";

		String year = nonExemptEmployeeService.getYear(ormClass, nonexemptEmpClock, employeeYear);

		if (String.valueOf(year).equals("null") || String.valueOf(year).length() == 0) {

			exemptTeamMemberService.updateCensusForm("STARTED", nonexemptEmpClock, employeeYear.trim());

		}

		System.out.println("chcking year");
		System.out.println(String.valueOf(year));
		nonExemptEmployeeService.addInterpersonalSkillsData(interpersonalSkills, year);

		String avgScore = nonExemptEmployeeService.getInterpersonalAvgScore(nonexemptEmpClock, employeeYear);

		model.addAttribute("avgScore", avgScore);
		model.addAttribute("avgScoreScript", avgScore);
		model.addAttribute("loginUser", loginUser);

	}

	// to get job-knowledge-skills form
	@RequestMapping(value = "job-knowledge-skills")
	public String getJobKnowledgeSkills(Model model, HttpSession session) {

		try {

			nonexemptEmpClock = loginUser.getNonExemptEmployeeClock();
			employeeYear = loginUser.getNonExemptEmployeeYear();

			if (nonexemptEmpClock != null) {
				System.out.println("is Not Null");
			} else {

				return "loginScreen";
			}

			String avgScore = nonExemptEmployeeService.getInterpersonalAvgScore(nonexemptEmpClock, employeeYear);

			if (avgScore.isEmpty()) {

				avgScore = "0";
			}

			String status = getStatus(nonexemptEmpClock, employeeYear);

			model.addAttribute("status", status);

			JobKnowledgeAndSkill jobKnowledgeObject = nonExemptEmployeeService.getjobknowledgeObject(nonexemptEmpClock,
					employeeYear);
			model.addAttribute("avgScoreScript", avgScore);
			model.addAttribute("avgScore", avgScore);

			if (jobKnowledgeObject != null) {

				if (jobKnowledgeObject.getAvgScore() != null || (!jobKnowledgeObject.getAvgScore().isEmpty())) {
					System.out.println("in not null method");

					System.out.println(avgScore + "avgScore");

					String summaryScore = jobKnowledgeObject.getAvgScore().replace(",", "");
					System.out.println(summaryScore + "ss");


					
					double doubleAvgScore = (Double.parseDouble(avgScore.trim())
							+ Double.parseDouble(summaryScore.trim())) / 2;
					

					double value = doubleAvgScore;
					double rounded = (double) Math.round(value * 100) / 100;
			//		double rounded = (double) Math.round(value);
					System.out.println(value +" rounded is "+ rounded);
					
					
					System.out.println("original score " + rounded);
					avgScore = new DecimalFormat("##.##").format(rounded);
					System.out.println(avgScore + "avg score of both");
				}

				model.addAttribute("avgScore", avgScore);
				model.addAttribute("jdetails", jobKnowledgeObject);
				model.addAttribute("loginUser", loginUser);

				if (jobKnowledgeObject.getSupervisorstatus() == null
						|| jobKnowledgeObject.getSupervisorstatus().isEmpty()) {

					System.out.println("data from query..");

					if (jobKnowledgeObject.getSafetyScore() == null
							|| jobKnowledgeObject.getSafetySupervisorsComments().isEmpty()
							|| jobKnowledgeObject.getSafetyScore().isEmpty()
							|| jobKnowledgeObject.getSafetySupervisorsComments() == null) {

						model.addAttribute("jmessage", "no Validation");

					} else if (jobKnowledgeObject.getQualityScore() == null
							|| jobKnowledgeObject.getQualitySupervisorsComments().isEmpty()
							|| jobKnowledgeObject.getQualityScore().isEmpty()
							|| jobKnowledgeObject.getQualitySupervisorsComments() == null) {

						model.addAttribute("jmessage", "no Validation");

					} else if (jobKnowledgeObject.getProductivityScore() == null
							|| jobKnowledgeObject.getProductivitySupervisorsComments().isEmpty()
							|| jobKnowledgeObject.getProductivityScore().isEmpty()
							|| jobKnowledgeObject.getProductivitySupervisorsComments() == null) {

						model.addAttribute("jmessage", "no Validation");

					} else if (jobKnowledgeObject.getJobKnowledgeAndSkillsScore() == null
							|| jobKnowledgeObject.getJobKnowledgeAndSkillsSupervisorsComments().isEmpty()
							|| jobKnowledgeObject.getJobKnowledgeAndSkillsScore().isEmpty()
							|| jobKnowledgeObject.getJobKnowledgeAndSkillsSupervisorsComments() == null) {

						model.addAttribute("jmessage", "no Validation");

					} else if (jobKnowledgeObject.getSupervisorsOverallComments() == null
							|| jobKnowledgeObject.getSupervisorsOverallComments().isEmpty()) {

						model.addAttribute("jmessage", "no Validation");

					}
				}
				return "job-knowledge-skills";

			} else if (jobKnowledgeObject == null) {

				System.out.println("null date from query");

				model.addAttribute("jdetails", jobKnowledgeObject);
				model.addAttribute("jmessage", "no Validation");

			}
			model.addAttribute("loginUser", loginUser);
			log.info("getJobKnowledgeSkills() successfully executed");

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("loginUser", loginUser);
		}
		return "job-knowledge-skills";
	}

	@RequestMapping(value = "/jobknowledgeForm", params = "btnSubmitBackSave", method = RequestMethod.POST)
	public String jobKnowledgeAndSkillsBackSave(@ModelAttribute("jobknowledge") JobKnowledgeAndSkillsBean jkasBean,
			Model model, HttpSession session) {

		JobKnowledgeAndSkill jobKnowledgeAndSkill = new JobKnowledgeAndSkill();
		try {

			nonexemptEmpClock = loginUser.getNonExemptEmployeeClock();
			employeeYear = loginUser.getNonExemptEmployeeYear();

			if (nonexemptEmpClock != null) {
				System.out.println("is Not Null");
			} else {

				return "loginScreen";
			}

			/*
			 * List<InterpersonalSkills> interpersonalList =
			 * nonExemptEmployeeService
			 * .getInterpersonalData(nonexemptEmpClock.trim(), employeeYear);
			 * 
			 * 
			 * model.addAttribute("interpersonalData", interpersonalList);
			 */

			jobKnowledgeAndSkillsForm(jkasBean, jobKnowledgeAndSkill, model, session);
			getInterpersonalSkills(model, session);
			model.addAttribute("loginUser", loginUser);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("loginUser", loginUser);
			return "job-knowledge-skills";
		}
		return "interpersonal-skills";
	}

	@RequestMapping(value = "/jobknowledgeForm", params = "btnSubmitNextSave", method = RequestMethod.POST)
	public String jobKnowledgeAndSkillsNextSave(@ModelAttribute("jobknowledge") JobKnowledgeAndSkillsBean jkasBean,
			Model model, HttpSession session) {

		JobKnowledgeAndSkill jobKnowledgeAndSkill = new JobKnowledgeAndSkill();
		try {

			nonexemptEmpClock = loginUser.getNonExemptEmployeeClock();
			employeeYear = loginUser.getNonExemptEmployeeYear();

			if (nonexemptEmpClock != null) {
				System.out.println("is Not Null");
			} else {

				return "loginScreen";
			}

			List<InterpersonalSkills> interpersonalList = nonExemptEmployeeService
					.getInterpersonalData(nonexemptEmpClock.trim(), employeeYear);

			List<TrainingAndDevelopment> trainingAndDevelopement = nonExemptEmployeeService
					.getTrainingAndDevelopmentData(nonexemptEmpClock, employeeYear);

			model.addAttribute("trainingAndDevelopement", trainingAndDevelopement);
			model.addAttribute("loginUser", loginUser);
			jobKnowledgeAndSkillsForm(jkasBean, jobKnowledgeAndSkill, model, session);

			getJobKnowledgeSkills(model, session);

			return "training-development";

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("loginUser", loginUser);
			return "job-knowledge-skills";
		}

	}

	public void jobKnowledgeAndSkillsForm(JobKnowledgeAndSkillsBean jkasBean, JobKnowledgeAndSkill jobKnowledgeAndSkill,
			Model model, HttpSession session) throws Exception {
		nonexemptEmpClock = loginUser.getNonExemptEmployeeClock();
		employeeYear = loginUser.getNonExemptEmployeeYear();

		System.out.println("job knowledge skills");

		jobKnowledgeAndSkill.setClockId(Integer.parseInt(nonexemptEmpClock.trim()));

		String currentYear = employeeYear.trim();

		jobKnowledgeAndSkill.setAnnualYear(currentYear);

		jobKnowledgeAndSkill.setSafetyScore(jkasBean.getSafetyScore());
		jobKnowledgeAndSkill.setSafetySupervisorsComments(jkasBean.getSafetySupervisorsComments());

		jobKnowledgeAndSkill.setQualityScore(jkasBean.getQualityScore());
		jobKnowledgeAndSkill.setQualitySupervisorsComments(jkasBean.getQualitySupervisiorsComments());

		jobKnowledgeAndSkill.setProductivityScore(jkasBean.getProductivityScore());
		jobKnowledgeAndSkill.setProductivitySupervisorsComments(jkasBean.getProductivitySupervisorsComments());

		jobKnowledgeAndSkill.setJobKnowledgeAndSkillsScore(jkasBean.getJobKnowledgeAndSkillsScore());
		jobKnowledgeAndSkill
				.setJobKnowledgeAndSkillsSupervisorsComments(jkasBean.getJobKnowledgeAndSkillsSupervisorsComments());

		jobKnowledgeAndSkill.setSupervisorsOverallComments(jkasBean.getSupervisorsOveralComments());
		System.out.println("overall score");
		System.out.println(jkasBean.getSummaryAvgScore());
		System.out.println(jkasBean.getAvgScore().trim());

		if (jkasBean.getAvgScore().isEmpty() || jkasBean.getAvgScore() == null) {

			jobKnowledgeAndSkill.setAvgScore("0");
		} else {

			jobKnowledgeAndSkill.setAvgScore(jkasBean.getAvgScore().trim());

		}
		String summaryScore = jkasBean.getSummaryAvgScore().replace(",", "");

		// jobKnowledgeAndSkill.setSummaryAvgScore(jkasBean.getSummaryAvgScore().trim());
		jobKnowledgeAndSkill.setSummaryAvgScore(summaryScore);

		String ormClass = "JobKnowledgeAndSkill";

		String year = nonExemptEmployeeService.getYear(ormClass, nonexemptEmpClock.trim(), currentYear);

		if (String.valueOf(year).equals("null") || String.valueOf(year).length() == 0) {

			exemptTeamMemberService.updateCensusForm("STARTED", nonexemptEmpClock, employeeYear.trim());

		}

		nonExemptEmployeeService.addJobKnowledgeAndSkillsData(jobKnowledgeAndSkill, year);

		// training and development retrieve screens..
		try {

			List<TrainingAndDevelopment> trainingAndDevelopement = nonExemptEmployeeService
					.getTrainingAndDevelopmentData(nonexemptEmpClock, currentYear);

			model.addAttribute("trainingAndDevelopement", trainingAndDevelopement);
			model.addAttribute("loginUser", loginUser);

		} catch (Exception e) {
			model.addAttribute("loginUser", loginUser);
			e.printStackTrace();

		}

	}

	@RequestMapping(value = "training-development", method = RequestMethod.GET)
	public String getNonExemptTrainingorDevelopment(Model model, HttpSession session) {

		nonexemptEmpClock = loginUser.getNonExemptEmployeeClock();
		employeeYear = loginUser.getNonExemptEmployeeYear();

		if (nonexemptEmpClock != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		model.addAttribute("nonExempt", nonexemptEmpClock);

		String loginClock = loginUser.getNonExemptEmployeeClock();

		model.addAttribute("loginClock", loginClock);

		try {

			List<TrainingAndDevelopment> trainingAndDevelopement = nonExemptEmployeeService
					.getTrainingAndDevelopmentData(nonexemptEmpClock.trim(), employeeYear);

			String status = getStatus(nonexemptEmpClock, employeeYear);
			model.addAttribute("status", status);
			model.addAttribute("loginUser", loginUser);
			model.addAttribute("trainingAndDevelopement", trainingAndDevelopement);

		} catch (Exception e) {
			model.addAttribute("loginUser", loginUser);
			e.printStackTrace();

		}

		return "training-development";
	}

	/*
	 * return "training-development"; } return "training-development";
	 */

	@RequestMapping(value = "/training-developmentForm", params = "btnBackSave", method = RequestMethod.POST)
	public String trainingAndDevelopementBackSave(
			@ModelAttribute("trainingAndDevelopment") TrainingAndDevelopmentBean trainingAndDevelopmentBean,
			Model model, HttpSession session) {
		try {
			TrainingAndDevelopment trainingAndDevelopement = new TrainingAndDevelopment();

			nonexemptEmpClock = loginUser.getNonExemptEmployeeClock();
			employeeYear = loginUser.getNonExemptEmployeeYear();

			if (nonexemptEmpClock != null) {
				System.out.println("is Not Null");
			} else {

				return "loginScreen";
			}

			List<JobKnowledgeAndSkill> jobKnowledge = nonExemptEmployeeService.getjobknowledgeData(nonexemptEmpClock,
					employeeYear);
			model.addAttribute("jobKnowledgeData", jobKnowledge);

			saveTrainingAndDevelopement(trainingAndDevelopmentBean, trainingAndDevelopement, model, session);

			getNonExemptTrainingorDevelopment(model, session);

			getJobKnowledgeSkills(model, session);
			model.addAttribute("loginUser", loginUser);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("loginUser", loginUser);
			return "training-development";
		}
		return "job-knowledge-skills";
	}

	@RequestMapping(value = "/training-developmentForm", params = "nextSave", method = RequestMethod.POST)
	public String trainingAndDevelopementNextSave(
			@ModelAttribute("trainingAndDevelopment") TrainingAndDevelopmentBean trainingAndDevelopmentBean,
			Model model, HttpSession session) {

		getNonExemptAcknowledgmentSection(model, session);

		try {
			TrainingAndDevelopment trainingAndDevelopement = new TrainingAndDevelopment();

			nonexemptEmpClock = loginUser.getNonExemptEmployeeClock();
			employeeYear = loginUser.getNonExemptEmployeeYear();

			model.addAttribute("nonExempt", nonexemptEmpClock);
			String loginClock = loginUser.getNonExemptEmployeeClock();

			model.addAttribute("loginClock", loginClock);
			model.addAttribute("loginUser", loginUser);
			if (nonexemptEmpClock != null) {
				System.out.println("is Not Null");
			} else {

				return "loginScreen";
			}

			List<TrainingAndDevelopment> trainingAndDevelopementList = nonExemptEmployeeService
					.getTrainingAndDevelopmentData(nonexemptEmpClock.trim(), employeeYear);

			model.addAttribute("trainingAndDevelopement", trainingAndDevelopementList);

			saveTrainingAndDevelopement(trainingAndDevelopmentBean, trainingAndDevelopement, model, session);

			getNonExemptTrainingorDevelopment(model, session);

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("loginUser", loginUser);
			return "training-development";
		}
		// return "training-development";
		return "acknowledgment-section";

	}

	@RequestMapping(value = "/training-developmentForm", params = "btnSubmit", method = RequestMethod.POST)
	public String trainingAndDevelopementSubmit(
			@ModelAttribute("trainingAndDevelopment") TrainingAndDevelopmentBean trainingAndDevelopmentBean,
			Model model, HttpSession session) {
		try {
			nonexemptEmpClock = loginUser.getNonExemptEmployeeClock();
			System.out.println("nonexemptEmpClock ::: " + nonexemptEmpClock);
			employeeYear = loginUser.getNonExemptEmployeeYear();

			if (nonexemptEmpClock != null) {
				System.out.println("is Not Null");
			} else {

				return "loginScreen";
			}

			TrainingAndDevelopment trainingAndDevelopement = new TrainingAndDevelopment();

			saveTrainingAndDevelopement(trainingAndDevelopmentBean, trainingAndDevelopement, model, session);
			model.addAttribute("loginUser", loginUser);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("loginUser", loginUser);
			return "training-development";
		}
		// only submit and redirect to dashboard
		return "redirect:/back.do";

	}

	// TrainingAndDevelopementBean method

	public void saveTrainingAndDevelopement(
			@ModelAttribute("trainingAndDevelopment") TrainingAndDevelopmentBean trainingAndDevelopmentBean,
			TrainingAndDevelopment trainingAndDevelopement, Model model, HttpSession session) throws Exception {

		nonexemptEmpClock = loginUser.getNonExemptEmployeeClock();
		employeeYear = loginUser.getNonExemptEmployeeYear();

		trainingAndDevelopement.setClockId(Integer.parseInt(nonexemptEmpClock.trim()));

		trainingAndDevelopement.setFirstAreaorFocus(trainingAndDevelopmentBean.getFirstAreaorFocus());

		if (trainingAndDevelopmentBean.getFirstDateDue().equalsIgnoreCase(",")
				|| trainingAndDevelopmentBean.getFirstDateDue().isEmpty()) {

		} else {

			trainingAndDevelopement
					.setFirstDateDue(Converters.getNonExemptDate((trainingAndDevelopmentBean.getFirstDateDue())));
		}

		trainingAndDevelopement.setfirstTrainingTopic(trainingAndDevelopmentBean.getfirstTrainingTopic());
		trainingAndDevelopement.setfirstTrainingDescription(trainingAndDevelopmentBean.getfirstTrainingDescription());

		trainingAndDevelopement.setSecondAreaorFocus(trainingAndDevelopmentBean.getSecondAreaorFocus());
		if (trainingAndDevelopmentBean.getSecondfDateDue().equalsIgnoreCase(",")
				|| trainingAndDevelopmentBean.getSecondfDateDue().isEmpty()) {

		} else {

			trainingAndDevelopement
					.setSecondDateDue(Converters.getNonExemptDate(trainingAndDevelopmentBean.getSecondfDateDue()));
		}

		trainingAndDevelopement.setSecondTrainingTopic(trainingAndDevelopmentBean.getSecondTrainingTopic());
		trainingAndDevelopement.setSecondTrainingDescription(trainingAndDevelopmentBean.getSecondTrainingDescription());

		trainingAndDevelopement.setThirdAreaorFocus(trainingAndDevelopmentBean.getThirdAreaorFocus());
		if (trainingAndDevelopmentBean.getThirdDateDue().equalsIgnoreCase(",")
				|| trainingAndDevelopmentBean.getThirdDateDue().isEmpty()) {

		} else {

			trainingAndDevelopement
					.setThirdDateDue(Converters.getNonExemptDate(trainingAndDevelopmentBean.getThirdDateDue()));
		}
		trainingAndDevelopement.setThirdTrainingTopic(trainingAndDevelopmentBean.getThirdTrainingTopic());
		trainingAndDevelopement.setThirdTrainingDescription(trainingAndDevelopmentBean.getThirdTrainingDescription());
		trainingAndDevelopement.setAnnualYear(employeeYear.trim());

		String ormClass = "TrainingAndDevelopment";

		String year = nonExemptEmployeeService.getYear(ormClass, nonexemptEmpClock, employeeYear);

		if (String.valueOf(year).equals("null") || String.valueOf(year).length() == 0) {

			// exemptTeamMemberService.updateCensusForm("Completed",
			// nonexemptEmpClock);

		} else {
			// year = Integer.parseInt(Converters.getCurrentYear());
		}
		model.addAttribute("loginUser", loginUser);
		nonExemptEmployeeService.addNonExemptTrainingorDevelopmenData(trainingAndDevelopement, year);
		log.info("addNonExemptSummaryData() successfully executed");
	}

	@RequestMapping(value = "acknowledgment-section")
	public String getNonExemptAcknowledgmentSection(Model model, HttpSession session) {

		System.out.println("acknowledgment - section.");
		try {

			nonexemptEmpClock = loginUser.getNonExemptEmployeeClock();
			employeeYear = loginUser.getNonExemptEmployeeYear();

			model.addAttribute("nonExempt", nonexemptEmpClock);
			String loginClock = loginUser.getNonExemptEmployeeClock();
			// model.addAttribute("loginUser", loginUser);
			// model.addAttribute("loginClock", loginClock);

			if (nonexemptEmpClock != null) {
				System.out.println("is Not Null");
			} else {

				return "loginScreen";
			}

			String status = getStatus(nonexemptEmpClock, employeeYear);

			model.addAttribute("status", status);

			try {

				log.info("nonexemptEmpClock ::: " + nonexemptEmpClock);

				List<CensusForm> employeeList = nonExemptEmployeeService.getNonExemptEmployeeList(nonexemptEmpClock,
						employeeYear.trim());
				System.out.println("employeeList ::: " + employeeList);

				model.addAttribute("employee", employeeList);
			} catch (Exception e) {
				model.addAttribute("loginUser", loginUser);
				log.info("im in catch..");
				e.printStackTrace();
			}

			System.out.println("what");
			System.out.println("status " + status);
			model.addAttribute("status", status);
			model.addAttribute("loginUser", loginUser);
		} catch (Exception e) {
			model.addAttribute("loginUser", loginUser);
		}
		return "acknowledgment-section";
	}

	// AcknowledgementBean method
	@RequestMapping(value = "/acknowledgment-section-Action", params = "back", method = RequestMethod.POST)
	public String addNonExemptAcknowledgmentSectionData(
			@ModelAttribute("acknowledgment") AcknowledgementBean acknowledgementBean, Model model,
			HttpSession session) {

		System.out.println("Enter Back button for acknowledgment - section.");
		nonexemptEmpClock = loginUser.getNonExemptEmployeeClock();
		employeeYear = loginUser.getNonExemptEmployeeYear();
		if (nonexemptEmpClock != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		String status = getStatus(nonexemptEmpClock, employeeYear);

		model.addAttribute("status", status);
		model.addAttribute("loginUser", loginUser);
		getNonExemptTrainingorDevelopment(model, session);

		return "training-development";

	}

	@RequestMapping(value = "/acknowledgment-section-Action", params = "submit", method = RequestMethod.POST)
	public String addNonExemptAcknowledgmentSectionDataSubmit(
			@ModelAttribute("acknowledgment") AcknowledgementBean acknowledgementBean, Model model, HttpSession session)
			throws AddressException, MessagingException {

		nonexemptEmpClock = loginUser.getNonExemptEmployeeClock();
		employeeYear = loginUser.getNonExemptEmployeeYear();

		if (nonexemptEmpClock != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}
		// model.addAttribute("loginUser", loginUser);
		// JOB KNOWLEDGE SKILL VALIDATION
		JobKnowledgeAndSkill jobKnowledgeObject = nonExemptEmployeeService.getjobknowledgeObject(nonexemptEmpClock,
				employeeYear);

		InterpersonalSkills interpersonalObject = nonExemptEmployeeService
				.getInterpersonalObjectData(nonexemptEmpClock.trim(), employeeYear.trim());

		String tableInfo = validateTables(interpersonalObject, jobKnowledgeObject);

		if (tableInfo.equalsIgnoreCase("emptyData")) {

			model.addAttribute("email", "<h6 style=color:red>All required fields not have not been completed. "
					+ " Please check on prior pages if any requirements weren't completed.</h6>");
			getNonExemptAcknowledgmentSection(model, session);

			// updating two tables parallel
			nonExemptEmployeeService.insertSupervisorStatus(nonexemptEmpClock, employeeYear, "submitted");

			return "acknowledgment-section";

		} else {

			// updating two tables parallel
			nonExemptEmployeeService.updateSupervisorStatus(nonexemptEmpClock, employeeYear, "submitted");

		}

		String checkEmptyData = "";

		if (interpersonalObject != null) {

			model.addAttribute("idetails", interpersonalObject);

			if (interpersonalObject.getResponsibilityScore() == null
					|| interpersonalObject.getResponsibilitySupervisorsComments().isEmpty()
					|| interpersonalObject.getResponsibilityScore().isEmpty()
					|| interpersonalObject.getResponsibilitySupervisorsComments() == null) {

				checkEmptyData = "nullData";
			}

			else if (interpersonalObject.getAdaptabilityScore() == null
					|| interpersonalObject.getAdaptabilitySupervisorsComments().isEmpty()
					|| interpersonalObject.getAdaptabilityScore().isEmpty()
					|| interpersonalObject.getAdaptabilitySupervisorsComments() == null) {

				checkEmptyData = "nullData";

			} else if (interpersonalObject.getInitiativeScore() == null
					|| interpersonalObject.getInitiativeSupervisorsComments().isEmpty()
					|| interpersonalObject.getInitiativeScore().isEmpty()
					|| interpersonalObject.getInitiativeSupervisorsComments() == null) {

				checkEmptyData = "nullData";

			} else if (interpersonalObject.getJudgementScore() == null
					|| interpersonalObject.getJudgementSupervisorsComments().isEmpty()
					|| interpersonalObject.getJudgementScore().isEmpty()
					|| interpersonalObject.getJudgementSupervisorsComments() == null) {

				checkEmptyData = "nullData";

			}

			else if (interpersonalObject.getWrittenAndOralCommunicationScore() == null
					|| interpersonalObject.getWrittenAndOralCommunicationSupervisorsComments().isEmpty()
					|| interpersonalObject.getWrittenAndOralCommunicationScore().isEmpty()
					|| interpersonalObject.getWrittenAndOralCommunicationSupervisorsComments() == null) {

				checkEmptyData = "nullData";

			}

			else if (interpersonalObject.getPunctualityAndCommitmentScore() == null
					|| interpersonalObject.getPunctualityAndCommitmentSupervisorsComments().isEmpty()
					|| interpersonalObject.getPunctualityAndCommitmentScore().isEmpty()
					|| interpersonalObject.getPunctualityAndCommitmentSupervisorsComments() == null) {

				checkEmptyData = "nullData";

			}

			if (checkEmptyData.equalsIgnoreCase("nullData")) {

				model.addAttribute("email", "<h6 style=color:red>All required fields not have not been completed. "
						+ " Please check on prior pages if any requirements weren't completed.</h6>");
				getNonExemptAcknowledgmentSection(model, session);

				return "acknowledgment-section";
			}

		}

		if (jobKnowledgeObject != null) {

			System.out.println("data from query..");

			model.addAttribute("jdetails", jobKnowledgeObject);

			if (jobKnowledgeObject.getSafetyScore() == null
					|| jobKnowledgeObject.getSafetySupervisorsComments().isEmpty()
					|| jobKnowledgeObject.getSafetyScore().isEmpty()
					|| jobKnowledgeObject.getSafetySupervisorsComments() == null) {

				checkEmptyData = "nullData";
			} else if (jobKnowledgeObject.getQualityScore() == null
					|| jobKnowledgeObject.getQualitySupervisorsComments().isEmpty()
					|| jobKnowledgeObject.getQualityScore().isEmpty()
					|| jobKnowledgeObject.getQualitySupervisorsComments() == null) {

				checkEmptyData = "nullData";
			} else if (jobKnowledgeObject.getProductivityScore() == null
					|| jobKnowledgeObject.getProductivitySupervisorsComments().isEmpty()
					|| jobKnowledgeObject.getProductivityScore().isEmpty()
					|| jobKnowledgeObject.getProductivitySupervisorsComments() == null) {

				checkEmptyData = "nullData";
			} else if (jobKnowledgeObject.getJobKnowledgeAndSkillsScore() == null
					|| jobKnowledgeObject.getJobKnowledgeAndSkillsSupervisorsComments().isEmpty()
					|| jobKnowledgeObject.getJobKnowledgeAndSkillsScore().isEmpty()
					|| jobKnowledgeObject.getJobKnowledgeAndSkillsSupervisorsComments() == null) {

				checkEmptyData = "nullData";
			} else if (jobKnowledgeObject.getSupervisorsOverallComments() == null
					|| jobKnowledgeObject.getSupervisorsOverallComments().isEmpty()) {

				checkEmptyData = "nullData";
			}

			if (checkEmptyData.equalsIgnoreCase("nullData")) {

				model.addAttribute("email", "<h6 style=color:red>All required fields not have not been completed. "
						+ " Please check on prior pages if any requirements weren't completed.</h6>");
				getNonExemptAcknowledgmentSection(model, session);

				return "acknowledgment-section";
			}

		}

		/*
		 * List<TrainingAndDevelopment> trainingAndDevelopement =
		 * nonExemptEmployeeService
		 * .getTrainingAndDevelopmentData(nonexemptEmpClock.trim(),
		 * employeeYear);
		 * 
		 * 
		 * 
		 * if (trainingAndDevelopement.size() == 0) {
		 * 
		 * 
		 * model.addAttribute("email",
		 * "<h6 style=color:red>All required fields not have not been completed. "
		 * +
		 * " Please check on prior pages if any requirements weren't completed.</h6>"
		 * );
		 * 
		 * getNonExemptAcknowledgmentSection(model, session);
		 * 
		 * return "acknowledgment-section"; }
		 */

		model.addAttribute("nonExempt", nonexemptEmpClock);
		String loginClock = loginUser.getClockNumber();

		// model.addAttribute("loginClock", loginClock);

		String status = getStatus(loginUser.getNonExemptEmployeeClock(), loginUser.getNonExemptEmployeeYear());
		model.addAttribute("status", status);

		exemptTeamMemberService.updateCensusForm("MANAGER COMPLETED", nonexemptEmpClock, employeeYear.trim());

		// exemptTeamMemberService.updateCensusForm("MANAGER COMPLETED",
		// nonexemptEmpClock);

		String formStatus = "MANAGER COMPLETED";
		String role = "Non Exempt";

		AppraisalMailConfig mailData = nonExemptEmployeeService.getEMpMailData(formStatus, role);

		log.info(mailData.getMail_subject());
		System.out.println("Clock number :: " + loginClock);
		// List<CensusForm> employeeDetails =
		// tmservice.getEmployeeDetails((String)
		// session.getAttribute("loginClockNumber"), employeeYear.trim());
		List<CensusForm> employeeDetails = tmservice.getEmployeeDetails(loginClock, employeeYear.trim());
		CensusForm supervisor = employeeService.getLoginEmployeeDetails(Integer.parseInt(loginClock), "",
				employeeYear.trim());

		CensusForm employee = employeeService.getLoginEmployeeDetails(Integer.parseInt(nonexemptEmpClock), "",
				employeeYear.trim());

		// for (CensusForm censusForm : employeeDetails) {

		CensusForm hrGeneralist = nonExemptEmployeeService.getSupervisorMailId(nonexemptEmpClock.trim(),
				"hrGeneralistClockNumber", employeeYear.trim());

		CensusForm hrManager = nonExemptEmployeeService.getSupervisorMailId(nonexemptEmpClock.trim(),
				"hrManagerClockNumber", employeeYear.trim());

		log.info("email + non exempt");
		log.info("gen " + hrGeneralist.getEmpEmailAddress());
		log.info("man " + hrManager.getEmpEmailAddress());
		log.info("super " + supervisor.getEmpEmailAddress());

		EmailConfig.getInstance().sendMail(
				mailData.getMail_subject() + " " + employee.getEmplastName() + "," + employee.getEmpfirstName(),
				mailData.getMail_body(), hrGeneralist.getEmpEmailAddress(), hrManager.getEmpEmailAddress(),
				supervisor.getEmpEmailAddress());

		// }

		logoutController.backController(model, session);
		model.addAttribute("loginUser", loginUser);
		return "managerScreen";

	}

	private String validateTables(InterpersonalSkills interpersonalObject, JobKnowledgeAndSkill jobKnowledgeObject) {

		if (interpersonalObject == null || jobKnowledgeObject == null) {

			return "emptyData";
		}

		return "notEmptyData";
	}

	@RequestMapping(value = "/nonteam-members-information", method = RequestMethod.GET)
	public String getNonExemptEmployee(Model modelMap, HttpSession session) {
		try {

			nonexemptEmpClock = loginUser.getNonExemptEmployeeClock();
			employeeYear = loginUser.getNonExemptEmployeeYear();

			if (nonexemptEmpClock != null) {
				System.out.println("is Not Null");
			} else {

				return "loginScreen";
			}

			List<CensusForm> nonExemptList = nonExemptEmployeeService.getNonExemptEmployeeList(nonexemptEmpClock.trim(),
					employeeYear);

			for (CensusForm c : nonExemptList) {
				System.out.println("if");

			}
			modelMap.addAttribute("loginUser", loginUser);
			modelMap.addAttribute("employee", nonExemptList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		log.info("getList() successfully executed");

		return "teammemberInformation";

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

	@RequestMapping(value = "/managerStatus", method = RequestMethod.GET)
	public String getManagerStatus(@RequestParam("managerStatus") String managerStatus, HttpSession session,
			Model model) throws AddressException, MessagingException {

		System.out.println("This is getManagerStatus method.. ");

		nonexemptEmpClock = loginUser.getNonExemptEmployeeClock();
		employeeYear = loginUser.getNonExemptEmployeeYear();

		if (nonexemptEmpClock != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		String loginClocid = loginUser.getClockNumber();
		model.addAttribute("loginUser", loginUser);
		try {

			if (managerStatus.equalsIgnoreCase("managerApproved")) {
				System.out.println("IF block.....");

				exemptTeamMemberService.updateCensusForm("HR APPROVED", nonexemptEmpClock, employeeYear.trim());

				String formStatus = "HR APPROVED";
				String role = "Non Exempt";

				AppraisalMailConfig mailData = nonExemptEmployeeService.getEMpMailData(formStatus, role);

				log.info(mailData.getMail_subject());

				CensusForm employee = employeeService.getLoginEmployeeDetails(Integer.parseInt(nonexemptEmpClock), "",
						employeeYear.trim());

				// for (CensusForm censusForm : employeeDetails) {

				CensusForm supervisorMailId = nonExemptEmployeeService.getSupervisorMailId(nonexemptEmpClock,
						"supervisorClockNumber", employeeYear.trim());
				String ccAddress = "";
				/*
				 * CensusForm hrGeneralist =
				 * nonExemptEmployeeService.getSupervisorMailId(loginClocid ,
				 * "hrGeneralistClockNumber", employeeYear.trim());
				 */

				CensusForm hrGeneralist = employeeService.getLoginEmployeeDetails(Integer.parseInt(loginClocid), "",
						employeeYear.trim());

				System.out.println("emails");
				log.info(hrGeneralist.getEmpEmailAddress() + "form ");
				log.info(supervisorMailId.getEmpEmailAddress() + " employee");

				EmailConfig.getInstance().sendMail(
						mailData.getMail_subject() + " " + employee.getEmplastName() + "," + employee.getEmplastName(),
						mailData.getMail_body(), supervisorMailId.getEmpEmailAddress(), ccAddress,
						hrGeneralist.getEmpEmailAddress());

				// }

			} else {

				exemptTeamMemberService.updateCensusForm("STARTED", nonexemptEmpClock, employeeYear.trim());

				String formStatus = "HR REJECTED";
				String role = "Non Exempt";

				AppraisalMailConfig mailData = nonExemptEmployeeService.getEMpMailData(formStatus, role);

				log.info(mailData.getMail_subject());

				List<CensusForm> employeeDetails = tmservice
						.getEmployeeDetails((String) session.getAttribute("loginClockNumber"), employeeYear.trim());

				CensusForm employee = employeeService.getLoginEmployeeDetails(Integer.parseInt(nonexemptEmpClock), "",
						employeeYear.trim());

				// for (CensusForm censusForm : employeeDetails) {

				CensusForm supervisorMailId = nonExemptEmployeeService.getSupervisorMailId(nonexemptEmpClock,
						"supervisorClockNumber", employeeYear.trim());
				String ccAddress = "";
				/*
				 * CensusForm hrGeneralist =
				 * nonExemptEmployeeService.getSupervisorMailId(
				 * nonexemptEmpClock.trim(), "hrGeneralistClockNumber",
				 * employeeYear.trim());
				 */

				CensusForm hrGeneralist = employeeService.getLoginEmployeeDetails(Integer.parseInt(loginClocid), "",
						employeeYear.trim());

				System.out.println("emails");
				log.info(hrGeneralist.getEmpEmailAddress() + "form ");
				log.info(supervisorMailId.getEmpEmailAddress() + " employee");

				EmailConfig.getInstance().sendMail(
						mailData.getMail_subject() + " " + employee.getEmplastName() + "," + employee.getEmpfirstName(),
						mailData.getMail_body(), supervisorMailId.getEmpEmailAddress(), ccAddress,
						hrGeneralist.getEmpEmailAddress());

				// }

				System.out.println("else block.....");

			}
			List<TrainingAndDevelopment> trainingAndDevelopement = nonExemptEmployeeService
					.getTrainingAndDevelopmentData(nonexemptEmpClock.trim(), employeeYear);

			String status = getStatus(nonexemptEmpClock, employeeYear);
			model.addAttribute("status", status);
			model.addAttribute("loginUser", loginUser);
			model.addAttribute("trainingAndDevelopement", trainingAndDevelopement);

			logoutController.backController(model, session);

			logoutController.hrDashboard(loginClocid, session, model);

		} catch (Exception e) {

			getNonExemptAcknowledgmentSection(model, session);
			model.addAttribute("loginUser", loginUser);
			return "acknowledgment-section";
		}
		// return "managerScreen";
		return "hrDashboard";
	}

	// salary-review page
	@RequestMapping(value = "/nonsalaryreviewpage", method = RequestMethod.GET)
	public String salaryReviewPage(Model model, HttpSession session) {
		nonexemptEmpClock = loginUser.getNonExemptEmployeeClock();
		employeeYear = loginUser.getNonExemptEmployeeYear();
		System.out.println("Enter salaryReviewPage ::: ");
		System.out.println("nonexemptEmpClock " + nonexemptEmpClock);
		if (String.valueOf(nonexemptEmpClock).equalsIgnoreCase("null")) {

			return "loginScreen";
		}
		model.addAttribute("loginUser", loginUser);
		CensusForm employeeDetails = employeeInfo.getEmployeeForm(String.valueOf(nonexemptEmpClock),
				employeeYear.trim());
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

		// String salaryreview;
		return "nonsalaryreview";
	}

	@RequestMapping(value = "/nonsalaryreview", params = "submit", method = RequestMethod.POST)
	public String salaryReviewPageSubmit(Model model, HttpSession session, CensusForm employee) {

		try {
			nonexemptEmpClock = loginUser.getNonExemptEmployeeClock();
			employeeYear = loginUser.getNonExemptEmployeeYear();

			System.out.println("Enter salaryReviewPageSubmit :: ");
			System.out.println("nonexemptEmpClock " + nonexemptEmpClock);
			System.out.println(nonexemptEmpClock);

			if (String.valueOf(nonexemptEmpClock).equalsIgnoreCase("null")) {

				System.out.println("session closed");
				return "loginScreen";
			}

			String percentage = employee.getPercentageOfIncrease();
			if (employee.getNextYearAnnualRate().contains("$")) {

				String annualRate = employee.getNextYearAnnualRate().replace("$", "");
				employee.setNextYearAnnualRate(annualRate);
			}
			if (employee.getNextYearHourlyRate().contains("$")) {

				String hourlyRate = employee.getNextYearHourlyRate().replace("$", "");
				employee.setNextYearHourlyRate(hourlyRate);
			}

			System.out.println("percentage :: " + employee.getPercentageOfIncrease());
			System.out.println("percentage :: " + employee.getNextYearHourlyRate());
			System.out.println("Perafadf" + employee.getNextYearAnnualRate());

			employee.setNextYearAnnualRate(EncryptDecryptProcess.encryptTechnique(employee.getNextYearAnnualRate()));
			employee.setNextYearHourlyRate(EncryptDecryptProcess.encryptTechnique(employee.getNextYearHourlyRate()));

			employeeInfo.insertSalaryReview(employee, nonexemptEmpClock, employeeYear);

			model.addAttribute("employeeDetails", employee);
			salaryReviewPage(model, session);
			model.addAttribute("loginUser", loginUser);
		} catch (Exception e) {

			model.addAttribute("employeeDetails", employee);
			salaryReviewPage(model, session);
			model.addAttribute("loginUser", loginUser);
			return "nonsalaryreview";
		}
		return "nonsalaryreview";
	}

	@RequestMapping(value = "/interpersonalForm", params = "btnSave", method = RequestMethod.POST)
	public String interPersonalSkillsSave(
			@ModelAttribute("interpersonal") InterpersonalSkillsBean interpersonalSkillsBean, Model model,
			HttpSession session) throws Exception {

		nonexemptEmpClock = loginUser.getNonExemptEmployeeClock();
		employeeYear = loginUser.getNonExemptEmployeeYear();
		InterpersonalSkills interpersonalSkills = new InterpersonalSkills();
		if (nonexemptEmpClock != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		String status = getStatus(nonexemptEmpClock, employeeYear);

		model.addAttribute("status", status);
		model.addAttribute("loginUser", loginUser);
		saveInterPersonalSkills(interpersonalSkills, interpersonalSkillsBean, model, session);

		InterpersonalSkills interpersonalObject = nonExemptEmployeeService
				.getInterpersonalObjectData(nonexemptEmpClock.trim(), employeeYear.trim());

		getInterpersonalSkills(model, session);

		/*
		 * if (interpersonalObject != null) {
		 * 
		 * model.addAttribute("idetails", interpersonalObject); if
		 * (interpersonalObject.getSupervisorstatus() == null ||
		 * interpersonalObject.getSupervisorstatus().isEmpty()) {
		 * 
		 * if (interpersonalObject.getResponsibilityScore() == null ||
		 * interpersonalObject.getResponsibilitySupervisorsComments().isEmpty()
		 * || interpersonalObject.getResponsibilityScore().isEmpty() ||
		 * interpersonalObject.getResponsibilitySupervisorsComments() == null) {
		 * 
		 * model.addAttribute("imessage", "noValidation");
		 * 
		 * }
		 * 
		 * else if (interpersonalObject.getAdaptabilityScore() == null ||
		 * interpersonalObject.getAdaptabilitySupervisorsComments().isEmpty() ||
		 * interpersonalObject.getAdaptabilityScore().isEmpty() ||
		 * interpersonalObject.getAdaptabilitySupervisorsComments() == null) {
		 * 
		 * model.addAttribute("imessage", "noValidation");
		 * 
		 * } else if (interpersonalObject.getInitiativeScore() == null ||
		 * interpersonalObject.getInitiativeSupervisorsComments().isEmpty() ||
		 * interpersonalObject.getInitiativeScore().isEmpty() ||
		 * interpersonalObject.getInitiativeSupervisorsComments() == null) {
		 * 
		 * model.addAttribute("imessage", "noValidation");
		 * 
		 * } else if (interpersonalObject.getJudgementScore() == null ||
		 * interpersonalObject.getJudgementSupervisorsComments().isEmpty() ||
		 * interpersonalObject.getJudgementScore().isEmpty() ||
		 * interpersonalObject.getJudgementSupervisorsComments() == null) {
		 * 
		 * model.addAttribute("imessage", "noValidation");
		 * 
		 * }
		 * 
		 * else if (interpersonalObject.getWrittenAndOralCommunicationScore() ==
		 * null ||
		 * interpersonalObject.getWrittenAndOralCommunicationSupervisorsComments
		 * ().isEmpty() ||
		 * interpersonalObject.getWrittenAndOralCommunicationScore().isEmpty()
		 * ||
		 * interpersonalObject.getWrittenAndOralCommunicationSupervisorsComments
		 * () == null) {
		 * 
		 * model.addAttribute("imessage", "noValidation");
		 * 
		 * }
		 * 
		 * else if (interpersonalObject.getPunctualityAndCommitmentScore() ==
		 * null ||
		 * interpersonalObject.getPunctualityAndCommitmentSupervisorsComments().
		 * isEmpty() ||
		 * interpersonalObject.getPunctualityAndCommitmentScore().isEmpty() ||
		 * interpersonalObject.getPunctualityAndCommitmentSupervisorsComments()
		 * == null) {
		 * 
		 * model.addAttribute("imessage", "noValidation");
		 * 
		 * } }
		 * 
		 * return "interpersonal-skills";
		 * 
		 * } else if (interpersonalObject == null) {
		 * 
		 * model.addAttribute("idetails", interpersonalObject);
		 * model.addAttribute("imessage", "noValidation"); }
		 */

		return "interpersonal-skills";
	}

	@RequestMapping(value = "/jobknowledgeForm", params = "btnSave", method = RequestMethod.POST)
	public String jobKnowledgeAndSkillsSave(@ModelAttribute("jobknowledge") JobKnowledgeAndSkillsBean jkasBean,
			Model model, HttpSession session) {

		JobKnowledgeAndSkill jobKnowledgeAndSkill = new JobKnowledgeAndSkill();
		try {

			nonexemptEmpClock = loginUser.getNonExemptEmployeeClock();
			employeeYear = loginUser.getNonExemptEmployeeYear();

			if (nonexemptEmpClock != null) {
				System.out.println("is Not Null");
			} else {

				return "loginScreen";
			}
			String status = getStatus(nonexemptEmpClock, employeeYear);

			model.addAttribute("status", status);
			model.addAttribute("loginUser", loginUser);
			jobKnowledgeAndSkillsForm(jkasBean, jobKnowledgeAndSkill, model, session);

			getJobKnowledgeSkills(model, session);

			/*
			 * JobKnowledgeAndSkill jobKnowledgeObject =
			 * nonExemptEmployeeService.getjobknowledgeObject(nonexemptEmpClock,
			 * employeeYear);
			 * 
			 * if (jobKnowledgeObject != null) {
			 * 
			 * model.addAttribute("jdetails", jobKnowledgeObject);
			 * 
			 * if (jobKnowledgeObject.getSupervisorstatus() == null ||
			 * jobKnowledgeObject.getSupervisorstatus().isEmpty()) {
			 * 
			 * System.out.println("data from query..");
			 * 
			 * if (jobKnowledgeObject.getSafetyScore() == null ||
			 * jobKnowledgeObject.getSafetySupervisorsComments().isEmpty() ||
			 * jobKnowledgeObject.getSafetyScore().isEmpty() ||
			 * jobKnowledgeObject.getSafetySupervisorsComments() == null) {
			 * 
			 * model.addAttribute("jmessage", "no Validation");
			 * 
			 * } else if (jobKnowledgeObject.getQualityScore() == null ||
			 * jobKnowledgeObject.getQualitySupervisorsComments().isEmpty() ||
			 * jobKnowledgeObject.getQualityScore().isEmpty() ||
			 * jobKnowledgeObject.getQualitySupervisorsComments() == null) {
			 * 
			 * model.addAttribute("jmessage", "no Validation");
			 * 
			 * } else if (jobKnowledgeObject.getProductivityScore() == null ||
			 * jobKnowledgeObject.getProductivitySupervisorsComments().isEmpty()
			 * || jobKnowledgeObject.getProductivityScore().isEmpty() ||
			 * jobKnowledgeObject.getProductivitySupervisorsComments() == null)
			 * {
			 * 
			 * model.addAttribute("jmessage", "no Validation");
			 * 
			 * } else if (jobKnowledgeObject.getJobKnowledgeAndSkillsScore() ==
			 * null ||
			 * jobKnowledgeObject.getJobKnowledgeAndSkillsSupervisorsComments().
			 * isEmpty() ||
			 * jobKnowledgeObject.getJobKnowledgeAndSkillsScore().isEmpty() ||
			 * jobKnowledgeObject.getJobKnowledgeAndSkillsSupervisorsComments()
			 * == null) {
			 * 
			 * model.addAttribute("jmessage", "no Validation");
			 * 
			 * } else if (jobKnowledgeObject.getSupervisorsOverallComments() ==
			 * null ||
			 * jobKnowledgeObject.getSupervisorsOverallComments().isEmpty()) {
			 * 
			 * model.addAttribute("jmessage", "no Validation");
			 * 
			 * } }
			 * 
			 * 
			 * } else if (jobKnowledgeObject == null) {
			 * 
			 * System.out.println("null date from query");
			 * 
			 * model.addAttribute("jdetails", jobKnowledgeObject);
			 * model.addAttribute("jmessage", "no Validation");
			 * 
			 * }
			 */

			log.info("getJobKnowledgeSkills() successfully executed");

		} catch (Exception e) {
			model.addAttribute("loginUser", loginUser);
			e.printStackTrace();
		}
		return "job-knowledge-skills";
	}

	@RequestMapping(value = "/training-developmentForm", params = "btnSave", method = RequestMethod.POST)
	public String trainingAndDevelopementSave(
			@ModelAttribute("trainingAndDevelopment") TrainingAndDevelopmentBean trainingAndDevelopmentBean,
			Model model, HttpSession session) {

		if (nonexemptEmpClock != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}
		TrainingAndDevelopment trainingAndDevelopement = new TrainingAndDevelopment();
		try {
			saveTrainingAndDevelopement(trainingAndDevelopmentBean, trainingAndDevelopement, model, session);
			List<TrainingAndDevelopment> trainingAndDevelopementObject = nonExemptEmployeeService
					.getTrainingAndDevelopmentData(nonexemptEmpClock.trim(), employeeYear);

			String status = getStatus(nonexemptEmpClock, employeeYear);
			model.addAttribute("status", status);
			model.addAttribute("loginUser", loginUser);
			model.addAttribute("trainingAndDevelopement", trainingAndDevelopementObject);

		} catch (Exception e) {
			model.addAttribute("loginUser", loginUser);
			e.printStackTrace();
		}

		return "training-development";
	}

}
