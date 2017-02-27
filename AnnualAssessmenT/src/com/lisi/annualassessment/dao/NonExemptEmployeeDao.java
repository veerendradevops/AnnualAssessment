package com.lisi.annualassessment.dao;

import java.util.List;

import com.lisi.annualassessment.orm.AcknowledgmentSection;
import com.lisi.annualassessment.orm.AppraisalMailConfig;
import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.orm.InterpersonalSkills;
import com.lisi.annualassessment.orm.JobKnowledgeAndSkill;
import com.lisi.annualassessment.orm.TrainingAndDevelopment;

public interface NonExemptEmployeeDao {

	public List<CensusForm> getEmployeeInformation(String loginEmpClock);

	public List<CensusForm> getNonExemptEmployeeList(String clockNumber,String year);

	public void addJobKnowledgeAndSkillsData(JobKnowledgeAndSkill jobKnowledgeAndSkill,String year);
	
	public List<JobKnowledgeAndSkill> getJobKnowledgeList(String clockId,String year);

	public void addInterpersonalSkillsData(InterpersonalSkills interpersonalSkills,String year);
	
	public List<InterpersonalSkills> getInterpersonalList(String clockId,String year);

	/*void addNonExemptSummaryData(SummaryOfPerformanceReview nonExemptSummaryOrm);
	
	public List<SummaryOfPerformanceReview> getSummaryOfPerformanceReviewList(String clockId);*/

	public void addNonExemptAcknowledgmentSectionData(AcknowledgmentSection acknowledgmentSection);
	
	public List<AcknowledgmentSection> getAcknowledgementData(String empClockNumber,String year);
	
	/*public List<TrainingorDevelopmenData> addNonExemptTrainingorDevelopmenData(
			String empClockNumber);
*/
	public void addNonExemptTrainingorDevelopmenData(TrainingAndDevelopment trainingAndDevelopement,String year);
	
	public List<TrainingAndDevelopment> getTrainingAndDevelopmentData(
			String empClockNumber,String year);

	

	/*public void deleteEmp(int clockId);

	public void deleteJobknowledgeDao(int clockId);

	public void deleteNonExemptSummaryDao(String empClockNumber);*/

	//public void addNonExemptTrainingorDevelopmenData(TrainingAndDevelopment trainingAndDevelopement);

	public void deleteAcknowledgmentSectionData(String empClockNumber);

	public String getYear(String ormClass,String clock,String year);

	public String getInterpersonalAvgScore(String nonexemptEmpClock,String employeeYear);

	public AppraisalMailConfig getEmpEmailStauts(String status, String role);

	public  CensusForm getSupervisorMailId(String supervisorClockNumber,String role,String annualYear);

	public AppraisalMailConfig getEmpEmailStauts(String role);

	public void updateSalaryRole(String status, StringBuffer allClocks,String year);


	public InterpersonalSkills getInterpersonalObjectData(String clockId, String employeeYear);

	public JobKnowledgeAndSkill getjobknowledgeObjectData(String nonexemptEmpClock, String employeeYear);

	public void insertSupervisorStatus(String nonexemptEmpClock, String employeeYear, String status);

	void updateSupervisorStatus(String nonexemptEmpClock, String employeeYear, String status);

	
}
