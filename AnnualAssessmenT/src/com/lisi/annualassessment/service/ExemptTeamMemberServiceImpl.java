package com.lisi.annualassessment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lisi.annualassessment.orm.ExemptTeamMember;
import com.lisi.annualassessment.dao.ExemptTeamMemberDAO;

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
	public int fetchYearOfAnEmployee(int clockNum,String year) {
		// TODO Auto-generated method stub
		return exemptTeamMemberDAO.fetchYearOfAnEmployee(clockNum, year);
	}

	@Override
	public int updateCensusForm(String status,String empClock,String employeeYear) {
		// TODO Auto-generated method stub
		return exemptTeamMemberDAO.updateCensusForm(status,empClock,employeeYear);
	}


	
}
