/**
 * 
 */
package com.lisi.annualassessment.dao;

import java.util.List;

import com.lisi.annualassessment.orm.ExemptSection2;
import com.lisi.annualassessment.pojo.ExemptSection2Pojo;

/**
 * @author manikanta.b
 *
 */
public interface ExemptSection2DAO {
	
	
	public void fillExemptSection2(ExemptSection2 es,String year);
	public String insertExemptSection2(ExemptSection2 exemptorm);
	public String fillExemptSection3(ExemptSection2 es,String year);
	public List<ExemptSection2> retriveObjectAchievementData(String empClockNumber,String year);
	public List<ExemptSection2> retriveManagerSkillsAssessmentData(String empClock,String year);
	public String fillAssessmentSummary(ExemptSection2 es,String year);
	public List<ExemptSection2> retriveAssessmentSummaryData(ExemptSection2 exemptorm);
	public ExemptSection2 fetchObjectAchievementData(String clock, String year);
	
}
