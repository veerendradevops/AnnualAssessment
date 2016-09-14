package com.lisi.annaulAssessment.DAO;

import java.util.List;

import com.lisi.annaualAssessment.orm.ExemptTeamMember;
import com.lisi.annaualAssessment.orm.SkillsSelfAssessment;

public interface SkillsSelfAssessmentDAO {
	
	
	public List<SkillsSelfAssessment> getSkillsSelfAssessmentDetails(String clockNumber  ,String currentYear);
	public boolean saveSkillsSelfAssessmentDetails(SkillsSelfAssessment skillsSelfAssessment);
	
	public boolean updateSkillsSelfAssessmentDetails(SkillsSelfAssessment skillsSelfAssessment,int year);
	
	public int fetchYearOfAnSkillsSelfAssessment(int clockNum);

}
