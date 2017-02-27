package com.lisi.annualassessment.pojo;



public class LDAPDetails {
	
	private String url;
	
	private String domain;

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	@Override
	public String toString() {
		return "LDAPDetails [url=" + url + ", domain=" + domain + "]";
	}
	
	
	
	

}
