/**
 * 
 */
package com.lisi.annaulAssessment.service;

import java.util.List;

import com.lisi.annaualAssessment.orm.ExemptSection2;
import com.lisi.annaulAssessment.pojo.ExemptSection2Pojo;

/**
 * @author manikanta.b
 *
 */
public interface ExemptSection2Service {
	
	
	public void fillExemptSection2(ExemptSection2 es,String year);
	public String insertExemptSection2(ExemptSection2 exemptorm);
	public void fillExemptSection3(ExemptSection2 es,String year);
	public List<ExemptSection2> retriveObjectAchievementData(String clockNumber,String year);
	public List<ExemptSection2> retriveManagerSkillsAssessmentData(String clock,String year);
	public List<ExemptSection2> retriveAssessmentSummaryData(ExemptSection2 exemptorm);
	public void fillAssessmentSummary(ExemptSection2 es,String year);
	
}
