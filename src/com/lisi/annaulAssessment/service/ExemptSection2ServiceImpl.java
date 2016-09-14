/**
 * 
 */
package com.lisi.annaulAssessment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lisi.annaualAssessment.orm.ExemptSection2;
import com.lisi.annaulAssessment.DAO.ExemptSection2DAO;
import com.lisi.annaulAssessment.pojo.ExemptSection2Pojo;

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
	public void fillExemptSection3(ExemptSection2 es) {
       esdao.fillExemptSection3(es);		
	}

	@Override
	public List<ExemptSection2> retriveObjectAchievementData() {
		
		return esdao.retriveObjectAchievementData();
	}

	@Override
	public List<ExemptSection2> retriveManagerSkillsAssessmentData() {
		
		return esdao.retriveManagerSkillsAssessmentData();
	}

	@Override
	public String insertExemptSection2() {
		
		return esdao.insertExemptSection2();
	}

	@Override
	public void fillAssessmentSummary(ExemptSection2 es,String year) {
		
		 esdao.fillAssessmentSummary(es,year);
	}

	@Override
	public List<ExemptSection2> retriveAssessmentSummaryData() {
		
		return esdao.retriveAssessmentSummaryData();
	}
	

}
