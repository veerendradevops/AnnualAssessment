package com.lisi.annaulAssessment.DAO;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.jfree.util.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lisi.annaualAssessment.orm.ExemptTeamMember;
import com.lisi.annaualAssessment.orm.SkillsSelfAssessment;
import com.lisi.annaulAssessment.controller.ExemptEmployeeInfoController;
import com.lisi.annaulAssessment.util.Converters;

@Repository("skillsSelfAssessmentDAO")
public class SkillsSelfAssessmentDAOImpl implements SkillsSelfAssessmentDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
			private static final Logger log = Logger.getLogger(SkillsSelfAssessmentDAOImpl.class);
	
	@Override
	public boolean saveSkillsSelfAssessmentDetails(SkillsSelfAssessment skillsSelfAssessment) {
		
		try
		{
			Log.info("*** Enter SkillsSelfAssessmentDAOImpl ***");
			sessionFactory.getCurrentSession().save(skillsSelfAssessment);			
			
			return true;
		}
		catch(Exception exception)
		{
			Log.error("exception is ::: "+exception.getMessage());
			return false;
		}
		
	}

	
	@Override
	public boolean updateSkillsSelfAssessmentDetails(SkillsSelfAssessment skillsSelfAssessment,int year) {
		
			try{
				System.out.println("udate year is ::  "+String.valueOf(year));
				if (String.valueOf(year).equals(Converters.getCurrentYear())) {
					
					System.out.println("YEAR :::: "+Converters.getCurrentYear());
					System.out.println("Enter update condition");

						String statement1 = "update SkillsSelfAssessment set  section1G1=?,section1G2=?, section1G3=?,section1G4=?,section1G5=? where empClockNumber=? and appraisalYear=?";
						
						System.out.println("statement :: "+statement1);
						
						

						Query query1 = sessionFactory.getCurrentSession().createQuery(statement1);
						query1.setString(0, skillsSelfAssessment.getSection1G1());
						query1.setString(1, skillsSelfAssessment.getSection1G2());
						query1.setString(2, skillsSelfAssessment.getSection1G3());
						query1.setString(3, skillsSelfAssessment.getSection1G4());
						query1.setString(4,skillsSelfAssessment.getSection1G5());
						query1.setInteger(5,skillsSelfAssessment.getEmpClockNumber());
						query1.setString(6,skillsSelfAssessment.getAppraisalYear());


						query1.executeUpdate();
						
						return true;
						
					} else {
						System.out.println("Enter save method");
						sessionFactory.getCurrentSession().save(skillsSelfAssessment);
						return true;
					}

				
			
			}
		
			catch (Exception e) {
					
					e.printStackTrace();
					System.out.println("error is :::"+e.getMessage());
					return false;
				}
			
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<SkillsSelfAssessment> getSkillsSelfAssessmentDetails(String clockNumber, String currentYear) {
		
		Query hql_statement=null;
		List<SkillsSelfAssessment> listSkillsSelfAssessmentDetails=null;
		
		
		System.out.println("clockNumber :: "+clockNumber+"currentYear :: "+currentYear+" ::: "+Integer.parseInt(clockNumber));
		
		System.out.println("Enter getSkillsSelfAssessmentDetails() ***");
		try{
			
			Log.info("*** Enter getSkillsSelfAssessmentDetails ***");
		String statement="from SkillsSelfAssessment where empClockNumber=? and appraisalYear=?";
		System.out.println("statement ::: "+statement);
		
		hql_statement=sessionFactory.getCurrentSession().createQuery(statement);
		hql_statement.setInteger(0, Integer.parseInt(clockNumber));
		hql_statement.setString(1, String.valueOf(currentYear));
		listSkillsSelfAssessmentDetails=hql_statement.list();
		
		return listSkillsSelfAssessmentDetails;
		}
		catch(Exception exception)
		{
			Log.error("Faced Error is :: "+exception.getMessage());
			
		}
		return listSkillsSelfAssessmentDetails;
	}
	
	
	

	@Override
	public int fetchYearOfAnSkillsSelfAssessment(int clockNum) {
		
		log.info("fetchYearOfAnEmployee");
		
		String statement=" from SkillsSelfAssessment where empClockNumber=? and appraisalYear=?";
		
		
		 
		Long  count=0l;
		
		
		try{
		Query query=sessionFactory.getCurrentSession().createQuery(statement).setParameter(0, clockNum).setParameter(1, Converters.getCurrentYear());
		
		List<SkillsSelfAssessment> exempt=query.list();
		System.out.println("exempt.size() :: "+exempt.size());
		
		if(exempt.size()==1){
			
			for(SkillsSelfAssessment ex : exempt){
				
				String year=ex.getAppraisalYear();
				
				return Integer.parseInt(year.trim());
			}
			
			// error
			
			
			
		}else if(exempt.size()==0){
			
			return 0;
		}
		
		
		 log.info("Count ::: "+count);
		 
		 if(count==0){
			 
			 return 0;
		 }
		}
		
		
		
		catch(Exception e){
			
			e.printStackTrace();
			log.info("exceptions state");
			return 0;
		}
		 
		
	return 0;
	}

	
	

}
