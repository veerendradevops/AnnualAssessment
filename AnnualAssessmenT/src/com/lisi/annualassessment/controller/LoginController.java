package com.lisi.annualassessment.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.directory.Attributes;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.pojo.LDAPDetails;
import com.lisi.annualassessment.pojo.LoginUser;
import com.lisi.annualassessment.pojo.UploadForm;
import com.lisi.annualassessment.pojo.WebUserRole;
import com.lisi.annualassessment.service.EmployeeService;
import com.lisi.annualassessment.service.HRManagerService;
import com.lisi.annualassessment.service.TMPersonalInformationService;
import com.lisi.annualassessment.util.Converters;

@Controller
public class LoginController {

	private static final Logger log = Logger.getLogger(LoginController.class);

	private String employeeRole = "Employee";

	private String supervisorRole = "Supervisor";
	private String hrManager = "HrManager";

	private String hrGeneralist = "HRGeneralist";

	private String hrAdmin = "HRAdmin";

	Map<Integer, String> employee;
	Map<Integer, String> supervisor;
	Map<Integer, String> hrMangager;
	Map<Integer, String> hrGeneraList;

	@Autowired
	private TMPersonalInformationService tmservice;

	@Autowired
	private LoginUser loginUser;

	@Autowired
	private LDAPDetails ldap;

	@Autowired
	private HRManagerController hrdashboard;

	@Autowired
	private HRManagerEmployees hrManagerEmployees;

	private EmployeeService empService;

	public LoginController() {

	}

	@Autowired
	public LoginController(EmployeeService empService) {

		this.empService = empService;

	}

	@RequestMapping(value = "/welcomeLogin", method = RequestMethod.GET)
	public String welcomeLogin(Model model, HttpSession session) {

		// To use Interceptor's, this session is usefull.
		session.setAttribute("active", "active");

		return "loginScreen";
	}

	@RequestMapping(value = "/checkLogin", method = RequestMethod.POST)
	public String checkLogin(@RequestParam("username") String username, @RequestParam("password") String password,
			Model model, HttpSession session) throws AddressException, MessagingException {

		loginUser.setUsername(username);
		loginUser.setPassword(password);

		System.out.println(loginUser.getUsername());

		StringBuffer roleBased = new StringBuffer("");

		List<CensusForm> census = Collections.EMPTY_LIST;

		List<CensusForm> censusform = empService.getEmployeeRole(Converters.getCurrentYear());

		employee = new HashMap<Integer, String>();

		supervisor = new HashMap<Integer, String>();

		hrMangager = new HashMap<Integer, String>();

		hrGeneraList = new HashMap<Integer, String>();

		for (CensusForm c : censusform) {

			System.out.println(String.valueOf(c.getEmpClockNumber()) + "clock" + String.valueOf(c.getEmpfirstName())
					+ "first" + String.valueOf(c.getEmplastName()));
			employee.put(c.getEmpClockNumber(), c.getEmpfirstName().substring(0, 1).trim() + "" + c.getEmplastName());

			supervisor.put(c.getSupervisorClockNumber(),
					c.getSupervisorFirstName().substring(0, 1).trim() + "" + c.getSupervisorLasttName());

			hrMangager.put(c.getHrManagerClockNumber(),
					c.getHrManagerFirstName().substring(0, 1).trim() + "" + c.getHrManagerLastName());

			hrGeneraList.put(c.getHrGeneralistClockNumber(),
					c.getHrGeneralistFirstName().substring(0, 1).trim() + "" + c.getHrGeneralistLastName());

		}

		int clockNumber;

		// "pavan", "P@van@lisi"

		log.info(username);

		// AD AUTHENTICATION
		/*
		 * String[] auth = authenticateLDAPUser(loginUser.getUsername(),
		 * loginUser.getPassword(), ldap.getUrl(), ldap.getDomain());
		 */
		boolean auth = authenticateLDAPUser(username, password, ldap.getUrl(), ldap.getDomain());

		/*
		 * log.info(auth[0]); log.info(auth[1]);
		 * 
		 * auth[1] = auth[1].replace("description: ", "");
		 * 
		 * Boolean authenticationResult = Boolean.valueOf(auth[0]);
		 */
		/*
		 * if(String.valueOf(auth[1]).equalsIgnoreCase("null")
		 * ||String.valueOf(auth[1]).isEmpty()){
		 * 
		 * model.addAttribute("wrongUser",
		 * "<h6 style=color:red>Clock ID is not available at Description</h6>");
		 * 
		 * return "loginScreen"; }
		 */
		CensusForm employeeInfo = null;

		try {
			if (auth == false) {

				// employee role validation

				log.info("your LDAP account is successfully accessed  ");

				try {

					// clockNumber = loginUser.getUsername().trim(); Terminated

					/*
					 * if(Integer.parseInt(auth[1])==0){
					 * 
					 * model.addAttribute("wrongUser",
					 * "<h6 style=color:red>Clock ID is not available at Description</h6>"
					 * );
					 * 
					 * // return "uploadForm"; return "loginScreen"; }
					 */

					// clockNumber = Integer.parseInt(auth[1]);
					clockNumber = Integer.parseInt(username);

					// login employee status
					employeeInfo = empService.getLoginEmployeeDetails(clockNumber, username,
							Converters.getCurrentYear());

					log.info("employee info");

					session.setAttribute("loginClockNumber", String.valueOf(clockNumber));

					loginUser.setClockNumber(String.valueOf(clockNumber));

					model.addAttribute("clockNumber", String.valueOf(clockNumber));

					log.info("clockNumber : " + clockNumber);

					if (employeeInfo == null) {

						model.addAttribute("wrongUser",
								"<h6 style=color:red>user is not existing in the database</h6 >");
						return "loginScreen";

					}

					if (String.valueOf(employeeInfo.geteStatus()).equalsIgnoreCase("Terminated")) {

						model.addAttribute("wrongUser",
								"<h6 style=color:red>user is not having previliges to access</h6 >");
						return "loginScreen";
					}

					session.setAttribute("loginYear", employeeInfo.getAnnaulYear());
					loginUser.setLoginYear(employeeInfo.getAnnaulYear());

					// changes done by Meeravali
					session.setAttribute("exemptOrNonExempt", employeeInfo.getExemptOrNonExempt().trim());

				} catch (Exception e) {

					e.printStackTrace();

					if (e.toString().contains("org.hibernate.NonUniqueResultException")) {
						model.addAttribute("wrongUser",
								"<h6 style=color:red>multiple user's found with this username<h6 style=color:red>");
						return "loginScreen";
					} else if (e.toString().contains("NullPointerException")) {
						model.addAttribute("wrongUser",
								"<h6 style=color:red>user is not existing in the database</h6 >");
						return "loginScreen";

					}
					model.addAttribute("wrongUser",
							"<h6 style=color:red>check your database and Ldap connections</h6 >");
					return "loginScreen";
				}

				log.info("assigning roles to below user.");

				// classification is nothing but jobAttribute eg: executive....
				session.setAttribute("classification", employeeInfo.getClassification2());

				System.out.println(employeeInfo.getClassification2());

				loginUser.setClassification(employeeInfo.getClassification2());

				if (String.valueOf(employeeInfo.getClassification2()).contains("Executive")
						&& (String.valueOf(supervisor.get(clockNumber)).isEmpty()
								|| String.valueOf(supervisor.get(clockNumber)).equalsIgnoreCase("null"))) {

					model.addAttribute("wrongUser",
							"<h6 style=color:red>your account is not having access to login..</h6>");

					return "loginScreen";
				}

				log.info("roles..");
				log.info(employeeInfo.getEmpfirstName());

				if (!(String.valueOf(employee.get(clockNumber)).isEmpty())
						&& (!(String.valueOf(employee.get(clockNumber)).equals("null")))) {

					log.info("employee");

					roleBased.append(employeeRole);
				}

				log.info(supervisor.get(clockNumber));

				if (!(String.valueOf(supervisor.get(clockNumber)).isEmpty())
						&& (!(String.valueOf(supervisor.get(clockNumber)).equals("null")))) {

					log.info("supervisor");

					roleBased.append(supervisorRole);

					census = empService.getExemptEmployees(clockNumber, "exempt", employeeInfo.getAnnaulYear());

				}

				if (employeeInfo.getHrAdmin().equalsIgnoreCase(String.valueOf(clockNumber))) {

					roleBased.append(hrAdmin);

					model.addAttribute("hrAdmin", clockNumber);
				} else if (!(String.valueOf(hrMangager.get(clockNumber)).isEmpty())
						&& (!(String.valueOf(hrMangager.get(clockNumber)).equals("null")))) {

					roleBased.append(hrManager);

					System.out.println("adding hr manager role..");
					model.addAttribute("hrManager", clockNumber);

				}

				else if (!(String.valueOf(hrGeneraList.get(clockNumber)).isEmpty())
						&& (!(String.valueOf(hrGeneraList.get(clockNumber)).equals("null")))) {

					roleBased.append(hrGeneralist);

					System.out.println("adding hr Generalist role..");
					model.addAttribute("hrGeneralist", clockNumber);

				}

				log.info("getHRAdmin :: " + employeeInfo.getHrAdmin() + "==== " + String.valueOf(clockNumber));

				session.setAttribute("employeeRoles", roleBased);

				loginUser.setRoles(roleBased.toString());

				// hr manager.. if loop

				System.out.println("role " + roleBased);

				// roles of the employee..
				// session.setAttribute("employeeRole", roleBased.toString());

				if (roleBased.toString().contains(hrManager)) {

					session.setAttribute("employeeForm", employeeInfo.getSalaryIncreaseOrNot());

					loginUser.setEmployeeForm(employeeInfo.getSalaryIncreaseOrNot());

				} else if (roleBased.toString().contains(hrGeneralist)) {

					log.info("fetching hrGeneralist details");
					session.setAttribute("employeeForm", employeeInfo.getSalaryIncreaseOrNot());

					loginUser.setEmployeeForm(employeeInfo.getSalaryIncreaseOrNot());

				}

				if (roleBased.toString().contains("Supervisor")) {

					System.out.println("being supervisor");
					System.out.println(employeeInfo.getSalaryIncreaseOrNot());

					session.setAttribute("employeeForm", employeeInfo.getSalaryIncreaseOrNot());

					loginUser.setEmployeeForm(employeeInfo.getSalaryIncreaseOrNot());
					System.out.println("supervisor");

					model.addAttribute("employeeDetails", census);

				} else if ((!roleBased.toString().contains(supervisorRole))
						&& (!roleBased.toString().contains(hrManager)) && (!roleBased.toString().contains(hrGeneralist))
						&& (!roleBased.toString().contains(hrAdmin))) {

					if (roleBased.toString().contains(employeeRole)) {
						// in case of employee
						System.out.println("only employee");
						List<CensusForm> employeeDetails = tmservice.getEmployeeDetails(String.valueOf(clockNumber),
								employeeInfo.getAnnaulYear());

						if (employeeDetails.size() == 1) {

							for (CensusForm c : employeeDetails) {

								session.setAttribute("loginEmployeeStatus", c.getStatus());

								if (c.getExemptOrNonExempt().equalsIgnoreCase("non-Exempt")) {

									model.addAttribute("wrongUser",
											"<h6 style=color:red>not eligible for appriasal</h6>");
									return "loginScreen";
								}

							}

						} else if (employeeDetails.size() > 1) {

							model.addAttribute("wrongUser",
									"<h6 style=color:red>multiple user's found with this username</h6>");
						}

						model.addAttribute("employeeDetails", employeeDetails);

						// employee role...
						session.setAttribute("onlyEmployee", roleBased.toString());

						loginUser.setRoles(roleBased.toString());

						model.addAttribute("loginUser", loginUser);
						session.setAttribute("onlyHr", roleBased.toString());
						return "exemptEmployee";

					}
				}

				model.addAttribute("clockNumber", clockNumber);

				if (roleBased.toString().contains(hrGeneralist)) {

					System.out.println("HR GENERALIST IN LOGIN CONTROLLER");
					hrdashboard.hrGeneralistEmployees(String.valueOf(clockNumber), model);
					model.addAttribute("loginUser", loginUser);
					return "hrDashboard";

				}

				if (roleBased.toString().contains(hrManager)) {

					System.out.println("HR MANAGER IN LOGIN CONTROLLER");

					hrdashboard.hrManagerEmployees(String.valueOf(clockNumber), model);
					model.addAttribute("loginUser", loginUser);
					return "hrDashboard";

				}
				if (roleBased.toString().contains(hrAdmin)) {

					System.out.println("HR ADMIN IN LOGIN CONTROLLER");

					hrManagerEmployees.getHREmployeeList(String.valueOf(clockNumber), model, session);
					model.addAttribute("loginUser", loginUser);
					return "hrDashboard";

				}

				model.addAttribute("loginUser", loginUser);

				return "managerScreen";

			} else {

				model.addAttribute("wrongUser",
						"<h6 style=color:red>The username and password you entered don't match</h6>");

				// return "uploadForm";
				return "loginScreen";
			}
		} catch (Exception e) {

			e.printStackTrace();
			model.addAttribute("wrongUser", "<h6 style=color:red>You have a problem with your login credentials.</h6>");

			// return "uploadForm";
			return "loginScreen";

		}

	}

	// private static String[] authenticateLDAPUser(String name, String
	// password, String url, String domain) {

	private static boolean authenticateLDAPUser(String name, String password, String url, String domain) {

		System.out.println("authenticate LDAP USER");
		String[] authentication = new String[2];
		try {

			SearchControls searchControls = getSearchControls();
			// the server, we have created the LDAP configurations.
			DirContext ctx = new InitialDirContext(getAuthenticationInformation(name, password, url, domain));

			String filter = "(&(sAMAccountName=" + name + "))";

			System.out.println(ctx.getEnvironment());
			try {

				/*
				 * NamingEnumeration<SearchResult> answer =
				 * ctx.search("dc=vtsli,dc=com", filter, searchControls);
				 * 
				 * // ctx.search("dc=open,dc=liae,dc=lisi", filter,
				 * searchControls);
				 * 
				 * //ctx.search("dc="+url+",dc="+domain, filter,
				 * searchControls); while (answer.hasMore()) {
				 * 
				 * System.out.println("while loop"); Attributes attrs =
				 * answer.next().getAttributes();
				 * System.out.println(attrs.get("Description"));
				 * System.out.println(attrs.get("mail"));
				 * 
				 * 
				 * authentication[1]=String.valueOf(attrs.get("Description")); }
				 */

			} catch (Exception e) {

				if (e.getMessage().contains("Unprocessed Continuation Reference(s)")) {
					System.out.println("description exception.");

					authentication[0] = "true";

					// return true;
				} else {

					authentication[0] = "false";
					return false;
				}
			}

			ctx.close();

			return true;
			// authentication[0]="true";
		} catch (Exception e) {

			log.info(e.getMessage());

			return false;
			// authentication[0]="false";
			// authentication[1]="0";
		}

		// authentication[0]="true";

		// return true;
		// return authentication;
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

	public TMPersonalInformationService getTmservice() {
		return tmservice;
	}

	public void setTmservice(TMPersonalInformationService tmservice) {
		this.tmservice = tmservice;
	}

	public static void main(String[] args) {

		/*
		 * boolean isValidUser =
		 * LoginController.authenticateLDAPUserTest("eBalassanian", "p@van",
		 * "ldap://192.168.100.8:389", "@vtsli.com");
		 * 
		 * System.out.println("boolean " + isValidUser);
		 */
	}

	private static SearchControls getSearchControls() {
		SearchControls cons = new SearchControls();
		cons.setSearchScope(SearchControls.SUBTREE_SCOPE);
		String[] attrIDs = { "distinguishedName", "sn", "givenname", "mail", "telephonenumber", "description" };
		cons.setReturningAttributes(attrIDs);
		return cons;
	}

}
