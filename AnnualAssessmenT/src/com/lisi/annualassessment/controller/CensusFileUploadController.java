package com.lisi.annualassessment.controller;

import java.io.ByteArrayOutputStream; 
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.lisi.annualassessment.emp.form.EncryptDecryptProcess;
import com.lisi.annualassessment.emp.form.UpdateEmployeeStatus;
import com.lisi.annualassessment.emp.form.XLSXFormValidation;
import com.lisi.annualassessment.orm.AppraisalMailConfig;
import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.orm.Disciplinary;
import com.lisi.annualassessment.orm.Hierarchy;
import com.lisi.annualassessment.pojo.ClockNumbers;
import com.lisi.annualassessment.pojo.LoginUser;
import com.lisi.annualassessment.pojo.UploadForm;
import com.lisi.annualassessment.service.EmailNotificationService;
import com.lisi.annualassessment.service.EmployeeService;
import com.lisi.annualassessment.service.NonExemptEmployeeService;
import com.lisi.annualassessment.service.TMPersonalInformationService;
import com.lisi.annualassessment.service.UploadFormService;
import com.lisi.annualassessment.util.EmailConfig;

@Controller
public class CensusFileUploadController {

	private static final Logger log = Logger.getLogger(CensusFileUploadController.class);

	@Autowired
	private UploadFormService uploadFormService;



	@Autowired
	private LoginUser loginUser;

	@Autowired
	private EmployeeService empService;

	@Autowired
	private NonExemptEmployeeService nonExemptService;

	public static Set<String> clockNumbers;

	public static Set<String> supervisor = new HashSet<String>();

	public static Set<String> hrManager = new HashSet<String>();

	public static Set<String> hrGeneralist = new HashSet<String>();

	public static Set<String> hrAdmin = new HashSet<String>();

	public static Set<String> employee = new HashSet<String>();

	// public int errorCount = 1;

	public int errorHead = 0;
	public static String cellOneErrorMessage;

	public static String cellTwoErrorMessage = "";

	public static String firstName;

	public static String lastName;

	public String rowDead = "";

	@RequestMapping(value = "sourceFileUpload", params = "upload", method = RequestMethod.POST)
	public ModelAndView uploadFile(@ModelAttribute(value = "SOURCEFORM") UploadForm form, HttpServletRequest request,
			HttpServletResponse response, Model model, HttpSession session) throws IOException {

		log.info("uploadController");
		if (session.getAttribute("loginClockNumber") != null) {
			System.out.println("is Not Null");
		} else {

			return new ModelAndView("loginScreen");
		}

		int errorCount = 1;

		String loginYear = (String) session.getAttribute("loginYear");

		String clockNumber = (String) session.getAttribute("loginClockNumber");

		CensusForm employeeDetails = empService.getLoginEmployeeDetails(Integer.parseInt(clockNumber), clockNumber,
				loginYear.trim());

		System.out.println("upload year" + form.getUploadYear());
		List<Integer> dbEmp = empService.getEmployees(form.getUploadYear().trim());

		System.out.println(dbEmp.size() + " db employee size ");

		String s = request.getParameter("dest");
		System.out.println(dbEmp);
		System.out.println(s + " loc");

		// if (!result.hasErrors()) {
		synchronized (this) {

			CommonsMultipartFile multiPartFile = form.getFile();

			if (multiPartFile.isEmpty()) {

				addingRoles(model, session);

				return new ModelAndView("uploadForm", "errorMsg", "please pick a file and upload.");
			}

			String orginalName = multiPartFile.getOriginalFilename();

			CommonsMultipartFile destinationFile = form.getDestinationlocation();

			if (orginalName.contains(".xlsx")) {

			} else {

				addingRoles(model, session);
				model.addAttribute("loginUser", loginUser);
				return new ModelAndView("uploadForm", "errorMsg", "please upload a valid .xlsx file");

			}

			System.out.println("file content");

			String fileExtension = FilenameUtils.getExtension(multiPartFile.getName());
			System.out.println(fileExtension);
			System.out.println(multiPartFile.getName().lastIndexOf("xlsx"));

			if (multiPartFile.getName() != null) {
				log.info("if");

				orginalName = multiPartFile.getName();

				log.info(orginalName + " org");

			}

			ServletContext servletContext = request.getSession().getServletContext();
			File reportTempDirectory = (File) servletContext.getAttribute("javax.servlet.context.tempdir");

			String errorfilePath = System.getProperty("java.io.tmpdir") + "/" + orginalName;
			String errorReportName = "Error Report";
			Calendar currentDate = Calendar.getInstance();
			int currentYear = currentDate.get(Calendar.YEAR);
			int currentMonth = currentDate.get(Calendar.MONTH) + 1;
			int currentDay = currentDate.get(Calendar.DAY_OF_MONTH) + 1;
			int currentHour = currentDate.get(Calendar.HOUR_OF_DAY);
			int currentMin = currentDate.get(Calendar.MINUTE) + 1;
			int currentSecond = currentDate.get(Calendar.SECOND) + 1;
			errorfilePath = errorReportName + "-" + currentYear + "-" + currentMonth + "-" + currentDay + "-"
					+ currentHour + "-" + currentMin + "-" + currentSecond + ".xls";

			String errorfile = errorReportName + "-" + currentYear + "-" + currentMonth + "-" + currentDay + "-"
					+ currentHour + "-" + currentMin + "-" + currentSecond + ".xls";

			String filePath = System.getProperty("java.io.tmpdir") + "/" + orginalName;
			File destination = new File(filePath);
			multiPartFile.transferTo(destination);

			HSSFWorkbook workbook = new HSSFWorkbook();
			HSSFSheet worksheet = workbook.createSheet("census Report data");

			File filePath1 = new File(destination.getAbsolutePath());

			FileInputStream fis = new FileInputStream(filePath1);
			// Finds the workbook instance for XLSX file
			XSSFWorkbook wb = new XSSFWorkbook(fis);

			// Return first sheet from the XLSX workbook
			Sheet sheet = wb.getSheetAt(0);

			Map<String, String> dataHeaderMap = new HashMap<String, String>();

			ArrayList<CensusForm> censusFormList = new ArrayList<CensusForm>();
			// Get iterator to all the rows in current sheet
			Iterator<Row> rowIterator = sheet.iterator();
			Iterator<Row> clockIterator = sheet.iterator();

			String errorClockNumber = "";
			// Iterator<Row> delExistingClock=sheet.iterator();

			// Total number of records.
			int rowsCount = sheet.getLastRowNum();

			clockNumbers = getSuperviousHrclockNumbers(clockIterator);

			log.info(clockNumbers);

			try {
				// log.info("after clock nums");
				while (rowIterator.hasNext()) {
					Row row = rowIterator.next();

					cellTwoErrorMessage = "";

					CensusForm censusForm = new CensusForm();
					Hierarchy hierarchy = new Hierarchy();
					Disciplinary disciplinary = new Disciplinary();

					rowDead = " ";
					Iterator<Cell> cellIterator = row.cellIterator();
					// HSSFRow errorHeader = worksheet.createRow((int) 0);
					while (cellIterator.hasNext()) {

						Cell cell = cellIterator.next();
						if (cell.getRowIndex() < 1) {
							dataHeaderMap.put("" + cell.getRowIndex() + "" + cell.getColumnIndex(),
									cell.getStringCellValue());

							System.out.println(cell.getColumnIndex() + " : " + cell.getStringCellValue());

							censusForm = null;

						} else {

							switch (cell.getCellType()) {

							case Cell.CELL_TYPE_STRING:

								censusForm = XLSXFormValidation.setCensusFormFields(censusForm, hierarchy, disciplinary,
										dataHeaderMap.get(0 + "" + cell.getColumnIndex()), cell.getStringCellValue());

								break;
							case Cell.CELL_TYPE_NUMERIC:

								if (DateUtil.isCellDateFormatted(cell)) {

									censusForm = XLSXFormValidation.setCensusFormFields(censusForm, hierarchy,
											disciplinary, dataHeaderMap.get(0 + "" + cell.getColumnIndex()),
											cell.getDateCellValue() + "");

								} else {

									if (cell.getColumnIndex() == 0) {

										if (dbEmp.contains(Integer.parseInt(
												XLSXFormValidation.replaceDotZeros(cell.getNumericCellValue() + "")))) {

										}
									}

									// System.out.println("min call");
									censusForm = XLSXFormValidation.setCensusFormFields(censusForm, hierarchy,
											disciplinary, dataHeaderMap.get(0 + "" + cell.getColumnIndex()),
											cell.getNumericCellValue() + "");
								}
								break;
							case Cell.CELL_TYPE_BOOLEAN:

								censusForm = XLSXFormValidation.setCensusFormFields(censusForm, hierarchy, disciplinary,
										dataHeaderMap.get(0 + "" + cell.getColumnIndex()),
										cell.getBooleanCellValue() + "");
								break;

							case Cell.CELL_TYPE_BLANK:

								censusForm = XLSXFormValidation.setCensusFormFields(censusForm, hierarchy, disciplinary,
										dataHeaderMap.get(0 + "" + cell.getColumnIndex()), cell.getStringCellValue());

								break;

							default:

							}

							if (censusForm == null) {
								log.info("censusform is null");

								rowDead = "i am holding null data";

								censusForm = new CensusForm();

							}
						}

					}
					if (rowDead.equals("i am holding null data")) {

						log.info("row dead ");
						HSSFRow errorHeader = worksheet.createRow((int) 0);

						HSSFRow errorRow = worksheet.createRow((int) errorCount);
						HSSFCell firstCell;
						HSSFCell secondCell;
						HSSFCell thirdCell;
						HSSFCell fourthCell;

						firstCell = errorHeader.createCell((int) 0);
						firstCell.setCellValue("Clock Number");
						secondCell = errorHeader.createCell((int) 1);
						secondCell.setCellValue("First Name");
						thirdCell = errorHeader.createCell((int) 2);
						thirdCell.setCellValue("Last Name");
						fourthCell = errorHeader.createCell((int) 3);
						fourthCell.setCellValue("Error Message");
						// }

						firstCell = errorRow.createCell((int) 0);
						firstCell.setCellValue(cellOneErrorMessage);
						secondCell = errorRow.createCell((int) 1);
						secondCell.setCellValue(firstName);
						thirdCell = errorRow.createCell((int) 2);
						thirdCell.setCellValue(lastName);
						thirdCell = errorRow.createCell((int) 3);
						thirdCell.setCellValue(cellTwoErrorMessage);
						log.info(cellOneErrorMessage);
						log.info(cellTwoErrorMessage + " clock number for error employee");
						log.info("row Dead " + cellTwoErrorMessage);
						errorCount++;
						errorHead++;
						censusForm = null;

					}

					if (censusForm != null) {

						System.out.println("database insertion");
						System.out.println(censusForm.getMinValue());
						log.info("min in controller");
						log.info(censusForm.getMinValue());

						if (String.valueOf(censusForm.getMinValue()).equalsIgnoreCase("null")) {

							String minEncrypt = EncryptDecryptProcess.encryptTechnique("0.00");
							censusForm.setMinValue(minEncrypt);
						} else {

						}
						if (String.valueOf(censusForm.getMidValue()).equalsIgnoreCase("null")) {
							String midEncrypt = EncryptDecryptProcess.encryptTechnique("0.00");
							censusForm.setMidValue(midEncrypt);
						} else {

						}
						if (String.valueOf(censusForm.getMaxValue()).equalsIgnoreCase("null")) {
							String maxEncrypt = EncryptDecryptProcess.encryptTechnique("0.00");

							censusForm.setMaxValue(maxEncrypt);
						} else {

						}
						if (String.valueOf(censusForm.getCurrentHrlyRate()).equalsIgnoreCase("null")) {

							String currentHrlyRateEncrypt = EncryptDecryptProcess.encryptTechnique("0.00");

							censusForm.setCurrentHrlyRate(currentHrlyRateEncrypt);
							censusForm.setNextYearHourlyRate(currentHrlyRateEncrypt);
						}
						if (String.valueOf(censusForm.getAnnaulRate()).equalsIgnoreCase("null")) {

							String annualRateEncrypt = EncryptDecryptProcess.encryptTechnique("0.00");

							censusForm.setAnnaulRate(annualRateEncrypt);
							censusForm.setNextYearAnnualRate(annualRateEncrypt);
						}
						if (String.valueOf(censusForm.getPercentageOfIncrease()).equalsIgnoreCase("null")) {

							// String annualRateEncrypt =
							// EncryptDecryptProcess.encryptTechnique("0.00");

							censusForm.setPercentageOfIncrease("0.00");

						}

						censusFormList.add(censusForm);

						censusForm.setAnnaulYear(form.getUploadYear());
						censusForm.setStatus("Not Started");

						Date todayDate = new Date();
						if (censusForm.getEmpClockNumber() == 0) {

							// if the clock is zero.

						} else if (dbEmp.contains(censusForm.getEmpClockNumber())) { // to
							// update
							// the
							// user...

							// uploadFormService.fetchCensusForm(censusForm.getEmpClockNumber(),Converters.getCurrentYear());

							CensusForm census = empService.getLoginEmployeeDetails(censusForm.getEmpClockNumber(), "",
									form.getUploadYear().trim());

							String status = UpdateEmployeeStatus.validateUser(censusForm, census);

							System.out.println("came to update ------------------------");

							if (status.equalsIgnoreCase("new record")) {
								uploadFormService.updateEmployeeDetails(censusForm);

								HSSFRow errorHeader = worksheet.createRow((int) 0);

								HSSFRow errorRow = worksheet.createRow((int) errorCount);
								HSSFCell firstCell;
								HSSFCell secondCell;
								HSSFCell thirdCell;
								HSSFCell fourthCell;

								firstCell = errorHeader.createCell((int) 0);
								firstCell.setCellValue("Clock Number");
								secondCell = errorHeader.createCell((int) 1);
								secondCell.setCellValue("First Name");
								thirdCell = errorHeader.createCell((int) 2);
								thirdCell.setCellValue("Last Name");
								fourthCell = errorHeader.createCell((int) 3);
								fourthCell.setCellValue("Error Message");
							} else {

							}

						}

						else {

							censusForm.setCompletedDate(todayDate.toString());
							hierarchy.setApprisalYear(form.getUploadYear().trim());

							/*
							 * if
							 * (hrAdmin.contains(censusForm.getEmpClockNumber())
							 * ) {
							 * 
							 * censusForm.setRole("HRAdmin"); } else if
							 * (hrManager.contains(censusForm.getEmpClockNumber(
							 * ))) {
							 * 
							 * censusForm.setRole("HrManager"); } else if
							 * (hrGeneralist.contains(censusForm.
							 * getEmpClockNumber())) {
							 * 
							 * censusForm.setRole("HRGeneralist"); }
							 */
							System.out.println("--------save employee records------");

							System.out.println(censusForm.getRole());

							System.out.println(censusForm.getMinValue());
							log.info("min in controller");
							log.info(censusForm.getMinValue());

							// uploadFormService.fetchEmployeeClock();

							uploadFormService.saveEmployeeDetails(censusForm);
							HSSFRow errorHeader = worksheet.createRow((int) 0);

							HSSFRow errorRow = worksheet.createRow((int) errorCount);
							HSSFCell firstCell;
							HSSFCell secondCell;
							HSSFCell thirdCell;
							HSSFCell fourthCell;

							firstCell = errorHeader.createCell((int) 0);
							firstCell.setCellValue("Clock Number");
							secondCell = errorHeader.createCell((int) 1);
							secondCell.setCellValue("First Name");
							thirdCell = errorHeader.createCell((int) 2);
							thirdCell.setCellValue("Last Name");
							fourthCell = errorHeader.createCell((int) 3);
							fourthCell.setCellValue("Error Message");

						}

					}

				}

				if (errorCount > 1 || errorCount == 0) {
					// FileInputStream is = new FileInputStream(new
					// File("D:/latestfile.xlsx"));
					// FileInputStream is = new FileInputStream(errorfilePath);

					String reportfilePath = reportTempDirectory + "/" + errorfile;

					FileOutputStream fileOut = new FileOutputStream(reportfilePath);

					System.out.println("*************************************************************");
					response.setContentType("application/vnd.ms-excel");
					response.setHeader("Content-disposition", "attachment; filename=" + errorfile);

					ByteArrayOutputStream baos = new ByteArrayOutputStream();
					baos = convertPDFToByteArrayOutputStream(reportfilePath);

					OutputStream os = response.getOutputStream();
					baos.writeTo(os);
					os.flush();

					/*
					 * @SuppressWarnings("resource") FileOutputStream fileOut =
					 * new FileOutputStream(errorfilePath);
					 */
					/*
					 * workbook.write(fileOut); fileOut.flush();
					 */
					workbook.write(os);
					// fileOut.flush();

					// org.apache.commons.io.IOUtils.copy(is,
					// response.getOutputStream());
					response.flushBuffer();
					fileOut.close();
					// is.close();
				}

			} catch (Exception e) {

				System.out.println();

				addingRoles(model, session);

				model.addAttribute("loginUser", loginUser);
				model.addAttribute("fileupload", "please pick a file to upload");
				e.printStackTrace();
				e.getMessage();
				System.out.println(e.getMessage());
				log.info(e.getStackTrace());
				log.info(e.getMessage());
				return new ModelAndView("uploadForm", "errorMsg", "  file is having a problem while uploading.");
			}

		}
		model.addAttribute("loginUser", loginUser);
		addingRoles(model, session);
		model.addAttribute("fileupload", "");
		return new ModelAndView("uploadForm");
	}

	private ByteArrayOutputStream convertPDFToByteArrayOutputStream(String fileReport) {

		InputStream inputStream = null;
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		try {

			inputStream = new FileInputStream(fileReport);
			byte[] buffer = new byte[1024];
			baos = new ByteArrayOutputStream();

			int bytesRead;
			while ((bytesRead = inputStream.read(buffer)) != -1) {
				baos.write(buffer, 0, bytesRead);
			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (inputStream != null) {
				try {
					inputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return baos;
	}

	/*
	 * superiors clock number data
	 */
	private static Set<String> getSuperviousHrclockNumbers(Iterator<Row> rowIterator) {

		String modifiedclockNumber = "";
		Set<String> clockNumbersSet = new HashSet<String>();
		while (rowIterator.hasNext()) {

			Row row = rowIterator.next();
			String hourlyORSalary = "";
			String EmpClockNumber = "";
			ClockNumbers clockNumber = new ClockNumbers();

			Iterator<Cell> cellIterators = row.cellIterator();
			while (cellIterators.hasNext()) {

				Cell cell = cellIterators.next();
				if (cell.getRowIndex() < 1) {

					clockNumber = null;

				} else {
					switch (cell.getCellType()) {
					case Cell.CELL_TYPE_STRING:
						if (cell.getColumnIndex() == 10) {
							hourlyORSalary = cell.getStringCellValue();
							log.info("hourlyORSalary..." + hourlyORSalary);
						}

					case Cell.CELL_TYPE_NUMERIC:

						// log.info("clock numbers message");

						// log.info(cell.getColumnIndex() + " what is column
						// index...");

						if (cell.getColumnIndex() == 0) {

							employee.add(
									XLSXFormValidation.replaceDotZeros(String.valueOf(cell.getNumericCellValue())));

						}

						// hr manager
						if (cell.getColumnIndex() == 19) {

							modifiedclockNumber = XLSXFormValidation
									.replaceDotZeros(String.valueOf(cell.getNumericCellValue()));

							hrManager.add(modifiedclockNumber);

						}

						// supervisor
						if (cell.getColumnIndex() == 14) {

							modifiedclockNumber = XLSXFormValidation
									.replaceDotZeros(String.valueOf(cell.getNumericCellValue()));

							supervisor.add(modifiedclockNumber);

						}

						// hr generlist
						if (cell.getColumnIndex() == 22) {

							modifiedclockNumber = XLSXFormValidation
									.replaceDotZeros(String.valueOf(cell.getNumericCellValue()));

							hrGeneralist.add(modifiedclockNumber);

						}
						// hr Admin
						if (cell.getColumnIndex() == 37) {

							modifiedclockNumber = XLSXFormValidation
									.replaceDotZeros(String.valueOf(cell.getNumericCellValue()));

							hrAdmin.add(modifiedclockNumber);

						}

						break;
					case Cell.CELL_TYPE_BOOLEAN:

						break;

					case Cell.CELL_TYPE_BLANK:
						if (cell.getColumnIndex() == 11) {

							String email = String.valueOf(cell.getStringCellValue());
							log.info("Column Value For this index no.11:::" + email);
							if (String.valueOf(hourlyORSalary).equalsIgnoreCase("S")) {
								if (email.isEmpty() || String.valueOf(email).equalsIgnoreCase("null")) {
									log.info("EmpClockNumber:::" + EmpClockNumber);
									if (employee.contains(EmpClockNumber)) {
										employee.remove(EmpClockNumber);
										log.info("Remove Clock Number for set:::" + EmpClockNumber);
									}

								}

							}
						}
						break;

					default:

					}

				}
				if (!modifiedclockNumber.trim().isEmpty()) {
					clockNumbersSet.add(modifiedclockNumber);
				}
			}

		}

		return clockNumbersSet;

	}

	public void setUploadFormService(UploadFormService uploadFormService) {
		this.uploadFormService = uploadFormService;
	}

	public String getCellOneErrorMessage() {
		return cellOneErrorMessage;
	}

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

	// mail sending code..

	@Autowired
	private EmailNotificationService emailNotificationService;

	@RequestMapping(value = "/sourceFileUpload", params = "sendMail", method = RequestMethod.POST)
	public String getExemptFormDetails(@ModelAttribute(value = "SOURCEFORM") UploadForm form,
			HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session)
			throws AddressException, MessagingException {
		try {

			Map<Integer, String> employees = new HashMap<Integer, String>();

			Map<Integer, String> supervisor = new HashMap<Integer, String>();
			int i = 0;
			int j = 0;
			System.out.println("send mail");

			String clockNumber = (String) session.getAttribute("loginClockNumber");

			String loginYear = (String) session.getAttribute("loginYear");

			CensusForm employeeDetails = empService.getLoginEmployeeDetails(Integer.parseInt(clockNumber), clockNumber,
					loginYear.trim());

			System.out.println("sending mail to below year people " + employeeDetails.getAnnaulYear());

			List<CensusForm> exemptDetailsLisr = emailNotificationService.getExemptFormDetails("exempt", "",
					employeeDetails.getAnnaulYear());

			// AppraisalMailConfig mailData =
			// nonExemptService.getEMpMailData("STARTED");

			AppraisalMailConfig nonExempt = nonExemptService.getEMpMailData("STARTED", "Non Exempt");

			AppraisalMailConfig exempt = nonExemptService.getEMpMailData("STARTED", "Exempt");

			String clockID = (String) session.getAttribute("loginClockNumber");
			if (session.getAttribute("loginClockNumber") != null) {
				System.out.println("is Not Null");
			} else {

				return "loginScreen";
			}
			String email = "";

			for (CensusForm c : exemptDetailsLisr) {

				if (String.valueOf(c.getEmpClockNumber()).equalsIgnoreCase(clockID)) {

					email = c.getEmpEmailAddress();
				}

				employees.put(c.getEmpClockNumber(), c.getEmpEmailAddress());

			}

			for (CensusForm censusForm : exemptDetailsLisr) {

				String emailIDs = censusForm.getEmpEmailAddress();

				/*
				 * EmailConfig.getInstance().sendMail("subject", "body",
				 * "sudhindra.halaharvi@verinon.co.in", "",
				 * "sudhindra.halaharvi@verinon.co.in");
				 */
				String supervisorEmail = employees.get(censusForm.getSupervisorClockNumber());

				if (supervisor.get(censusForm.getSupervisorClockNumber()) == null
						|| supervisor.get(censusForm.getSupervisorClockNumber()).isEmpty()) {

					if (String.valueOf(emailIDs).equalsIgnoreCase("null") || emailIDs.isEmpty()) {

					} else if (censusForm.getHourlyOrSalary().equalsIgnoreCase("S")) {
						i++;
						log.info("EmpClockNumber::" + censusForm.getEmpClockNumber() + "Employee Mail Id " + emailIDs
								+ "Supervisor Mailid" + supervisorEmail);
						System.out.println("email config");
						System.out.println("to :" + emailIDs);
						System.out.println(email);
						System.out.println(exempt.getMail_body());
						EmailConfig.getInstance().sendMail(exempt.getMail_subject(), exempt.getMail_body(), emailIDs,
								supervisorEmail, email);
					} else if (censusForm.getHourlyOrSalary().equalsIgnoreCase("H")) {
						j++;
						log.info("EmpClockNumber::" + censusForm.getEmpClockNumber() + "and supervisor mailId::"
								+ supervisorEmail);

						EmailConfig.getInstance().sendMail(nonExempt.getMail_subject(), nonExempt.getMail_body(),
								supervisorEmail, "", email);
					}
				}
				supervisor.put(censusForm.getSupervisorClockNumber(), supervisorEmail);

			}
			log.info("Exempt value:" + i);
			log.info("NonExempt value:" + j);
			addingRoles(model, session);

			model.addAttribute("loginUser", loginUser);
			return "uploadForm";
		} catch (Exception e) {
			addingRoles(model, session);

			model.addAttribute("loginUser", loginUser);
			model.addAttribute("fileupload", "SMTP protocol is failling.");

			return "uploadForm";

		}
	}

	@RequestMapping(value = "/sourceFileUpload", params = "selectedlocaion", method = RequestMethod.POST)
	public String getMailToFactory(@ModelAttribute(value = "SOURCEFORM") UploadForm form, HttpServletRequest request,
			HttpServletResponse response, Model model, HttpSession session)
			throws AddressException, MessagingException {
		try {
			log.info("getMailToFactory");
			log.info(form.getAmerica());
			log.info(form.getCoi());
			log.info(form.getTorrance());
			List<String> list = new ArrayList<String>();
			if ((String.valueOf(form.getAmerica()).equalsIgnoreCase("null") || form.getAmerica().isEmpty())
					&& (String.valueOf(form.getCoi()).equalsIgnoreCase("null") || form.getCoi().isEmpty())
					&& (String.valueOf(form.getTorrance()).equalsIgnoreCase("null") || form.getTorrance().isEmpty())) {
				model.addAttribute("loginUser", loginUser);

				return "uploadForm";
			}

			if (session.getAttribute("loginClockNumber") != null) {
				System.out.println("is Not Null");
			} else {

				return "loginScreen";
			}
			String email = "";

			String clockNumber = (String) session.getAttribute("loginClockNumber");

			String loginYear = (String) session.getAttribute("loginYear");

			CensusForm employeeDetails = empService.getLoginEmployeeDetails(Integer.parseInt(clockNumber), clockNumber,
					loginYear.trim());

			Map<Integer, String> supervisor = new HashMap<Integer, String>();

			// AppraisalMailConfig mailData =
			// nonExemptService.getEMpMailData("STARTED");

			AppraisalMailConfig nonExempt = nonExemptService.getEMpMailData("STARTED", "Everyone");
			log.info(nonExempt.getStatus() + "::status");
			log.info(nonExempt.getUsertype() + "::userType");
			// AppraisalMailConfig exempt =
			// nonExemptService.getEMpMailData("STARTED", "Exempt");

			List<CensusForm> censusform = empService.getEmployeeRole(loginYear.trim());

			List<CensusForm> exemptDetailsLisr = emailNotificationService.getExemptFormDetails("exempt", form,
					employeeDetails.getAnnaulYear());

			email = employeeDetails.getEmpEmailAddress();
			StringBuffer updateSalaryExemptClock = new StringBuffer("");
			// int length=0;
			int salaryExemptClocklength = 0;
			int i = 0;
			int j = 0;
			for (CensusForm c : censusform) {

				System.out.println("checking the clocks");
				System.out.println(c.getEmpClockNumber() + " " + c.getFactoryLocation());

				supervisor.put(c.getEmpClockNumber(), c.getEmpEmailAddress());
				System.out.println(c.getEmpClockNumber() + "email " + c.getEmpEmailAddress());
				i++;
			}
			System.out.println("num of records " + i);

			for (CensusForm censusForm : exemptDetailsLisr) {

				String emailIDs = censusForm.getEmpEmailAddress();
				String supervisorEmail = String.valueOf(supervisor.get(censusForm.getSupervisorClockNumber()));

				System.out.println(supervisorEmail + " supervisor emaillll...");

				System.out.println(censusForm.getSupervisorClockNumber() + "superclock"
						+ supervisor.get(censusForm.getSupervisorClockNumber()));

				log.info("hr " + email + " supervisor " + supervisorEmail);

				if (censusForm.getHourlyOrSalary().equalsIgnoreCase("S")
						|| censusForm.getHourlyOrSalary().equalsIgnoreCase("H")) {
					updateSalaryExemptClock.append(censusForm.getEmpClockNumber());
					updateSalaryExemptClock.append(",");

				}

				if (String.valueOf(emailIDs).equalsIgnoreCase("null") || emailIDs.isEmpty()) {

				}

				if (!list.contains(supervisorEmail) && !supervisorEmail.isEmpty()
						&& !String.valueOf(supervisorEmail).equalsIgnoreCase("null")) {

					System.out.println(supervisorEmail + "::Supervisor Email:::");
					EmailConfig.getInstance().sendMail(
							nonExempt.getMail_subject() + " " + censusForm.getEmplastName() + " ,"
									+ censusForm.getEmpfirstName(),
							nonExempt.getMail_body(), supervisorEmail, "", email);
					list.add(supervisorEmail);
					j++;

				}

				/*
				 * else if
				 * (censusForm.getHourlyOrSalary().equalsIgnoreCase("S")) {
				 * 
				 * EmailConfig.getInstance().sendMail(
				 * nonExempt.getMail_subject() + " " +
				 * censusForm.getEmplastName() + " ," +
				 * censusForm.getEmpfirstName(), nonExempt.getMail_body(),
				 * supervisorEmail, "", email); } else if
				 * (censusForm.getHourlyOrSalary().equalsIgnoreCase("H")) {
				 * 
				 * // nonExemptService.updateSalaryRoleActivated("Activated", //
				 * emailIDs, employeeDetails.getAnnaulYear());
				 * 
				 * EmailConfig.getInstance().sendMail(
				 * nonExempt.getMail_subject() + " " +
				 * censusForm.getEmplastName() + " ," +
				 * censusForm.getEmpfirstName(), nonExempt.getMail_body(),
				 * supervisorEmail, "", email); }
				 */

			}
			System.out.println("jjjj count::::" + j);
			System.out.println("Number of records in that list::::" + list.size());
			salaryExemptClocklength = updateSalaryExemptClock.length();
			updateSalaryExemptClock.deleteCharAt(salaryExemptClocklength - 1);
			System.out.println("updateSalaryExemptClock::::" + updateSalaryExemptClock);
			nonExemptService.updateSalaryRoleActivated("Activated", updateSalaryExemptClock,
					employeeDetails.getAnnaulYear());
			String[] disableOrEnableCheckBox = empService.getSalaryReviewStatus(loginUser.getLoginYear().trim());
			System.out.println(disableOrEnableCheckBox[0] + "::Torrance");
			System.out.println(disableOrEnableCheckBox[1] + "::City Of industry");
			System.out.println(disableOrEnableCheckBox[2] + "::North America");

			model.addAttribute("loginUser", loginUser);

			model.addAttribute("Torranace", disableOrEnableCheckBox[0]);
			model.addAttribute("CityOFIndustry", disableOrEnableCheckBox[1]);
			model.addAttribute("NorthAmerica", disableOrEnableCheckBox[2]);

			addingRoles(model, session);
			return "uploadForm";
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
			System.out.println("Exception is occured");
			addingRoles(model, session);

			model.addAttribute("loginUser", loginUser);
			model.addAttribute("fileupload", "SMTP protocol is failling.");

			return "uploadForm";
		}
	}

	// Code Related For Scan Documents

	@RequestMapping(value = "/sharedPdf", method = RequestMethod.GET)
	public String getSharedPdfPage(@RequestParam("clockNumber") String empClockNumber, Model model,
			HttpSession session) {
		if (session.getAttribute("loginClockNumber") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}
		System.out.println("This is getSharedPdfPage method");
		// downloadFileInSharedLocation(form.getFile(), sharedLocation,
		// fileName);
		StringBuffer employeeHirerachy = (StringBuffer) session.getAttribute("employeeRoles");

		String employeeRole = employeeHirerachy.toString();
		model.addAttribute("loginUser", loginUser);
		if (employeeRole.contains("HRGeneralist")) {
			System.out.println("This is hrgeneralist");
			model.addAttribute("hrGeneralist", empClockNumber);
			return "sharedPdf";
		}

		else if (employeeRole.contains("HrManager")) {
			System.out.println("This is hrmanager");
			model.addAttribute("hrManager", empClockNumber);
			return "sharedPdf";
		} else if (employeeRole.contains("HRAdmin")) {
			System.out.println("This is hrAdmin");
			model.addAttribute("hrAdmin", empClockNumber);
			return "sharedPdf";
		}

		else if (employeeRole.contains("Supervisor")) {
			System.out.println("This is suervisor ");
			model.addAttribute("hrDashboard", "Manager");
			// hrManagerEmployees(empClockNumber, model);
			/*
			 * model.addAttribute("loginUser", loginUser);
			 * model.addAttribute("dashboard", "");
			 * model.addAttribute("hrAdmin", "Meeravali");
			 */
			return "sharedPdf";
		}
		return "sharedPdf";
	}

	@RequestMapping(value = "/selectPdf", method = RequestMethod.POST)
	public String savePdfFileInSharedLocation(@ModelAttribute("sharedfile") UploadForm form, HttpServletRequest request,
			HttpServletResponse response, Model model, HttpSession session) throws IOException {
		String empClockNumber = loginUser.getClockNumber();

		if (loginUser.getClockNumber() != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}
		String message = null;
		System.out.println("This is savePdfFileInSharedLocation method");
		model.addAttribute("loginUser", loginUser);
		MultipartFile commonsFile = form.getFile();

		String fileName = commonsFile.getOriginalFilename();
		// File file = new File(commonsFile.getOriginalFilename());
		System.out.println("OriginalFile:::" + commonsFile.getOriginalFilename());
		System.out.println(commonsFile.getContentType() + "Content type");
		if (commonsFile.getContentType().equals("application/pdf")) {
			String sharedLocation = empService.getSharedLocationPath();

			System.out.println("sharedLocationPath::" + sharedLocation);
			message = downloadFileInSharedLocation(commonsFile, sharedLocation, fileName);
		} else {
			if (commonsFile.isEmpty()) {
				System.out.println("File is Empty");
				message = "Please Choose A File And Upload";
			} else {
				System.out.println("The file is not .pdf format");
				message = "Please Select A Pdf File Only";
			}
		}
		System.out.println(message + ":::message");
		model.addAttribute("errorMsg", message);

		StringBuffer employeeHirerachy = (StringBuffer) session.getAttribute("employeeRoles");

		String employeeRole = employeeHirerachy.toString();
		model.addAttribute("loginUser", loginUser);
		if (employeeRole.contains("HRGeneralist")) {

			model.addAttribute("hrGeneralist", empClockNumber);
			return "sharedPdf";
		}

		if (employeeRole.contains("HrManager")) {

			model.addAttribute("hrManager", empClockNumber);
			return "sharedPdf";
		}
		if (employeeRole.contains("HRAdmin")) {

			model.addAttribute("hrAdmin", empClockNumber);
			return "sharedPdf";
		}

		if (employeeRole.contains("Supervisor")) {
			model.addAttribute("hrDashboard", "Manager");

			return "sharedPdf";
		}
		return "sharedPdf";
	}

	@SuppressWarnings("resource")
	private String downloadFileInSharedLocation(MultipartFile file, String sharedLocation, String fileName)
			throws IOException {
		if (loginUser.getClockNumber() != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}
		String message = null;
		FileChannel source = null;
		FileChannel destination = null;
		/*
		 * if (!createDirs(sharedLocation)) { throw new
		 * IllegalArgumentException( "Can't create directory " +
		 * sharedLocation); }
		 */

		System.out.println("you selected pdf file");
		try {
			File convFile = new File(file.getOriginalFilename());
			file.transferTo(convFile);
			File dst = new File(sharedLocation + "/" + fileName);
			if (!dst.createNewFile()) {

				throw new IllegalArgumentException("File " + dst.getAbsolutePath() + " already exists");
			}
			System.out.println(sharedLocation + "path and file location " + fileName);
			System.out.println(convFile.getAbsolutePath() + " File Path ");
			System.out.println(dst.getAbsolutePath() + " Shared Location Path");
			System.out.println(String.format("Copying %s to %s", convFile.getAbsolutePath(), dst.getAbsolutePath()));

			source = new FileInputStream(convFile).getChannel();
			destination = new FileOutputStream(dst).getChannel();

			destination.transferFrom(source, 0, source.size());
			message = "Your File Saved Sucessfully";
		} catch (IllegalArgumentException iae) {
			iae.printStackTrace();
			message = "Already File Is Exist Can You Please Change File Name";
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();

			message = e.getMessage();
		} finally {

			if (source != null) {
				source.close();
			}
			if (destination != null) {
				destination.close();
			}
		}
		return message;

	}
}
