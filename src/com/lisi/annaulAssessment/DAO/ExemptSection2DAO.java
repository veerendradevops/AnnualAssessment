/**
 * 
 */
package com.lisi.annaulAssessment.DAO;

import java.util.List;

import com.lisi.annaualAssessment.orm.ExemptSection2;
import com.lisi.annaulAssessment.pojo.ExemptSection2Pojo;

/**
 * @author manikanta.b
 *
 */
public interface ExemptSection2DAO {
	
	
	public void fillExemptSection2(ExemptSection2 es,String year);
	public String insertExemptSection2();
	public void fillExemptSection3(ExemptSection2 es);
	public List<ExemptSection2> retriveObjectAchievementData();
	public List<ExemptSection2> retriveManagerSkillsAssessmentData();
	public void fillAssessmentSummary(ExemptSection2 es,String year);
	public List<ExemptSection2> retriveAssessmentSummaryData();
	
}
