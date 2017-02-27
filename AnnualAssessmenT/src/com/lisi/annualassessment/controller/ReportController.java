package com.lisi.annualassessment.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.docx4j.XmlUtils;
import org.docx4j.convert.out.pdf.PdfConversion;
import org.docx4j.convert.out.pdf.viaXSLFO.PdfSettings;
import org.docx4j.openpackaging.packages.WordprocessingMLPackage;
import org.docx4j.openpackaging.parts.Parts;
import org.docx4j.openpackaging.parts.WordprocessingML.FooterPart;
import org.docx4j.openpackaging.parts.WordprocessingML.HeaderPart;
import org.docx4j.openpackaging.parts.WordprocessingML.MainDocumentPart;
import org.docx4j.wml.Document;
import org.docx4j.wml.Ftr;
import org.docx4j.wml.Hdr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.orm.ExemptSection2;
import com.lisi.annualassessment.orm.ExemptTeamMember;
import com.lisi.annualassessment.orm.InterpersonalSkills;
import com.lisi.annualassessment.orm.JobKnowledgeAndSkill;
import com.lisi.annualassessment.orm.PresentYearObjectives;
import com.lisi.annualassessment.orm.SkillsSelfAssessment;
import com.lisi.annualassessment.orm.TrainingAndDevelopment;
import com.lisi.annualassessment.pojo.DropDownValues;
import com.lisi.annualassessment.pojo.LoginUser;
import com.lisi.annualassessment.pojo.ManagerSkillsAssessment;
import com.lisi.annualassessment.pojo.SkillsSelfAssesmentVariables;
import com.lisi.annualassessment.service.ExemptSection2Service;
import com.lisi.annualassessment.service.ExemptTeamMemberService;
import com.lisi.annualassessment.service.ManagerEmployeeService;
import com.lisi.annualassessment.service.NonExemptEmployeeService;
import com.lisi.annualassessment.service.SkillsSelfAssessmentService;
import com.lisi.annualassessment.service.TMPersonalInformationService;
import com.lisi.annualassessment.util.Converters;

/**
 * 
 * @author dileep.b
 * 
 */

@Controller
public class ReportController {

	private static final Logger log = Logger.getLogger(LoginController.class);

	@Autowired
	private TMPersonalInformationService tMPersonalInformationService;

	@Autowired
	private NonExemptEmployeeService nonExemptEmployeeService;

	@Autowired
	private ExemptTeamMemberService exemptTeamMemberService;

	@Autowired
	private ExemptSection2Service exemptSection2Service;

	@Autowired
	private SkillsSelfAssessmentService skillsSelfAssessmentService;

	@Autowired
	private ManagerEmployeeService managerEmployeeService;
	
	@Autowired
	private LoginUser loginUser;

	@Autowired
	ServletContext servletContext;

	// Exempt Report

	@RequestMapping(value = "/exemptReport", method = RequestMethod.GET)
	public ModelAndView exemptReport(HttpSession session) {
		log.info("Entered Into exemptReport()");
		if (session.getAttribute("exemptEmp") != null) {
			System.out.println("is Not Null");
		} else {

			return new ModelAndView("loginScreen", null);
		}
	//	String clockNumber = (String) session.getAttribute("exemptEmp").toString().trim();

		String clockNumber = loginUser.getExemptEmployeeClock().toString().trim();
		
	//	String employeeYear = (String) session.getAttribute("year");
		
		String employeeYear = loginUser.getExemptEmployeeYear();

		tMPersonalInformationService.updatePrintDate(clockNumber, employeeYear);

		exemptTeamMemberService.updateCensusForm("CLOSED", clockNumber, employeeYear.trim());

		System.out.println("Clocknumber in Report Controller:::: " + clockNumber);

		Map<String, Object> model = new HashMap<String, Object>();
		List<CensusForm> employeeDetails = tMPersonalInformationService.getEmployeeDetails(clockNumber,
				loginUser.getExemptEmployeeYear().toString());
		System.out.println("Employee Info:::::   " + employeeDetails.toString());

		List<ExemptTeamMember> tmReviewOfPastYearDetails = exemptTeamMemberService
				.getReviewOfPastYearDetails(clockNumber, employeeYear);
		System.out.println("tmReviewOfPastYearDetails Info:::::   " + tmReviewOfPastYearDetails.toString());

		List<SkillsSelfAssessment> skillsSelfAssessmentDetails = skillsSelfAssessmentService
				.getSkillsSelfAssessmentDetails(clockNumber, employeeYear);

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

		List<ExemptSection2> objectAchievementDetails = exemptSection2Service.retriveObjectAchievementData(clockNumber,
				employeeYear.toString());
		System.out.println("reviewOfPastYearDetails Info:::::   " + objectAchievementDetails.toString());

		ExemptSection2 exemptorm = null;
		List<ExemptSection2> retrivedata = exemptSection2Service.retriveManagerSkillsAssessmentData(clockNumber,
				employeeYear.toString());
		System.out.println(retrivedata);
		for (ExemptSection2 exemptSection2pojo : retrivedata) {
			exemptorm = new ExemptSection2();
			System.out.println(String.valueOf(exemptSection2pojo.getSection2B1()));
			int i = 0;

			System.out.println("exemptSection2cur :: " + exemptSection2pojo.getSection2A1Level());
			System.out.println("exemptSection2skillcur :: " + exemptSection2pojo.getSection2B1());
			// getting comma seperated values for Section2B1 and set into string
			String exemptsection = exemptSection2pojo.getSection2B1();
			String[] section2b1 = exemptsection.split(",");
			// getting comma seperated values for Section2B2 and set into string
			String exemptsection1 = exemptSection2pojo.getSection2B2();
			String[] section2b2 = exemptsection1.split(",");
			// getting comma seperated values for Section2B3 and set into string
			String exemptsection2 = exemptSection2pojo.getSection2B3();
			String[] section2b3 = exemptsection2.split(",");
			System.out.println("section2b1" + section2b1);
			ManagerSkillsAssessment manager = new ManagerSkillsAssessment();
			System.out.println(section2b1.length);
			System.out.println("length");

			for (String t : section2b1) {
				System.out.println("commaSeperatedValues is::::" + t);
				exemptorm = manager.setFields(exemptorm, t, i);
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

			exemptorm.setSection2CSummeryStrength(exemptSection2pojo.getSection2CSummeryStrength());
			exemptorm.setSection2CSummeryImprovement(exemptSection2pojo.getSection2CSummeryImprovement());
			exemptorm.setSection2DSummeryOfAccomplishmentAndAreasImprovement(
					exemptSection2pojo.getSection2DSummeryOfAccomplishmentAndAreasImprovement());
			exemptorm.setSection2EAssessmentSummary(exemptSection2pojo.getSection2EAssessmentSummary());
			exemptorm.setSection2EAssessmentcompared(exemptSection2pojo.getSection2EAssessmentcompared());
		}

		PresentYearObjectives presentYearObjectives = managerEmployeeService.retrievePresentYearObjectives(clockNumber,
				employeeYear.toString());
		// System.out.println("presentYearObjectives:::::
		// "+presentYearObjectives.toString());

		model.put("employeeDetails", employeeDetails);
		model.put("tmReviewOfPastYearDetails", tmReviewOfPastYearDetails);
		model.put("objectAchievementDetails", objectAchievementDetails);
		model.put("skillsSelfAssessmentDetails", skills);
		model.put("managerSkillsAssessmentDetails", exemptorm);
		model.put("presentYearObjectives", presentYearObjectives);

		String exemptReportTemplateFilePath = servletContext
				.getRealPath("/WEB-INF/ReportTemplates/ExemptReport template.xml");

		// String nonExemptReportTemplateFilePath =
		// "D:/PDFConverter/docx/Non-ExemptReport template.xml";
		// String exemptReportPdfPath =
		// "D:/LisiPdfReports/pdf/ExemptReport.pdf";

		System.out.println("**********************************************************************");

		File reportTempDirectory = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
		System.out.println("reportTempDirectory in Report Controller : " + reportTempDirectory);
		String fileReportName = employeeYear.toString() + " Annual Performance Review-" + clockNumber
				+ "-Report.pdf";
		System.out.println("fileReportName in Report Controller: " + fileReportName);
		System.out.println("**********************************************************************");
		String exemptReportPdfPath = reportTempDirectory + "/" + fileReportName;

		downloadExemptReport(exemptReportTemplateFilePath, exemptReportPdfPath, model);

		return new ModelAndView("exemptReport", model);

	}

	// Non Exempt Report

	@RequestMapping(value = "/nonExemptReport", method = RequestMethod.GET)
	public ModelAndView nonExemptReport(HttpSession session) {
		log.info("Entered Into nonExemptReport()");
		if (session.getAttribute("nonExempt") != null) {
			System.out.println("is Not Null");
		} else {

			return new ModelAndView("loginScreen");
		}

	//	String clockNumber = (String) session.getAttribute("nonExempt").toString().trim();

		String clockNumber = loginUser.getNonExemptEmployeeClock().toString().trim();
		
		String employeeYear = loginUser.getNonExemptEmployeeYear().toString().trim();

		exemptTeamMemberService.updateCensusForm("CLOSED", clockNumber, employeeYear.trim());

		tMPersonalInformationService.updatePrintDate(clockNumber, employeeYear);

		Map<String, Object> model = new HashMap<String, Object>();
		// For Employee Details
		List<CensusForm> employeeDetails = tMPersonalInformationService.getEmployeeDetails(clockNumber,
				loginUser.getNonExemptEmployeeYear().toString());
		System.out.println("Employee Info:::::   " + employeeDetails.toString());
		// For Interpersonal Skills
		List<InterpersonalSkills> interpersonalSkills = nonExemptEmployeeService.getInterpersonalData(clockNumber,
				employeeYear.toString());
		System.out.println("InterpersonalSkills Info:::::   " + interpersonalSkills.toString());
		// For Job Knowledge And Skill
		List<JobKnowledgeAndSkill> jobKnowledgeAndSkill = nonExemptEmployeeService.getjobknowledgeData(clockNumber,
				employeeYear.toString());
		System.out.println("JobKnowledgeAndSkill Info:::::   " + jobKnowledgeAndSkill.toString());
		// For TrainingAndDevelopment
		/*
		 * List<AcknowledgmentSection> acknowledgmentSection =
		 * nonExemptEmployeeService.getAcknowledgementData("7919",
		 * Converters.getCurrentYear().toString()); System.out.println(
		 * "AcknowledgmentSection Info:::::   "
		 * +acknowledgmentSection.toString());
		 */

		// For TrainingAndDevelopment
		List<TrainingAndDevelopment> trainingAndDevelopment = nonExemptEmployeeService
				.getTrainingAndDevelopmentData(clockNumber, employeeYear.toString());
		System.out.println("TrainingAndDevelopment Info:::::   " + trainingAndDevelopment.toString());

		model.put("employeeDetails", employeeDetails);
		model.put("interpersonalSkills", interpersonalSkills);
		model.put("jobKnowledgeAndSkill", jobKnowledgeAndSkill);
		// model.put("acknowledgmentSection", acknowledgmentSection);
		model.put("trainingAndDevelopment", trainingAndDevelopment);

		String nonExemptReportTemplateFilePath = servletContext
				.getRealPath("/WEB-INF/ReportTemplates/Non-ExemptReport template.xml");

		// String nonExemptReportTemplateFilePath =
		// "D:/PDFConverter/docx/Non-ExemptReport template.xml";

		System.out.println("**********************************************************************");

		File reportTempDirectory = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
		System.out.println("reportTempDirectory in Report Controller : " + reportTempDirectory);
		String fileReportName = employeeYear.toString() + " Annual Performance Review-" + clockNumber
				+ "-Report.pdf";
		System.out.println("fileReportName in Report Controller: " + fileReportName);
		System.out.println("**********************************************************************");
		String nonExemptReportPdfPath = reportTempDirectory + "/" + fileReportName;

		downloadNonExemptReport(nonExemptReportTemplateFilePath, nonExemptReportPdfPath, model);

		return new ModelAndView("nonExemptReport", model);

	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static void downloadNonExemptReport(String templateFilePath, String pdfFilePath, Map<String, Object> map) {

		try {

			String employeeFullName = null;
			String managerFullName;
			String hrGeneralistName;
			String annualyear = null;

			HashMap mappings = new HashMap();

			// SECTION #1 TEAM MEMBER'S INFORMATION

			List<CensusForm> censusFormList = (List<CensusForm>) map.get("employeeDetails");
			Iterator<CensusForm> censusFormListItr = censusFormList.iterator();
			while (censusFormListItr.hasNext()) {
				CensusForm censusForm = censusFormListItr.next();

				System.out.println("Employee Full Name In download Non Exempt:::::::::::   "
						+ censusForm.getEmplastName() + ", " + censusForm.getEmpfirstName());

				employeeFullName = censusForm.getEmplastName().trim() + ", " + censusForm.getEmpfirstName().trim();

				managerFullName = censusForm.getSupervisorLasttName().trim() + ", "
						+ censusForm.getSupervisorFirstName().trim();

				hrGeneralistName = censusForm.getHrGeneralistLastName().trim() + ", "
						+ censusForm.getHrGeneralistFirstName().trim();

				annualyear = censusForm.getAnnaulYear().trim();

				if (employeeFullName != null && !employeeFullName.isEmpty()) {
					employeeFullName = replaceStringwithSpecialCharacters(employeeFullName);
					mappings.put("emp_name", employeeFullName);
				} else {
					mappings.put("emp_name", "");
				}

				if (censusForm.getJobTitle() != null && !censusForm.getJobTitle().isEmpty()) {
					String jobTitle = censusForm.getJobTitle().trim();
					jobTitle = replaceStringwithSpecialCharacters(jobTitle);
					mappings.put("job_title", jobTitle);
				} else {
					mappings.put("job_title", "");
				}
				Date dateOfInterview = new Date();
				mappings.put("date_of_interview", "" + new SimpleDateFormat("MM/dd/yyyy").format(dateOfInterview) + "");

				if (censusForm.getDOH() != null) {
					mappings.put("date_of_hire", Converters.convertStringToDate(censusForm.getDOH().toString()));
				} else {
					mappings.put("date_of_hire", "");
				}

				mappings.put("date_of_last_interview", "");

				if (censusForm.getCostCenter() != null && !censusForm.getCostCenter().isEmpty()) {
					String costCenter = censusForm.getCostCenter().trim();
					costCenter = replaceStringwithSpecialCharacters(costCenter);
					mappings.put("department", costCenter);
				} else {
					mappings.put("department", "");
				}

				if (managerFullName != null && !managerFullName.isEmpty()) {
					managerFullName = replaceStringwithSpecialCharacters(managerFullName);
					mappings.put("department_manager", managerFullName);
				} else {
					mappings.put("department_manager", "");
				}

				if (censusForm.getFactoryLocation() != null && !censusForm.getFactoryLocation().isEmpty()) {
					String factoryLocation = censusForm.getFactoryLocation().trim();
					factoryLocation = replaceStringwithSpecialCharacters(factoryLocation);
					mappings.put("factory_division", factoryLocation);
				} else {
					mappings.put("factory_division", "");
				}

				if (censusForm.getMor() != null && !censusForm.getMor().isEmpty()) {
					String mor = censusForm.getMor().trim();
					mor = replaceStringwithSpecialCharacters(mor);
					mappings.put("mor", mor);
				} else {
					mappings.put("mor", "");
				}

				// Acknowledgment Section

				if (employeeFullName != null && !employeeFullName.isEmpty()) {
					employeeFullName = replaceStringwithSpecialCharacters(employeeFullName);
					mappings.put("team_member_name", employeeFullName);
				} else {
					mappings.put("team_member_name", "");
				}
				if (managerFullName != null && !managerFullName.isEmpty()) {
					managerFullName = replaceStringwithSpecialCharacters(managerFullName);
					mappings.put("supervisor_name", managerFullName);
				} else {
					mappings.put("supervisor_name", "");
				}
				if (hrGeneralistName != null && !hrGeneralistName.isEmpty()) {
					hrGeneralistName = replaceStringwithSpecialCharacters(hrGeneralistName);
					mappings.put("hr_name", hrGeneralistName);
				} else {
					mappings.put("hr_name", "");
				}

			}

			WordprocessingMLPackage wordMLPackage = WordprocessingMLPackage.load(new java.io.File(templateFilePath));
			Parts docParts = wordMLPackage.getParts();
			HashMap mapParts = docParts.getParts();
			Set set = mapParts.entrySet();
			Object objHeader = null;
			// Get an iterator
			Iterator i = set.iterator();

			// Display elements
			while (i.hasNext()) {
				Map.Entry me = (Map.Entry) i.next();

				objHeader = me.getValue();

				if (objHeader.getClass() == HeaderPart.class) {

					HeaderPart headerPart = (HeaderPart) objHeader;
					String headerXml = XmlUtils.marshaltoString(headerPart.getJaxbElement(), true);

					HashMap headerMappings = new HashMap();
					if (headerXml.indexOf("${employee_full_name}") != -1) {
						if (employeeFullName != null && !employeeFullName.isEmpty()) {
							employeeFullName = replaceStringwithSpecialCharacters(employeeFullName);
							headerMappings.put("employee_full_name", employeeFullName.trim());
						} else {
							headerMappings.put("employee_full_name", "");
						}
					}
					if (annualyear != null && !annualyear.isEmpty()) {
						headerMappings.put("annual_year", annualyear.trim());
					} else {
						headerMappings.put("annual_year", "");
					}
					Object obj = XmlUtils.unmarshallFromTemplate(headerXml, headerMappings);
					headerPart.setJaxbElement((Hdr) obj);

				}

				if (objHeader.getClass() == FooterPart.class) {

					FooterPart footerPart = (FooterPart) objHeader;
					String footerXml = XmlUtils.marshaltoString(footerPart.getJaxbElement(), true);
					HashMap footerMapings = new HashMap();

					if (annualyear != null && !annualyear.isEmpty()) {
						footerMapings.put("annual_year", annualyear.trim());
					} else {
						footerMapings.put("annual_year", "");
					}

					Object obj = XmlUtils.unmarshallFromTemplate(footerXml, footerMapings);
					footerPart.setJaxbElement((Ftr) obj);
				}

			}

			MainDocumentPart documentPart = wordMLPackage.getMainDocumentPart();

			// unmarshallFromTemplate requires string input
			String xml = XmlUtils.marshaltoString(documentPart.getJaxbElement(), true);

			// SECTION #2 INTERPERSONAL SKILLS

			List<InterpersonalSkills> interpersonalSkillsList = (List<InterpersonalSkills>) map
					.get("interpersonalSkills");
			Iterator<InterpersonalSkills> interpersonalSkillsListItr = interpersonalSkillsList.iterator();

			while (interpersonalSkillsListItr.hasNext()) {
				InterpersonalSkills interpersonalSkills = interpersonalSkillsListItr.next();

				if (interpersonalSkills.getResponsibilityScore() != null
						&& !interpersonalSkills.getResponsibilityScore().isEmpty()) {
					mappings.put("responsibility_score", interpersonalSkills.getResponsibilityScore().trim());

				} else {
					mappings.put("responsibility_score", "");
				}
				if (interpersonalSkills.getResponsibilitySupervisorsComments() != null
						&& !interpersonalSkills.getResponsibilitySupervisorsComments().isEmpty()) {
					String comments = interpersonalSkills.getResponsibilitySupervisorsComments().trim();
					comments = replaceStringwithSpecialCharacters(comments);
					mappings.put("responsibility_comments", comments);
				} else {
					mappings.put("responsibility_comments", "");
				}
				if (interpersonalSkills.getAdaptabilityScore() != null
						&& !interpersonalSkills.getAdaptabilityScore().isEmpty()) {
					mappings.put("adaptability_score", interpersonalSkills.getAdaptabilityScore().trim());

				} else {
					mappings.put("adaptability_score", "");
				}

				if (interpersonalSkills.getAdaptabilitySupervisorsComments() != null
						&& !interpersonalSkills.getAdaptabilitySupervisorsComments().isEmpty()) {

					String comments = interpersonalSkills.getAdaptabilitySupervisorsComments().trim();
					comments = replaceStringwithSpecialCharacters(comments);
					mappings.put("adaptability_comments", comments);
				} else {
					mappings.put("adaptability_comments", "");
				}
				if (interpersonalSkills.getInitiativeScore() != null
						&& !interpersonalSkills.getInitiativeScore().isEmpty()) {
					mappings.put("initiative_score", interpersonalSkills.getInitiativeScore().trim());

				} else {
					mappings.put("initiative_score", "");
				}
				if (interpersonalSkills.getInitiativeSupervisorsComments() != null
						&& !interpersonalSkills.getInitiativeSupervisorsComments().isEmpty()) {
					String comments = interpersonalSkills.getInitiativeSupervisorsComments().trim();
					comments = replaceStringwithSpecialCharacters(comments);
					mappings.put("initiative_comments", comments);
				} else {
					mappings.put("initiative_comments", "");
				}
				if (interpersonalSkills.getJudgementScore() != null
						&& !interpersonalSkills.getJudgementScore().isEmpty()) {
					mappings.put("judgment_score", interpersonalSkills.getJudgementScore().trim());

				} else {
					mappings.put("judgment_score", "");
				}
				if (interpersonalSkills.getJudgementSupervisorsComments() != null
						&& !interpersonalSkills.getJudgementSupervisorsComments().isEmpty()) {
					String comments = interpersonalSkills.getJudgementSupervisorsComments().trim();
					comments = replaceStringwithSpecialCharacters(comments);
					mappings.put("judgment_comments", comments);
				} else {
					mappings.put("judgment_comments", "");
				}
				if (interpersonalSkills.getWrittenAndOralCommunicationScore() != null
						&& !interpersonalSkills.getWrittenAndOralCommunicationScore().isEmpty()) {
					mappings.put("communication_score",
							interpersonalSkills.getWrittenAndOralCommunicationScore().trim());

				} else {
					mappings.put("communication_score", "");
				}
				if (interpersonalSkills.getWrittenAndOralCommunicationSupervisorsComments() != null
						&& !interpersonalSkills.getWrittenAndOralCommunicationSupervisorsComments().isEmpty()) {
					String comments = interpersonalSkills.getWrittenAndOralCommunicationSupervisorsComments().trim();
					comments = replaceStringwithSpecialCharacters(comments);
					mappings.put("communication_comments", comments);
				} else {
					mappings.put("communication_comments", "");
				}
				if (interpersonalSkills.getPunctualityAndCommitmentScore() != null
						&& !interpersonalSkills.getPunctualityAndCommitmentScore().isEmpty()) {
					mappings.put("attendance_score", interpersonalSkills.getPunctualityAndCommitmentScore().trim());

				} else {
					mappings.put("attendance_score", "");
				}
				if (interpersonalSkills.getPunctualityAndCommitmentSupervisorsComments() != null
						&& !interpersonalSkills.getPunctualityAndCommitmentSupervisorsComments().isEmpty()) {
					String comments = interpersonalSkills.getPunctualityAndCommitmentSupervisorsComments().trim();
					comments = replaceStringwithSpecialCharacters(comments);
					mappings.put("attendance_comments", comments);
				} else {
					mappings.put("attendance_comments", "");
				}

				if (interpersonalSkills.getAvgScore() != null && !interpersonalSkills.getAvgScore().isEmpty()) {
					mappings.put("section2_avg_score", interpersonalSkills.getAvgScore().trim());
				} else {
					mappings.put("section2_avg_score", "");
				}

			}

			// SECTION #3 JOB KNOWLEDGE & SKILLS

			List<JobKnowledgeAndSkill> jobKnowledgeAndSkillsList = (List<JobKnowledgeAndSkill>) map
					.get("jobKnowledgeAndSkill");
			Iterator<JobKnowledgeAndSkill> jobKnowledgeAndSkillsListItr = jobKnowledgeAndSkillsList.iterator();

			while (jobKnowledgeAndSkillsListItr.hasNext()) {

				JobKnowledgeAndSkill jobKnowledgeAndSkills = jobKnowledgeAndSkillsListItr.next();
				if (jobKnowledgeAndSkills.getSafetyScore() != null
						&& !jobKnowledgeAndSkills.getSafetyScore().isEmpty()) {
					mappings.put("satety_score", jobKnowledgeAndSkills.getSafetyScore().trim());

				} else {
					mappings.put("satety_score", "");
				}
				if (jobKnowledgeAndSkills.getSafetySupervisorsComments() != null
						&& !jobKnowledgeAndSkills.getSafetySupervisorsComments().isEmpty()) {
					String comments = jobKnowledgeAndSkills.getSafetySupervisorsComments().trim();
					comments = replaceStringwithSpecialCharacters(comments);
					mappings.put("safety_comments", comments);
				} else {
					mappings.put("safety_comments", "");
				}
				if (jobKnowledgeAndSkills.getQualityScore() != null
						&& !jobKnowledgeAndSkills.getQualityScore().isEmpty()) {
					mappings.put("quality_score", jobKnowledgeAndSkills.getQualityScore().trim());

				} else {
					mappings.put("quality_score", "");
				}
				if (jobKnowledgeAndSkills.getQualitySupervisorsComments() != null
						&& !jobKnowledgeAndSkills.getQualitySupervisorsComments().isEmpty()) {
					String comments = jobKnowledgeAndSkills.getQualitySupervisorsComments().trim();
					comments = replaceStringwithSpecialCharacters(comments);
					mappings.put("quality_comments", comments);
				} else {
					mappings.put("quality_comments", "");
				}
				if (jobKnowledgeAndSkills.getProductivityScore() != null
						&& !jobKnowledgeAndSkills.getProductivityScore().isEmpty()) {
					mappings.put("productivity_score", jobKnowledgeAndSkills.getProductivityScore().trim());

				} else {
					mappings.put("productivity_score", "");
				}
				if (jobKnowledgeAndSkills.getProductivitySupervisorsComments() != null
						&& !jobKnowledgeAndSkills.getProductivitySupervisorsComments().isEmpty()) {
					String comments = jobKnowledgeAndSkills.getProductivitySupervisorsComments().trim();
					comments = replaceStringwithSpecialCharacters(comments);
					mappings.put("productivity_comments", comments);
				} else {
					mappings.put("productivity_comments", "");
				}
				if (jobKnowledgeAndSkills.getJobKnowledgeAndSkillsScore() != null
						&& !jobKnowledgeAndSkills.getJobKnowledgeAndSkillsScore().isEmpty()) {
					mappings.put("jobskills_score", jobKnowledgeAndSkills.getJobKnowledgeAndSkillsScore().trim());

				} else {
					mappings.put("jobskills_score", "");
				}
				if (jobKnowledgeAndSkills.getJobKnowledgeAndSkillsSupervisorsComments() != null
						&& !jobKnowledgeAndSkills.getJobKnowledgeAndSkillsSupervisorsComments().isEmpty()) {
					String comments = jobKnowledgeAndSkills.getJobKnowledgeAndSkillsSupervisorsComments().trim();
					comments = replaceStringwithSpecialCharacters(comments);
					mappings.put("jobskills_comments", comments);
				} else {
					mappings.put("jobskills_comments", "");
				}

				if (jobKnowledgeAndSkills.getAvgScore() != null && !jobKnowledgeAndSkills.getAvgScore().isEmpty()) {
					mappings.put("section3_avg_score", jobKnowledgeAndSkills.getAvgScore().trim());
				} else {
					mappings.put("section3_avg_score", "");
				}

				if (jobKnowledgeAndSkills.getSupervisorsOverallComments() != null
						&& !jobKnowledgeAndSkills.getSupervisorsOverallComments().isEmpty()) {
					String comments = jobKnowledgeAndSkills.getSupervisorsOverallComments().trim();
					comments = replaceStringwithSpecialCharacters(comments);
					mappings.put("overall_comments", comments);
				} else {
					mappings.put("overall_comments", "");
				}

				if (jobKnowledgeAndSkills.getSummaryAvgScore() != null
						&& !jobKnowledgeAndSkills.getSummaryAvgScore().isEmpty()) {
					
					DecimalFormat df = new DecimalFormat("#.##");
					
					System.out.println(df.format(Double.valueOf(jobKnowledgeAndSkills.getSummaryAvgScore().trim()))+ " report value.");
				
					
					
					mappings.put("avg_overall_score", df.format(Double.valueOf(jobKnowledgeAndSkills.getSummaryAvgScore().trim())));
				} else {
					mappings.put("avg_overall_score", "");
				}

			}

			// SECTION #4 SUMMARY OF PERFORMANCE REVIEW

			List<TrainingAndDevelopment> trainingAndDevelopmentList = (List<TrainingAndDevelopment>) map
					.get("trainingAndDevelopment");
			Iterator<TrainingAndDevelopment> trainingAndDevelopmentListItr = trainingAndDevelopmentList.iterator();

			while (trainingAndDevelopmentListItr.hasNext()) {

				TrainingAndDevelopment trainingAndDevelopment = trainingAndDevelopmentListItr.next();
				if (trainingAndDevelopment.getFirstAreaorFocus() != null
						&& !trainingAndDevelopment.getFirstAreaorFocus().isEmpty()) {
					String areaFocus = trainingAndDevelopment.getFirstAreaorFocus().trim();
					areaFocus = replaceStringwithSpecialCharacters(areaFocus);
					mappings.put("area_focus1", areaFocus);
				} else {
					mappings.put("area_focus1", "");
				}
				if (trainingAndDevelopment.getfirstTrainingTopic() != null
						&& !trainingAndDevelopment.getfirstTrainingTopic().isEmpty()) {
					mappings.put("method_of_training1", trainingAndDevelopment.getfirstTrainingTopic().trim());
				} else {
					mappings.put("method_of_training1", "");
				}
				if (trainingAndDevelopment.getfirstTrainingDescription() != null
						&& !trainingAndDevelopment.getfirstTrainingDescription().isEmpty()) {
					String description = trainingAndDevelopment.getfirstTrainingDescription().trim();
					description = replaceStringwithSpecialCharacters(description);
					mappings.put("training_description1", description);
				} else {
					mappings.put("training_description1", "");
				}
				if (trainingAndDevelopment.getFirstDateDue() != null) {
					mappings.put("due_date1",
							Converters.convertStringToDate(trainingAndDevelopment.getFirstDateDue().toString()));
				} else {
					mappings.put("due_date1", "");
				}
				if (trainingAndDevelopment.getSecondAreaorFocus() != null
						&& !trainingAndDevelopment.getSecondAreaorFocus().isEmpty()) {
					String areaFocus = trainingAndDevelopment.getSecondAreaorFocus().trim();
					areaFocus = replaceStringwithSpecialCharacters(areaFocus);
					mappings.put("area_focus2", areaFocus);
				} else {
					mappings.put("area_focus2", "");
				}
				if (trainingAndDevelopment.getSecondTrainingTopic() != null
						&& !trainingAndDevelopment.getSecondTrainingTopic().isEmpty()) {
					mappings.put("method_of_training2", trainingAndDevelopment.getSecondTrainingTopic().trim());
				} else {
					mappings.put("method_of_training2", "");
				}
				if (trainingAndDevelopment.getSecondTrainingDescription() != null
						&& !trainingAndDevelopment.getSecondTrainingDescription().isEmpty()) {
					String description = trainingAndDevelopment.getSecondTrainingDescription().trim();
					description = replaceStringwithSpecialCharacters(description);
					mappings.put("training_description2", description);
				} else {
					mappings.put("training_description2", "");
				}
				if (trainingAndDevelopment.getSecondfDateDue() != null) {
					mappings.put("due_date2",
							Converters.convertStringToDate(trainingAndDevelopment.getSecondfDateDue().toString()));
				} else {
					mappings.put("due_date2", "");
				}
				if (trainingAndDevelopment.getThirdAreaorFocus() != null
						&& !trainingAndDevelopment.getThirdAreaorFocus().isEmpty()) {
					String areaFocus = trainingAndDevelopment.getThirdAreaorFocus().trim();
					areaFocus = replaceStringwithSpecialCharacters(areaFocus);
					mappings.put("area_focus3", areaFocus);
				} else {
					mappings.put("area_focus3", "");
				}
				if (trainingAndDevelopment.getThirdTrainingTopic() != null
						&& !trainingAndDevelopment.getThirdTrainingTopic().isEmpty()) {
					mappings.put("method_of_training3", trainingAndDevelopment.getThirdTrainingTopic().trim());
				} else {
					mappings.put("method_of_training3", "");
				}
				if (trainingAndDevelopment.getThirdTrainingDescription() != null
						&& !trainingAndDevelopment.getThirdTrainingDescription().isEmpty()) {
					String description = trainingAndDevelopment.getThirdTrainingDescription().trim();
					description = replaceStringwithSpecialCharacters(description);
					mappings.put("training_description3", description);
				} else {
					mappings.put("training_description3", "");
				}
				if (trainingAndDevelopment.getThirdDateDue() != null) {
					mappings.put("due_date3",
							Converters.convertStringToDate(trainingAndDevelopment.getThirdDateDue().toString()));
				} else {
					mappings.put("due_date3", "");
				}
			}

			mappings.put("team_member_comments", "");

			// Do it...
			Object obj = XmlUtils.unmarshallFromTemplate(xml, mappings);

			// Inject result into docx
			documentPart.setJaxbElement((Document) obj);

			PdfSettings pdfSettings = new PdfSettings();
			OutputStream outputStream = new FileOutputStream(new File(pdfFilePath));
			PdfConversion converter = new org.docx4j.convert.out.pdf.viaXSLFO.Conversion(wordMLPackage);
			converter.output(outputStream, pdfSettings);

			outputStream.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static void downloadExemptReport(String templateFilePath, String pdfFilePath, Map<String, Object> map) {

		try {

			String employeeFullName = null;
			String managerFullName;

			String annualyear = null;

			HashMap mappings = new HashMap();

			// SECTION #1 TEAM MEMBER'S INFORMATION

			List<CensusForm> censusFormList = (List<CensusForm>) map.get("employeeDetails");
			Iterator<CensusForm> censusFormListItr = censusFormList.iterator();
			while (censusFormListItr.hasNext()) {
				CensusForm censusForm = censusFormListItr.next();

				System.out.println("Employee Full Name In download Non Exempt:::::::::::   "
						+ censusForm.getEmplastName() + ", " + censusForm.getEmpfirstName());

				employeeFullName = censusForm.getEmplastName().trim() + ", " + censusForm.getEmpfirstName().trim();

				managerFullName = censusForm.getSupervisorLasttName().trim() + ", "
						+ censusForm.getSupervisorFirstName().trim();

			//	annualyear = censusForm.getAnnaulYear().trim();
				
				annualyear = censusForm.getAnnaulYear().trim();

				String comparedYear = String.valueOf((Integer.parseInt(annualyear.trim()) - 2));

				if (annualyear != null && !annualyear.isEmpty()) {
					mappings.put("annual_year", annualyear.trim());
				} else {
					mappings.put("annual_year", "");
				}

				if (comparedYear != null && !comparedYear.isEmpty()) {
					mappings.put("compared_year", comparedYear.trim());
				} else {
					mappings.put("compared_year", "");
				}

				if (employeeFullName != null && !employeeFullName.isEmpty()) {
					employeeFullName = replaceStringwithSpecialCharacters(employeeFullName);
					mappings.put("emp_name", employeeFullName);
				} else {
					mappings.put("emp_name", "");
				}

				if (censusForm.getJobTitle() != null && !censusForm.getJobTitle().isEmpty()) {
					String jobTitle = censusForm.getJobTitle().trim();
					jobTitle = replaceStringwithSpecialCharacters(jobTitle);
					mappings.put("job_title", jobTitle);
				} else {
					mappings.put("job_title", "");
				}
				Date dateOfInterview = new Date();
				mappings.put("date_of_interview", "" + new SimpleDateFormat("MM/dd/yyyy").format(dateOfInterview) + "");

				if (censusForm.getDOH() != null) {
					mappings.put("date_of_hire", Converters.convertStringToDate(censusForm.getDOH().toString()));
				} else {
					mappings.put("date_of_hire", "");
				}

				mappings.put("date_of_last_interview", "");

				if (censusForm.getCostCenter() != null && !censusForm.getCostCenter().isEmpty()) {
					String costCenter = censusForm.getCostCenter().trim();
					costCenter = replaceStringwithSpecialCharacters(costCenter);
					mappings.put("department", costCenter);
				} else {
					mappings.put("department", "");
				}

				if (managerFullName != null && !managerFullName.isEmpty()) {
					managerFullName = replaceStringwithSpecialCharacters(managerFullName);
					mappings.put("department_manager", managerFullName);
				} else {
					mappings.put("department_manager", "");
				}

				if (censusForm.getFactoryLocation() != null && !censusForm.getFactoryLocation().isEmpty()) {
					String factoryLocation = censusForm.getFactoryLocation().trim();
					factoryLocation = replaceStringwithSpecialCharacters(factoryLocation);
					mappings.put("factory_division", factoryLocation);
				} else {
					mappings.put("factory_division", "");
				}

				if (censusForm.getMor() != null && !censusForm.getMor().isEmpty()) {
					String mor = censusForm.getMor().trim();
					mor = replaceStringwithSpecialCharacters(mor);
					mappings.put("mor", mor);
				} else {
					mappings.put("mor", "");
				}

				// Acknowledgment Section

				if (employeeFullName != null && !employeeFullName.isEmpty()) {
					employeeFullName = replaceStringwithSpecialCharacters(employeeFullName);
					mappings.put("emp_full_name", employeeFullName);
				} else {
					mappings.put("emp_full_name", "");
				}
				if (managerFullName != null && !managerFullName.isEmpty()) {
					managerFullName = replaceStringwithSpecialCharacters(managerFullName);
					mappings.put("manager_full_name", managerFullName);
				} else {
					mappings.put("manager_full_name", "");
				}

			}

			WordprocessingMLPackage wordMLPackage = WordprocessingMLPackage.load(new java.io.File(templateFilePath));
			Parts docParts = wordMLPackage.getParts();
			HashMap mapParts = docParts.getParts();
			Set set = mapParts.entrySet();
			Object objHeader = null;
			// Get an iterator
			Iterator i = set.iterator();

			// Display elements
			while (i.hasNext()) {
				Map.Entry me = (Map.Entry) i.next();

				objHeader = me.getValue();

				if (objHeader.getClass() == HeaderPart.class) {

					HeaderPart headerPart = (HeaderPart) objHeader;
					String headerXml = XmlUtils.marshaltoString(headerPart.getJaxbElement(), true);

					HashMap headerMappings = new HashMap();
					if (headerXml.indexOf("${employee_full_name}") != -1) {
						if (employeeFullName != null && !employeeFullName.isEmpty()) {
							employeeFullName = replaceStringwithSpecialCharacters(employeeFullName);
							headerMappings.put("employee_full_name", employeeFullName.trim());
						} else {
							headerMappings.put("employee_full_name", "");
						}
					}
					if (annualyear != null && !annualyear.isEmpty()) {
						headerMappings.put("annual_year", annualyear.trim());
					} else {
						headerMappings.put("annual_year", "");
					}
					Object obj = XmlUtils.unmarshallFromTemplate(headerXml, headerMappings);
					headerPart.setJaxbElement((Hdr) obj);

				}

				if (objHeader.getClass() == FooterPart.class) {

					FooterPart footerPart = (FooterPart) objHeader;
					String footerXml = XmlUtils.marshaltoString(footerPart.getJaxbElement(), true);
					HashMap footerMapings = new HashMap();

					if (annualyear != null && !annualyear.isEmpty()) {
						footerMapings.put("annual_year", annualyear.trim());
					} else {
						footerMapings.put("annual_year", "");
					}

					Object obj = XmlUtils.unmarshallFromTemplate(footerXml, footerMapings);
					footerPart.setJaxbElement((Ftr) obj);
				}

			}

			// Team Member Review Of Past Year Details

			List<ExemptTeamMember> tmReviewOfPastYearDetailsList = (List<ExemptTeamMember>) map
					.get("tmReviewOfPastYearDetails");
			Iterator<ExemptTeamMember> tmReviewOfPastYearDetailsListItr = tmReviewOfPastYearDetailsList.iterator();

			while (tmReviewOfPastYearDetailsListItr.hasNext()) {

				ExemptTeamMember exemptTeamMember = tmReviewOfPastYearDetailsListItr.next();

				if (exemptTeamMember.getSection1A() != null && !exemptTeamMember.getSection1A().isEmpty()) {
					String review = exemptTeamMember.getSection1A().trim();
					review = replaceStringwithSpecialCharacters(review);
					mappings.put("sec1_review_of_year", review);
				} else {
					mappings.put("sec1_review_of_year", "");
				}
				if (exemptTeamMember.getSection1B1() != null && !exemptTeamMember.getSection1B1().isEmpty()) {
					String training = exemptTeamMember.getSection1B1().trim();
					training = replaceStringwithSpecialCharacters(training);
					mappings.put("sec1_training1", training);
				} else {
					mappings.put("sec1_training1", "");
				}
				if (exemptTeamMember.getSection1B2() != null && !exemptTeamMember.getSection1B2().isEmpty()) {
					String training = exemptTeamMember.getSection1B2().trim();
					training = replaceStringwithSpecialCharacters(training);
					mappings.put("sec1_training2", training);
				} else {
					mappings.put("sec1_training2", "");
				}
				if (exemptTeamMember.getSection1B3() != null && !exemptTeamMember.getSection1B3().isEmpty()) {
					String training = exemptTeamMember.getSection1B3().trim();
					training = replaceStringwithSpecialCharacters(training);
					mappings.put("sec1_training3", training);
				} else {
					mappings.put("sec1_training3", "");
				}
				if (exemptTeamMember.getSection1B4() != null && !exemptTeamMember.getSection1B4().isEmpty()) {
					String training = exemptTeamMember.getSection1B4().trim();
					training = replaceStringwithSpecialCharacters(training);
					mappings.put("sec1_training4", training);
				} else {
					mappings.put("sec1_training4", "");
				}

				if (exemptTeamMember.getEffectivenessOfB1() != null
						&& !exemptTeamMember.getEffectivenessOfB1().isEmpty()) {
					mappings.put("sec1_effectiveness1", exemptTeamMember.getEffectivenessOfB1().trim());
				} else {
					mappings.put("sec1_effectiveness1", "");
				}
				if (exemptTeamMember.getEffectivenessOfB2() != null
						&& !exemptTeamMember.getEffectivenessOfB2().isEmpty()) {
					mappings.put("sec1_effectiveness2", exemptTeamMember.getEffectivenessOfB2().trim());
				} else {
					mappings.put("sec1_effectiveness2", "");
				}
				if (exemptTeamMember.getEffectivenessOfB3() != null
						&& !exemptTeamMember.getEffectivenessOfB3().isEmpty()) {
					mappings.put("sec1_effectiveness3", exemptTeamMember.getEffectivenessOfB3().trim());
				} else {
					mappings.put("sec1_effectiveness3", "");
				}
				if (exemptTeamMember.getEffectivenessOfB4() != null
						&& !exemptTeamMember.getEffectivenessOfB4().isEmpty()) {
					mappings.put("sec1_effectiveness4", exemptTeamMember.getEffectivenessOfB4().trim());
				} else {
					mappings.put("sec1_effectiveness4", "");
				}

				if (exemptTeamMember.getSection1C() != null && !exemptTeamMember.getSection1C().isEmpty()) {
					String sectionc = exemptTeamMember.getSection1C().trim();
					sectionc = replaceStringwithSpecialCharacters(sectionc);
					mappings.put("sec1_c", sectionc);
				} else {
					mappings.put("sec1_c", "");
				}

				if (exemptTeamMember.getSection1D1() != null && !exemptTeamMember.getSection1D1().isEmpty()) {
					String sec1_d1 = exemptTeamMember.getSection1D1().trim();
					sec1_d1 = replaceStringwithSpecialCharacters(sec1_d1);
					mappings.put("sec1_d1", sec1_d1);
				} else {
					mappings.put("sec1_d1", "");
				}
				if (exemptTeamMember.getSection1D2() != null && !exemptTeamMember.getSection1D2().isEmpty()) {
					String sec1_d2 = exemptTeamMember.getSection1D2().trim();
					sec1_d2 = replaceStringwithSpecialCharacters(sec1_d2);
					mappings.put("sec1_d2", sec1_d2);
				} else {
					mappings.put("sec1_d2", "");
				}

				if (exemptTeamMember.getSection1F1() != null && !exemptTeamMember.getSection1F1().isEmpty()) {
					String sec1_f1a = exemptTeamMember.getSection1F1().trim();
					sec1_f1a = replaceStringwithSpecialCharacters(sec1_f1a);
					mappings.put("sec1_f1a", sec1_f1a);
					if (exemptTeamMember.getSection1F1().equals("yes")) {

						if (exemptTeamMember.getSection1F2ONE() != null
								&& !exemptTeamMember.getSection1F2ONE().isEmpty()) {
							String sec1_f2b = exemptTeamMember.getSection1F2ONE().trim();
							sec1_f2b = replaceStringwithSpecialCharacters(sec1_f2b);
							mappings.put("sec1_f2b", sec1_f2b);
						} else {
							mappings.put("sec1_f2b", "");
						}

						if (exemptTeamMember.getSection1F2TWO() != null
								&& !exemptTeamMember.getSection1F2TWO().isEmpty()) {
							String sec1_f2b_us_facility = exemptTeamMember.getSection1F2TWO().trim();
							sec1_f2b_us_facility = replaceStringwithSpecialCharacters(sec1_f2b_us_facility);
							mappings.put("sec1_f2b_us_facility", sec1_f2b_us_facility);
						} else {
							mappings.put("sec1_f2b_us_facility", "");
						}
					}
					else{
						mappings.put("sec1_f2b", "");
						mappings.put("sec1_f2b_us_facility", "");
					}

						if (exemptTeamMember.getSection1F3A() != null && !exemptTeamMember.getSection1F3A().isEmpty()) {
							String sec1_f3 = exemptTeamMember.getSection1F3A().trim();
							sec1_f3 = replaceStringwithSpecialCharacters(sec1_f3);
							mappings.put("sec1_f3", sec1_f3);
						} else {
							mappings.put("sec1_f3", "");
						}

						if (exemptTeamMember.getSection1F3B() != null && !exemptTeamMember.getSection1F3B().isEmpty()) {
							String sec1_f3_region = exemptTeamMember.getSection1F3B().trim();
							sec1_f3_region = replaceStringwithSpecialCharacters(sec1_f3_region);
							mappings.put("sec1_f3_region", sec1_f3_region);
						} else {
							mappings.put("sec1_f3_region", "");
						}

						if (exemptTeamMember.getSection1F3B1() != null
								&& !exemptTeamMember.getSection1F3B1().isEmpty()) {
							String sec1_f3_1 = exemptTeamMember.getSection1F3B1().trim();
							sec1_f3_1 = replaceStringwithSpecialCharacters(sec1_f3_1);
							mappings.put("sec1_f3_1", sec1_f3_1);
						} else {
							mappings.put("sec1_f3_1", "");
						}

						if (exemptTeamMember.getSection1F3B2() != null
								&& !exemptTeamMember.getSection1F3B2().isEmpty()) {
							String sec1_f3_2 = exemptTeamMember.getSection1F3B2().trim();
							sec1_f3_2 = replaceStringwithSpecialCharacters(sec1_f3_2);
							mappings.put("sec1_f3_2", sec1_f3_2);
						} else {
							mappings.put("sec1_f3_2", "");
						}

					

				} else {
					mappings.put("sec1_f3_region", "");
					mappings.put("sec1_f3_1", "");
					mappings.put("sec1_f3_2", "");
				}

				// Skills Assessment Summary

				SkillsSelfAssesmentVariables skillsSelfAssesmentVariables = (SkillsSelfAssesmentVariables) map
						.get("skillsSelfAssessmentDetails");

				if (skillsSelfAssesmentVariables.getSkills1() != null
						&& !skillsSelfAssesmentVariables.getSkills1().isEmpty()) {
					mappings.put("sec1_skill1", skillsSelfAssesmentVariables.getSkills1().trim());
				} else {
					mappings.put("sec1_skill1", "");
				}

				if (skillsSelfAssesmentVariables.getSkills2() != null
						&& !skillsSelfAssesmentVariables.getSkills2().isEmpty()) {
					mappings.put("sec1_skill2", skillsSelfAssesmentVariables.getSkills2().trim());
				} else {
					mappings.put("sec1_skill2", "");
				}

				if (skillsSelfAssesmentVariables.getSkills3() != null
						&& !skillsSelfAssesmentVariables.getSkills3().isEmpty()) {
					mappings.put("sec1_skill3", skillsSelfAssesmentVariables.getSkills3().trim());
				} else {
					mappings.put("sec1_skill3", "");
				}

				if (skillsSelfAssesmentVariables.getSkills4() != null
						&& !skillsSelfAssesmentVariables.getSkills4().isEmpty()) {
					mappings.put("sec1_skill4", skillsSelfAssesmentVariables.getSkills4().trim());
				} else {
					mappings.put("sec1_skill4", "");
				}

				if (skillsSelfAssesmentVariables.getSkills5() != null
						&& !skillsSelfAssesmentVariables.getSkills5().isEmpty()) {
					mappings.put("sec1_skill5", skillsSelfAssesmentVariables.getSkills5().trim());
				} else {
					mappings.put("sec1_skill5", "");
				}

				if (skillsSelfAssesmentVariables.getSkills6() != null
						&& !skillsSelfAssesmentVariables.getSkills6().isEmpty()) {
					mappings.put("sec1_skill6", skillsSelfAssesmentVariables.getSkills6().trim());
				} else {
					mappings.put("sec1_skill6", "");
				}

				if (skillsSelfAssesmentVariables.getSkills7() != null
						&& !skillsSelfAssesmentVariables.getSkills7().isEmpty()) {
					mappings.put("sec1_skill7", skillsSelfAssesmentVariables.getSkills7().trim());
				} else {
					mappings.put("sec1_skill7", "");
				}

				if (skillsSelfAssesmentVariables.getSkills8() != null
						&& !skillsSelfAssesmentVariables.getSkills8().isEmpty()) {
					mappings.put("sec1_skill8", skillsSelfAssesmentVariables.getSkills9().trim());
				} else {
					mappings.put("sec1_skill8", "");
				}

				if (skillsSelfAssesmentVariables.getSkills9() != null
						&& !skillsSelfAssesmentVariables.getSkills9().isEmpty()) {
					mappings.put("sec1_skill9", skillsSelfAssesmentVariables.getSkills9().trim());
				} else {
					mappings.put("sec1_skill9", "");
				}

				if (skillsSelfAssesmentVariables.getSkills10() != null
						&& !skillsSelfAssesmentVariables.getSkills10().isEmpty()) {
					mappings.put("sec1_skill10", skillsSelfAssesmentVariables.getSkills10().trim());
				} else {
					mappings.put("sec1_skill10", "");
				}

				// Ways Of Working

				if (skillsSelfAssesmentVariables.getWaysOfWorking1() != null
						&& !skillsSelfAssesmentVariables.getWaysOfWorking1().isEmpty()) {
					mappings.put("sec1_ways_of_working1", skillsSelfAssesmentVariables.getWaysOfWorking1().trim());
				} else {
					mappings.put("sec1_ways_of_working1", "");
				}

				if (skillsSelfAssesmentVariables.getWaysOfWorking2() != null
						&& !skillsSelfAssesmentVariables.getWaysOfWorking2().isEmpty()) {
					mappings.put("sec1_ways_of_working2", skillsSelfAssesmentVariables.getWaysOfWorking2().trim());
				} else {
					mappings.put("sec1_ways_of_working2", "");
				}

				if (skillsSelfAssesmentVariables.getWaysOfWorking3() != null
						&& !skillsSelfAssesmentVariables.getWaysOfWorking3().isEmpty()) {
					mappings.put("sec1_ways_of_working3", skillsSelfAssesmentVariables.getWaysOfWorking3().trim());
				} else {
					mappings.put("sec1_ways_of_working3", "");
				}

				if (skillsSelfAssesmentVariables.getWaysOfWorking4() != null
						&& !skillsSelfAssesmentVariables.getWaysOfWorking4().isEmpty()) {
					mappings.put("sec1_ways_of_working4", skillsSelfAssesmentVariables.getWaysOfWorking4().trim());
				} else {
					mappings.put("sec1_ways_of_working4", "");
				}

				if (skillsSelfAssesmentVariables.getWaysOfWorking5() != null
						&& !skillsSelfAssesmentVariables.getWaysOfWorking5().isEmpty()) {
					mappings.put("sec1_ways_of_working5", skillsSelfAssesmentVariables.getWaysOfWorking5().trim());
				} else {
					mappings.put("sec1_ways_of_working5", "");
				}

				if (skillsSelfAssesmentVariables.getWaysOfWorking6() != null
						&& !skillsSelfAssesmentVariables.getWaysOfWorking6().isEmpty()) {
					mappings.put("sec1_ways_of_working6", skillsSelfAssesmentVariables.getWaysOfWorking6().trim());
				} else {
					mappings.put("sec1_ways_of_working6", "");
				}

				if (skillsSelfAssesmentVariables.getWaysOfWorking7() != null
						&& !skillsSelfAssesmentVariables.getWaysOfWorking7().isEmpty()) {
					mappings.put("sec1_ways_of_working7", skillsSelfAssesmentVariables.getWaysOfWorking7().trim());
				} else {
					mappings.put("sec1_ways_of_working7", "");
				}

				// Self Management and Leadership

				if (skillsSelfAssesmentVariables.getSelfManagementandLeadership1() != null
						&& !skillsSelfAssesmentVariables.getSelfManagementandLeadership1().isEmpty()) {
					mappings.put("sec1_selfmgmt_and_leadership1",
							skillsSelfAssesmentVariables.getSelfManagementandLeadership1().trim());
				} else {
					mappings.put("sec1_selfmgmt_and_leadership1", "");
				}

				if (skillsSelfAssesmentVariables.getSelfManagementandLeadership2() != null
						&& !skillsSelfAssesmentVariables.getSelfManagementandLeadership2().isEmpty()) {
					mappings.put("sec1_selfmgmt_and_leadership2",
							skillsSelfAssesmentVariables.getSelfManagementandLeadership2().trim());
				} else {
					mappings.put("sec1_selfmgmt_and_leadership2", "");
				}

				if (skillsSelfAssesmentVariables.getSelfManagementandLeadership3() != null
						&& !skillsSelfAssesmentVariables.getSelfManagementandLeadership3().isEmpty()) {
					mappings.put("sec1_selfmgmt_and_leadership3",
							skillsSelfAssesmentVariables.getSelfManagementandLeadership3().trim());
				} else {
					mappings.put("sec1_selfmgmt_and_leadership3", "");
				}

				if (skillsSelfAssesmentVariables.getSelfManagementandLeadership4() != null
						&& !skillsSelfAssesmentVariables.getSelfManagementandLeadership4().isEmpty()) {
					mappings.put("sec1_selfmgmt_and_leadership4",
							skillsSelfAssesmentVariables.getSelfManagementandLeadership4().trim());
				} else {
					mappings.put("sec1_selfmgmt_and_leadership4", "");
				}

				if (skillsSelfAssesmentVariables.getSelfManagementandLeadership5() != null
						&& !skillsSelfAssesmentVariables.getSelfManagementandLeadership5().isEmpty()) {
					mappings.put("sec1_selfmgmt_and_leadership5",
							skillsSelfAssesmentVariables.getSelfManagementandLeadership5().trim());
				} else {
					mappings.put("sec1_selfmgmt_and_leadership5", "");
				}

				if (skillsSelfAssesmentVariables.getSelfManagementandLeadership5() != null
						&& !skillsSelfAssesmentVariables.getSelfManagementandLeadership6().isEmpty()) {
					mappings.put("sec1_selfmgmt_and_leadership6",
							skillsSelfAssesmentVariables.getSelfManagementandLeadership6().trim());
				} else {
					mappings.put("sec1_selfmgmt_and_leadership6", "");
				}

				if (skillsSelfAssesmentVariables.getSelfManagementandLeadership5() != null
						&& !skillsSelfAssesmentVariables.getSelfManagementandLeadership7().isEmpty()) {
					mappings.put("sec1_selfmgmt_and_leadership7",
							skillsSelfAssesmentVariables.getSelfManagementandLeadership7().trim());
				} else {
					mappings.put("sec1_selfmgmt_and_leadership7", "");
				}

				if (skillsSelfAssesmentVariables.getSection1G4() != null
						&& !skillsSelfAssesmentVariables.getSection1G4().isEmpty()) {
					String sec1_summary_strengths = skillsSelfAssesmentVariables.getSection1G4().trim();
					sec1_summary_strengths = replaceStringwithSpecialCharacters(sec1_summary_strengths);
					mappings.put("sec1_summary_strengths", sec1_summary_strengths);
				} else {
					mappings.put("sec1_summary_strengths", "");
				}

				if (skillsSelfAssesmentVariables.getSection1G5() != null
						&& !skillsSelfAssesmentVariables.getSection1G5().isEmpty()) {
					String sec1_summary_of_areas_of_improvement = skillsSelfAssesmentVariables.getSection1G5().trim();
					sec1_summary_of_areas_of_improvement = replaceStringwithSpecialCharacters(
							sec1_summary_of_areas_of_improvement);
					mappings.put("sec1_summary_of_areas_of_improvement", sec1_summary_of_areas_of_improvement);
				} else {
					mappings.put("sec1_summary_of_areas_of_improvement", "");
				}

			}

			// *** END OF SECTION 1 - TEAM MEMBER'S SELF ASSESSMENT***

			// SECTION II - TO BE COMPLETED BY MANAGER

			// Object Achievement Details

			List<ExemptSection2> exemptSection2List = (List<ExemptSection2>) map.get("objectAchievementDetails");
			Iterator<ExemptSection2> exemptSection2ListItr = exemptSection2List.iterator();

			while (exemptSection2ListItr.hasNext()) {

				ExemptSection2 exemptSection2 = exemptSection2ListItr.next();

				if (exemptSection2.getSection2A1Objective() != null
						&& !exemptSection2.getSection2A1Objective().isEmpty()) {
					String sec2_objective1 = exemptSection2.getSection2A1Objective().trim();
					sec2_objective1 = replaceStringwithSpecialCharacters(sec2_objective1);
					mappings.put("sec2_objective1", sec2_objective1);
				} else {
					mappings.put("sec2_objective1", "");
				}

				if (exemptSection2.getSection2A2Objective() != null
						&& !exemptSection2.getSection2A2Objective().isEmpty()) {
					String sec2_objective2 = exemptSection2.getSection2A2Objective().trim();
					sec2_objective2 = replaceStringwithSpecialCharacters(sec2_objective2);
					mappings.put("sec2_objective2", sec2_objective2);
				} else {
					mappings.put("sec2_objective2", "");
				}

				if (exemptSection2.getSection2A3Objective() != null
						&& !exemptSection2.getSection2A3Objective().isEmpty()) {
					String sec2_objective3 = exemptSection2.getSection2A3Objective().trim();
					sec2_objective3 = replaceStringwithSpecialCharacters(sec2_objective3);
					mappings.put("sec2_objective3", sec2_objective3);
				} else {
					mappings.put("sec2_objective3", "");
				}

				if (exemptSection2.getSection2A4Objective() != null
						&& !exemptSection2.getSection2A4Objective().isEmpty()) {
					String sec2_objective4 = exemptSection2.getSection2A4Objective().trim();
					sec2_objective4 = replaceStringwithSpecialCharacters(sec2_objective4);
					mappings.put("sec2_objective4", sec2_objective4);
				} else {
					mappings.put("sec2_objective4", "");
				}

				if (exemptSection2.getSection2A5Objective() != null
						&& !exemptSection2.getSection2A5Objective().isEmpty()) {
					String sec2_objective5 = exemptSection2.getSection2A5Objective().trim();
					sec2_objective5 = replaceStringwithSpecialCharacters(sec2_objective5);
					mappings.put("sec2_objective5", sec2_objective5);
				} else {
					mappings.put("sec2_objective5", "");
				}

				mappings.put("sec2_level1", String.valueOf(exemptSection2.getSection2A1Level()));
				mappings.put("sec2_level2", String.valueOf(exemptSection2.getSection2A2Level()));
				mappings.put("sec2_level3", String.valueOf(exemptSection2.getSection2A3Level()));
				mappings.put("sec2_level4", String.valueOf(exemptSection2.getSection2A4Level()));
				mappings.put("sec2_level5", String.valueOf(exemptSection2.getSection2A5Level()));
			
				mappings.put("sec2_level_total",
						String.valueOf((exemptSection2.getSection2A1Level() + exemptSection2.getSection2A2Level()
								+ exemptSection2.getSection2A3Level() + exemptSection2.getSection2A4Level()
								+ exemptSection2.getSection2A5Level())));

				if (exemptSection2.getSection2AdditionalComments() != null
						&& !exemptSection2.getSection2AdditionalComments().isEmpty()) {
					String sec2_additional_comments = exemptSection2.getSection2AdditionalComments().trim();
					sec2_additional_comments = replaceStringwithSpecialCharacters(sec2_additional_comments);
					mappings.put("sec2_additional_comments", sec2_additional_comments);
				} else {
					mappings.put("sec2_additional_comments", "");
				}

			}

			// Manager Skill Assessment Details

			ExemptSection2 managerSkillsAssessmentDetails = (ExemptSection2) map.get("managerSkillsAssessmentDetails");

			if (managerSkillsAssessmentDetails.getSkills1() != null
					&& !managerSkillsAssessmentDetails.getSkills1().isEmpty()) {
				mappings.put("sec2_skill1", managerSkillsAssessmentDetails.getSkills1().trim());
			} else {
				mappings.put("sec2_skill1", "");
			}
			if (managerSkillsAssessmentDetails.getSkills2() != null
					&& !managerSkillsAssessmentDetails.getSkills2().isEmpty()) {
				mappings.put("sec2_skill2", managerSkillsAssessmentDetails.getSkills2().trim());
			} else {
				mappings.put("sec2_skill2", "");
			}
			if (managerSkillsAssessmentDetails.getSkills3() != null
					&& !managerSkillsAssessmentDetails.getSkills3().isEmpty()) {
				mappings.put("sec2_skill3", managerSkillsAssessmentDetails.getSkills3().trim());
			} else {
				mappings.put("sec2_skill3", "");
			}
			if (managerSkillsAssessmentDetails.getSkills4() != null
					&& !managerSkillsAssessmentDetails.getSkills4().isEmpty()) {
				mappings.put("sec2_skill4", managerSkillsAssessmentDetails.getSkills4().trim());
			} else {
				mappings.put("sec2_skill4", "");
			}
			if (managerSkillsAssessmentDetails.getSkills5() != null
					&& !managerSkillsAssessmentDetails.getSkills5().isEmpty()) {
				mappings.put("sec2_skill5", managerSkillsAssessmentDetails.getSkills5().trim());
			} else {
				mappings.put("sec2_skill5", "");
			}

			if (managerSkillsAssessmentDetails.getSkills6() != null
					&& !managerSkillsAssessmentDetails.getSkills6().isEmpty()) {
				mappings.put("sec2_skill6", managerSkillsAssessmentDetails.getSkills6().trim());
			} else {
				mappings.put("sec2_skill6", "");
			}
			if (managerSkillsAssessmentDetails.getSkills7() != null
					&& !managerSkillsAssessmentDetails.getSkills7().isEmpty()) {
				mappings.put("sec2_skill7", managerSkillsAssessmentDetails.getSkills7().trim());
			} else {
				mappings.put("sec2_skill7", "");
			}
			if (managerSkillsAssessmentDetails.getSkills8() != null
					&& !managerSkillsAssessmentDetails.getSkills8().isEmpty()) {
				mappings.put("sec2_skill8", managerSkillsAssessmentDetails.getSkills8().trim());
			} else {
				mappings.put("sec2_skill8", "");
			}
			if (managerSkillsAssessmentDetails.getSkills9() != null
					&& !managerSkillsAssessmentDetails.getSkills9().isEmpty()) {
				mappings.put("sec2_skill9", managerSkillsAssessmentDetails.getSkills9().trim());
			} else {
				mappings.put("sec2_skill9", "");
			}
			if (managerSkillsAssessmentDetails.getSkills10() != null
					&& !managerSkillsAssessmentDetails.getSkills10().isEmpty()) {
				mappings.put("sec2_skill10", managerSkillsAssessmentDetails.getSkills10().trim());
			} else {
				mappings.put("sec2_skill10", "");
			}

			// Ways Of Working

			if (managerSkillsAssessmentDetails.getWaysOfWorking1() != null
					&& !managerSkillsAssessmentDetails.getWaysOfWorking1().isEmpty()) {
				mappings.put("sec2_ways_of_working1", managerSkillsAssessmentDetails.getWaysOfWorking1().trim());
			} else {
				mappings.put("sec2_ways_of_working1", "");
			}
			if (managerSkillsAssessmentDetails.getWaysOfWorking2() != null
					&& !managerSkillsAssessmentDetails.getWaysOfWorking2().isEmpty()) {
				mappings.put("sec2_ways_of_working2", managerSkillsAssessmentDetails.getWaysOfWorking2().trim());
			} else {
				mappings.put("sec2_ways_of_working2", "");
			}
			if (managerSkillsAssessmentDetails.getWaysOfWorking3() != null
					&& !managerSkillsAssessmentDetails.getWaysOfWorking3().isEmpty()) {
				mappings.put("sec2_ways_of_working3", managerSkillsAssessmentDetails.getWaysOfWorking3().trim());
			} else {
				mappings.put("sec2_ways_of_working3", "");
			}
			if (managerSkillsAssessmentDetails.getWaysOfWorking4() != null
					&& !managerSkillsAssessmentDetails.getWaysOfWorking4().isEmpty()) {
				mappings.put("sec2_ways_of_working4", managerSkillsAssessmentDetails.getWaysOfWorking4().trim());
			} else {
				mappings.put("sec2_ways_of_working4", "");
			}
			if (managerSkillsAssessmentDetails.getWaysOfWorking5() != null
					&& !managerSkillsAssessmentDetails.getWaysOfWorking5().isEmpty()) {
				mappings.put("sec2_ways_of_working5", managerSkillsAssessmentDetails.getWaysOfWorking5().trim());
			} else {
				mappings.put("sec2_ways_of_working5", "");
			}
			if (managerSkillsAssessmentDetails.getWaysOfWorking6() != null
					&& !managerSkillsAssessmentDetails.getWaysOfWorking6().isEmpty()) {
				mappings.put("sec2_ways_of_working6", managerSkillsAssessmentDetails.getWaysOfWorking6().trim());
			} else {
				mappings.put("sec2_ways_of_working6", "");
			}
			if (managerSkillsAssessmentDetails.getWaysOfWorking7() != null
					&& !managerSkillsAssessmentDetails.getWaysOfWorking7().isEmpty()) {
				mappings.put("sec2_ways_of_working7", managerSkillsAssessmentDetails.getWaysOfWorking7().trim());
			} else {
				mappings.put("sec2_ways_of_working7", "");
			}

			// SELF-MANAGEMENT AND LEADERSHIP

			if (managerSkillsAssessmentDetails.getSelfManagementandLeadership1() != null
					&& !managerSkillsAssessmentDetails.getSelfManagementandLeadership1().isEmpty()) {
				mappings.put("sec2_selfmgmt_and_leadership1",
						managerSkillsAssessmentDetails.getSelfManagementandLeadership1().trim());
			} else {
				mappings.put("sec2_selfmgmt_and_leadership1", "");
			}
			if (managerSkillsAssessmentDetails.getSelfManagementandLeadership2() != null
					&& !managerSkillsAssessmentDetails.getSelfManagementandLeadership2().isEmpty()) {
				mappings.put("sec2_selfmgmt_and_leadership2",
						managerSkillsAssessmentDetails.getSelfManagementandLeadership2().trim());
			} else {
				mappings.put("sec2_selfmgmt_and_leadership2", "");
			}
			if (managerSkillsAssessmentDetails.getSelfManagementandLeadership3() != null
					&& !managerSkillsAssessmentDetails.getSelfManagementandLeadership3().isEmpty()) {
				mappings.put("sec2_selfmgmt_and_leadership3",
						managerSkillsAssessmentDetails.getSelfManagementandLeadership3().trim());
			} else {
				mappings.put("sec2_selfmgmt_and_leadership3", "");
			}
			if (managerSkillsAssessmentDetails.getSelfManagementandLeadership4() != null
					&& !managerSkillsAssessmentDetails.getSelfManagementandLeadership4().isEmpty()) {
				mappings.put("sec2_selfmgmt_and_leadership4",
						managerSkillsAssessmentDetails.getSelfManagementandLeadership4().trim());
			} else {
				mappings.put("sec2_selfmgmt_and_leadership4", "");
			}
			if (managerSkillsAssessmentDetails.getSelfManagementandLeadership5() != null
					&& !managerSkillsAssessmentDetails.getSelfManagementandLeadership5().isEmpty()) {
				mappings.put("sec2_selfmgmt_and_leadership5",
						managerSkillsAssessmentDetails.getSelfManagementandLeadership5().trim());
			} else {
				mappings.put("sec2_selfmgmt_and_leadership5", "");
			}
			if (managerSkillsAssessmentDetails.getSelfManagementandLeadership6() != null
					&& !managerSkillsAssessmentDetails.getSelfManagementandLeadership6().isEmpty()) {
				mappings.put("sec2_selfmgmt_and_leadership6",
						managerSkillsAssessmentDetails.getSelfManagementandLeadership6().trim());
			} else {
				mappings.put("sec2_selfmgmt_and_leadership6", "");
			}
			if (managerSkillsAssessmentDetails.getSelfManagementandLeadership7() != null
					&& !managerSkillsAssessmentDetails.getSelfManagementandLeadership7().isEmpty()) {
				mappings.put("sec2_selfmgmt_and_leadership7",
						managerSkillsAssessmentDetails.getSelfManagementandLeadership7().trim());
			} else {
				mappings.put("sec2_selfmgmt_and_leadership7", "");
			}

			// Summary

			if (managerSkillsAssessmentDetails.getSection2CSummeryStrength() != null
					&& !managerSkillsAssessmentDetails.getSection2CSummeryStrength().isEmpty()) {
				String sec2_summary_strengths = managerSkillsAssessmentDetails.getSection2CSummeryStrength().trim();
				sec2_summary_strengths = replaceStringwithSpecialCharacters(sec2_summary_strengths);
				mappings.put("sec2_summary_strengths", sec2_summary_strengths);
			} else {
				mappings.put("sec2_summary_strengths", "");
			}

			if (managerSkillsAssessmentDetails.getSection2CSummeryImprovement() != null
					&& !managerSkillsAssessmentDetails.getSection2CSummeryImprovement().isEmpty()) {
				String sec2_summary_of_areas_of_improvement = managerSkillsAssessmentDetails
						.getSection2CSummeryImprovement().trim();
				sec2_summary_of_areas_of_improvement = replaceStringwithSpecialCharacters(
						sec2_summary_of_areas_of_improvement);
				mappings.put("sec2_summary_of_areas_of_improvement", sec2_summary_of_areas_of_improvement);
			} else {
				mappings.put("sec2_summary_of_areas_of_improvement", "");
			}

			if (managerSkillsAssessmentDetails.getSection2DSummeryOfAccomplishmentAndAreasImprovement() != null
					&& !managerSkillsAssessmentDetails.getSection2DSummeryOfAccomplishmentAndAreasImprovement()
							.isEmpty()) {
				String sec2_d = managerSkillsAssessmentDetails.getSection2DSummeryOfAccomplishmentAndAreasImprovement()
						.trim();
				sec2_d = replaceStringwithSpecialCharacters(sec2_d);
				mappings.put("sec2_d", sec2_d);
			} else {
				mappings.put("sec2_d", "");
			}

			if (managerSkillsAssessmentDetails.getSection2EAssessmentSummary() != null
					&& !managerSkillsAssessmentDetails.getSection2EAssessmentSummary().isEmpty()) {
				String sec2_e1 = managerSkillsAssessmentDetails.getSection2EAssessmentSummary().trim();
				sec2_e1 = replaceStringwithSpecialCharacters(sec2_e1);
				mappings.put("sec2_e1", sec2_e1);
			} else {
				mappings.put("sec2_e1", "");
			}

			if (managerSkillsAssessmentDetails.getSection2EAssessmentcompared() != null
					&& !managerSkillsAssessmentDetails.getSection2EAssessmentcompared().isEmpty()) {
				String sec2_e2 = managerSkillsAssessmentDetails.getSection2EAssessmentcompared().trim();
				sec2_e2 = replaceStringwithSpecialCharacters(sec2_e2);
				mappings.put("sec2_e2", sec2_e2);
			} else {
				mappings.put("sec2_e2", "");
			}

			// SECTION III - TO BE COMPLETED BY MANAGER AND TEAM MEMBER

			// OBJECTIVES

			PresentYearObjectives presentYearObjectives = (PresentYearObjectives) map.get("presentYearObjectives");

			if (presentYearObjectives.getObjectivesOne() != null
					&& !presentYearObjectives.getObjectivesOne().isEmpty()) {
				String sec3_objective1 = presentYearObjectives.getObjectivesOne().trim();
				sec3_objective1 = replaceStringwithSpecialCharacters(sec3_objective1);
				mappings.put("sec3_objective1", sec3_objective1);
			} else {
				mappings.put("sec3_objective1", "");
			}
			if (presentYearObjectives.getObjectivesTwo() != null
					&& !presentYearObjectives.getObjectivesTwo().isEmpty()) {
				String sec3_objective2 = presentYearObjectives.getObjectivesTwo().trim();
				sec3_objective2 = replaceStringwithSpecialCharacters(sec3_objective2);
				mappings.put("sec3_objective2", sec3_objective2);
			} else {
				mappings.put("sec3_objective2", "");
			}
			if (presentYearObjectives.getObjectivesThree() != null
					&& !presentYearObjectives.getObjectivesThree().isEmpty()) {
				String sec3_objective3 = presentYearObjectives.getObjectivesThree().trim();
				sec3_objective3 = replaceStringwithSpecialCharacters(sec3_objective3);
				mappings.put("sec3_objective3", sec3_objective3);
			} else {
				mappings.put("sec3_objective3", "");
			}
			if (presentYearObjectives.getObjectivesFour() != null
					&& !presentYearObjectives.getObjectivesFour().isEmpty()) {
				String sec3_objective4 = presentYearObjectives.getObjectivesFour().trim();
				sec3_objective4 = replaceStringwithSpecialCharacters(sec3_objective4);
				mappings.put("sec3_objective4", sec3_objective4);
			} else {
				mappings.put("sec3_objective4", "");
			}
			if (presentYearObjectives.getObjectivesFive() != null
					&& !presentYearObjectives.getObjectivesFive().isEmpty()) {
				String sec3_objective5 = presentYearObjectives.getObjectivesFive().trim();
				sec3_objective5 = replaceStringwithSpecialCharacters(sec3_objective5);
				mappings.put("sec3_objective5", sec3_objective5);
			} else {
				mappings.put("sec3_objective5", "");
			}

			if (presentYearObjectives.getObjectivesOneWeight() != null
					&& !presentYearObjectives.getObjectivesOneWeight().isEmpty()) {
				mappings.put("sec3_weight1", presentYearObjectives.getObjectivesOneWeight().trim());
			} else {
				mappings.put("sec3_weight1", "");
			}
			if (presentYearObjectives.getObjectivesTwoWeight() != null
					&& !presentYearObjectives.getObjectivesTwoWeight().isEmpty()) {
				mappings.put("sec3_weight2", presentYearObjectives.getObjectivesTwoWeight().trim());
			} else {
				mappings.put("sec3_weight2", "");
			}
			if (presentYearObjectives.getObjectivesThreeWeight() != null
					&& !presentYearObjectives.getObjectivesThreeWeight().isEmpty()) {
				mappings.put("sec3_weight3", presentYearObjectives.getObjectivesThreeWeight().trim());
			} else {
				mappings.put("sec3_weight3", "");
			}
			if (presentYearObjectives.getObjectivesFourWeight() != null
					&& !presentYearObjectives.getObjectivesFourWeight().isEmpty()) {
				mappings.put("sec3_weight4", presentYearObjectives.getObjectivesFourWeight().trim());
			} else {
				mappings.put("sec3_weight4", "");
			}
			if (presentYearObjectives.getObjectivesFiveWeight() != null
					&& !presentYearObjectives.getObjectivesFiveWeight().isEmpty()) {
				mappings.put("sec3_weight5", presentYearObjectives.getObjectivesFiveWeight().trim());
			} else {
				mappings.put("sec3_weight5", "");
			}

			if (String.valueOf(presentYearObjectives.getObjectivesTwoWeight()).equalsIgnoreCase("null")) {

				presentYearObjectives.setObjectivesTwoWeight("0");

			}
			if (String.valueOf(presentYearObjectives.getObjectivesThreeWeight()).equalsIgnoreCase("null")) {

				presentYearObjectives.setObjectivesThreeWeight("0");

			}
			if (String.valueOf(presentYearObjectives.getObjectivesFourWeight()).equalsIgnoreCase("null")) {

				presentYearObjectives.setObjectivesFourWeight("0");

			}
			if (String.valueOf(presentYearObjectives.getObjectivesFiveWeight()).equalsIgnoreCase("null")) {

				presentYearObjectives.setObjectivesFiveWeight("0");

			}

			int weightTotal = (Integer.parseInt(presentYearObjectives.getObjectivesOneWeight().trim())
					+ Integer.parseInt(presentYearObjectives.getObjectivesTwoWeight().trim())
					+ Integer.parseInt(presentYearObjectives.getObjectivesThreeWeight().trim())
					+ Integer.parseInt(presentYearObjectives.getObjectivesFourWeight().trim())
					+ Integer.parseInt(presentYearObjectives.getObjectivesFiveWeight().trim()));

			mappings.put("sec3_weight_total", String.valueOf(weightTotal));

			// Goals

			if (presentYearObjectives.getDevelopmentGoalsOne() != null
					&& !presentYearObjectives.getDevelopmentGoalsOne().isEmpty()) {
				String sec3_goal1 = presentYearObjectives.getDevelopmentGoalsOne().trim();
				sec3_goal1 = replaceStringwithSpecialCharacters(sec3_goal1);
				mappings.put("sec3_goal1", sec3_goal1);
			} else {
				mappings.put("sec3_goal1", "");
			}
			if (presentYearObjectives.getDevelopmentGoalsTwo() != null
					&& !presentYearObjectives.getDevelopmentGoalsTwo().isEmpty()) {
				String sec3_goal2 = presentYearObjectives.getDevelopmentGoalsTwo().trim();
				sec3_goal2 = replaceStringwithSpecialCharacters(sec3_goal2);
				mappings.put("sec3_goal2", sec3_goal2);
			} else {
				mappings.put("sec3_goal2", "");
			}
			if (presentYearObjectives.getDevelopmentGoalsThree() != null
					&& !presentYearObjectives.getDevelopmentGoalsThree().isEmpty()) {
				String sec3_goal3 = presentYearObjectives.getDevelopmentGoalsThree().trim();
				sec3_goal3 = replaceStringwithSpecialCharacters(sec3_goal3);
				mappings.put("sec3_goal3", sec3_goal3);
			} else {
				mappings.put("sec3_goal3", "");
			}
			if (presentYearObjectives.getDevelopmentGoalsFour() != null
					&& !presentYearObjectives.getDevelopmentGoalsFour().isEmpty()) {
				String sec3_goal4 = presentYearObjectives.getDevelopmentGoalsFour().trim();
				sec3_goal4 = replaceStringwithSpecialCharacters(sec3_goal4);
				mappings.put("sec3_goal4", sec3_goal4);
			} else {
				mappings.put("sec3_goal4", "");
			}
			if (presentYearObjectives.getDevelopmentGoalsFive() != null
					&& !presentYearObjectives.getDevelopmentGoalsFive().isEmpty()) {
				String sec3_goal5 = presentYearObjectives.getDevelopmentGoalsFive().trim();
				sec3_goal5 = replaceStringwithSpecialCharacters(sec3_goal5);
				mappings.put("sec3_goal5", sec3_goal5);
			} else {
				mappings.put("sec3_goal5", "");
			}

			// End Of Section-3

			MainDocumentPart documentPart = wordMLPackage.getMainDocumentPart();

			// unmarshallFromTemplate requires string input
			String xml = XmlUtils.marshaltoString(documentPart.getJaxbElement(), true);

			// Do it...
			Object obj = XmlUtils.unmarshallFromTemplate(xml, mappings);

			// Inject result into docx
			documentPart.setJaxbElement((Document) obj);

			PdfSettings pdfSettings = new PdfSettings();
			OutputStream outputStream = new FileOutputStream(new File(pdfFilePath));
			PdfConversion converter = new org.docx4j.convert.out.pdf.viaXSLFO.Conversion(wordMLPackage);
			converter.output(outputStream, pdfSettings);

			outputStream.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public static String replaceStringwithSpecialCharacters(String reaplaceString) {

		if (reaplaceString.contains("&")) {
			System.out.println("&&&&&&&&&&&&&&&&&&&");
			reaplaceString = reaplaceString.replace("&", "&#38;");
		}

		if (reaplaceString.contains("<")) {
			System.out.println("<<<<<<<<<<<<<<<<<<<");
			reaplaceString = reaplaceString.replace("<", "&lt;");
		}

		if (reaplaceString.contains(">")) {
			System.out.println(">>>>>>>>>>>>>>>>>>>>>");
			reaplaceString = reaplaceString.replace(">", "&gt;");
		}

		if (reaplaceString.contains("'")) {
			System.out.println("''''''''''''''''''''");
			reaplaceString = reaplaceString.replace("'", "&#39;");
		}

		if (reaplaceString.contains("\"")) {
			System.out.println("Double Quotesssssssssssssssssss");
			reaplaceString = reaplaceString.replace("\"", "&#34;");
		}

		System.out.println(reaplaceString.trim());
		return reaplaceString.trim();

	}

}
