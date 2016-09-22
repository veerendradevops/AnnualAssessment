package com.lisi.annaulAssessment.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lisi.annaualAssessment.orm.CensusForm;
import com.lisi.annaulAssessment.service.EmployeeService;
import com.lisi.annaulAssessment.util.Converters;

@Controller
public class LogoutController {

	@Autowired
	private EmployeeService empService;

	@RequestMapping(value = "/logout")
	public String logoutController(Model model, HttpSession session) {

		session.invalidate();

		return "loginScreen";
	}

	@RequestMapping(value = "/back")
	public String backController(Model model, HttpSession session) {

		List<CensusForm> census = Collections.EMPTY_LIST;

		String clockNumber = (String) session.getAttribute("loginClockNumber");

		census = empService.getExemptEmployees(Integer.parseInt(clockNumber.trim()), "exempt",
				Converters.getCurrentYear());

		double yellowHourlyRate = 0;
		double yellowAnnaulRate = 0;
		int numberOfEmployees = 0;

		for (CensusForm c : census) {

			if (c.getCurrentHrlyRate().isEmpty()) {

			} else {
				yellowHourlyRate += Double.parseDouble(c.getCurrentHrlyRate().trim());
			}

			/*if (c.getAnnaulRate().isEmpty()) {

			} else {
				yellowAnnaulRate += Double.parseDouble(c.getAnnaulRate().trim());
			}*/
			numberOfEmployees++;
			System.out.println("yes");
		}

		model.addAttribute("yellowHourlyRate", yellowHourlyRate);
		model.addAttribute("yellowAnnaulRate", yellowAnnaulRate);
		model.addAttribute("numberofemployees", (numberOfEmployees-1));

		model.addAttribute("empDetails", census);

		return "managerScreen";

	}

}
