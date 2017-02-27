package com.lisi.annualassessment.service;

import java.util.List;

import com.lisi.annualassessment.orm.SkillsSelfAssessment;

public interface SkillsSelfAssessmentService {
	
	public boolean saveSkillsSelfAssessmentDetails(SkillsSelfAssessment skillsSelfAssessment);
	
	public List<SkillsSelfAssessment> getSkillsSelfAssessmentDetails(String clockNumber, String currentYear);
	
	public boolean updateSkillsSelfAssessmentDetails(SkillsSelfAssessment skillsSelfAssessment,int year);


	public int fetchYearOfAnSkillsSelfAssessment(int clockNum,String year);

}
