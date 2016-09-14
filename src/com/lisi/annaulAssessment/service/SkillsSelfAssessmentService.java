package com.lisi.annaulAssessment.service;

import java.util.List;

import com.lisi.annaualAssessment.orm.SkillsSelfAssessment;

public interface SkillsSelfAssessmentService {
	
	public boolean saveSkillsSelfAssessmentDetails(SkillsSelfAssessment skillsSelfAssessment);
	
	public List<SkillsSelfAssessment> getSkillsSelfAssessmentDetails(String clockNumber, String currentYear);
	
	public boolean updateSkillsSelfAssessmentDetails(SkillsSelfAssessment skillsSelfAssessment,int year);


	public int fetchYearOfAnSkillsSelfAssessment(int clockNum);

}
