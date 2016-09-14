
package com.lisi.annaulAssessment.DAO;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lisi.annaualAssessment.orm.AcknowledgmentSection;
import com.lisi.annaualAssessment.orm.CensusForm;

import com.lisi.annaualAssessment.orm.InterpersonalSkills;
import com.lisi.annaualAssessment.orm.JobKnowledgeAndSkill;

import com.lisi.annaualAssessment.orm.TrainingAndDevelopment;
import com.lisi.annaulAssessment.controller.NonExemptEmployeesController;
import com.lisi.annaulAssessment.util.Converters;

@Repository("nonExemptEmployeeDao")
public class NonExemptEmployeeDaoImpl implements NonExemptEmployeeDao {
	private static final Logger log = Logger.getLogger(NonExemptEmployeesController.class);

	@Autowired
	private SessionFactory session;

	Query query;

	@SuppressWarnings("unchecked")
	@Override
	public List<CensusForm> getEmployeeInformation() {

		query = session.getCurrentSession().createQuery("from CensusForm where exemptOrNonExempt=? and supervisorClockNumber=?");

		query.setParameter(0, "non-Exempt");
		query.setString(1, NonExemptEmployeesController.getLoginEmpClock().trim());

		return (List<CensusForm>) query.list();

	}

	@Override
	public List<CensusForm> getNonExemptEmployeeList(String clockNumber) {

		String statement = "from CensusForm where empClockNumber=?";

		query = session.getCurrentSession().createQuery(statement);

		query.setInteger(0, Integer.parseInt(clockNumber.trim()));

		return (List<CensusForm>) query.list();

	}

	@Override
	public void addJobKnowledgeAndSkillsData(JobKnowledgeAndSkill jobKnowledgeAndSkill, String existingYeaR) {
		try {

			/*
			 * int year = 0;
			 * 
			 * String hqlQuery =
			 * "from JobKnowledgeAndSkill where clockId=? and annualPerformance=? "
			 * ;
			 * 
			 * 
			 * Session currentSession = session.openSession();
			 * currentSession.beginTransaction();
			 * 
			 * 
			 * query = session.getCurrentSession().createQuery(hqlQuery);
			 * 
			 * query.setInteger(0,
			 * Integer.parseInt(NonExemptEmployeesController.getEmpClockNumber()
			 * ));
			 * 
			 * query.setInteger(1,
			 * Integer.parseInt(NonExemptEmployeesController.getAnnaulYear()));
			 * 
			 * List<JobKnowledgeAndSkill> checkYear = query.list(); for
			 * (JobKnowledgeAndSkill jks : checkYear) {
			 * 
			 * year = Integer.parseInt(jks.getAnnualPerformance()); }
			 */
			if (String.valueOf(Converters.getCurrentYear()).equals(existingYeaR)) {

				String statement = "update JobKnowledgeAndSkill set safetyScore=?,safetySupervisorsComments=?,qualityScore=?,"
						+ "qualitySupervisorsComments=?,productivityScore=?,productivitySupervisorsComments=?,"
						+ "jobKnowledgeAndSkillsScore=?,jobKnowledgeAndSkillsSupervisorsComments=?,"
						+ "supervisorsOverallComments=?,avgScore=? where clockId=? and annualYear=?";
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
				query.setParameter(10, jobKnowledgeAndSkill.getClockId());
				query.setParameter(11, jobKnowledgeAndSkill.getAnnualYear());
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
	public List<JobKnowledgeAndSkill> getJobKnowledgeList(String clockId) {
		String hqlQuery = "from JobKnowledgeAndSkill where clockId=? and annualYear=?";

		query = session.getCurrentSession().createQuery(hqlQuery);

		query.setInteger(0, Integer.parseInt(clockId));

		query.setInteger(1, Integer.parseInt(NonExemptEmployeesController.getAnnaulYear()));

		return (List<JobKnowledgeAndSkill>) query.list();
	}

	@Override
	public void addInterpersonalSkillsData(InterpersonalSkills interpersonalSkills, String existingYeaR) {

		// InterpersonalSkillsBean ipsb=new InterpersonalSkillsBean();

		try {
			/*
			 * int year = 0;
			 * 
			 * String hqlQuery =
			 * "from InterpersonalSkills where clockId=? and annualYear=?";
			 * 
			 * query = session.getCurrentSession().createQuery(hqlQuery);
			 * 
			 * query.setInteger(0,
			 * Integer.parseInt(NonExemptEmployeesController.getEmpClockNumber()
			 * ));
			 * 
			 * query.setInteger(1,
			 * Integer.parseInt(NonExemptEmployeesController.getAnnaulYear()));
			 * 
			 * List<InterpersonalSkills> checkYear = query.list(); for
			 * (InterpersonalSkills ips : checkYear) {
			 * 
			 * year = Integer.parseInt(ips.getAnnualYear());
			 * 
			 * }
			 */
			if (String.valueOf(Converters.getCurrentYear()).equals(existingYeaR)) {
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
	public List<InterpersonalSkills> getInterpersonalList(String clockId) {
		String hqlQuery = "from InterpersonalSkills where clockId=? and annualYear=?";

		query = session.getCurrentSession().createQuery(hqlQuery);

		query.setInteger(0, Integer.parseInt(clockId));
		query.setInteger(1, Integer.parseInt(NonExemptEmployeesController.getAnnaulYear()));

		return (List<InterpersonalSkills>) query.list();
	}

	/*
	 * @Override public void addNonExemptSummaryData(SummaryOfPerformanceReview
	 * nonExemptSummaryOrm) { try {
	 * 
	 * int year = 0;
	 * 
	 * String hqlQuery =
	 * "from SummaryOfPerformanceReview where clockId=? and annualPerformance=? "
	 * ;
	 * 
	 * query = session.getCurrentSession().createQuery(hqlQuery);
	 * 
	 * query.setInteger(0,
	 * Integer.parseInt(NonExemptEmployeesController.getEmpClockNumber()));
	 * 
	 * query.setInteger(1,
	 * Integer.parseInt(NonExemptEmployeesController.getEmpClockNumber()));
	 * 
	 * List<SummaryOfPerformanceReview> checkYear = query.list();
	 * 
	 * for (SummaryOfPerformanceReview spr : checkYear) {
	 * 
	 * year = Integer.parseInt(spr.getAnnualPerformance()); } if (year ==
	 * Converters.getDate()) {
	 * 
	 * Session s=session.openSession(); s.beginTransaction();
	 * 
	 * 
	 * session.getCurrentSession().saveOrUpdate(nonExemptSummaryOrm); } else {
	 * 
	 * 
	 * Session s=session.openSession(); s.beginTransaction();
	 * 
	 * String str = nonExemptSummaryOrm.getSupervisorsOverallComments();
	 * 
	 * } }
	 * 
	 * catch (Exception e) {
	 * 
	 * e.printStackTrace(); }
	 * 
	 * }
	 * 
	 * @Override public List<SummaryOfPerformanceReview>
	 * getSummaryOfPerformanceReviewList(String clockId) {
	 * 
	 * String hqlQuery =
	 * "from SummaryOfPerformanceReview where clockId=? and annualPerformance=?"
	 * ;
	 * 
	 * query = session.getCurrentSession().createQuery(hqlQuery);
	 * 
	 * query.setInteger(0, 1111 Integer.parseInt(clockId) );
	 * 
	 * query.setInteger(1, 2016 Integer.parseInt(NonExemptEmployeesController.
	 * getAnnaulYear()) );
	 * 
	 * return (List<SummaryOfPerformanceReview>) query.list();
	 * 
	 * }
	 */

	@Override
	public void addNonExemptTrainingorDevelopmenData(TrainingAndDevelopment trainingAndDevelopement,
			String existingYeaR) {
		try {
			/*
			 * log.info("addNonExemptTrainingorDevelopmenData");
			 * log.info(trainingAndDevelopement.getFirstAreaorFocus());
			 * log.info(trainingAndDevelopement.getfirstTrainingDescription());
			 * log.info(trainingAndDevelopement.getThirdTrainingDescription());
			 * 
			 * session.getCurrentSession().save(trainingAndDevelopement);
			 * 
			 * int year = 0;
			 * 
			 * String hqlQuery =
			 * "from TrainingAndDevelopment where clockId=? and annualYear=? ";
			 * 
			 * query = session.getCurrentSession().createQuery(hqlQuery);
			 * 
			 * query.setInteger(0,
			 * Integer.parseInt(NonExemptEmployeesController.getEmpClockNumber()
			 * ));
			 * 
			 * query.setInteger(1,Integer.parseInt(NonExemptEmployeesController.
			 * getAnnaulYear()));
			 * 
			 * List<TrainingAndDevelopment> checkYear = query.list();
			 * 
			 * for (TrainingAndDevelopment tad : checkYear) {
			 * 
			 * year = Integer.parseInt(tad.getAnnualYear()); }
			 */
			if (String.valueOf(existingYeaR).equals(Converters.getCurrentYear())) {

				String statement = "update TrainingAndDevelopment set firstAreaorFocus=?,firstTrainingDescription=?,firstTrainingTopic,firstDateDue=?,secondAreaorFocus=?,secondTrainingTopic=?,secondTrainingDescription=?,secondfDateDue=?,thirdAreaorFocus=?,thirdTrainingTopic=?,thirdTrainingDescription=?,thirdDateDue=? where clockId=? and annualYear=?";

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

			} else {
				session.getCurrentSession().save(trainingAndDevelopement);
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
	public List<TrainingAndDevelopment> getTrainingAndDevelopmentData(String empClockNumber) {

		log.info("this is retreve method");
		System.out.println(empClockNumber);
		System.out.println(NonExemptEmployeesController.getAnnaulYear());

		String hqlQuery = "from TrainingAndDevelopment where clockId=? and annualYear=?";

		query = session.getCurrentSession().createQuery(hqlQuery);

		query.setInteger(0, Integer.parseInt(empClockNumber));

		query.setInteger(1, Integer.parseInt(NonExemptEmployeesController.getAnnaulYear()));

		List<Object[]> obj = query.list();

		/*
		 * for (Object[] object : obj) {
		 * 
		 * System.out.println(object[0]); //year = String.valueOf(object[0]); }
		 */

		System.out.println(obj.contains("TrainingAndDevelopment"));

		log.info("this is end retreve method");

		return (List<TrainingAndDevelopment>) query.list();

	}

	@Override
	public void addNonExemptAcknowledgmentSectionData(AcknowledgmentSection acknowledgmentSection) {
		/*
		 * try {
		 * 
		 * int year = 0;
		 * 
		 * String hqlQuery =
		 * "from AcknowledgmentSection where clockId=? and annualYear=? ";
		 * 
		 * query = session.getCurrentSession().createQuery(hqlQuery);
		 * 
		 * query.setInteger(0, 1111
		 * Integer.parseInt(NonExemptEmployeesController. getEmpClockNumber())
		 * );
		 * 
		 * query.setInteger(1, Converters.getDate());
		 * 
		 * List<AcknowledgmentSection> checkYear = query.list();
		 * 
		 * for (AcknowledgmentSection aks : checkYear) {
		 * 
		 * year = Integer.parseInt(aks.getAnnualYear()); } if (year ==
		 * Converters.getDate()) {
		 * 
		 * session.getCurrentSession().saveOrUpdate(acknowledgmentSection); }
		 * else { session.getCurrentSession().save(acknowledgmentSection); } }
		 * 
		 * catch (Exception e) {
		 * 
		 * e.printStackTrace(); }
		 * 
		 */}

	@Override
	public List<AcknowledgmentSection> getAcknowledgementData(String empClockNumber) {
		String hqlQuery = "from AcknowledgmentSection where clockId=? and annualPerformance=?";

		query = session.getCurrentSession().createQuery(hqlQuery);

		query.setInteger(0, Integer.parseInt(empClockNumber));

		query.setInteger(1, Integer.parseInt(NonExemptEmployeesController.getAnnaulYear()));
		return (List<AcknowledgmentSection>) query.list();
	}

	@Override
	public void addNonExemptTrainingorDevelopmenData(TrainingAndDevelopment trainingAndDevelopement) {
		session.getCurrentSession().saveOrUpdate(trainingAndDevelopement);

	}

	/*
	 * // delete operations
	 * 
	 * @Override public void deleteEmp(int clockId) {
	 * 
	 * session.getCurrentSession().createQuery(
	 * "delete from InterpersonalSkills ips where ips.clockId=?");
	 * query.setParameter(0, clockId); query.executeUpdate();
	 * 
	 * }
	 * 
	 * @Override public void deleteJobknowledgeDao(int clockId) {
	 * session.getCurrentSession().createQuery(
	 * "delete from JobKnowledgeAndSkill jks where jks.clockId=?");
	 * query.setParameter(0, clockId); query.executeUpdate();
	 * 
	 * }
	 * 
	 * @Override public void deleteNonExemptSummaryDao(String empClockNumber) {
	 * 
	 * session.getCurrentSession().createQuery(
	 * "delete from SummaryOfPerformanceReview spr where spr.clockId=?");
	 * query.setParameter(0, empClockNumber); query.executeUpdate();
	 * 
	 * }
	 */

	@Override
	public void deleteAcknowledgmentSectionData(String empClockNumber) {

		session.getCurrentSession().createQuery("delete from AcknowledgmentSection aks where aks.clockId=?");
		query.setParameter(0, empClockNumber);
		query.executeUpdate();

	}

	@Override
	public String getYear(String ormClass) {
		String year = "";

		String hqlQuery = "select annualYear from " + ormClass + " where clockId=? and annualYear=?";

		/*
		 * year=(String) session.getCurrentSession().createQuery(hqlQuery).
		 * setParameter(0,
		 * Integer.parseInt(NonExemptEmployeesController.getEmpClockNumber()))
		 * .setParameter(1,
		 * Integer.parseInt(NonExemptEmployeesController.getAnnaulYear())).
		 * uniqueResult();
		 */
		/* Query query = */
		year = (String) session.getCurrentSession().createQuery(hqlQuery)
				.setParameter(0, Integer.parseInt(NonExemptEmployeesController.getEmpClockNumber()))
				.setParameter(1, NonExemptEmployeesController.getAnnaulYear()).uniqueResult();

		/*
		 * query.setInteger(0,
		 * Integer.parseInt(NonExemptEmployeesController.getEmpClockNumber()));
		 * 
		 * query.setString(1, NonExemptEmployeesController.getAnnaulYear());
		 * 
		 * @SuppressWarnings("unchecked") List<Object[]> obj = query.list();
		 * 
		 * for (Object[] object : obj) {
		 * 
		 * System.out.println(object[0]); year = String.valueOf(object[0]); }
		 */

		/*
		 * List<JobKnowledgeAndSkill> checkYear = query.list(); for
		 * (JobKnowledgeAndSkill ips : checkYear) {
		 * 
		 * year = ips.getAnnualYear();
		 * 
		 * }
		 */
		System.out.println("employee year");
		System.out.println("year form an employee  " + year);
		return year;
	}

}
