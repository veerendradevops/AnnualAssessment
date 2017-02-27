package com.lisi.annualassessment.dao;

import java.util.ArrayList;
import java.util.Collections;
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

import com.lisi.annualassessment.orm.ExemptTeamMember;
import com.lisi.annualassessment.controller.ExemptEmployeeController;
import com.lisi.annualassessment.util.Converters;

@Transactional
@Repository("exemptTeamMemberDAO")
public class ExemptTeamMemberDAOImpl implements ExemptTeamMemberDAO {

	static final Logger log = Logger.getLogger(ExemptTeamMemberDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public boolean updateReviewOfPastYearDetails(ExemptTeamMember exemptTeamMember, int year) {

		try {

			 if (year!=0) {

	                System.out.println("update");
	                String statement = "update ExemptTeamMember set  section1A=?,section1B1=?,"
                           + "effectivenessOfB1=?,section1B2=?,effectivenessOfB2=?,section1B3=?,effectivenessOfB3=?,"
                           + "section1B4=?,effectivenessOfB4=?,section1C=? ,section1D1=? ,section1D2=?"
                           + ",section1F1=? ,section1F2ONE=? ,section1F2TWO=? ,section1F3A=? ,section1F3B=?"
                           + ",section1F3B1=? ,section1F3B2=? ,other=? where empClockNumber=? and appraisalYear=?";
                   
	                Query query = sessionFactory.getCurrentSession().createQuery(statement);
	                  System.out.println("Query :::: "+query);
	                  
	                  
	                  System.out.println("other :: "+exemptTeamMember.getOther());
	                  System.out.println(exemptTeamMember.getEffectivenessOfB3());
	                  
	                  query.setString(0, exemptTeamMember.getSection1A().trim());
	                  query.setString(1, exemptTeamMember.getSection1B1());
	                  query.setString(2, exemptTeamMember.getEffectivenessOfB1());
	                  query.setString(3, exemptTeamMember.getSection1B2());
	                  query.setString(4,exemptTeamMember.getEffectivenessOfB2());
	                  query.setString(5, exemptTeamMember.getSection1B3());
	                  query.setString(6, exemptTeamMember.getEffectivenessOfB3());
	                  query.setString(7, exemptTeamMember.getSection1B4());
	                  query.setString(8, exemptTeamMember.getEffectivenessOfB4());
	                  query.setString(9, exemptTeamMember.getSection1C().trim());
	                  query.setString(10, exemptTeamMember.getSection1D1());
	                  query.setString(11, exemptTeamMember.getSection1D2());
	                  query.setString(12, exemptTeamMember.getSection1F1());
	                  
	                   

	                if (String.valueOf(exemptTeamMember.getSection1F1()).equalsIgnoreCase("no") || String.valueOf(exemptTeamMember.getSection1F1()).equals("null") ||  String.valueOf(exemptTeamMember.getSection1F1()).isEmpty()){
	                    log.info("Enter if condition for getSection1F1 ::  " +exemptTeamMember.getSection1F1());
	                    query.setString(13, "");
	                    query.setString(14, "");
	                } else {
	                    query.setString(13, exemptTeamMember.getSection1F2ONE());
	                    query.setString(14, exemptTeamMember.getSection1F2TWO());

	                }

	                if (String.valueOf(exemptTeamMember.getSection1F3A()).equalsIgnoreCase("no") || String.valueOf(exemptTeamMember.getSection1F3A()).equals("null")) {
	                    log.info("Enter if condition for Section1F3A ::  " + exemptTeamMember.getSection1F3A());

	                    query.setString(15, exemptTeamMember.getSection1F3A());
	                    query.setString(16, "");
	                    query.setString(17, "");
	                    query.setString(18, "");
	                    query.setString(19, "");
	                } else {

	                    query.setString(15, exemptTeamMember.getSection1F3A());
	                    query.setString(16, exemptTeamMember.getSection1F3B());
	                    query.setString(17, exemptTeamMember.getSection1F3B1());
	                    query.setString(18, exemptTeamMember.getSection1F3B2());
	                    query.setString(19, exemptTeamMember.getOther());

	                }
	                  query.setInteger(20,exemptTeamMember.getEmpClockNumber());
	                  query.setString(21,exemptTeamMember.getAppraisalYear());
	                 
	                 

	                  
	                  System.out.println("Section1F3A() :::"+exemptTeamMember.getSection1F3A());
	                  System.out.println("Section1F3B() :::"+exemptTeamMember.getSection1F3B());
	                  System.out.println("Section1F3B1() :::"+exemptTeamMember.getSection1F3B1());
	                  System.out.println("Section1F3B2() :::"+exemptTeamMember.getSection1F3B2());
	                  
	                  
	                  
	                  query.executeUpdate();
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

		System.out.println("getReviewOfPastYearDetails");
		Query hql_statement ;
		List<ExemptTeamMember> listExemptTeamMemberValues = Collections.EMPTY_LIST;

		
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
			exception.printStackTrace();

			// return empClockNum;
		}
		return listExemptTeamMemberValues;
	}

	@Override
	public void reviewOfPastYear(ExemptTeamMember exemptTeamMember) {/*

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

	*/}

	@Override
	public int fetchYearOfAnEmployee(int clockNum,String empYear) {

		log.info("fetchYearOfAnEmployee");

		String statement = " from ExemptTeamMember where empClockNumber=? and appraisalYear=?";

		Long count = 0l;

		try {
			Query query = sessionFactory.getCurrentSession().createQuery(statement).setParameter(0, clockNum)
					.setParameter(1, empYear);

			ExemptTeamMember exempt=(ExemptTeamMember)query.uniqueResult();
			
			if(exempt==null){
				
				return 0;
			}else{
				
				return Integer.parseInt(exempt.getAppraisalYear());
			}
			
			/*List<ExemptTeamMember> exempt = query.list();

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
			}*/
		}

		catch (Exception e) {

			e.printStackTrace();
			log.info("exceptions state");
			return 0;
		}

		
	}

	@Override
	public int updateCensusForm(String status,String clock,String employeeYear) {
		Date todayDate = new Date();
		
		log.info("status :: "+status);
		System.out.println("updatd the employee status..");
		String updateStatement = "update CensusForm set status=? , completedDate=? where empClockNumber=? and annaulYear=?";

		Query query = sessionFactory.getCurrentSession().createQuery(updateStatement);
		query.setString(0, status);
		query.setString(1, todayDate.toString());
		query.setInteger(2, Integer.parseInt(clock.trim()));
		query.setString(3, employeeYear.trim());
		
		return query.executeUpdate();
	}

}
