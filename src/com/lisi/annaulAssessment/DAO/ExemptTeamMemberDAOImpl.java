package com.lisi.annaulAssessment.DAO;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.lisi.annaualAssessment.orm.ExemptTeamMember;
import com.lisi.annaulAssessment.controller.ExemptEmployeeController;
import com.lisi.annaulAssessment.util.Converters;

@Transactional
@Repository("exemptTeamMemberDAO")
public class ExemptTeamMemberDAOImpl implements ExemptTeamMemberDAO {

	static final Logger log = Logger.getLogger(ExemptTeamMemberDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public boolean updateReviewOfPastYearDetails(ExemptTeamMember exemptTeamMember, int year) {

		try {

			if (String.valueOf(year).equals(Converters.getCurrentYear())) {

				String statement1 = "update ExemptTeamMember set  section1A=?,section1B1=?,"
						+ "effectivenessOfB1=?,section1B2=?,effectivenessOfB2=?,section1B3=?,effectivenessOfB3=?,"
						+ "section1B4=?,effectivenessOfB4=?,section1C=? ,section1D1=? ,section1D2=?"
						+ ",section1F1=? ,section1F2ONE=? ,section1F2TWO=? ,section1F3A=? ,section1F3B=?"
						+ ",section1F3B1=? ,section1F3B2=? where empClockNumber=? and appraisalYear=?";

				// '"+empClockNumber+"' and appraisalYear='"+appraisalYear+"'";

				System.out.println("Enter if condition");

				System.out.println("clock :: " + exemptTeamMember.getEmpClockNumber());
				System.out.println("year :: " + exemptTeamMember.getAppraisalYear());
				System.out.println("section B11 :: " + exemptTeamMember.getSection1B1());

				Query query1 = sessionFactory.getCurrentSession().createQuery(statement1);
				// query1.setInteger(0,exemptTeamMember.getEmpClockNumber());
				query1.setString(0, exemptTeamMember.getSection1A());
				query1.setString(1, exemptTeamMember.getSection1B1());
				query1.setString(2, exemptTeamMember.getEffectivenessOfB1());
				query1.setString(3, exemptTeamMember.getSection1B2());
				query1.setString(4, exemptTeamMember.getEffectivenessOfB2());
				query1.setString(5, exemptTeamMember.getSection1B3());
				query1.setString(6, exemptTeamMember.getEffectivenessOfB3());
				query1.setString(7, exemptTeamMember.getSection1B4());
				query1.setString(8, exemptTeamMember.getEffectivenessOfB4());
				query1.setString(9, exemptTeamMember.getSection1C());
				query1.setString(10, exemptTeamMember.getSection1D1());
				query1.setString(11, exemptTeamMember.getSection1D2());
				query1.setString(12, exemptTeamMember.getSection1F1());
				query1.setString(13, exemptTeamMember.getSection1F2ONE());
				query1.setString(14, exemptTeamMember.getSection1F3A());
				query1.setString(15, exemptTeamMember.getSection1F3B());
				query1.setString(16, exemptTeamMember.getSection1F3B2());
				query1.setString(17, exemptTeamMember.getSection1D2());
				query1.setString(18, exemptTeamMember.getSection1D2());
				query1.setInteger(19, exemptTeamMember.getEmpClockNumber());
				query1.setString(20, exemptTeamMember.getAppraisalYear());

				query1.executeUpdate();

				return true;

			} else {

				System.out.println("Enter else condion");
				sessionFactory.getCurrentSession().save(exemptTeamMember);
				return true;
			}

		}

		catch (Exception e) {

			e.printStackTrace();
			System.out.println(e.getMessage());
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ExemptTeamMember> getReviewOfPastYearDetails(String clockNumber, String currentYear) {

		Query hql_statement = null;
		List<ExemptTeamMember> listExemptTeamMemberValues = null;

		int empClockNum = 0;
		try {
			String statement = "from ExemptTeamMember where empClockNumber=? and appraisalYear=?";
			System.out.println("statement :: " + statement);
			hql_statement = sessionFactory.getCurrentSession().createQuery(statement);
			hql_statement.setInteger(0, Integer.parseInt(clockNumber));
			hql_statement.setString(1, String.valueOf(currentYear));

			listExemptTeamMemberValues = hql_statement.list();

			// return empClcokNumber;
			return listExemptTeamMemberValues;
		} catch (Exception exception) {
			log.error("Error is getReviewOfPastYearDetails ::: " + exception.getMessage());
			System.out.println("Error is getReviewOfPastYearDetails ::: " + exception.getMessage());

			// return empClockNum;
		}
		return listExemptTeamMemberValues;
	}

	@Override
	public void reviewOfPastYear(ExemptTeamMember exemptTeamMember) {

		System.out.println("Enter reviewOfPastYear method ");
		try {
			String year = null;
			// String statement = "from ExemptSection2 where empClockNumber=?
			// and appraisalYear=?";

			int empClockNumber = 564562;
			String appraisalYear = "2016";

			String statement = "from ExemptSection2 where empClockNumber= '" + empClockNumber + "' and appraisalYear='"
					+ appraisalYear + "'";

			Query query = sessionFactory.getCurrentSession().createQuery(statement);
			System.out.println("query  :::: " + query);
			// query.setInteger(0, 564562);
			// query.setString(1, "2016");

			// query.setInteger(0,exemptTeamMember.getEmpClockNumber());
			// query.setString(1,"2016");

			// System.out.println("year is :: "+query.setString(1,"2016"));

			List<ExemptTeamMember> fetchYear = query.list();

			for (ExemptTeamMember es2 : fetchYear) {

				log.info(es2.getAppraisalYear());

				year = es2.getAppraisalYear();

			}

			if (year.equals(Converters.getCurrentYear())) {

				sessionFactory.getCurrentSession().saveOrUpdate(exemptTeamMember);
				System.out.println("enter if condition");
			} else {

				sessionFactory.getCurrentSession().save(exemptTeamMember);
				System.out.println("enter else");
			}

			System.out.println("dao impl " + exemptTeamMember);
		} catch (Exception e) {

			e.printStackTrace();
			System.out.println(e.getMessage());
		}

	}

	@Override
	public int fetchYearOfAnEmployee(int clockNum) {

		log.info("fetchYearOfAnEmployee");

		String statement = " from ExemptTeamMember where empClockNumber=? and appraisalYear=?";

		Long count = 0l;

		try {
			Query query = sessionFactory.getCurrentSession().createQuery(statement).setParameter(0, clockNum)
					.setParameter(1, Converters.getCurrentYear());

			List<ExemptTeamMember> exempt = query.list();

			if (exempt.size() == 1) {

				for (ExemptTeamMember ex : exempt) {

					String year = ex.getAppraisalYear();

					return Integer.parseInt(year.trim());
				}

				// error
			} else if (exempt.size() == 0) {

				return 0;
			}

			log.info(count);

			if (count == 0) {

				return 0;
			}
		}

		catch (Exception e) {

			e.printStackTrace();
			log.info("exceptions state");
			return 0;
		}

		return 0;
	}

	@Override
	public int updateCensusForm(String status) {
		Date todayDate = new Date();
		String updateStatement = "update CensusForm set status=? , completedDate=? where empClockNumber=? and annaulYear=?";

		Query query = sessionFactory.getCurrentSession().createQuery(updateStatement);
		query.setString(0, status);
		query.setString(1, todayDate.toString());
		query.setInteger(2, Integer.parseInt(ExemptEmployeeController.getClockNumber().trim()));
		query.setString(3, Converters.getCurrentYear());
		return 0;
	}

}
