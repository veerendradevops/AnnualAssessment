package com.lisi.annualassessment.service;

import java.util.List;

import com.lisi.annualassessment.orm.AppraisalMailConfig;

public interface AppraisalMailConfigService {
	public List<AppraisalMailConfig> getMailConfig(String userType, String status);
}
