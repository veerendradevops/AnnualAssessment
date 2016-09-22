package com.lisi.annaulAssessment.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.lisi.annaulAssessment.service.ExemptTeamMemberService;
import com.lisi.annaulAssessment.service.NonExemptEmployeeService;
import com.lisi.annaulAssessment.util.Converters;

@Controller
public class NonExemptEmployeesController {

	private static final Logger log = Logger.getLogger(NonExemptEmployeesController.class);

	private String nonexemptEmpClock, employeeYear;
	
	@Autowired
	private ExemptTeamMemberService exemptTeamMemberService;

	@Autowired
	private NonExemptEmployeeService nonExemptEmployeeService;

	// To get All nonexempt employee list
	@RequestMapping(value = "/team-members-information", method = RequestMethod.GET)
	public String getEmployeeList(@RequestParam("clockNum") String loginEmpClock, ModelMap modelMap) {
		try {

			List<CensusForm> employeeList = nonExemptEmployeeService.getEmployeeList(loginEmpClock);

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
			Model modelMap, HttpSession session) {
		try {

			session.setAttribute("nonExempt", Converters.decrypt(clockNumber));

			session.setAttribute("nonExemptYear", annualYear);

			String originalValue = Converters.decrypt(clockNumber);

			List<CensusForm> nonExemptList = nonExemptEmployeeService.getNonExemptEmployeeList(originalValue,
					annualYear);

			modelMap.addAttribute("employee", nonExemptList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		log.info("getList() successfully executed");

		return "teammemberInformation";

	}

	@RequestMapping(value = "/nonExemptPersonalInfo", method = RequestMethod.GET)
	public String nonExemptPersonalInfo(Model model, HttpSession session) {

		nonexemptEmpClock = (String) session.getAttribute("nonExempt");
		employeeYear = (String) session.getAttribute("nonExemptYear");

		List<CensusForm> nonExemptList = nonExemptEmployeeService.getNonExemptEmployeeList(nonexemptEmpClock.trim(),
				employeeYear.trim());

		model.addAttribute("employee", nonExemptList);

		return "teammemberInformation";
	}

	// to get interpersonal-skills form
	@RequestMapping(value = "/interpersonal-skills", method = RequestMethod.GET)
	public String getInterpersonalSkills(Model model, HttpSession session) {
		try {

			nonexemptEmpClock = (String) session.getAttribute("nonExempt");
			employeeYear = (String) session.getAttribute("nonExemptYear");

			List<InterpersonalSkills> interpersonalList = nonExemptEmployeeService
					.getInterpersonalData(nonexemptEmpClock.trim(), employeeYear);

			model.addAttribute("interpersonalData", interpersonalList);

		}

		catch (Exception e) {
			e.printStackTrace();
		}
		log.info("getInterpersonalSkills() successfully executed");
		return "interpersonal-skills";
	}

	// InterpersonalSkillsBean method for Next & Save
	@RequestMapping(value = "/interpersonalForm", params="btnSubmitNextSave", method = RequestMethod.POST)
	public ModelAndView interPersonalSkillsNextSave(
			@ModelAttribute("interpersonal") InterpersonalSkillsBean interpersonalSkillsBean, Model model,
			HttpSession session) {

		InterpersonalSkills interpersonalSkills = new InterpersonalSkills();
		try{
			//saving the data
			saveInterPersonalSkills(interpersonalSkills,interpersonalSkillsBean,model,session);
			
			return new ModelAndView("job-knowledge-skills");

		}

		catch (Exception e) {

			model.addAttribute("message", "Your data is not inserted..");

			e.printStackTrace();
			return new ModelAndView("interpersonal-skills");

		}

	}
	
	// InterpersonalSkillsBean method for Back & Save
		@RequestMapping(value = "/interpersonalForm", params="btnSubmitBackSave", method = RequestMethod.POST)
		public ModelAndView interPersonalSkillsBackSave(
				@ModelAttribute("interpersonal") InterpersonalSkillsBean interpersonalSkillsBean, Model model,
				HttpSession session) {

			InterpersonalSkills interpersonalSkills = new InterpersonalSkills();
			try{
				//saving the data
				saveInterPersonalSkills(interpersonalSkills,interpersonalSkillsBean,model,session);			
				List<CensusForm> nonExemptList = nonExemptEmployeeService.getNonExemptEmployeeList(session.getAttribute("nonExempt").toString(),
						session.getAttribute("nonExemptYear").toString());

				model.addAttribute("employee", nonExemptList);
				return new ModelAndView("teammemberInformation");
			}

			catch (Exception e) {
				model.addAttribute("message", "Your data is not inserted..");
				e.printStackTrace();
				return new ModelAndView("interpersonal-skills");

			}

		}
	
	/*PREVIOUS CODE----*/
	/*@RequestMapping(value = "/interpersonalForm", method = RequestMethod.POST)
	public ModelAndView interPersonalSkills(
			@ModelAttribute("interpersonal") InterpersonalSkillsBean interpersonalSkillsBean, Model model,
			HttpSession session) {

		InterpersonalSkills interpersonalSkills = new InterpersonalSkills();

		nonexemptEmpClock = (String) session.getAttribute("nonExempt");
		employeeYear = (String) session.getAttribute("nonExemptYear");

		try {
			List<JobKnowledgeAndSkill> jobKnowledge = nonExemptEmployeeService.getjobknowledgeData(nonexemptEmpClock,
					employeeYear);

			model.addAttribute("jobKnowledgeData", jobKnowledge);

			interpersonalSkills.setClockId(Integer.parseInt(nonexemptEmpClock.trim()));

			String currentYear = employeeYear;

			interpersonalSkills.setAnnualYear(currentYear);

			interpersonalSkills.setResponsibilityScore(interpersonalSkillsBean.getResponsibilityScore());
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

			String year = nonExemptEmployeeService.getYear(ormClass, nonexemptEmpClock, employeeYear);
			

			System.out.println("befor stated status");
			if (String.valueOf(year).equals("null") || String.valueOf(year).length()==0) {
				System.out.println("new record");
				exemptTeamMemberService.updateCensusForm("Started", nonexemptEmpClock);
			}

			nonExemptEmployeeService.addInterpersonalSkillsData(interpersonalSkills, year);
			String avgScore = nonExemptEmployeeService.getInterpersonalAvgScore(nonexemptEmpClock, employeeYear);

			model.addAttribute("avgScore", avgScore);

			return new ModelAndView("job-knowledge-skills");

		}

		catch (Exception e) {

			model.addAttribute("message", "Your data is not inserted..");

			e.printStackTrace();
			return new ModelAndView("interpersonal-skills");

		}

	}*/
	
	
	
	
	public void saveInterPersonalSkills(InterpersonalSkills interpersonalSkills,InterpersonalSkillsBean interpersonalSkillsBean,Model model,
			HttpSession session) throws Exception
	{
		nonexemptEmpClock = (String) session.getAttribute("nonExempt");
		employeeYear = (String) session.getAttribute("nonExemptYear");

			List<JobKnowledgeAndSkill> jobKnowledge = nonExemptEmployeeService.getjobknowledgeData(nonexemptEmpClock,
					employeeYear);

			model.addAttribute("jobKnowledgeData", jobKnowledge);

			interpersonalSkills.setClockId(Integer.parseInt(nonexemptEmpClock.trim()));

			String currentYear = employeeYear;

			interpersonalSkills.setAnnualYear(currentYear);

			interpersonalSkills.setResponsibilityScore(interpersonalSkillsBean.getResponsibilityScore());
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

			String year = nonExemptEmployeeService.getYear(ormClass, nonexemptEmpClock, employeeYear);
			

			System.out.println("befor stated status");
			if (String.valueOf(year).equals("null") || String.valueOf(year).length()==0) {
				System.out.println("new record");
				exemptTeamMemberService.updateCensusForm("Started", nonexemptEmpClock);
			}

			nonExemptEmployeeService.addInterpersonalSkillsData(interpersonalSkills, year);
			String avgScore = nonExemptEmployeeService.getInterpersonalAvgScore(nonexemptEmpClock, employeeYear);

			model.addAttribute("avgScore", avgScore);

	}

	// to get job-knowledge-skills form
	@RequestMapping(value = "job-knowledge-skills")
	public String getJobKnowledgeSkills(Model model, HttpSession session) {

		try {
			String currentYear = String.valueOf(Converters.getCurrentYear());
			nonexemptEmpClock = (String) session.getAttribute("nonExempt");
			employeeYear = (String) session.getAttribute("nonExemptYear");

			List<JobKnowledgeAndSkill> jobKnowledge = nonExemptEmployeeService.getjobknowledgeData(nonexemptEmpClock,
					employeeYear);

			String avgScore = nonExemptEmployeeService.getInterpersonalAvgScore(nonexemptEmpClock, employeeYear);

			model.addAttribute("avgScore", avgScore);
			model.addAttribute("jobKnowledgeData", jobKnowledge);

			log.info("getJobKnowledgeSkills() successfully executed");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "job-knowledge-skills";
	}

	// JobKnowledgeAndSkillsBean method
	@RequestMapping(value = "/jobknowledgeForm", method = RequestMethod.POST)
	public ModelAndView jobKnowledgeAndSkills(@ModelAttribute("jobknowledge") JobKnowledgeAndSkillsBean jkasBean,
			Model model, HttpSession session) {

		JobKnowledgeAndSkill jobKnowledgeAndSkill = new JobKnowledgeAndSkill();
		nonexemptEmpClock = (String) session.getAttribute("nonExempt");
		employeeYear = (String) session.getAttribute("nonExemptYear");

		try {

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
			jobKnowledgeAndSkill.setJobKnowledgeAndSkillsSupervisorsComments(
					jkasBean.getJobKnowledgeAndSkillsSupervisorsComments());

			jobKnowledgeAndSkill.setSupervisorsOverallComments(jkasBean.getSupervisorsOveralComments());

			jobKnowledgeAndSkill.setAvgScore(jkasBean.getAvgScore().trim());

			jobKnowledgeAndSkill.setSummaryAvgScore(jkasBean.getSummaryAvgScore().trim());

			String ormClass = "JobKnowledgeAndSkill";

			String year = nonExemptEmployeeService.getYear(ormClass, nonexemptEmpClock.trim(), employeeYear);

			nonExemptEmployeeService.addJobKnowledgeAndSkillsData(jobKnowledgeAndSkill, year);

			// training and development retrieve screens..
			try {
				String presentYear = String.valueOf(Converters.getCurrentYear());

				List<TrainingAndDevelopment> trainingAndDevelopement = nonExemptEmployeeService
						.getTrainingAndDevelopmentData(nonexemptEmpClock, employeeYear);

				model.addAttribute("trainingAndDevelopement", trainingAndDevelopement);

			} catch (Exception e) {

				e.printStackTrace();

			}

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

	@RequestMapping(value = "training-development", method = RequestMethod.GET)
	public String getNonExemptTrainingorDevelopment(Model model, HttpSession session) {

		nonexemptEmpClock = (String) session.getAttribute("nonExempt");
		employeeYear = (String) session.getAttribute("nonExemptYear");
		try {
			String presentYear = String.valueOf(Converters.getCurrentYear());

			List<TrainingAndDevelopment> trainingAndDevelopement = nonExemptEmployeeService
					.getTrainingAndDevelopmentData(nonexemptEmpClock.trim(), employeeYear);

			model.addAttribute("trainingAndDevelopement", trainingAndDevelopement);

		} catch (Exception e) {

			e.printStackTrace();

		}

		return "training-development";
	}

	// neethu

	// TrainingAndDevelopementBean method
	@RequestMapping(value = "/training-developmentForm", method = RequestMethod.POST)
	public ModelAndView addNonExemptTrainingorDevelopmenData(
			@ModelAttribute("trainingAndDevelopment") TrainingAndDevelopmentBean trainingAndDevelopmentBean,
			HttpSession session) {

		TrainingAndDevelopment trainingAndDevelopement = new TrainingAndDevelopment();

		nonexemptEmpClock = (String) session.getAttribute("nonExempt");
		employeeYear = (String) session.getAttribute("nonExemptYear");

		try {

			trainingAndDevelopement.setClockId(Integer.parseInt(nonexemptEmpClock.trim()));

			trainingAndDevelopement.setFirstAreaorFocus(trainingAndDevelopmentBean.getFirstAreaorFocus());

			if (trainingAndDevelopmentBean.getFirstDateDue().equalsIgnoreCase(",")
					|| trainingAndDevelopmentBean.getFirstDateDue().isEmpty()) {

			} else {

				trainingAndDevelopement
						.setFirstDateDue(Converters.getNonExemptDate((trainingAndDevelopmentBean.getFirstDateDue())));
			}

			trainingAndDevelopement.setfirstTrainingTopic(trainingAndDevelopmentBean.getfirstTrainingTopic());
			trainingAndDevelopement
					.setfirstTrainingDescription(trainingAndDevelopmentBean.getfirstTrainingDescription());

			trainingAndDevelopement.setSecondAreaorFocus(trainingAndDevelopmentBean.getSecondAreaorFocus());
			if (trainingAndDevelopmentBean.getSecondfDateDue().equalsIgnoreCase(",")
					|| trainingAndDevelopmentBean.getSecondfDateDue().isEmpty()) {

			} else {

				trainingAndDevelopement
						.setSecondDateDue(Converters.getNonExemptDate(trainingAndDevelopmentBean.getSecondfDateDue()));
			}

			trainingAndDevelopement.setSecondTrainingTopic(trainingAndDevelopmentBean.getSecondTrainingTopic());
			trainingAndDevelopement
					.setSecondTrainingDescription(trainingAndDevelopmentBean.getSecondTrainingDescription());

			trainingAndDevelopement.setThirdAreaorFocus(trainingAndDevelopmentBean.getThirdAreaorFocus());
			if (trainingAndDevelopmentBean.getThirdDateDue().equalsIgnoreCase(",")
					|| trainingAndDevelopmentBean.getThirdDateDue().isEmpty()) {

			} else {

				trainingAndDevelopement
						.setThirdDateDue(Converters.getNonExemptDate(trainingAndDevelopmentBean.getThirdDateDue()));
			}
			trainingAndDevelopement.setThirdTrainingTopic(trainingAndDevelopmentBean.getThirdTrainingTopic());
			trainingAndDevelopement
					.setThirdTrainingDescription(trainingAndDevelopmentBean.getThirdTrainingDescription());
			trainingAndDevelopement.setAnnualYear(employeeYear.trim());

			String ormClass = "TrainingAndDevelopment";

			String year = nonExemptEmployeeService.getYear(ormClass, nonexemptEmpClock, employeeYear);
			
			if (String.valueOf(year).equals("null") || String.valueOf(year).length()==0) {

				exemptTeamMemberService.updateCensusForm("Completed", nonexemptEmpClock);
				
			} else {
		//		year = Integer.parseInt(Converters.getCurrentYear());
			}

			nonExemptEmployeeService.addNonExemptTrainingorDevelopmenData(trainingAndDevelopement, year);

			log.info("addNonExemptSummaryData() successfully executed");

		}

		catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("training-development");
		}
		//return new ModelAndView("acknowledgment-section");
		//only submit and redirect to dashboard
		return new ModelAndView("redirect:/back.do");

	}

	// To get NonExemptacknowledgment form
	@RequestMapping(value = "acknowledgment-section")
	public String getNonExemptAcknowledgmentSection(Model model, HttpSession session) {

		try {
			String currentYear = String.valueOf(Converters.getCurrentYear());

			nonexemptEmpClock = (String) session.getAttribute("nonExempt");
			employeeYear = (String) session.getAttribute("nonExemptYear");

			List<AcknowledgmentSection> acknowledgement = nonExemptEmployeeService
					.getAcknowledgementData(nonexemptEmpClock.trim(), employeeYear.trim());

			model.addAttribute("acknowledgement", acknowledgement);

		} catch (Exception e) {

		}
		return "acknowledgment-section";
	}

	// AcknowledgementBean method
	@RequestMapping(value = "/acknowledgment-section", method = RequestMethod.POST)
	public String addNonExemptAcknowledgmentSectionData(
			@ModelAttribute("acknowledgment") AcknowledgementBean acknowledgementBean, Model model,
			HttpSession session) {

		AcknowledgmentSection acknowledgmentSection = new AcknowledgmentSection();

		try {
			nonexemptEmpClock = (String) session.getAttribute("nonExempt");
			employeeYear = (String) session.getAttribute("nonExemptYear");
			String currentYear = String.valueOf(Converters.getCurrentYear());

			acknowledgmentSection.setClockId(Integer.parseInt(nonexemptEmpClock.trim()));
			acknowledgmentSection.setAnnualYear(currentYear);
			acknowledgmentSection.setTeamMembersComments(acknowledgementBean.getTeamMembersComments());

			nonExemptEmployeeService.addNonExemptAcknowledgmentSectionData(acknowledgmentSection);

		} catch (Exception e) {

			model.addAttribute("status", "your data not inserted successfully");

			// nonExemptEmployeeService.deleteAcknowledgmentSectionData(NonExemptEmployeesController.getEmpClockNumber());

			return "acknowledgment-section";
		}
		return "training-development";

	}

	@RequestMapping(value = "/nonteam-members-information", method = RequestMethod.GET)
	public String getNonExemptEmployee(Model modelMap, HttpSession session) {
		try {

			nonexemptEmpClock = (String) session.getAttribute("nonExempt");
			employeeYear = (String) session.getAttribute("nonExemptYear");

			List<CensusForm> nonExemptList = nonExemptEmployeeService.getNonExemptEmployeeList(nonexemptEmpClock.trim(),
					employeeYear);

			for (CensusForm c : nonExemptList) {
				System.out.println("if");
				System.out.println(c.getDOH());
			}

			modelMap.addAttribute("employee", nonExemptList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		log.info("getList() successfully executed");

		return "teammemberInformation";

	}

}
