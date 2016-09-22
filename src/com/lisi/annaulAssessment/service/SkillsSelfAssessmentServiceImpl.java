package com.lisi.annaulAssessment.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lisi.annaualAssessment.orm.SkillsSelfAssessment;
import com.lisi.annaulAssessment.DAO.ExemptTeamMemberDAOImpl;
import com.lisi.annaulAssessment.DAO.SkillsSelfAssessmentDAO;

@Service("skillsSelfAssessmentService")
@Transactional
public class SkillsSelfAssessmentServiceImpl implements SkillsSelfAssessmentService{

	static final Logger log=Logger.getLogger(ExemptTeamMemberDAOImpl.class);
	
	@Autowired
	private SkillsSelfAssessmentDAO skillsSelfAssessmentDAO;
	
	@Override
	public boolean saveSkillsSelfAssessmentDetails(SkillsSelfAssessment skillsSelfAssessment) {
		// TODO Auto-generated method stub
		log.info("** Enter SkillsSelfAssessmentServiceImpl *** ");
		return skillsSelfAssessmentDAO.saveSkillsSelfAssessmentDetails(skillsSelfAssessment);
	}

	@Override
	public List<SkillsSelfAssessment> getSkillsSelfAssessmentDetails(String clockNumber, String currentYear) {
		// TODO Auto-generated method stub
		return skillsSelfAssessmentDAO.getSkillsSelfAssessmentDetails(clockNumber, currentYear);
	}

	@Override
	public boolean updateSkillsSelfAssessmentDetails(SkillsSelfAssessment skillsSelfAssessment,int year) {
		// TODO Auto-generated method stub
		return skillsSelfAssessmentDAO.updateSkillsSelfAssessmentDetails(skillsSelfAssessment, year);
	}

	@Override
	public int fetchYearOfAnSkillsSelfAssessment(int clockNum,String year) {
		// TODO Auto-generated method stub
		return skillsSelfAssessmentDAO.fetchYearOfAnSkillsSelfAssessment(clockNum, year);
	}
	

}
