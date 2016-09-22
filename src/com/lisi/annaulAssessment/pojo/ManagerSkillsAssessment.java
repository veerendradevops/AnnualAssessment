package com.lisi.annaulAssessment.pojo;

import java.util.List;

import com.lisi.annaualAssessment.orm.ExemptSection2;

/**
 * @author manikanta.b
 *
 */
public class ManagerSkillsAssessment {

	public ExemptSection2 setFields(ExemptSection2 commaSeperatedValues, String t, int i) {
		if (i == 0) {

			commaSeperatedValues.setSkills1(t);	

		}
		if (i == 1) {
			commaSeperatedValues.setSkills2(t);
		}
		if (i == 2) {
			commaSeperatedValues.setSkills3(t);
		}
		if (i == 3) {
			commaSeperatedValues.setSkills4(t);
		}
		if (i == 4) {
			commaSeperatedValues.setSkills5(t);
		}
		if (i == 5) {
			commaSeperatedValues.setSkills6(t);
		}
		if (i == 6) {
			commaSeperatedValues.setSkills7(t);
		}
		if (i == 7) {
			commaSeperatedValues.setSkills8(t);
		}
		if (i == 8) {
			commaSeperatedValues.setSkills9(t);
		}
		if (i == 9) {
			commaSeperatedValues.setSkills10(t);
		}

		return commaSeperatedValues;
	}
	public ExemptSection2 setFieldsForwaysOfWorking(ExemptSection2 commaSeperatedValues,String t, int i){
		
		if(i==0){
			commaSeperatedValues.setWaysOfWorking1(t);
		}
		if(i==1){
			commaSeperatedValues.setWaysOfWorking2(t);
		}
		if(i==2){
			commaSeperatedValues.setWaysOfWorking3(t);
		}
		if(i==3){
			commaSeperatedValues.setWaysOfWorking4(t);
		}
		if(i==4){
			commaSeperatedValues.setWaysOfWorking5(t);
		}
		if(i==5){
			commaSeperatedValues.setWaysOfWorking6(t);
		}
		if(i==6){
			commaSeperatedValues.setWaysOfWorking7(t);
		}
		return commaSeperatedValues;
		
	}
public ExemptSection2 setFieldsForSelfManagementandLeadership(ExemptSection2 commaSeperatedValues,String t, int i){
	if(i==0){
		commaSeperatedValues.setSelfManagementandLeadership1(t);
	}
	if(i==1){
		commaSeperatedValues.setSelfManagementandLeadership2(t);
	}
	if(i==2){
		commaSeperatedValues.setSelfManagementandLeadership3(t);
	}
	if(i==3){
		commaSeperatedValues.setSelfManagementandLeadership4(t);
	}
	if(i==4){
		commaSeperatedValues.setSelfManagementandLeadership5(t);
	}
	if(i==5){
		commaSeperatedValues.setSelfManagementandLeadership6(t);
	}
	if(i==6){
		commaSeperatedValues.setSelfManagementandLeadership7(t);
	}
	return commaSeperatedValues;
}

}
