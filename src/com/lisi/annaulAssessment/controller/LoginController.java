package com.lisi.annaulAssessment.controller;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lisi.annaualAssessment.orm.CensusForm;
import com.lisi.annaulAssessment.pojo.CensusFormFields;
import com.lisi.annaulAssessment.pojo.LDAPDetails;
import com.lisi.annaulAssessment.pojo.LoginUser;
import com.lisi.annaulAssessment.pojo.UploadForm;
import com.lisi.annaulAssessment.pojo.WebUserRole;
import com.lisi.annaulAssessment.service.EmployeeService;
import com.lisi.annaulAssessment.service.TMPersonalInformationService;
import com.lisi.annaulAssessment.util.Converters;

@Controller
public class LoginController {

	private static final Logger log = Logger.getLogger(LoginController.class);

	private String employeeRole = "Employee";

	private String supervisorRole = "Supervisor";

	
	
	@Autowired
	private TMPersonalInformationService tmservice;
	
//	public static Map<Integer, String> employee;
	
	public static String loginClockNumber;
	

	@Autowired
	private LDAPDetails ldap;

	@Autowired
	private EmployeeService empService;

	@RequestMapping(value = "/welcomeLogin", method = RequestMethod.GET)
	public String welcomeLogin(Model model) {

		// model.addAttribute(new LoginUser());
		log.info("welcomeLogin + user");

		return "loginScreen";
	}

	@SuppressWarnings("null")
	@RequestMapping(value = "/checkLogin", method = RequestMethod.POST)
	public String checkLogin(@ModelAttribute("loginUser") LoginUser loginUser, BindingResult br, Model model,
			HttpSession session) {

		WebUserRole webUser = new WebUserRole();
		StringBuffer roleBased = new StringBuffer("");
		log.info(ldap.getDomain());

		List<CensusForm> census = null;
		int clockNumber = 0;

		// "pavan", "P@van@lisi"

		model.addAttribute(new UploadForm());
		log.info(loginUser.getUsername());
		boolean isValidUser = authenticateLDAPUser(loginUser.getUsername(), loginUser.getPassword(), ldap.getUrl(),
				ldap.getDomain());
		

		log.info(isValidUser);

		if (isValidUser == true) {

			// employee role validation

			log.info("true              + ");

			try {

				clockNumber = empService.getEmployeeClockNumbers(loginUser.getUsername());

				LoginController.setLoginClockNumber(String.valueOf((clockNumber)));
				if(clockNumber!=0){
					
					ExemptEmployeeController.setAnnaylYear(Converters.getCurrentYear());
				}
				
				log.info(clockNumber);
				
			} catch (Exception e) {

				if (e.toString().contains("org.hibernate.NonUniqueResultException")) {
					model.addAttribute("wrongUser", "multiple user's found with this username");
					return "loginScreen";
				}else if(e.toString().contains("NullPointerException")){
					model.addAttribute("wrongUser", "user is not existing in the database");
					return "loginScreen";
					
				}
				
			}
		
			System.out.println(clockNumber);

			List<CensusForm> censusform = empService.getEmployeeRole();

			// List<CensusForm> census =
			// empService.getExemptEmployees(clockNumber);

			Map<Integer, String> employee = new HashMap<Integer, String>();

			Map<Integer, String> supervisor = new HashMap<Integer, String>();

			Map<Integer, String> hrMangager = new HashMap<Integer, String>();

			for (CensusForm c : censusform) {

//				employee.put(c.getEmpClockNumber(), c.getHierarchy().getEmployeeADName());
		//		log.info(c.getEmpfirstName() + "" + c.getEmplastName());
				
			
				
				employee.put(c.getEmpClockNumber(), c.getEmpfirstName().substring(0,1).trim() + "" + c.getEmplastName());

				supervisor.put(c.getSupervisorClockNumber(),
						c.getSupervisorFirstName().substring(0, 1).trim() + "" + c.getSupervisorLasttName());

				hrMangager.put(c.getHrManagerClockNumber(),
						c.getHrManagerFirstName().substring(0, 1).trim() + "" + c.getHrManagerLastName());

			}

			webUser.setEmployeeSupervisor("");

			// log.info("supervisor is or not !!");

	//		System.out.println(employee.get(clockNumber) + " " + "employee");
	//		log.info(employee.get(clockNumber) + " " + "employee");
	//		log.info(supervisor.get(clockNumber) + " " + " supervisor");
	//		log.info(loginUser.getUsername() + " user name ");

			if (String.valueOf(employee.get(clockNumber)).equalsIgnoreCase(loginUser.getUsername())) {

				log.info("employee");
				roleBased.append(employeeRole);
			}

		
			
			if (String.valueOf(supervisor.get(clockNumber)).equalsIgnoreCase(loginUser.getUsername())) {

				log.info("supervisor");
				
				roleBased.append(supervisorRole);

				census = empService.getExemptEmployees(clockNumber);

			}

			System.out.println("role " + roleBased);

			session.setAttribute("employeeRole", roleBased.toString());
			
			if(roleBased.toString().contains("Supervisor")){
				
				
			}else{
				
				List<CensusForm> employeeDetails = tmservice.getEmployeeDetails(String.valueOf(clockNumber));
				ExemptEmployeeController.setClockNumber(String.valueOf(clockNumber));

				model.addAttribute("employeeDetails", employeeDetails);

				session.setAttribute("onlyEmployee", roleBased.toString());

				return "exemptEmployee";
			}

			model.addAttribute("empDetails", census);
			
			LoginController.setLoginClockNumber(String.valueOf(clockNumber).trim());
			
			model.addAttribute("clockNumber",clockNumber );
			return "managerScreen";

		} else {

			model.addAttribute("wrongUser", "The username and password you entered don't match");
			/*
			 * List<CensusForm> census = empServie.listEmps();
			 * 
			 * log.info("false"); for (CensusForm c : census) {
			 * 
			 * log.info(c.getEmpClockNumber()); }
			 * 
			 * model.addAttribute("empDetails", census);
			 */
			// user login fail condition
			// return "supervisorDashboard";
			return "uploadForm";
		}

	}

	private static boolean authenticateLDAPUser(String name, String password, String url, String domain) {

		try {

			// the server, we have created the LDAP configurations.
			DirContext ctx = new InitialDirContext(getAuthenticationInformation(name, password, url, domain));

			// "ldap://192.168.100.89:389/"
			ctx.close();
			return true;
		} catch (Exception e) {

			log.info(e.getMessage());

		}

		return false;
	}

	// authentication information.
	private static Hashtable getAuthenticationInformation(String name, String password, String providerURL,
			String domain) {
		Hashtable env = new Hashtable(11);
		env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
		env.put(Context.PROVIDER_URL, providerURL);
		env.put(Context.SECURITY_AUTHENTICATION, "simple");
		env.put(Context.SECURITY_PRINCIPAL, name + domain);
		env.put(Context.SECURITY_CREDENTIALS, password);
		return env;
	}

	public static String getLoginClockNumber() {
		return loginClockNumber;
	}

	public static void setLoginClockNumber(String loginClockNumber) {
		LoginController.loginClockNumber = loginClockNumber;
	}

	public TMPersonalInformationService getTmservice() {
		return tmservice;
	}

	public void setTmservice(TMPersonalInformationService tmservice) {
		this.tmservice = tmservice;
	}

	
	
	
}
