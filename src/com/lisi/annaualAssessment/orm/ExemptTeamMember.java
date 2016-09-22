package com.lisi.annaualAssessment.orm;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="ExemptTeamMember")
public class ExemptTeamMember implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="empClockNumber")
	private int empClockNumber;
	
	@Column(name="Section1A")
	private String section1A;
	
	@Column(name="Section1B1")
	private String section1B1;
	
	@Column(name="EffectivenessOfB1")
	private String effectivenessOfB1;
	
	@Column(name="Section1B2")
	private String section1B2;
	
	@Column(name="EffectivenessOfB2")
	private String effectivenessOfB2;
	
	@Column(name="Section1B3")
	private String section1B3;
	
	@Column(name="EffectivenessOfB3")
	private String effectivenessOfB3;
	
	@Column(name="Section1B4")
	private String section1B4;
	
	@Column(name="EffectivenessOfB4")
	private String effectivenessOfB4;
	
	@Column(name="Section1C")
	private String section1C;
	
	@Column(name="Section1D1")
	private String section1D1;
	
	@Column(name="Section1D2")
	private String section1D2;
	
	@Column(name="Section1F1")
	private String section1F1;
	
	@Column(name="Section1F2ONE")
	private String section1F2ONE;
	
	@Column(name="Section1F2TWO")
	private String section1F2TWO;
	
	@Column(name="Section1F3A")
	private String section1F3A;
	
	@Column(name="Section1F3B")
	private String section1F3B;
	
	@Column(name="Section1F3B1")
	private String section1F3B1;
	
	@Column(name="Section1F3B2")
	private String section1F3B2;
	
	@Column(name="AppraisalYear")
	private String appraisalYear;

	@Column(name="Other")
	private String other;
	
	
	
	
	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	/**
	 * @return the empClockNumber
	 */
	public int getEmpClockNumber() {
		return empClockNumber;
	}

	/**
	 * @param empClockNumber the empClockNumber to set
	 */
	public void setEmpClockNumber(int empClockNumber) {
		this.empClockNumber = empClockNumber;
	}

	/**
	 * @return the section1A
	 */
	public String getSection1A() {
		return section1A;
	}

	/**
	 * @param section1a the section1A to set
	 */
	public void setSection1A(String section1a) {
		section1A = section1a;
	}

	/**
	 * @return the section1B1
	 */
	public String getSection1B1() {
		return section1B1;
	}

	/**
	 * @param section1b1 the section1B1 to set
	 */
	public void setSection1B1(String section1b1) {
		section1B1 = section1b1;
	}

	/**
	 * @return the effectivenessOfB1
	 */
	public String getEffectivenessOfB1() {
		return effectivenessOfB1;
	}

	/**
	 * @param effectivenessOfB1 the effectivenessOfB1 to set
	 */
	public void setEffectivenessOfB1(String effectivenessOfB1) {
		this.effectivenessOfB1 = effectivenessOfB1;
	}

	/**
	 * @return the section1B2
	 */
	public String getSection1B2() {
		return section1B2;
	}

	/**
	 * @param section1b2 the section1B2 to set
	 */
	public void setSection1B2(String section1b2) {
		section1B2 = section1b2;
	}

	/**
	 * @return the effectivenessOfB2
	 */
	public String getEffectivenessOfB2() {
		return effectivenessOfB2;
	}

	/**
	 * @param effectivenessOfB2 the effectivenessOfB2 to set
	 */
	public void setEffectivenessOfB2(String effectivenessOfB2) {
		this.effectivenessOfB2 = effectivenessOfB2;
	}

	/**
	 * @return the section1B3
	 */
	public String getSection1B3() {
		return section1B3;
	}

	/**
	 * @param section1b3 the section1B3 to set
	 */
	public void setSection1B3(String section1b3) {
		section1B3 = section1b3;
	}

	/**
	 * @return the effectivenessOfB3
	 */
	public String getEffectivenessOfB3() {
		return effectivenessOfB3;
	}

	/**
	 * @param effectivenessOfB3 the effectivenessOfB3 to set
	 */
	public void setEffectivenessOfB3(String effectivenessOfB3) {
		this.effectivenessOfB3 = effectivenessOfB3;
	}

	/**
	 * @return the section1B4
	 */
	public String getSection1B4() {
		return section1B4;
	}

	/**
	 * @param section1b4 the section1B4 to set
	 */
	public void setSection1B4(String section1b4) {
		section1B4 = section1b4;
	}

	/**
	 * @return the effectivenessOfB4
	 */
	public String getEffectivenessOfB4() {
		return effectivenessOfB4;
	}

	/**
	 * @param effectivenessOfB4 the effectivenessOfB4 to set
	 */
	public void setEffectivenessOfB4(String effectivenessOfB4) {
		this.effectivenessOfB4 = effectivenessOfB4;
	}

	/**
	 * @return the section1C
	 */
	public String getSection1C() {
		return section1C;
	}

	/**
	 * @param section1c the section1C to set
	 */
	public void setSection1C(String section1c) {
		section1C = section1c;
	}

	/**
	 * @return the section1D1
	 */
	public String getSection1D1() {
		return section1D1;
	}

	/**
	 * @param section1d1 the section1D1 to set
	 */
	public void setSection1D1(String section1d1) {
		section1D1 = section1d1;
	}

	/**
	 * @return the section1D2
	 */
	public String getSection1D2() {
		return section1D2;
	}

	/**
	 * @param section1d2 the section1D2 to set
	 */
	public void setSection1D2(String section1d2) {
		section1D2 = section1d2;
	}

	/**
	 * @return the section1F1
	 */
	public String getSection1F1() {
		return section1F1;
	}

	/**
	 * @param section1f1 the section1F1 to set
	 */
	public void setSection1F1(String section1f1) {
		section1F1 = section1f1;
	}

	/**
	 * @return the section1F2ONE
	 */
	public String getSection1F2ONE() {
		return section1F2ONE;
	}

	/**
	 * @param section1f2one the section1F2ONE to set
	 */
	public void setSection1F2ONE(String section1f2one) {
		section1F2ONE = section1f2one;
	}

	/**
	 * @return the section1F2TWO
	 */
	public String getSection1F2TWO() {
		return section1F2TWO;
	}

	/**
	 * @param section1f2two the section1F2TWO to set
	 */
	public void setSection1F2TWO(String section1f2two) {
		section1F2TWO = section1f2two;
	}

	/**
	 * @return the section1F3A
	 */
	public String getSection1F3A() {
		return section1F3A;
	}

	/**
	 * @param section1f3a the section1F3A to set
	 */
	public void setSection1F3A(String section1f3a) {
		section1F3A = section1f3a;
	}

	/**
	 * @return the section1F3B
	 */
	public String getSection1F3B() {
		return section1F3B;
	}

	/**
	 * @param section1f3b the section1F3B to set
	 */
	public void setSection1F3B(String section1f3b) {
		section1F3B = section1f3b;
	}

	/**
	 * @return the section1F3B1
	 */
	public String getSection1F3B1() {
		return section1F3B1;
	}

	/**
	 * @param section1f3b1 the section1F3B1 to set
	 */
	public void setSection1F3B1(String section1f3b1) {
		section1F3B1 = section1f3b1;
	}

	/**
	 * @return the section1F3B2
	 */
	public String getSection1F3B2() {
		return section1F3B2;
	}

	/**
	 * @param section1f3b2 the section1F3B2 to set
	 */
	public void setSection1F3B2(String section1f3b2) {
		section1F3B2 = section1f3b2;
	}

	/**
	 * @return the appraisalYear
	 */
	public String getAppraisalYear() {
		return appraisalYear;
	}

	/**
	 * @param appraisalYear the appraisalYear to set
	 */
	public void setAppraisalYear(String appraisalYear) {
		this.appraisalYear = appraisalYear;
	}

	

	
	
}
