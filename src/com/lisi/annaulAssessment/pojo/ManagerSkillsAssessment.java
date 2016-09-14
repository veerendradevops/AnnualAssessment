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

}
