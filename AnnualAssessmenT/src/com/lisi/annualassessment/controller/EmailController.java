package com.lisi.annualassessment.controller;

import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.pojo.UploadForm;
import com.lisi.annualassessment.service.EmailNotificationService;
import com.lisi.annualassessment.util.EmailConfig;

@Controller
public class EmailController {
	
	private static final Logger log = Logger.getLogger(EmailController.class);
	
	/*@Autowired
	private EmailNotificationService emailNotificationService;
	
	@RequestMapping(value="/sourceFileUpload",params="sendMail",method=RequestMethod.POST)
	public String getExemptFormDetails(@ModelAttribute(value = "SOURCEFORM") UploadForm form, HttpServletRequest request,
			HttpServletResponse response,Model model,HttpSession session) throws AddressException, MessagingException
	{
	
		
		List<CensusForm> exemptDetailsLisr=emailNotificationService.getExemptFormDetails("exempt","");
	
		for (CensusForm censusForm : exemptDetailsLisr) {
			
			
		String emailIDs =	censusForm.getEmpEmailAddress();
		
		
		EmailConfig.getInstance().sendMail("subject","body",emailIDs,"",emailIDs);
		
			
		}
		addingRoles(model,  session);
		
		return"uploadForm";
	}
	
	
	
	@RequestMapping(value="/sourceFileUpload",params="selectedlocaion",method=RequestMethod.POST)
	public String getMailToFactory(@ModelAttribute(value = "SOURCEFORM") UploadForm form, HttpServletRequest request,
			HttpServletResponse response,Model model,HttpSession session) throws AddressException, MessagingException
	{
	
		
		log.info(form.getAmerica());
		log.info(form.getCoi());
		log.info(form.getTorrance());
		
		
		
		if(form.getAmerica().isEmpty() && form.getCoi().isEmpty() && form.getTorrance().isEmpty()){
			
			return"uploadForm";
		}
		
		List<CensusForm> exemptDetailsLisr=emailNotificationService.getExemptFormDetails("exempt",form);
		
		for (CensusForm censusForm : exemptDetailsLisr) {
			
			
			String emailIDs =	censusForm.getEmpEmailAddress();
			
			
			EmailConfig.getInstance().sendMail("subject","body",emailIDs,"",emailIDs);
			
				
			}
		addingRoles(model,  session);
		
		return"uploadForm";
	}*/
	
	
	public void addingRoles(Model model, HttpSession session) {

		StringBuffer employeeHirerachy = (StringBuffer) session.getAttribute("employeeRoles");

		String employeeRole = employeeHirerachy.toString();

		log.info(employeeRole);

		String clockNumber = (String) session.getAttribute("loginClockNumber");

		if (employeeRole.contains("HRGeneralist")) {

			model.addAttribute("hrGeneralist", clockNumber);
			log.info("Generalist role was added");

		}

		if (employeeRole.contains("HrManager")) {

			model.addAttribute("hrManager", clockNumber);

			log.info("Manager role was added");
		}
		if (employeeRole.contains("HRAdmin")) {

			model.addAttribute("hrAdmin", clockNumber);

			log.info("Admin role was added");
		}

		model.addAttribute("hrDashboard", "Manager");

	}
	
	
	
	
}
