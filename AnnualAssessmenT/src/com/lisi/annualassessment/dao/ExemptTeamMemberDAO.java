package com.lisi.annualassessment.dao;

import java.util.List;

import com.lisi.annualassessment.orm.ExemptTeamMember;

public interface ExemptTeamMemberDAO {
	
	public boolean updateReviewOfPastYearDetails(ExemptTeamMember exemptTeamMember, int year);
	
	public void reviewOfPastYear(ExemptTeamMember exemptTeamMember);
	
	public List<ExemptTeamMember> getReviewOfPastYearDetails(String clockNumber  ,String currentYear);

	public int fetchYearOfAnEmployee(int clockNum,String year);
	
	public int updateCensusForm(String status,String clock,String employeeYear);

}