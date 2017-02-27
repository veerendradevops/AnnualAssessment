
package com.lisi.annualassessment.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lisi.annualassessment.orm.AcknowledgmentSection;
import com.lisi.annualassessment.orm.AppraisalMailConfig;
import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.orm.InterpersonalSkills;
import com.lisi.annualassessment.orm.JobKnowledgeAndSkill;
import com.lisi.annualassessment.orm.TrainingAndDevelopment;
import com.lisi.annualassessment.controller.NonExemptEmployeesController;
import com.lisi.annualassessment.util.Converters;

@Repository("nonExemptEmployeeDao")
public class NonExemptEmployeeDaoImpl implements NonExemptEmployeeDao {
	private static final Logger log = Logger.getLogger(NonExemptEmployeesController.class);

	@Autowired
	private SessionFactory session;

	Query query;

	@SuppressWarnings("unchecked")
	@Override
	public List<CensusForm> getEmployeeInformation(String loginEmpClock) {

		System.out.println("getEmployeeInformation ::: Clock Number ::" + loginEmpClock);

		query = session.getCurrentSession()
				.createQuery("from CensusForm where exemptOrNonExempt=? and supervisorClockNumber=?");

		query.setParameter(0, "non-Exempt");

		query.setParameter(1, Integer.parseInt(loginEmpClock));
		List<CensusForm> emp = query.list();
		System.out.println("Employee List in Non Exempt ::: " + emp);
		return (List<CensusForm>) query.list();

	}

	@Override
	public List<CensusForm> getNonExemptEmployeeList(String clockNumber, String year) {

		String statement = "from CensusForm where empClockNumber=? and annaulYear=?";

		query = session.getCurrentSession().createQuery(statement);

		query.setInteger(0, Integer.parseInt(clockNumber.trim()));
		query.setString(1, year.trim());

		return (List<CensusForm>) query.list();

	}

	@Override
	public void addJobKnowledgeAndSkillsData(JobKnowledgeAndSkill jobKnowledgeAndSkill, String existingYear) {
		try {

			if (!String.valueOf(existingYear).equalsIgnoreCase("null")) {

				String statement = "update JobKnowledgeAndSkill set safetyScore=?,safetySupervisorsComments=?,qualityScore=?,"
						+ "qualitySupervisorsComments=?,productivityScore=?,productivitySupervisorsComments=?,"
						+ "jobKnowledgeAndSkillsScore=?,jobKnowledgeAndSkillsSupervisorsComments=?,"
						+ "supervisorsOverallComments=?,avgScore=?,summaryAvgScore=? where clockId=? and annualYear=?";
				Query query = session.getCurrentSession().createQuery(statement);

				query.setParameter(0, jobKnowledgeAndSkill.getSafetyScore());
				query.setParameter(1, jobKnowledgeAndSkill.getSafetySupervisorsComments());
				query.setParameter(2, jobKnowledgeAndSkill.getQualityScore());
				query.setParameter(3, jobKnowledgeAndSkill.getQualitySupervisorsComments());
				query.setParameter(4, jobKnowledgeAndSkill.getProductivityScore());
				query.setParameter(5, jobKnowledgeAndSkill.getProductivitySupervisorsComments());
				query.setParameter(6, jobKnowledgeAndSkill.getJobKnowledgeAndSkillsScore());
				query.setParameter(7, jobKnowledgeAndSkill.getJobKnowledgeAndSkillsSupervisorsComments());
				query.setParameter(8, jobKnowledgeAndSkill.getSupervisorsOverallComments());
				query.setParameter(9, jobKnowledgeAndSkill.getAvgScore());
				query.setParameter(10, jobKnowledgeAndSkill.getSummaryAvgScore());
				query.setParameter(11, jobKnowledgeAndSkill.getClockId());
				query.setParameter(12, jobKnowledgeAndSkill.getAnnualYear());
				query.executeUpdate();

			} else {
				log.info("this is save method");
				session.getCurrentSession().save(jobKnowledgeAndSkill);
			}
		}

		catch (Exception e) {

			e.printStackTrace();
		}
	}

	@Override
	public List<JobKnowledgeAndSkill> getJobKnowledgeList(String clockId, String empYear) {
		String hqlQuery = "from JobKnowledgeAndSkill where clockId=? and annualYear=?";

		query = session.getCurrentSession().createQuery(hqlQuery);

		query.setInteger(0, Integer.parseInt(clockId));

		query.setInteger(1, Integer.parseInt(empYear.trim()));

		return (List<JobKnowledgeAndSkill>) query.list();
	}

	@Override
	public void addInterpersonalSkillsData(InterpersonalSkills interpersonalSkills, String existingYear) {

		// InterpersonalSkillsBean ipsb=new InterpersonalSkillsBean();

		try {
			System.out.println("daooo");
			System.out.println(existingYear);

			if (!String.valueOf(existingYear).equalsIgnoreCase("null")) {

				log.info("this save or update method");

				String statement = "update InterpersonalSkills set responsibilityScore=?,responsibilitySupervisorsComments=?,"
						+ "adaptabilityScore=?,adaptabilitySupervisorsComments=?,initiativeScore=?,initiativeSupervisorsComments=?,"
						+ "judgementScore=?,judgementSupervisorsComments=?,writtenAndOralCommunicationScore=?,"
						+ "writtenAndOralCommunicationSupervisorsComments=?,punctualityAndCommitmentScore=?,"
						+ "punctualityAndCommitmentSupervisorsComments=?,avgScore=? where clockId=? and annualYear=?";

				Query query = session.getCurrentSession().createQuery(statement);

				query.setParameter(0, interpersonalSkills.getResponsibilityScore());
				query.setParameter(1, interpersonalSkills.getResponsibilitySupervisorsComments());
				query.setParameter(2, interpersonalSkills.getAdaptabilityScore());
				query.setParameter(3, interpersonalSkills.getAdaptabilitySupervisorsComments());
				query.setParameter(4, interpersonalSkills.getInitiativeScore());
				query.setParameter(5, interpersonalSkills.getInitiativeSupervisorsComments());
				query.setParameter(6, interpersonalSkills.getJudgementScore());
				query.setParameter(7, interpersonalSkills.getJudgementSupervisorsComments());
				query.setParameter(8, interpersonalSkills.getWrittenAndOralCommunicationScore());
				query.setParameter(9, interpersonalSkills.getWrittenAndOralCommunicationSupervisorsComments());
				query.setParameter(10, interpersonalSkills.getPunctualityAndCommitmentScore());
				query.setParameter(11, interpersonalSkills.getPunctualityAndCommitmentSupervisorsComments());
				query.setParameter(12, interpersonalSkills.getAvgScore());
				query.setParameter(13, interpersonalSkills.getClockId());
				query.setParameter(14, interpersonalSkills.getAnnualYear());
				query.executeUpdate();

			} else {
				session.getCurrentSession().save(interpersonalSkills);
			}
		} catch (Exception e) {
			log.info("exception occured at interpersonalSkills");
			e.printStackTrace();
		}
	}

	@Override
	public List<InterpersonalSkills> getInterpersonalList(String clockId, String year) {
		String hqlQuery = "from InterpersonalSkills where clockId=? and annualYear=?";

		query = session.getCurrentSession().createQuery(hqlQuery);

		query.setInteger(0, Integer.parseInt(clockId));
		query.setInteger(1, Integer.parseInt(year.trim()));

		return (List<InterpersonalSkills>) query.list();
	}

	@Override
	public void addNonExemptTrainingorDevelopmenData(TrainingAndDevelopment trainingAndDevelopement,
			String existingYear) {

		try {
			log.info("This addNonExemptTrainingorDevelopmenData method for saving and updating");

			log.info("the year is" + existingYear);

			if (!String.valueOf(existingYear).equalsIgnoreCase("null")) {

				String statement = "update TrainingAndDevelopment set firstAreaorFocus=?,firstTrainingDescription=?,"
						+ "firstTrainingTopic=?,firstDateDue=?,secondAreaorFocus=?,secondTrainingTopic=?,"
						+ "secondTrainingDescription=?,secondfDateDue=?,thirdAreaorFocus=?,thirdTrainingTopic=?,"
						+ "thirdTrainingDescription=?,thirdDateDue=? where clockId=? and annualYear=?";

				Query query = session.getCurrentSession().createQuery(statement);

				query.setParameter(0, trainingAndDevelopement.getFirstAreaorFocus());
				query.setParameter(1, trainingAndDevelopement.getfirstTrainingDescription());
				query.setParameter(2, trainingAndDevelopement.getfirstTrainingTopic());
				query.setParameter(3, trainingAndDevelopement.getFirstDateDue());
				query.setParameter(4, trainingAndDevelopement.getSecondAreaorFocus());
				query.setParameter(5, trainingAndDevelopement.getSecondTrainingTopic());
				query.setParameter(6, trainingAndDevelopement.getSecondTrainingDescription());
				query.setParameter(7, trainingAndDevelopement.getSecondfDateDue());
				query.setParameter(8, trainingAndDevelopement.getThirdAreaorFocus());
				query.setParameter(9, trainingAndDevelopement.getThirdTrainingTopic());
				query.setParameter(10, trainingAndDevelopement.getThirdTrainingDescription());
				query.setParameter(11, trainingAndDevelopement.getThirdDateDue());
				query.setParameter(12, trainingAndDevelopement.getClockId());
				query.setParameter(13, trainingAndDevelopement.getAnnualYear());
				query.executeUpdate();
				log.info("your data successfully updated..");

			} else {

				session.getCurrentSession().save(trainingAndDevelopement);

				log.info("your TrainingAndDevelopment data successfully saved");
			}
		}

		catch (Exception e) {

			e.printStackTrace();
		}

	}

	/*
	 * @Override public List<TrainingAndDevelopment>
	 * addNonExemptTrainingorDevelopmenData(String empClockNumber) { String
	 * hqlQuery =
	 * "from TrainingorDevelopmenData where clockId=? and annualPerformance=?";
	 * 
	 * query = session.getCurrentSession().createQuery(hqlQuery);
	 * 
	 * query.setInteger(0, Integer.parseInt(empClockNumber));
	 * 
	 * query.setInteger(1,
	 * Integer.parseInt(NonExemptEmployeesController.getAnnaulYear())); return
	 * (List<TrainingAndDevelopment>) query.list(); }
	 */
	@Override
	public List<TrainingAndDevelopment> getTrainingAndDevelopmentData(String empClockNumber, String year) {

		String hqlQuery = "from TrainingAndDevelopment where clockId=? and annualYear=?";

		query = session.getCurrentSession().createQuery(hqlQuery);

		query.setInteger(0, Integer.parseInt(empClockNumber));

		query.setInteger(1, Integer.parseInt(year.trim()));

		/*
		 * List<TrainingAndDevelopment> obj=query.list();
		 * 
		 * for(TrainingAndDevelopment training : obj){ log.info("for");
		 * log.info(training.getAnnualYear()); }
		 */

		return (List<TrainingAndDevelopment>) query.list();

	}

	@Override
	public void addNonExemptAcknowledgmentSectionData(AcknowledgmentSection acknowledgmentSection) {
		try {

			int year = 0;

			String hqlQuery = "from AcknowledgmentSection where clockId=? and annualYear=? ";

			query = session.getCurrentSession().createQuery(hqlQuery);

			query.setInteger(0, acknowledgmentSection.getClockId());

			query.setInteger(1, Integer.parseInt(Converters.getCurrentYear()));

			List<AcknowledgmentSection> checkYear = query.list();

			for (AcknowledgmentSection aks : checkYear) {

				year = Integer.parseInt(aks.getAnnualYear());
			}
			if (year == Integer.parseInt(Converters.getCurrentYear())) {

				session.getCurrentSession().saveOrUpdate(acknowledgmentSection);
			} else {
				session.getCurrentSession().save(acknowledgmentSection);
			}
		}

		catch (Exception e) {

			e.printStackTrace();
		}

	}

	@Override
	public List<AcknowledgmentSection> getAcknowledgementData(String empClockNumber, String year) {
		String hqlQuery = "from AcknowledgmentSection where clockId=? and annualPerformance=? and annualYear=?";

		query = session.getCurrentSession().createQuery(hqlQuery);

		query.setInteger(0, Integer.parseInt(empClockNumber));

		query.setString(1, year.trim());

		return (List<AcknowledgmentSection>) query.list();
	}

	@Override
	public void deleteAcknowledgmentSectionData(String empClockNumber) {

		session.getCurrentSession().createQuery("delete from AcknowledgmentSection aks where aks.clockId=?");
		query.setParameter(0, empClockNumber);
		query.executeUpdate();

	}

	@Override
	public String getYear(String ormClass, String clock, String empYear) {
		String year = "";

		String hqlQuery = "select annualYear from " + ormClass + " where clockId=? and annualYear=?";

		year = (String) session.getCurrentSession().createQuery(hqlQuery)
				.setParameter(0, Integer.parseInt(clock.trim())).setParameter(1, empYear.trim()).uniqueResult();

		return year;
	}

	@Override
	public String getInterpersonalAvgScore(String nonexemptEmpClock, String employeeYear) {
		String statement = "from InterpersonalSkills where Clockid=? and annualYear=?";
		query = session.getCurrentSession().createQuery(statement);

		query.setInteger(0, Integer.parseInt(nonexemptEmpClock));

		query.setInteger(1, Integer.parseInt(employeeYear.trim()));

		InterpersonalSkills interpersonalSkills = (InterpersonalSkills) query.uniqueResult();

		if (interpersonalSkills == null) {

			return "";
		}
		if (interpersonalSkills.getAvgScore() == null) {

			return "0";
		}

		return String.valueOf(interpersonalSkills.getAvgScore().trim());
	}

	@Override
	public AppraisalMailConfig getEmpEmailStauts(String status, String role) {

		String statement = "from AppraisalMailConfig where status=? and usertype=?";
		query = session.getCurrentSession().createQuery(statement);
		query.setParameter(0, status);
		query.setParameter(1, role);

		AppraisalMailConfig appraisal = (AppraisalMailConfig) query.uniqueResult();

		return appraisal;

	}

	@Override
	public AppraisalMailConfig getEmpEmailStauts(String status) {

		String statement = "from AppraisalMailConfig where status=?";
		query = session.getCurrentSession().createQuery(statement);
		query.setParameter(0, status);

		AppraisalMailConfig appraisal = (AppraisalMailConfig) query.uniqueResult();

		return appraisal;

	}

	@Override
	public CensusForm getSupervisorMailId(String supervisorClockNumber, String clock, String annualYear) {
		String supervisorMailId = null;
		// String statement = "select empEmailAddress from CensusForm where
		// supervisorClockNumber = ?";
		System.out.println("getSupervisroMail");
		System.out.println(supervisorClockNumber);

		String statement = "from CensusForm where empClockNumber in (select  " + clock + ""
				+ " from CensusForm where empClockNumber=? and annaulYear=?) and annaulYear=?";
		query = session.getCurrentSession().createQuery(statement);
		// query.setParameter(0, role);
		query.setParameter(0, Integer.parseInt(supervisorClockNumber));
		query.setParameter(1, annualYear.trim());
		query.setParameter(2, annualYear.trim());
		CensusForm census = (CensusForm) query.uniqueResult();
		/*
		 * for (CensusForm cform : list) { supervisorMailId =
		 * cform.getEmpEmailAddress();
		 * System.out.println("supervisorMailId::::::::"+supervisorMailId); }
		 */
		return census;
	}

	@Override
	public void updateSalaryRole(String status, StringBuffer allclocks, String year) {

		String statement = "update CensusForm set role=? where empClockNumber in(" + allclocks + ") and annaulYear=?";

		query = session.getCurrentSession().createQuery(statement);

		query.setParameter(0, "Activated");

		query.setParameter(1, year.trim());

		query.executeUpdate();

	}

	@Override
	public InterpersonalSkills getInterpersonalObjectData(String clockId, String employeeYear) {

		String sqlStatement = "from InterpersonalSkills where clockId=? and annualYear=?";

		query = session.getCurrentSession().createQuery(sqlStatement);

		query.setInteger(0, Integer.parseInt(clockId.trim()));
		query.setInteger(1, Integer.parseInt(employeeYear.trim()));

		InterpersonalSkills interpersonalSkills = (InterpersonalSkills) query.uniqueResult();

		return interpersonalSkills;
	}

	@Override
	public JobKnowledgeAndSkill getjobknowledgeObjectData(String nonexemptEmpClock, String employeeYear) {

		String hqlQuery = "from JobKnowledgeAndSkill where clockId=? and annualYear=?";

		query = session.getCurrentSession().createQuery(hqlQuery);

		query.setInteger(0, Integer.parseInt(nonexemptEmpClock.trim()));

		query.setInteger(1, Integer.parseInt(employeeYear.trim()));

		JobKnowledgeAndSkill jobKnowledgeSkill = (JobKnowledgeAndSkill) query.uniqueResult();

		return jobKnowledgeSkill;
	}

	@Override
	public void updateSupervisorStatus(String nonexemptEmpClock, String employeeYear, String status) {

		String statement = "update InterpersonalSkills set supervisorstatus=:status where clockId=:clockid and annualYear=:annualyear";

		query = session.getCurrentSession().createQuery(statement);

		query.setString("status", status);
		query.setString("clockid", nonexemptEmpClock);
		query.setString("annualyear", employeeYear);

		query.executeUpdate();

		String Jobstatement = "update JobKnowledgeAndSkill set supervisorstatus=:status where clockId=:clockid and annualYear=:annualyear";

		query = session.getCurrentSession().createQuery(Jobstatement);

		query.setString("status", status);
		query.setString("clockid", nonexemptEmpClock);
		query.setString("annualyear", employeeYear);

		query.executeUpdate();

	}

	@Override
	public void insertSupervisorStatus(String nonexemptEmpClock, String employeeYear, String status) {

		InterpersonalSkills personalSkills = new InterpersonalSkills();

		personalSkills.setClockId(Integer.parseInt(nonexemptEmpClock));
		personalSkills.setAnnualYear(employeeYear);
		personalSkills.setSupervisorstatus(status);

		session.getCurrentSession().save(personalSkills);

		JobKnowledgeAndSkill jobKnowledgeAndSkill = new JobKnowledgeAndSkill();

		jobKnowledgeAndSkill.setClockId(Integer.parseInt(nonexemptEmpClock));
		jobKnowledgeAndSkill.setAnnualYear(employeeYear);
		jobKnowledgeAndSkill.setSupervisorstatus(status);

		session.getCurrentSession().save(jobKnowledgeAndSkill);
	}

}
