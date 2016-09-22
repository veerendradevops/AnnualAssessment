package com.lisi.annaulAssessment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lisi.annaualAssessment.orm.ExemptTeamMember;
import com.lisi.annaulAssessment.DAO.ExemptTeamMemberDAO;

@Service("exemptTeamMemberService")
@Transactional
public class ExemptTeamMemberServiceImpl implements ExemptTeamMemberService{

	@Autowired
	private ExemptTeamMemberDAO exemptTeamMemberDAO;

	@Override
	public boolean updateReviewOfPastYearDetails(ExemptTeamMember exemptTeamMember, int year) {
		// TODO Auto-generated method stub
		return exemptTeamMemberDAO.updateReviewOfPastYearDetails(exemptTeamMember,year);
	}

	@Override
	public void reviewOfPastYear(ExemptTeamMember exemptTeamMember) {
		// TODO Auto-generated method stub
		
		
	}

	@Override
	public List<ExemptTeamMember> getReviewOfPastYearDetails(String clockNumber, String currentYear) {
		// TODO Auto-generated method stub
		return exemptTeamMemberDAO.getReviewOfPastYearDetails(clockNumber, currentYear);
	}

	@Override
	public int fetchYearOfAnEmployee(int clockNum) {
		// TODO Auto-generated method stub
		return exemptTeamMemberDAO.fetchYearOfAnEmployee(clockNum);
	}

	@Override
	public int updateCensusForm(String status,String empClock) {
		// TODO Auto-generated method stub
		return exemptTeamMemberDAO.updateCensusForm(status,empClock);
	}


	
}
