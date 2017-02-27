package com.lisi.annualassessment.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.orm.PresentYearObjectives;
import com.lisi.annualassessment.controller.ExemptEmployeeController;
import com.lisi.annualassessment.util.Converters;

@Repository("ManagerEmployeeDAO")
public class ManagerEmployeeDAOImpl implements ManagerEmployeeDAO {

	private static final Logger log = Logger.getLogger(ManagerEmployeeDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void savePresentYearObjectives(PresentYearObjectives presentyearObj, String personsYear) {

		log.info("savePresentYearObjectives");
		log.info(personsYear);
		if (!String.valueOf(personsYear).isEmpty()) {

			log.info("if");
			String statement = "update PresentYearObjectives set objectivesOne=?,objectivesOneWeight=?,objectivesTwo=?,"
					+ "objectivesTwoWeight=?,objectivesThree=?,objectivesThreeWeight=?,objectivesFour=?,objectivesFourWeight=?,"
					+ "objectivesFive=?,objectivesFiveWeight=?,overallScore=? where empClockNumber=? and annaulYear=?";
			Query query = sessionFactory.getCurrentSession().createQuery(statement);
			query.setParameter(0, presentyearObj.getObjectivesOne());
			query.setParameter(1, presentyearObj.getObjectivesOneWeight());
			query.setParameter(2, presentyearObj.getObjectivesTwo());
			query.setParameter(3, presentyearObj.getObjectivesTwoWeight());
			query.setParameter(4, presentyearObj.getObjectivesThree());
			query.setParameter(5, presentyearObj.getObjectivesThreeWeight());
			query.setParameter(6, presentyearObj.getObjectivesFour());
			query.setParameter(7, presentyearObj.getObjectivesFourWeight());
			query.setParameter(8, presentyearObj.getObjectivesFive());
			query.setParameter(9, presentyearObj.getObjectivesFiveWeight());
			query.setParameter(10, presentyearObj.getOverallScore());
			query.setParameter(11, presentyearObj.getEmpClockNumber());
			query.setParameter(12, presentyearObj.getAnnaulYear());

			query.executeUpdate();

		} else {
			log.info("else");
			sessionFactory.getCurrentSession().save(presentyearObj);
		}

	}

	@Override
	public PresentYearObjectives retrievePresentYearObjectives(String clockNumber,String year) {

		String statement = "from PresentYearObjectives where empClockNumber=? and annaulYear=?";
		
		
			Query query = sessionFactory.getCurrentSession().createQuery(statement);

			query.setInteger(0, Integer.parseInt(clockNumber));
			query.setString(1, year);
			
			PresentYearObjectives presentYearObj=(PresentYearObjectives)query.uniqueResult();
			
			if(presentYearObj==null){
				
				return null;
			}
			
		return presentYearObj;
	}

	@Override
	public void updateDevelopmentGoals(PresentYearObjectives developmentGoals,String clock,String year) {

		
		if (!String.valueOf(year).isEmpty()) {
		
		String statement = "update PresentYearObjectives set developmentGoalsOne=?,developmentGoalsTwo=?,developmentGoalsThree=?,developmentGoalsFour=?,developmentGoalsFive=? where empClockNumber=? and annaulYear=?";

		Query query = sessionFactory.getCurrentSession().createQuery(statement);

		log.info(developmentGoals.getDevelopmentGoalsOne());
		log.info(developmentGoals.getDevelopmentGoalsTwo());
		log.info(developmentGoals.getDevelopmentGoalsThree());
		log.info(developmentGoals.getDevelopmentGoalsFour());
		log.info(developmentGoals.getDevelopmentGoalsFive());
		log.info(clock);
		log.info(year);
		query.setParameter(0, developmentGoals.getDevelopmentGoalsOne());
		query.setParameter(1, developmentGoals.getDevelopmentGoalsTwo());
		query.setParameter(2, developmentGoals.getDevelopmentGoalsThree());
		query.setParameter(3, developmentGoals.getDevelopmentGoalsFour());
		query.setParameter(4, developmentGoals.getDevelopmentGoalsFive());

		query.setParameter(5, Integer.parseInt(clock.trim()));
		query.setParameter(6, year.trim());

		query.executeUpdate();
		}else{
			
			sessionFactory.getCurrentSession().save(developmentGoals);
			
		}

	}

	@Override
	public void updateMeetingSummary(PresentYearObjectives meetingSummary) {
	
		String statement = "update PresentYearObjectives set meetingSummaryManager=?,meetingSummaryTeamMember=? where empClockNumber=? and annaulYear=?";
		

		Query query = sessionFactory.getCurrentSession().createQuery(statement);

		query.setParameter(0, meetingSummary.getMeetingSummaryManager());
		query.setParameter(1, meetingSummary.getMeetingSummaryTeamMember());
		

		query.setParameter(2, meetingSummary.getEmpClockNumber());
		query.setParameter(3, meetingSummary.getAnnaulYear());

		query.executeUpdate();

		
	}

}
