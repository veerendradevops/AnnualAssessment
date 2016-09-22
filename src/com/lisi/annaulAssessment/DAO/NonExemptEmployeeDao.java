package com.lisi.annaulAssessment.DAO;

import java.util.List;

import com.lisi.annaualAssessment.orm.AcknowledgmentSection;
import com.lisi.annaualAssessment.orm.CensusForm;
import com.lisi.annaualAssessment.orm.InterpersonalSkills;
import com.lisi.annaualAssessment.orm.JobKnowledgeAndSkill;
import com.lisi.annaualAssessment.orm.TrainingAndDevelopment;

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

	

	

	

	



}
