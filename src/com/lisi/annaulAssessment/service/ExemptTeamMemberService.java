package com.lisi.annaulAssessment.service;

import java.util.List;

import com.lisi.annaualAssessment.orm.ExemptTeamMember;

public interface ExemptTeamMemberService {
	
    public boolean updateReviewOfPastYearDetails(ExemptTeamMember exemptTeamMember,int year);
	
	public void reviewOfPastYear(ExemptTeamMember exemptTeamMember);
	
	public List<ExemptTeamMember> getReviewOfPastYearDetails(String clockNumber  ,String currentYear);


	public int fetchYearOfAnEmployee(int clockNum);
	
	public int updateCensusForm(String status,String clock);

	


}
