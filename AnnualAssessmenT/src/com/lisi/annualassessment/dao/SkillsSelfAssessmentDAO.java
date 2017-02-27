package com.lisi.annualassessment.dao;

import java.util.List;

import com.lisi.annualassessment.orm.ExemptTeamMember;
import com.lisi.annualassessment.orm.SkillsSelfAssessment;

public interface SkillsSelfAssessmentDAO {
	
	
	public List<SkillsSelfAssessment> getSkillsSelfAssessmentDetails(String clockNumber  ,String currentYear);
	public boolean saveSkillsSelfAssessmentDetails(SkillsSelfAssessment skillsSelfAssessment);
	
	public boolean updateSkillsSelfAssessmentDetails(SkillsSelfAssessment skillsSelfAssessment,int year);
	
	public int fetchYearOfAnSkillsSelfAssessment(int clockNum,String year);

}
