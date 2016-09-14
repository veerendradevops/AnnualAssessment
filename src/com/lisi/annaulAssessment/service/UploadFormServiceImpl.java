package com.lisi.annaulAssessment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lisi.annaualAssessment.orm.CensusForm;
import com.lisi.annaualAssessment.orm.Disciplinary;
import com.lisi.annaulAssessment.DAO.UploadFormDAO;


@Service("UploadFormService")
@Transactional(rollbackFor={Exception.class})
public class UploadFormServiceImpl implements UploadFormService {

	@Autowired
	private UploadFormDAO uploadFormDAO;
	
	@Override
	public void saveEmployeeDetails(CensusForm censusForm) {
		// TODO Auto-generated method stub
		
		uploadFormDAO.uploadEmployee(censusForm);
		
	}


	@Override
	public void saveEmpDisciplinary(Disciplinary disciplinary) {
		// TODO Auto-generated method stub
		
		uploadFormDAO.saveEmpDisciplinary(disciplinary);
		
	}

	
	@Override
	public void deleteEmpDetails(CensusForm delCensusForm) {
		
		uploadFormDAO.deleteEmpDetails(delCensusForm);
	}
	

	public void setUploadFormDAO(UploadFormDAO uploadFormDAO) {
		this.uploadFormDAO = uploadFormDAO;
	}


	@Override
	public void deleteExistingEmployees(int delExisEmp) {
		
		
		uploadFormDAO.deleteExistingEmp(delExisEmp);
		
	}


	@Override
	public void deleteHierarchy(int delEmp) {
		
		uploadFormDAO.deleteHierarchy(delEmp);
		
	}


	@Override
	public void deleteDisciplinary(int delEmp) {
		
		uploadFormDAO.deleteDisciplinary(delEmp);
		
	}


	



	
}
