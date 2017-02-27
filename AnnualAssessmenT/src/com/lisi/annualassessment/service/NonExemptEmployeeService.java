package com.lisi.annualassessment.service;

import java.util.List;

import com.lisi.annualassessment.orm.AcknowledgmentSection;
import com.lisi.annualassessment.orm.AppraisalMailConfig;
import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.orm.InterpersonalSkills;
import com.lisi.annualassessment.orm.JobKnowledgeAndSkill;
import com.lisi.annualassessment.orm.TrainingAndDevelopment;
import com.lisi.annualassessment.pojo.AcknowledgementBean;

public interface NonExemptEmployeeService {

	public List<CensusForm> getEmployeeList(String loginEmpClock);

	List<CensusForm> getNonExemptEmployeeList(String clockNumber,String annalYear);

	public void addInterpersonalSkillsData(InterpersonalSkills ips, String year);

	public List<InterpersonalSkills> getInterpersonalData(String clockId,String year);

	public void addJobKnowledgeAndSkillsData(JobKnowledgeAndSkill jobKnowledgeAndSkill, String year);

	public List<JobKnowledgeAndSkill> getjobknowledgeData(String originalValue,String year);

	/*
	 * void addNonExemptSummaryData(SummaryOfPerformanceReview
	 * nonExemptSummaryOrm);
	 * 
	 * public List<SummaryOfPerformanceReview>
	 * getSummaryOfPerformanceReviewData(String originalValue);
	 */

	void addNonExemptTrainingorDevelopmenData(TrainingAndDevelopment trainingAndDevelopement, String year);

	public void addNonExemptAcknowledgmentSectionData(AcknowledgmentSection acknowledgmentSection);

	public List<AcknowledgmentSection> getAcknowledgementData(String empClockNumber,String year);

	/*void addNonExemptTrainingorDevelopmenData(TrainingAndDevelopment trainingAndDevelopement);*/

	public List<TrainingAndDevelopment> getTrainingAndDevelopmentData(String empClockNumber,String year);

	// delete operations
	/*
	 * public void deleteEmp(int clockId);
	 * 
	 * public void deleteJobKnowledgeService(int clockId);
	 * 
	 * public void deleteNonExemptSummaryService(String empClockNumber);
	 */
	public void deleteAcknowledgmentSectionData(String empClockNumber);

	public String getYear(String ormClass,String clock,String year);

	public String getInterpersonalAvgScore(String nonexemptEmpClock,String employeeYear);

	public AppraisalMailConfig getEMpMailData(String status, String role);
	
	public CensusForm getSupervisorMailId(String supervisorClockNumber,String role,String annualYear);

	public AppraisalMailConfig getEMpMailData(String string);

	public void updateSalaryRoleActivated(String string, StringBuffer allClocks,String year);
	
	
	public InterpersonalSkills getInterpersonalObjectData(String clock,String year);

	public JobKnowledgeAndSkill getjobknowledgeObject(String nonexemptEmpClock, String employeeYear);

	public void insertSupervisorStatus(String nonexemptEmpClock, String employeeYear, String string);

	void updateSupervisorStatus(String nonexemptEmpClock, String employeeYear, String status);
	
}
