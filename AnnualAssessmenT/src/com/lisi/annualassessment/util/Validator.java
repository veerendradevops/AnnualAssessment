package com.lisi.annualassessment.util;

import java.util.List;

import org.springframework.ui.Model;

import com.lisi.annualassessment.orm.ExemptSection2;
import com.lisi.annualassessment.pojo.LoginUser;

public class Validator {

	public String validateUser(ExemptSection2 exemptorm, Model model, LoginUser loginUser) {

		String message = "";

		if (String.valueOf(loginUser.getFormSubmissionStatus()).equalsIgnoreCase("null")) {

			if (exemptorm.getSkills1() == null) {

				message = "no validation";
				model.addAttribute("imessage", "no validation");
			}

			if (exemptorm.getSkills2() == null) {

				message = "no validation";
				model.addAttribute("imessage", "no validation");
			}
			if (exemptorm.getSkills3() == null) {

				message = "no validation";
				model.addAttribute("imessage", "no validation");
			}
			if (exemptorm.getSkills4() == null) {

				message = "no validation";
				model.addAttribute("imessage", "no validation");
			}
			if (exemptorm.getSkills5() == null) {

				message = "no validation";
				model.addAttribute("imessage", "no validation");
			}
			if (exemptorm.getSkills6() == null) {

				message = "no validation";
				model.addAttribute("imessage", "no validation");
			}
			if (exemptorm.getSkills7() == null) {

				message = "no validation";
				model.addAttribute("imessage", "no validation");
			}
			if (exemptorm.getSkills8() == null) {

				message = "no validation";
				model.addAttribute("imessage", "no validation");
			}
			if (exemptorm.getSkills9() == null) {

				message = "no validation";
				model.addAttribute("imessage", "no validation");
			}
			if (exemptorm.getSkills10() == null) {

				message = "no validation";
				model.addAttribute("imessage", "no validation");
			}
			if (exemptorm.getSelfManagementandLeadership1() == null) {

				message = "no validation";
				model.addAttribute("imessage", "no validation");
			}
			if (exemptorm.getSelfManagementandLeadership2() == null) {

				message = "no validation";
				model.addAttribute("imessage", "no validation");
			}
			if (exemptorm.getSelfManagementandLeadership3() == null) {

				message = "no validation";
				model.addAttribute("imessage", "no validation");
			}
			if (exemptorm.getSelfManagementandLeadership4() == null) {

				message = "no validation";
				model.addAttribute("imessage", "no validation");
			}
			if (exemptorm.getSelfManagementandLeadership5() == null) {

				message = "no validation";
				model.addAttribute("imessage", "no validation");
			}
			if (exemptorm.getSelfManagementandLeadership6() == null) {

				message = "no validation";
				model.addAttribute("imessage", "no validation");
			}
			if (exemptorm.getSelfManagementandLeadership7() == null) {

				message = "no validation";
				model.addAttribute("imessage", "no validation");
			}

		}
		return message;
	}

	public String validateExemptSection(List<ExemptSection2> retrivedata, Model model, LoginUser loginUser) {
		String message = "";
		ExemptSection2 exemptorm = new ExemptSection2();
		for (ExemptSection2 exemptSection2 : retrivedata) {

			System.out.println("exemptSection2 :: " + exemptSection2.getSection2CSummeryStrength());

			if (String.valueOf(loginUser.getFormSubmissionStatus()).equalsIgnoreCase("null")) {

				if (exemptorm.getSection2CSummeryImprovement() == null) {

					message = "no validation";
				}
				if (exemptorm.getSection2CSummeryStrength() == null) {

					message = "no validation";
				}
				if (exemptorm.getSection2DSummeryOfAccomplishmentAndAreasImprovement() == null) {

					message = "no validation";
				}
				if (exemptorm.getSection2EAssessmentcompared() == null) {

					message = "no validation";
				}
				if (exemptorm.getSection2EAssessmentSummary() == null) {

					message = "no validation";
				}

			}

		}
		return message;
	}
}
