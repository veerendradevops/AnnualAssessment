/**
 * 
 */
package com.lisi.annualassessment.pojo;

import java.util.List;

/**
 * @author meeravali.d
 *
 */
public class CsvReport {
	public List<String> factoryLocation;
	public List<Integer> shift;
	public String year;
	public String reportLocation;

	public List<String> getFactoryLocation() {
		return factoryLocation;
	}

	public void setFactoryLocation(List<String> factoryLocation) {
		this.factoryLocation = factoryLocation;
	}

	public List<Integer> getShift() {
		return shift;
	}

	public void setShift(List<Integer> shift) {
		this.shift = shift;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getReportLocation() {
		return reportLocation;
	}

	public void setReportLocation(String reportLocation) {
		this.reportLocation = reportLocation;
	}

	@Override
	public String toString() {
		return "CsvReport [factoryLocation=" + factoryLocation + ", shift=" + shift + ", year=" + year
				+ ", reportLocation=" + reportLocation + "]";
	}

	
	
}
