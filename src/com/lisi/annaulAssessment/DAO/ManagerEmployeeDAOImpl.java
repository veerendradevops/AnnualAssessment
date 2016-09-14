package com.lisi.annaulAssessment.DAO;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lisi.annaualAssessment.orm.PresentYearObjectives;
import com.lisi.annaulAssessment.controller.ExemptEmployeeController;
import com.lisi.annaulAssessment.util.Converters;

@Repository("ManagerEmployeeDAO")
public class ManagerEmployeeDAOImpl implements ManagerEmployeeDAO {

	private static final Logger log = Logger.getLogger(ManagerEmployeeDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void savePresentYearObjectives(PresentYearObjectives presentyearObj, String personsYear) {

		log.info("savePresentYearObjectives");
		log.info(personsYear);
		if (personsYear.equals(Converters.getCurrentYear())) {

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
	public List<PresentYearObjectives> retrievePresentYearObjectives() {

		String statement = "from PresentYearObjectives where empClockNumber=? and annaulYear=?";

		Query query = sessionFactory.getCurrentSession().createQuery(statement);

		query.setInteger(0, Integer.parseInt(ExemptEmployeeController.getClockNumber().trim()));
		query.setString(1, ExemptEmployeeController.getAnnaylYear());
		// year should pass

		// sessionFactory.getCurrentSession().createQuery(query).list();
		return (List<PresentYearObjectives>) query.list();
	}

	@Override
	public void updateDevelopmentGoals(PresentYearObjectives developmentGoals) {
		
		String statement="update PresentYearObjectives set meetingSummaryManager=?,meetingSummaryTeamMember=? where empClockNumber=? and annaulYear=?";
		
		Query query = sessionFactory.getCurrentSession().createQuery(statement);
		
		query.setParameter(0, developmentGoals.getMeetingSummaryManager());
		query.setParameter(1, developmentGoals.getMeetingSummaryTeamMember());
		
		query.setParameter(2, Integer.parseInt(ExemptEmployeeController.getClockNumber().trim()));
		query.setParameter(3, ExemptEmployeeController.getAnnaylYear());
		
		query.executeUpdate();
		
		
		
		
	}

}
