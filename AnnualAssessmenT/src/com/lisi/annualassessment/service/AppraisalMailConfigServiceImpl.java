package com.lisi.annualassessment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lisi.annualassessment.orm.AppraisalMailConfig;
import com.lisi.annualassessment.dao.AppraisalMailConfigDAO;

@Service
@Transactional
public class AppraisalMailConfigServiceImpl implements AppraisalMailConfigService {
	@Autowired
	private AppraisalMailConfigDAO dao;

	@Override
	public List<AppraisalMailConfig> getMailConfig(String userType, String status) {		
		return dao.getMailConfig(userType, status);
	}
}
