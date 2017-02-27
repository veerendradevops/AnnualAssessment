/**
 * 
 */
package com.lisi.annualassessment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lisi.annualassessment.orm.ExemptSection2;
import com.lisi.annualassessment.dao.ExemptSection2DAO;
import com.lisi.annualassessment.pojo.ExemptSection2Pojo;

/**
 * @author manikanta.b
 *
 */
@Service("ExemptSection2Service")
@Transactional
public class ExemptSection2ServiceImpl implements ExemptSection2Service{

	
	@Autowired
	private ExemptSection2DAO esdao;
	
	public void setEsdao(ExemptSection2DAO esdao) {
		this.esdao = esdao;
	}

	@Override
	public void fillExemptSection2(ExemptSection2 es,String year) {
		
		esdao.fillExemptSection2(es,year);
		
	}

	@Override
	public String fillExemptSection3(ExemptSection2 es,String year) {
      
		return  esdao.fillExemptSection3(es,year);		
	}

	@Override
	public List<ExemptSection2> retriveObjectAchievementData(String empClockNumber,String year) {
		
		return esdao.retriveObjectAchievementData(empClockNumber,year);
	}

	@Override
	public ExemptSection2 fetchObjectAchievementData(String clock, String year) {
		// TODO Auto-generated method stub
		return esdao.fetchObjectAchievementData(clock,year);
	}
	
	
	
	@Override
	public List<ExemptSection2> retriveManagerSkillsAssessmentData(String empClock,String year) {
		
		return esdao.retriveManagerSkillsAssessmentData(empClock,year);
	}

	@Override
	public String insertExemptSection2(ExemptSection2 exemptorm) {
		
		return esdao.insertExemptSection2(exemptorm);
	}

	@Override
	public String fillAssessmentSummary(ExemptSection2 es,String year) {
		
		return  esdao.fillAssessmentSummary(es,year);
	}

	@Override
	public List<ExemptSection2> retriveAssessmentSummaryData(ExemptSection2 exemptorm) {
		
		return esdao.retriveAssessmentSummaryData(exemptorm);
	}

	

}
