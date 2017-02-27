package com.lisi.annualassessment.dao;

import java.util.List;

import com.lisi.annualassessment.orm.AppraisalMailConfig;

public interface AppraisalMailConfigDAO {

	public List<AppraisalMailConfig> getMailConfig(String userType, String status);
	
}
