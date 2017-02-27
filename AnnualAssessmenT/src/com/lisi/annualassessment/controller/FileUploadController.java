package com.lisi.annualassessment.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lisi.annualassessment.pojo.LoginUser;
import com.lisi.annualassessment.service.EmployeeService;

@Controller
public class FileUploadController {

	private static final Logger log = Logger.getLogger(FileUploadController.class);

	@Autowired
	private LoginUser loginUser;
	
	@Autowired
	private EmployeeService empService;

	@RequestMapping(value = "/uploadForm")
	public String fileUploadForm(@RequestParam("clockNumber") String empClockNumber, Model model, HttpSession session) {

		StringBuffer employeeHirerachy = (StringBuffer) session.getAttribute("employeeRoles");

		if (session.getAttribute("loginClockNumber") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		String employeeRole = employeeHirerachy.toString();

		if (employeeRole.contains("HRGeneralist")) {

			model.addAttribute("hrGeneralist", empClockNumber);

		}

		if (employeeRole.contains("HrManager")) {

			model.addAttribute("hrManager", empClockNumber);
		}

		if (employeeRole.contains("HRAdmin")) {

			model.addAttribute("hrAdmin", empClockNumber);
		}

		String[] disableOrEnableCheckBox = empService.getSalaryReviewStatus(loginUser.getLoginYear().trim());
		model.addAttribute("Torranace", disableOrEnableCheckBox[0]);
		model.addAttribute("CityOFIndustry", disableOrEnableCheckBox[1]);
		model.addAttribute("NorthAmerica", disableOrEnableCheckBox[2]);
		model.addAttribute("loginUser", loginUser);

		return "uploadForm";
	}

}
