package com.lisi.annaulAssessment.service;

import java.util.List;

import com.lisi.annaualAssessment.orm.AcknowledgmentSection;
import com.lisi.annaualAssessment.orm.CensusForm;

import com.lisi.annaualAssessment.orm.InterpersonalSkills;
import com.lisi.annaualAssessment.orm.JobKnowledgeAndSkill;

import com.lisi.annaualAssessment.orm.TrainingAndDevelopment;
import com.lisi.annaulAssessment.pojo.AcknowledgementBean;

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

}
