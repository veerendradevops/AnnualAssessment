package com.lisi.annaulAssessment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lisi.annaualAssessment.orm.AcknowledgmentSection;
import com.lisi.annaualAssessment.orm.CensusForm;
import com.lisi.annaualAssessment.orm.InterpersonalSkills;
import com.lisi.annaualAssessment.orm.JobKnowledgeAndSkill;
import com.lisi.annaualAssessment.orm.TrainingAndDevelopment;
import com.lisi.annaulAssessment.DAO.NonExemptEmployeeDao;

@Service("nonExemptEmployeeService")
@Transactional
public class NonExemptEmployeeServiceImpl implements NonExemptEmployeeService {

	@Autowired
	private NonExemptEmployeeDao nonExemptEmployeeDao;

	@Override
	public List<CensusForm> getEmployeeList() {

		List<CensusForm> employeeList = nonExemptEmployeeDao.getEmployeeInformation();
		return employeeList;
	}

	@Override
	public List<CensusForm> getNonExemptEmployeeList(String clockNumber) {

		List<CensusForm> nonExemptEmployeeList = nonExemptEmployeeDao.getNonExemptEmployeeList( clockNumber);
		return nonExemptEmployeeList;
	}

	@Override
	public void addInterpersonalSkillsData(InterpersonalSkills ips,String year) {

		nonExemptEmployeeDao.addInterpersonalSkillsData(ips,year);
	}
	
	
	@Override
	public List<InterpersonalSkills> getInterpersonalData(String clockId) {
		List<InterpersonalSkills> interpersonalList=nonExemptEmployeeDao.getInterpersonalList(clockId);
		return interpersonalList;
	}

	@Override
	public void addJobKnowledgeAndSkillsData(JobKnowledgeAndSkill jobKnowledgeAndSkill,String year) {

		nonExemptEmployeeDao.addJobKnowledgeAndSkillsData(jobKnowledgeAndSkill,year);

	}
	
	
	@Override
	public List<JobKnowledgeAndSkill> getjobknowledgeData(String clockId) {
		List<JobKnowledgeAndSkill> jobknowledgeList=nonExemptEmployeeDao.getJobKnowledgeList(clockId);
		return jobknowledgeList;
	}

	/*public void addNonExemptSummaryData(SummaryOfPerformanceReview nonExemptSummaryOrm) {

		nonExemptEmployeeDao.addNonExemptSummaryData(nonExemptSummaryOrm);

	}
	*/

	/*@Override
	public List<SummaryOfPerformanceReview> getSummaryOfPerformanceReviewData(String clockId) {
		
	List<SummaryOfPerformanceReview> summaryOfPerformanceReviewList=nonExemptEmployeeDao.getSummaryOfPerformanceReviewList(clockId);

		return summaryOfPerformanceReviewList;
	}
*/
	@Override
	public void addNonExemptAcknowledgmentSectionData(AcknowledgmentSection acknowledgmentSection) {
		nonExemptEmployeeDao. addNonExemptAcknowledgmentSectionData(acknowledgmentSection);
		
	}

	
	@Override
	public List<AcknowledgmentSection> getAcknowledgementData(String empClockNumber) {
		List<AcknowledgmentSection> getAcknowledgementData=nonExemptEmployeeDao.getAcknowledgementData(empClockNumber);
		return getAcknowledgementData;
	}
	@Override
	public void addNonExemptTrainingorDevelopmenData(TrainingAndDevelopment trainingAndDevelopement) {
		nonExemptEmployeeDao.addNonExemptTrainingorDevelopmenData(trainingAndDevelopement);
		
	}
	
	@Override
	public List<TrainingAndDevelopment> getTrainingAndDevelopmentData(String empClockNumber) {
		List<TrainingAndDevelopment> getTrainingAndDevelopmentData=nonExemptEmployeeDao.getTrainingAndDevelopmentData(empClockNumber);
		return getTrainingAndDevelopmentData;
	}
		
		@Override
		public void addNonExemptTrainingorDevelopmenData(TrainingAndDevelopment trainingAndDevelopement,String year) {
			nonExemptEmployeeDao.addNonExemptTrainingorDevelopmenData(trainingAndDevelopement,year);
			
		}
		

	/*// delete operations
	@Override
	public void deleteEmp(int clockId) {
		nonExemptEmployeeDao.deleteEmp(clockId);

	}

	@Override
	public void deleteJobKnowledgeService(int clockId) {
		nonExemptEmployeeDao.deleteJobknowledgeDao(clockId);
	}



	

	@Override
	public void deleteNonExemptSummaryService(String empClockNumber) {
		nonExemptEmployeeDao.deleteNonExemptSummaryDao(empClockNumber);
		
	}*/

	@Override
	public void deleteAcknowledgmentSectionData(String empClockNumber) {
		nonExemptEmployeeDao.deleteAcknowledgmentSectionData(empClockNumber);
	}

	@Override
	public String getYear(String ormClass) {
		String year=nonExemptEmployeeDao.getYear(ormClass);
		return year;
	}

	
	

	
	
	

	

	

}
