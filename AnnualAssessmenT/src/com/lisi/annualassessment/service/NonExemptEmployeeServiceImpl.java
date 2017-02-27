package com.lisi.annualassessment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lisi.annualassessment.orm.AcknowledgmentSection;
import com.lisi.annualassessment.orm.AppraisalMailConfig;
import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.orm.InterpersonalSkills;
import com.lisi.annualassessment.orm.JobKnowledgeAndSkill;
import com.lisi.annualassessment.orm.TrainingAndDevelopment;
import com.lisi.annualassessment.dao.NonExemptEmployeeDao;

@Service("nonExemptEmployeeService")
@Transactional
public class NonExemptEmployeeServiceImpl implements NonExemptEmployeeService {

	@Autowired
	private NonExemptEmployeeDao nonExemptEmployeeDao;

	@Override
	public List<CensusForm> getEmployeeList(String loginEmpClock) {

		List<CensusForm> employeeList = nonExemptEmployeeDao.getEmployeeInformation(loginEmpClock);
		return employeeList;
	}

	@Override
	public List<CensusForm> getNonExemptEmployeeList(String clockNumber,String annaulYear) {

		List<CensusForm> nonExemptEmployeeList = nonExemptEmployeeDao.getNonExemptEmployeeList( clockNumber,annaulYear);
		return nonExemptEmployeeList;
	}

	@Override
	public void addInterpersonalSkillsData(InterpersonalSkills ips,String year) {

		nonExemptEmployeeDao.addInterpersonalSkillsData(ips,year);
	}
	
	
	@Override
	public List<InterpersonalSkills> getInterpersonalData(String clockId,String year) {
		List<InterpersonalSkills> interpersonalList=nonExemptEmployeeDao.getInterpersonalList(clockId, year);
		return interpersonalList;
	}

	@Override
	public void addJobKnowledgeAndSkillsData(JobKnowledgeAndSkill jobKnowledgeAndSkill,String year) {

		nonExemptEmployeeDao.addJobKnowledgeAndSkillsData(jobKnowledgeAndSkill,year);

	}
	
	
	@Override
	public List<JobKnowledgeAndSkill> getjobknowledgeData(String clockId,String empYear) {
		List<JobKnowledgeAndSkill> jobknowledgeList=nonExemptEmployeeDao.getJobKnowledgeList(clockId,empYear);
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
	public List<AcknowledgmentSection> getAcknowledgementData(String empClockNumber,String year) {
		List<AcknowledgmentSection> getAcknowledgementData=nonExemptEmployeeDao.getAcknowledgementData(empClockNumber,year);
		return getAcknowledgementData;
	}
	/*@Override
	public void addNonExemptTrainingorDevelopmenData(TrainingAndDevelopment trainingAndDevelopement) {
		nonExemptEmployeeDao.addNonExemptTrainingorDevelopmenData(trainingAndDevelopement);
		
	}
	*/
	@Override
	public List<TrainingAndDevelopment> getTrainingAndDevelopmentData(String empClockNumber,String empYear) {
		List<TrainingAndDevelopment> getTrainingAndDevelopmentData=nonExemptEmployeeDao.getTrainingAndDevelopmentData(empClockNumber,empYear);
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
	public String getYear(String ormClass,String empClock,String empyear) {
		String year=nonExemptEmployeeDao.getYear(ormClass,empClock,empyear);
		return year;
	}

	@Override
	public String getInterpersonalAvgScore(String nonexemptEmpClock,String employeeYear) {
		String avgScore=nonExemptEmployeeDao.getInterpersonalAvgScore(nonexemptEmpClock,employeeYear);
		return avgScore;
	}

	@Override
	public AppraisalMailConfig getEMpMailData(String status, String role) {
		// TODO Auto-generated method stub
		return nonExemptEmployeeDao.getEmpEmailStauts(status,role);
	}

	@Override
	public CensusForm getSupervisorMailId(String supervisorClockNumber,String role,String annualYear) {
		
		return nonExemptEmployeeDao.getSupervisorMailId(supervisorClockNumber,role,annualYear);
	}

	@Override
	public AppraisalMailConfig getEMpMailData(String role) {
		// TODO Auto-generated method stub
		return nonExemptEmployeeDao.getEmpEmailStauts(role);
	}

	@Override
	public void updateSalaryRoleActivated(String status,StringBuffer allclocks,String year) {
		
		
		 nonExemptEmployeeDao.updateSalaryRole(status,allclocks,year);
		
	}


	@Override
	public InterpersonalSkills getInterpersonalObjectData(String clockId, String employeeYear) {
		
		
		
		
		return nonExemptEmployeeDao.getInterpersonalObjectData(clockId,employeeYear);
	}

	@Override
	public JobKnowledgeAndSkill getjobknowledgeObject(String nonexemptEmpClock, String employeeYear) {
		// TODO Auto-generated method stub
		
		return nonExemptEmployeeDao.getjobknowledgeObjectData(nonexemptEmpClock,employeeYear);
	}

	@Override
	public void updateSupervisorStatus(String nonexemptEmpClock, String employeeYear, String status) {
		
		
		nonExemptEmployeeDao.updateSupervisorStatus(nonexemptEmpClock,employeeYear,status);
		
	}

	@Override
	public void insertSupervisorStatus(String nonexemptEmpClock, String employeeYear, String status) {
		// TODO Auto-generated method stub
		
		nonExemptEmployeeDao.insertSupervisorStatus(nonexemptEmpClock, employeeYear, status);
	}
	

	
	
	

	

	

}
