/**
 * 
 */
package com.lisi.annaulAssessment.DAO;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lisi.annaualAssessment.orm.CensusForm;
import com.lisi.annaualAssessment.orm.ExemptSection2;
import com.lisi.annaulAssessment.controller.ExemptEmployeeController;
import com.lisi.annaulAssessment.pojo.ExemptSection2Pojo;
import com.lisi.annaulAssessment.util.Converters;

/**
 * @author manikanta.b
 *
 */
@Repository("ExemptSection2DAO")
public class ExemptSection2DAOImpl implements ExemptSection2DAO {
	private static final Logger log = Logger.getLogger(ExemptSection2DAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	public String insertExemptSection2(ExemptSection2 exemptorm) {
		String year = null;
		String statement = "from ExemptSection2 where empClockNumber=? and appraisalYear=?";
		/*
		 * Query query =
		 * sessionFactory.getCurrentSession().createQuery(statement);
		 * query.setInteger(0,
		 * Integer.parseInt(ExemptEmployeeController.getClockNumber().trim()));
		 * 
		 * query.setInteger(1, Integer.parseInt(Converters.getCurrentYear()));
		 * 
		 * List<ExemptSection2> fetchYear = query.list();
		 */
		Query query = sessionFactory.getCurrentSession().createQuery(statement);
		query.setInteger(0, exemptorm.getEmpClockNumber());

		query.setInteger(1, Integer.parseInt(exemptorm.getAppraisalYear()));

		ExemptSection2 es2 = (ExemptSection2) query.uniqueResult();

		

		if (String.valueOf(es2).equals("null")) {

			return "";
		}

		
		return es2.getAppraisalYear();
	}

	@Override
	public void fillExemptSection2(ExemptSection2 es, String year) {

		log.info("fillExemptSection2");

		try {

			if (String.valueOf(year).equals(Converters.getCurrentYear())) {
				String statement = "update ExemptSection2  set section2A1Objective=?, section2A1Level=?,section2A2Objective=?,"
						+ "section2A2Level=?,section2A3Objective=?,section2A3Level=?,section2A4Objective=?,section2A4Level=?,"
						+ "section2A5Objective=?,section2A5Level=?,section2AdditionalComments=? where empClockNumber=? and appraisalYear=?";

				Query query = sessionFactory.getCurrentSession().createQuery(statement);

				query.setString(0, es.getSection2A1Objective());
				query.setInteger(1, es.getSection2A1Level());
				query.setString(2, es.getSection2A2Objective());
				query.setInteger(3, es.getSection2A2Level());
				query.setString(4, es.getSection2A3Objective());
				query.setInteger(5, es.getSection2A3Level());
				query.setString(6, es.getSection2A4Objective());
				query.setInteger(7, es.getSection2A4Level());
				query.setString(8, es.getSection2A5Objective());
				query.setInteger(9, es.getSection2A5Level());
				query.setString(10, es.getSection2AdditionalComments());
				query.setInteger(11, es.getEmpClockNumber());
				query.setString(12, es.getAppraisalYear());
				query.executeUpdate();
			} else {
				sessionFactory.getCurrentSession().save(es);
			}
			System.out.println("dao impl " + es);
		} catch (Exception e) {

			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}

	// Logic for retrieving Objectachievement data
	public void retriveAssessmentSummaryDatalogic(ExemptSection2 es, String year) {
		log.info("retriveAssessmentSummaryDataLogic");
		try {
			if (String.valueOf(year).equals(Converters.getCurrentYear())) {
				String statement = "update ExemptSection2  set section2CSummeryStrength=?,section2CSummeryImprovement=? where empClockNumber=? and appraisalYear=?";
				Query query = sessionFactory.getCurrentSession().createQuery(statement);
				query.setString(0, es.getSection2CSummeryStrength());
				query.setString(1, es.getSection2CSummeryImprovement());
				query.setInteger(3, es.getEmpClockNumber());
				query.setString(4, es.getAppraisalYear().trim());
				query.executeUpdate();
			} else {
				sessionFactory.getCurrentSession().save(es);

			}
		} catch (Exception e) {

		}
	}

	@Override
	public void fillExemptSection3(ExemptSection2 es, String year) {

		if (year.equalsIgnoreCase(Converters.getCurrentYear())) {

			System.out.println(year);
			String statement = "update ExemptSection2  set section2B1=? , section2B2=?,section2B3=? where empClockNumber=? and appraisalYear=? ";

			Query query = sessionFactory.getCurrentSession().createQuery(statement);

			query.setString(0, es.getSection2B1());

			query.setString(1, es.getSection2B2());

			query.setString(2, es.getSection2B3());

			query.setInteger(3, es.getEmpClockNumber());

			query.setInteger(4, Integer.parseInt(es.getAppraisalYear()));

			query.executeUpdate();
		} else {
System.out.println("dao else");
			sessionFactory.getCurrentSession().save(es);
		}
	}

	// Logic for retrieving Objectachievement data
	@Override
	public List<ExemptSection2> retriveObjectAchievementData(String clockNumber, String year) {

		String statement = "from ExemptSection2 where empClockNumber=? and appraisalYear=? ";
		Query query = sessionFactory.getCurrentSession().createQuery(statement);

		query.setInteger(0, Integer.parseInt(clockNumber.trim()));

		query.setInteger(1, Integer.parseInt(year.trim()));

		return (List<ExemptSection2>) query.list();
	}

	// Logic for retrieving AssessmentSummaryData
	@Override
	public List<ExemptSection2> retriveAssessmentSummaryData(ExemptSection2 exemptorm) {
		String statement = "from ExemptSection2 where empClockNumber=? and appraisalYear=? ";
		Query query = sessionFactory.getCurrentSession().createQuery(statement);
		query.setInteger(0, exemptorm.getEmpClockNumber());
		query.setInteger(1, Integer.parseInt(exemptorm.getAppraisalYear()));

		return (List<ExemptSection2>) query.list();
	}

	@Override
	public List<ExemptSection2> retriveManagerSkillsAssessmentData(String empClock,String year) {
		String statement = "from ExemptSection2 where empClockNumber=? and appraisalYear=? ";
		Query query = sessionFactory.getCurrentSession().createQuery(statement);

		query.setInteger(0, Integer.parseInt(empClock.trim()));

		query.setString(1, year.trim());

		return (List<ExemptSection2>) query.list();
	}

	@Override
	public void fillAssessmentSummary(ExemptSection2 es, String year) {

		System.out.println("fill assessment summary dao");
		log.info(es.getSection2CSummeryStrength() + " : " + es.getSection2CSummeryImprovement());
		log.info(year);
		log.info(Converters.getCurrentYear());

		if (String.valueOf(year).equals(Converters.getCurrentYear())) {
			log.info("fillassessmentSummary If Condition");
			String statement = "update ExemptSection2  set section2CSummeryStrength=?,section2CSummeryImprovement=?,section2DSummeryOfAccomplishmentAndAreasImprovement=?,section2EAssessmentSummary=?,section2EAssessmentcompared=? where empClockNumber=? and appraisalYear=?";
			Query query = sessionFactory.getCurrentSession().createQuery(statement);
			query.setString(0, es.getSection2CSummeryStrength());
			query.setString(1, es.getSection2CSummeryImprovement());

			query.setString(2, es.getSection2DSummeryOfAccomplishmentAndAreasImprovement());
			query.setString(3, es.getSection2EAssessmentSummary());
			query.setString(4, es.getSection2EAssessmentcompared());
			query.setInteger(5, es.getEmpClockNumber());
			query.setString(6, es.getAppraisalYear().trim());
			int result = query.executeUpdate();
			log.info(result + " result");
		} else {
			System.out.println("else condition");
			sessionFactory.getCurrentSession().save(es);
		}
		System.out.println("dao impl " + es);

	}

}
