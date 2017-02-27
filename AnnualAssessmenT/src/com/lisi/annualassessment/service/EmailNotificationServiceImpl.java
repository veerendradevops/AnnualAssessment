package com.lisi.annualassessment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lisi.annualassessment.dao.EmailNotificationDAO;
import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.pojo.UploadForm;




@Service("EmailNotificationServiceI")
@Transactional
public class EmailNotificationServiceImpl implements EmailNotificationService{

	@Autowired
	private EmailNotificationDAO emailNotificationDAO;
	
	@Override
	public List<CensusForm> getExemptFormDetails(String exempt,String factoryLocation,String year) {
		
		return emailNotificationDAO.getExemptFormDetails(exempt,factoryLocation,year);
	}

	@Override
	public List<CensusForm> getExemptFormDetails(String exempt, UploadForm form,String year) {
		// TODO Auto-generated method stub
		return emailNotificationDAO.getExemptFormDetails(exempt,form,year);
	}

}
