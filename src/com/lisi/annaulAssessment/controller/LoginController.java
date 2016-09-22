package com.lisi.annaulAssessment.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import javax.naming.directory.Attributes;
import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;
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
import com.lisi.annaulAssessment.pojo.CensusFormPojo;
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

	// static String employeeStatus;

	@Autowired
	private TMPersonalInformationService tmservice;

	// public static Map<Integer, String> employee;

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

		// loginUser.setUsername("creitz");
		// loginUser.setUsername("jadams");
		List<CensusForm> census = Collections.EMPTY_LIST;

		int clockNumber = 0;

		// "pavan", "P@van@lisi"

		model.addAttribute(new UploadForm());
		log.info(loginUser.getUsername());

		// AD AUTHENTICATION
		boolean isValidUser = authenticateLDAPUser(loginUser.getUsername(), loginUser.getPassword(), ldap.getUrl(),
				ldap.getDomain());

		log.info(isValidUser);
		CensusForm employeeInfo = null;
		if (isValidUser == false) {

			// employee role validation

			log.info("your LDAP account is successfully accessed  ");

			try {
				// uncomment this , we made it for christine..
				// clockNumber =
				// empService.getEmployeeClockNumbers(loginUser.getUsername(),
				// Converters.getCurrentYear());

				clockNumber = Integer.parseInt(loginUser.getUsername().trim());

				// login employee status
				employeeInfo = empService.getLoginEmployeeDetails(Integer.parseInt(loginUser.getUsername().trim()),
						loginUser.getUsername(), Converters.getCurrentYear());

				log.info("employee info");

				// E - Executive
				log.info(employeeInfo.getSalaryIncreaseOrNot());
				// log.info(employeeInfo.get);

				session.setAttribute("employeeForm", employeeInfo.getSalaryIncreaseOrNot());

				// setting the user login clock id
				// LoginController.setLoginClockNumber(String.valueOf((clockNumber)));

				session.setAttribute("loginClockNumber", String.valueOf(clockNumber));

				if (clockNumber != 0) {

					// ExemptEmployeeController.setAnnaylYear(Converters.getCurrentYear());
				}

				log.info("clockNumber");
				log.info(clockNumber);

			} catch (Exception e) {

				if (e.toString().contains("org.hibernate.NonUniqueResultException")) {
					model.addAttribute("wrongUser",
							"<h6 style=color:red>multiple user's found with this username<h6 style=color:red>");
					return "loginScreen";
				} else if (e.toString().contains("NullPointerException")) {
					model.addAttribute("wrongUser", "<h6 style=color:red>user is not existing in the database</h6 >");
					return "loginScreen";

				}
				e.printStackTrace();

			}

			System.out.println(clockNumber);

			List<CensusForm> censusform = empService.getEmployeeRole(Converters.getCurrentYear());

			// List<CensusForm> census =
			// empService.getExemptEmployees(clockNumber);

			Map<Integer, String> employee = new HashMap<Integer, String>();

			Map<Integer, String> supervisor = new HashMap<Integer, String>();

			Map<Integer, String> hrMangager = new HashMap<Integer, String>();

			// fetching roles form the census form..
			for (CensusForm c : censusform) {

				// employee.put(c.getEmpClockNumber(),
				// c.getHierarchy().getEmployeeADName());
				// log.info(c.getEmpfirstName() + "" + c.getEmplastName());

				employee.put(c.getEmpClockNumber(),
						c.getEmpfirstName().substring(0, 1).trim() + "" + c.getEmplastName());

				supervisor.put(c.getSupervisorClockNumber(),
						c.getSupervisorFirstName().substring(0, 1).trim() + "" + c.getSupervisorLasttName());

				hrMangager.put(c.getHrManagerClockNumber(),
						c.getHrManagerFirstName().substring(0, 1).trim() + "" + c.getHrManagerLastName());

			}

			log.info("supervisor role");
			log.info(supervisor.get(clockNumber + " test"));
			log.info(String.valueOf(supervisor.get(clockNumber)));
			if (employeeInfo.getClassification2().contains("Executive")
					&& (String.valueOf(supervisor.get(clockNumber)).isEmpty()
							|| String.valueOf(supervisor.get(clockNumber)).equalsIgnoreCase("null"))) {

				model.addAttribute("wrongUser",
						"<h6 style=color:red>your account is not having access to login..</h6>");

				return "loginScreen";
			}

			webUser.setEmployeeSupervisor("");

			// log.info("supervisor is or not !!");

			// System.out.println(employee.get(clockNumber) + " " + "employee");
			// log.info(employee.get(clockNumber) + " " + "employee");
			// log.info(supervisor.get(clockNumber) + " " + " supervisor");
			// log.info(loginUser.getUsername() + " user name ");

			// columnValue.substring(0, 1).trim() + "" +
			// censusForm.getEmplastName()

			log.info("roles..");
			log.info(employeeInfo.getEmpfirstName());
			// login username
			if (String.valueOf(employee.get(clockNumber)).equalsIgnoreCase(
					employeeInfo.getEmpfirstName().substring(0, 1) + "" + employeeInfo.getEmplastName())) {

				log.info("employee");
				roleBased.append(employeeRole);
			}

			log.info(supervisor.get(clockNumber));
			if (String.valueOf(supervisor.get(clockNumber)).equalsIgnoreCase(
					employeeInfo.getEmpfirstName().substring(0, 1) + "" + employeeInfo.getEmplastName())) {

				log.info("supervisor");

				roleBased.append(supervisorRole);

				census = empService.getExemptEmployees(clockNumber, "exempt", Converters.getCurrentYear());

				double yellowHourlyRate = 0;
				double yellowAnnaulRate = 0;
				int numberOfEmployees = 0;

				System.out.println(census.toString());
				if (census.size() >= 1) {

					for (CensusForm c : census) {
						if (String.valueOf(c.getClassification2()).contains("Executive")
								|| String.valueOf(c.getSalaryIncreaseOrNot()).equalsIgnoreCase("N")) {

						} else {

							System.out.println("for " + c.getCurrentHrlyRate());

							if (String.valueOf(c.getCurrentHrlyRate()).equals("null")
									|| c.getCurrentHrlyRate().isEmpty()) {

							} else {
								yellowHourlyRate += Double.parseDouble(c.getCurrentHrlyRate().trim());
							}

							if (String.valueOf(c.getAnnaulRate()).isEmpty()
									|| String.valueOf(c.getAnnaulRate()).equals("null")) {

							} else {
								yellowAnnaulRate += Double.parseDouble(c.getAnnaulRate().trim());
							}
							numberOfEmployees++;
							System.out.println("yes");

						}
					}

				}
				model.addAttribute("yellowHourlyRate", yellowHourlyRate);
				model.addAttribute("yellowAnnaulRate", yellowAnnaulRate);
				model.addAttribute("numberofemployees", numberOfEmployees);
			}

			System.out.println("role " + roleBased);

			session.setAttribute("employeeRole", roleBased.toString());

			if (roleBased.toString().contains("Supervisor")) {

				// session.setAttribute("loginEmployeeStatus", c.getStatus());

				System.out.println("supervisor");
			} else {// in case of employee
				System.out.println("only employee");
				List<CensusForm> employeeDetails = tmservice.getEmployeeDetails(String.valueOf(clockNumber),
						Converters.getCurrentYear());

				if (employeeDetails.size() == 1) {

					for (CensusForm c : employeeDetails) {

						// LoginController.setEmployeeStatus(c.getStatus());

						// login employee status...
						session.setAttribute("loginEmployeeStatus", c.getStatus());

					}

				} else if (employeeDetails.size() > 1) {

					model.addAttribute("wrongUser",
							"<h6 style=color:red>multiple user's found with this username</h6>");
				}

				model.addAttribute("employeeDetails", employeeDetails);

				// employee role...
				session.setAttribute("onlyEmployee", roleBased.toString());

				// session.setAttribute("", arg1);
				//

				return "exemptEmployee";
			}

			model.addAttribute("empDetails", census);

			// LoginController.setLoginClockNumber(String.valueOf(clockNumber).trim());

			model.addAttribute("clockNumber", clockNumber);
			return "managerScreen";

		} else {

			model.addAttribute("wrongUser",
					"<h6 style=color:red>The username and password you entered don't match</h6>");

			// return "uploadForm";
			return "loginScreen";
		}

	}

	private static boolean authenticateLDAPUser(String name, String password, String url, String domain) {

		System.out.println("authenticate LDAP USER");
		try {
			SearchControls searchControls = getSearchControls();
			// the server, we have created the LDAP configurations.
			DirContext ctx = new InitialDirContext(getAuthenticationInformation(name, password, url, domain));

			// String filter = "(&(sAMAccountName=" + name + "))";

			System.out.println(ctx.getEnvironment());
			try {

				/*
				 * NamingEnumeration<SearchResult> answer =
				 * ctx.search("dc=vtsli,dc=com", filter, searchControls);
				 * 
				 * while (answer.hasMore()) {
				 * 
				 * System.out.println("while loop"); Attributes attrs =
				 * answer.next().getAttributes();
				 * System.out.println(attrs.get("Description"));
				 * System.out.println(attrs.get("mail"));
				 * 
				 * }
				 */
			} catch (Exception e) {

				if (e.getMessage().contains("Unprocessed Continuation Reference(s)")) {
					System.out.println("yes, i got this exception");

					return true;
				} else {

					return false;
				}
			}
			// System.out.println();

			// "ldap://192.168.100.89:389/
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

	public static void main(String[] args) {

		boolean isValidUser = LoginController.authenticateLDAPUser("eBalassanian", "p@van", "ldap://192.168.100.8:389",
				"@vtsli.com");

		System.out.println("boolean " + isValidUser);

	}

	private static SearchControls getSearchControls() {
		SearchControls cons = new SearchControls();
		cons.setSearchScope(SearchControls.SUBTREE_SCOPE);
		String[] attrIDs = { "distinguishedName", "sn", "givenname", "mail", "telephonenumber", "description" };
		cons.setReturningAttributes(attrIDs);
		return cons;
	}
	/*
	 * public static String getEmployeeStatus() { return employeeStatus; }
	 * 
	 * public static void setEmployeeStatus(String employeeStatus) {
	 * LoginController.employeeStatus = employeeStatus; }
	 */

}
