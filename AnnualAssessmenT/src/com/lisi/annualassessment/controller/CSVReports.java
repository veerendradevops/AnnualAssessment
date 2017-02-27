package com.lisi.annualassessment.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.DataFormat;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.itextpdf.text.Font;
import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.orm.Department;
import com.lisi.annualassessment.orm.ExemptSection2;
import com.lisi.annualassessment.orm.JobKnowledgeAndSkill;
import com.lisi.annualassessment.pojo.CsvReport;
import com.lisi.annualassessment.pojo.LoginUser;
import com.lisi.annualassessment.service.EmployeeService;
import com.lisi.annualassessment.service.HRManagerService;
import com.lisi.annualassessment.util.Converters;
import com.lisi.annualassessment.util.WriteXLSX;

@Controller
public class CSVReports {

	private static final Logger log = Logger.getLogger(CSVReports.class);

	@Autowired
	private HRManagerService hRManagerService;

	@Autowired
	private EmployeeService empService;
	@Autowired
	private LoginUser loginUser;

	private String exemptEmpClock, employeeYear;

	@RequestMapping(value = "/csvreports", method = RequestMethod.GET)
	public String getCsvReport(@ModelAttribute("csvreport") CsvReport csvreport, Model model, HttpSession session) {

		log.info("csvreports");
		System.out.println("csv report");
		exemptEmpClock = loginUser.getClockNumber();
		employeeYear = loginUser.getLoginYear();
		model.addAttribute("loginUser", loginUser);

		if (session.getAttribute("loginClockNumber") != null) {
			System.out.println("is Not Null");
		} else {

			return "loginScreen";
		}

		System.out.println("exempt employee clock");
		System.out.println(exemptEmpClock);
		try {
			List<CensusForm> retrivedata = empService.getFactoryLocation(exemptEmpClock, employeeYear);

			System.out.println("FactoryLocationRetrivedata " + retrivedata);

			ArrayList<String> listFactory = new ArrayList<String>();
			ArrayList<Integer> listShift = new ArrayList<Integer>();

			String factory = "";
			int shift = 0;
			String shiftreport = "";

			// int i=0;
			for (CensusForm censusform : retrivedata) {

				if (listFactory.indexOf(censusform.getFactoryLocation()) != -1) {

				} else {

					listFactory.add(censusform.getFactoryLocation());

				}
				if (listShift.indexOf(censusform.getShift()) != -1) {

				} else {
					// System.out.println(censusform.getShift() + "controller
					// shift");
					listShift.add(censusform.getShift());
				}

			}

			/*
			 * for (int i = 0; i < listFactory.size(); i++) { //
			 * System.out.println("FactoryLocation:::::: " + //
			 * listFactory.get(i)); factory = factory + "<option value='" +
			 * listFactory.get(i) + "'>" + listFactory.get(i) + "</option>";
			 * 
			 * }
			 * 
			 * for (int k = 0; k < listShift.size(); k++) { //
			 * System.out.println("Shift:::::::::" + listShift.get(k));
			 * shiftreport = shiftreport + "<option value='" + listShift.get(k)
			 * + "'>" + listShift.get(k) + "</option>"; }
			 */
			/*
			 * model.addAttribute("csvReports", factory);
			 * model.addAttribute("csvreportshift", shiftreport);
			 */

			StringBuffer employeeHirerachy = (StringBuffer) session.getAttribute("employeeRoles");

			String employeeRole = employeeHirerachy.toString();

			String role = "";

			if (employeeRole.contains("HrManager")) {

				role = "hrManagerClockNumber";
			} else if (employeeRole.contains("HRAdmin")) {

				role = "hrAdmin";

			} else if (employeeRole.contains("HRGeneralist")) {
				role = "hrGeneralist";
			}
			// String annualYear1 = csvreport.getYear();
			// String annualYear = Converters.getCurrentYear();
			String annualYear = loginUser.getLoginYear();
			String clockNumber = loginUser.getClockNumber();
			
			List<CensusForm> employeesList = hRManagerService.getCenscusFormFactoryLocation(annualYear, clockNumber,
					role);

			Set<String> factoryLocationShift = new HashSet<String>();

			Set<Integer> shiftdup = new HashSet<Integer>();

			for (CensusForm census : employeesList) {

				factoryLocationShift.add(census.getFactoryLocation());
				shiftdup.add(census.getShift());
				// System.out.println("census.getFactoryLocation() :::::::: " +
				// census.getFactoryLocation());
				// System.out.println("census.getShift() :::::::: " +
				// census.getShift());

			}

			List<String> factoryLoc = new ArrayList<String>(factoryLocationShift);
			List<Integer> employeeShift = new ArrayList<Integer>(shiftdup);

			for (int i = 0; i < factoryLoc.size(); i++) {
				// System.out.println("FactoryLocation:::::: " +
				// listFactory.get(i));
				factory = factory + "<option value='" + factoryLoc.get(i) + "'>" + factoryLoc.get(i) + "</option>";

			}

			for (int k = 0; k < employeeShift.size(); k++) {
				// System.out.println("Shift:::::::::" + listShift.get(k));
				shiftreport = shiftreport + "<option value='" + employeeShift.get(k) + "'>" + employeeShift.get(k)
						+ "</option>";
			}

			List<CensusForm> loginEmpDataForAllYears = hRManagerService.getYearsInDatabase(clockNumber);

			model.addAttribute("AllYears", loginEmpDataForAllYears);

			model.addAttribute("csvReports", factory);
			model.addAttribute("csvreportshift", shiftreport);

			model.addAttribute("loginUser", loginUser);
			addingRoles(model, session);

		} catch (Exception e) {
			model.addAttribute("loginUser", loginUser);
			e.printStackTrace();

		}

		return "csvreports";
	}

	@RequestMapping(value = "/generateCSVReports", method = RequestMethod.POST)
	public ModelAndView genareteCsvreport(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("CsvReport") CsvReport csvReport,

			BindingResult result, Model model, HttpSession session) throws IOException, IllegalStateException {

		exemptEmpClock = loginUser.getClockNumber();
		employeeYear = loginUser.getLoginYear();
		model.addAttribute("loginUser", loginUser);
		System.out.println("Clock number ::::: " + employeeYear);
		if (session.getAttribute("loginClockNumber") != null) {
			System.out.println("is Not Null");
		} else {

			return new ModelAndView("loginScreen");
		}
		System.out.println(csvReport.toString() + " shift");

		System.out.println(csvReport.shift.toString());
		log.info("Start genareteCsvreport().");
		String orginalDetailReportFileName = "Detailed Report";
		String originalSummaryReportFileName = "Summary Report";
		Calendar currentDate = Calendar.getInstance();

		int currentYear = currentDate.get(Calendar.YEAR);
		int currentMonth = currentDate.get(Calendar.MONTH) + 1;
		int currentDay = currentDate.get(Calendar.DAY_OF_MONTH) + 1;
		// int currentHour = currentDate.get(Calendar.HOUR_OF_DAY);
		// int currentMin = currentDate.get(Calendar.MINUTE) + 1;
		// int currentSecond = currentDate.get(Calendar.SECOND) + 1;
		String clockNumber = loginUser.getClockNumber();
		orginalDetailReportFileName = orginalDetailReportFileName + "-" + currentYear + "-" + currentMonth + "-"
				+ currentDay + "-" + clockNumber + ".xls";
		originalSummaryReportFileName = originalSummaryReportFileName + "-" + currentYear + "-" + currentMonth + "-"
				+ currentDay + "-" + clockNumber + ".xls";

		StringBuffer employeeHirerachy = (StringBuffer) session.getAttribute("employeeRoles");

		String employeeRole = employeeHirerachy.toString();

		String role = "";

		if (employeeRole.contains("HrManager")) {

			role = "hrManagerClockNumber";
		} else if (employeeRole.contains("HRAdmin")) {

			role = "hrAdmin";

		} else if (employeeRole.contains("HRGeneralist")) {
			role = "hrGeneralist";
		}
		if (csvReport != null) {

			List<String> factoryLocationList = csvReport.getFactoryLocation();
			List<Integer> shiftsList = csvReport.getShift();
			String annualYear = csvReport.getYear();

			List<CensusForm> employeesList = null;
			List<Department> departmentEmployeesList = new ArrayList<Department>();

			if (factoryLocationList != null && shiftsList != null && annualYear != null) {

				if (factoryLocationList.indexOf("all") != -1 && shiftsList.indexOf(0) != -1) {// all

					employeesList = hRManagerService.getCensusFormAnnualYear(annualYear, clockNumber, role);

				}

				if (factoryLocationList.indexOf("all") != -1 && shiftsList.indexOf(0) == -1) {// 1

					System.out.println("Enter into Factory All:::::::::::::::");

				}

				if (factoryLocationList.indexOf("all") == -1 && shiftsList.indexOf(0) != -1) {

					employeesList = hRManagerService.getCensusFormFactoryLocation(csvReport.getFactoryLocation(),
							annualYear, clockNumber, role);

				}

				if (factoryLocationList.indexOf("all") == -1 && shiftsList.indexOf(0) == -1) {

					System.out.println("Enter into Not Equal All:::::::::::::::");
					System.out.println("FACTORY LOCATION:::::::::::::   " + factoryLocationList.toString());
					System.out.println("SHIFTS:::::::::::::   " + shiftsList.toString());
					employeesList = hRManagerService.getCensusFormFactoryLocationAndEmpShift(
							csvReport.getFactoryLocation(), csvReport.getShift(), annualYear, clockNumber, role);

				}

				Map<String, String> department = new HashMap<String, String>();

				for (Department costCenterDesc : departmentEmployeesList) {

					System.out.println(" " + costCenterDesc.getCostCenter());
					department.put(costCenterDesc.getCostCenter(), costCenterDesc.getDepartment());

				}

				System.out.println("       =======");

				if (employeesList != null) {
					try {

						addingRoles(model, session);
						// generateDetailReport(employeesList,
						// orginalDetailReportFileName, annualYear, response);
						/*
						 * generateSummaryReport(department, employeesList,
						 * originalSummaryReportFileName, response);
						 */
						generateZip(employeesList, department, request, response, orginalDetailReportFileName,
								originalSummaryReportFileName, annualYear, csvReport, factoryLocationList, shiftsList);

					} catch (Exception ex) {
						model.addAttribute("loginUser", loginUser);
						ex.printStackTrace();
					}
				}
			}
		}

		return new ModelAndView("csvreports");
	}

	public void generateDetailReport(List<CensusForm> employeesList, String orginalDetailReportFileName,
			String annualYear, HttpServletResponse response, List<String> factoryLocationList,
			List<Integer> shiftsList) {
		try {
			// Detail Report

			File excelReport = new File(System.getProperty("java.io.tmpdir") + "/" + orginalDetailReportFileName);

			System.out.println("Temp Location::::::::::::::: " + excelReport.getAbsolutePath());

			Map<String, String> departmentMap = new HashMap<String, String>();

			List<Department> deparmentList = hRManagerService.getAllDepartments();
			Iterator<Department> deparmentListItr = deparmentList.iterator();

			while (deparmentListItr.hasNext()) {
				Department department = deparmentListItr.next();
				/*
				 * System.out.println( "Department:::::::  " +
				 * department.getCostCenter() + " &&& " +
				 * department.getDepartment());
				 */
				departmentMap.put(department.getCostCenter(), department.getDepartment());
			}

			Map<String, List<String>> exemptSection2Map = new HashMap<String, List<String>>();
			List<ExemptSection2> exemptSection2List = hRManagerService.getAllExemptSection2Data(annualYear);
			Iterator<ExemptSection2> exemptSection2ListItr = exemptSection2List.iterator();
			List<String> exemptSection2ResultList = new ArrayList<String>();

			while (exemptSection2ListItr.hasNext()) {
				ExemptSection2 exemptSection2 = exemptSection2ListItr.next();
				exemptSection2ResultList.add(exemptSection2.getSection2EAssessmentSummary());
				exemptSection2ResultList.add(exemptSection2.getSection2DSummeryOfAccomplishmentAndAreasImprovement());
				exemptSection2Map.put(String.valueOf(exemptSection2.getEmpClockNumber()), exemptSection2ResultList);
			}

			Map<String, List<String>> nonExemptSection3Map = new HashMap<String, List<String>>();
			List<JobKnowledgeAndSkill> nonExemptSection3List = hRManagerService.getAllNonExemptSection3Data(annualYear);
			Iterator<JobKnowledgeAndSkill> nonExemptSection3ListItr = nonExemptSection3List.iterator();
			List<String> nonExemptSection3ResultList = new ArrayList<String>();

			while (nonExemptSection3ListItr.hasNext()) {
				JobKnowledgeAndSkill jobKnowledgeAndSkill = nonExemptSection3ListItr.next();
				nonExemptSection3ResultList.add(jobKnowledgeAndSkill.getSupervisorsOverallComments());
				nonExemptSection3ResultList.add(jobKnowledgeAndSkill.getSummaryAvgScore());
				nonExemptSection3Map.put(String.valueOf(jobKnowledgeAndSkill.getClockId()),
						nonExemptSection3ResultList);
			}

			WriteXLSX.buildDetailXLSX(departmentMap, employeesList, exemptSection2Map, nonExemptSection3Map,
					excelReport, annualYear, factoryLocationList, shiftsList);

			// FileInputStream is = new FileInputStream(excelReport);
			// System.out.println("*************************************************************");
			//
			// response.setContentType("application/vnd.ms-excel");
			// response.setHeader("Content-disposition", "attachment; filename="
			// + orginalDetailReportFileName);
			// FileCopyUtils.copy(is, response.getOutputStream());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void generateSummaryReport(Map<String, String> costCenterDesc, List<CensusForm> employeeList,
			String originalSummaryReportFileName, HttpServletResponse response, CsvReport csvReport,
			String annualYear) {
		try {
			// Summary Report
			// FileOutputStream fileOut = new
			// FileOutputStream("D:/summary.xlsx");
			// File fileOutPut=new File("D:/Summary Report.xlsx");
			// File excelReport1 = new File(System.getProperty("java.io.tmpdir")
			// + "/" + originalSummaryReportFileName);
			File excelReport = new File(System.getProperty("java.io.tmpdir") + "/" + originalSummaryReportFileName);

			System.out.println("Temp Location::::::::::::::: " + excelReport.getAbsolutePath());

			Map<String, String> departmentMap = new HashMap<String, String>();
			List<Department> deparmentList = hRManagerService.getAllDepartments();
			Iterator<Department> deparmentListItr = deparmentList.iterator();

			while (deparmentListItr.hasNext()) {
				Department department = deparmentListItr.next();
				System.out.println(
						"Department:::::::  " + department.getCostCenter() + " &&& " + department.getDepartment());
				departmentMap.put(department.getCostCenter(), department.getDepartment());
			}

			Set<String> costCenter = new HashSet<String>();
			// List<String> costDesc = new ArrayList<String>();
			for (CensusForm census : employeeList) {

				costCenter.add(census.getCostCenter());

			}

			log.info(costCenter.size() + " size of collections");

			Iterator iterator = costCenter.iterator();
			List<CensusForm> hourlyRate = null;

			System.out.println("report generated method...");
			buildSummaryXLSX(employeeList, excelReport, costCenterDesc, departmentMap, costCenter, csvReport,
					annualYear);

			// FileInputStream is1 = new FileInputStream("D:/summary.xlsx");
			// System.out.println("*************************************************************");
			//
			// response.setContentType("application/vnd.ms-excel");
			// response.setHeader("Content-disposition", "attachment; filename="
			// + originalSummaryReportFileName);
			// FileCopyUtils.copy(is1, response.getOutputStream());

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void generateZip(List<CensusForm> employeesList, Map<String, String> costCenterDesc,
			HttpServletRequest request, HttpServletResponse response, String orginalDetailReportFileName,
			String originalSummaryReportFileName, String annualYear, CsvReport csvReport,
			List<String> factoryLocationsList, List<Integer> shiftsList)
			throws ServletException, IOException, NullPointerException {

		// Set the content type based to zip
		String summaryReportZipName = "Reports";
		Calendar currentDate = Calendar.getInstance();
		int currentYear = currentDate.get(Calendar.YEAR);
		int currentMonth = currentDate.get(Calendar.MONTH) + 1;
		int currentDay = currentDate.get(Calendar.DAY_OF_MONTH) + 1;
		// int currentHour = currentDate.get(Calendar.HOUR_OF_DAY);
		// int currentMin = currentDate.get(Calendar.MINUTE) + 1;
		// int currentSecond = currentDate.get(Calendar.SECOND) + 1;
		summaryReportZipName = summaryReportZipName + "-" + currentYear + "-" + currentMonth + "-" + currentDay
				+ ".zip";
		response.setContentType("Content-type: text/zip");
		response.setHeader("Content-Disposition", "attachment; filename=" + summaryReportZipName);

		File excelReport = new File(System.getProperty("java.io.tmpdir") + "/" + orginalDetailReportFileName);
		File excelReport1 = new File(System.getProperty("java.io.tmpdir") + "/" + originalSummaryReportFileName);
		System.out.println("Temp Location::::::::::::::: " + excelReport.getAbsolutePath());

		generateDetailReport(employeesList, orginalDetailReportFileName, annualYear, response, factoryLocationsList,
				shiftsList);

		generateSummaryReport(costCenterDesc, employeesList, originalSummaryReportFileName, response, csvReport,
				annualYear);
		// List of files to be downloaded
		List<File> files = new ArrayList<File>();
		files.add(excelReport);
		files.add(excelReport1);

		ServletOutputStream out = response.getOutputStream();
		ZipOutputStream zos = new ZipOutputStream(new BufferedOutputStream(out));

		for (File file : files) {

			zos.putNextEntry(new ZipEntry(file.getName()));

			// Get the file
			FileInputStream fis = null;
			try {
				fis = new FileInputStream(file);

			} catch (FileNotFoundException fnfe) {
				// If the file does not exists, write an error entry instead of
				// file
				// contents

				zos.write(("ERRORld not find file " + file.getName()).getBytes());
				zos.closeEntry();
				System.out.println("Couldfind file " + file.getAbsolutePath());
				continue;
			}

			BufferedInputStream fif = new BufferedInputStream(fis);

			// Write the contents of the file
			int data = 0;
			while ((data = fif.read()) != -1) {
				zos.write(data);
			}

			zos.flush();

			fif.close();

			zos.closeEntry();
			System.out.println("Finished file " + file.getName());
		}

		zos.close();
	}

	@SuppressWarnings("null")
	public void buildSummaryXLSX(List<CensusForm> employeeList, File excelReport, Map<String, String> departmentMap,
			Map<String, String> costCenterDesc, Set<String> costCenter, CsvReport csvReport, String annualYear)
			throws FileNotFoundException, IOException {
		HSSFWorkbook workbook = new HSSFWorkbook();

		HSSFSheet sheet = workbook.createSheet("SummaryReport");
		CellStyle style = workbook.createCellStyle();
		HSSFFont font = workbook.createFont();
		font.setBoldweight(XSSFFont.BOLDWEIGHT_BOLD);
		style.setFont(font);

		System.out.println("buildSummaryXLSX");
		String header[] = { "Cost Center", "Cost Center Description",
				"" + annualYear.trim().toString() + " Annual Payroll", "Sum of % Inc",
				"" + (Integer.parseInt(annualYear.trim().toString()) + 1) + " Annual Payroll" };

		int rowCount = 0;
		Row headerRow = sheet.createRow(rowCount++);
		int headercolumnCount = 0;
		for (String aBook : header) {
			Cell cell = headerRow.createCell(headercolumnCount++);
			cell.setCellValue(aBook);
		}
		List<Integer> shiftsList = csvReport.getShift();
		List<String> costCenterList = new ArrayList<String>(costCenter);
		List<String> factoryLocationList = new ArrayList<String>(csvReport.getFactoryLocation());

		double annualPayroll = 0.00;
		double annualPayroll17 = 0.00;
		double increasePercent = 0.00;

		HSSFCellStyle currencyStyle = workbook.createCellStyle();
		currencyStyle.setAlignment(HSSFCellStyle.ALIGN_RIGHT); // THIS LINE
																// HERE!

		DataFormat currencyFmt = workbook.createDataFormat();
		currencyStyle.setDataFormat(currencyFmt.getFormat("$#,##0.00"));

		HSSFCellStyle percentageStyle = workbook.createCellStyle();
		percentageStyle.setAlignment(HSSFCellStyle.ALIGN_RIGHT); // THIS LINE
																	// HERE!
		DataFormat percentageFmt = workbook.createDataFormat();
		percentageStyle.setDataFormat(percentageFmt.getFormat("0.0000000000%"));

		/*
		 * Currency cell type total and Percentage
		 */
		HSSFCellStyle currencyStyleTotal = workbook.createCellStyle();
		currencyStyleTotal.setAlignment(HSSFCellStyle.ALIGN_RIGHT); // THIS LINE
		HSSFFont fontTotal = workbook.createFont(); // HERE!
		fontTotal.setBoldweight(XSSFFont.BOLDWEIGHT_BOLD);
		currencyStyleTotal.setFont(fontTotal);

		DataFormat currency_Total = workbook.createDataFormat();
		currencyStyleTotal.setDataFormat(currency_Total.getFormat("$#,##0.00"));

		HSSFCellStyle percentageStyleTotal = workbook.createCellStyle();
		percentageStyleTotal.setAlignment(HSSFCellStyle.ALIGN_RIGHT); // THIS
																		// LINE
		percentageStyleTotal.setFont(fontTotal); // HERE!
		DataFormat percentageTotal = workbook.createDataFormat();
		percentageStyleTotal.setDataFormat(percentageTotal.getFormat("0.0000000000%"));

		// while (employeesListItr.hasNext()) {

		for (String dept : costCenterList) {
			System.out.println("dept ");
			System.out.println(dept);
			Row row = sheet.createRow(rowCount++);
			int columnCount = 0;
			// CensusForm censusform = employeesListItr.next();
			Cell cell = row.createCell(columnCount++);
			cell.setCellValue(dept);

			// Cost Center Description empty beacuase not available in database

			cell = row.createCell(columnCount++);
			cell.setCellValue(costCenterDesc.get(dept.trim()));

			// 2015 Annual Payroll empty beacuase not available in database
			String year = csvReport.year;
			String[] hourlyRate;
			if (shiftsList.indexOf(0) != -1 && shiftsList.indexOf(0) != 0) {

				hourlyRate = hRManagerService.gethourlyRate(String.valueOf(dept), year);
				System.out.println("IF hourlyRate first condition ::::::: :: " + String.valueOf(hourlyRate));

			} else {
				hourlyRate = hRManagerService.gethourlyRate(factoryLocationList, String.valueOf(dept),
						csvReport.getShift(), year);
				System.out.println("ELSE hourlyRate condition ::::::::::: " + hourlyRate);
			}
			System.out.println("for loop");

			if (hourlyRate[0] != null && !hourlyRate[0].isEmpty() && !hourlyRate[0].equalsIgnoreCase("null")) {

				// double value = Double.parseDouble(hourlyRate[0].trim());
				// double hourly_Rate_value = Math.round(value);

				Cell hourlyRate0 = row.createCell(columnCount++);
				hourlyRate0.setCellStyle(currencyStyle);
				hourlyRate0.setCellType(Cell.CELL_TYPE_NUMERIC);
				hourlyRate0.setCellValue(Double.parseDouble(hourlyRate[0].trim()));

				annualPayroll += Double.parseDouble(hourlyRate[0].trim());
			} else {
				Cell hourlyRate0 = row.createCell(columnCount++);
				hourlyRate0.setCellStyle(currencyStyle);
				hourlyRate0.setCellType(Cell.CELL_TYPE_NUMERIC);
				hourlyRate0.setCellValue(Double.parseDouble("0.00"));
			}

			// Sum of % Inc empty beacuase not available in database

			Cell hourlyRate1 = row.createCell(columnCount++);
			hourlyRate1.setCellStyle(percentageStyle);
			hourlyRate1.setCellType(Cell.CELL_TYPE_NUMERIC);
			// Decimal value
			// String hourlyRate_Fraction =hourlyRate[1].trim();
			System.out.println("teST");
			System.out.println(hourlyRate[1]);
			// double
			// hourlyRate_Fraction_Truncate=Double.parseDouble(hourlyRate_Fraction);
			// DecimalFormat df1_hourlyRate_Fraction = new
			// DecimalFormat("#.##");
			// String
			// dx_hourlyRate_Fraction=df1_hourlyRate_Fraction.format(hourlyRate_Fraction_Truncate);
			// hourlyRate_Fraction_Truncate=Double.valueOf(dx_hourlyRate_Fraction);

			if (hourlyRate[1].equals("0.0")) {
				hourlyRate[1] = "0.00";
			}
			hourlyRate1.setCellValue(Double.parseDouble(hourlyRate[1].trim()) / 100);

			// 2016 Annual Payroll empty beacuase not available in database

			log.info(hourlyRate[2]);
			if (String.valueOf(hourlyRate[2]).equalsIgnoreCase("0.0") || hourlyRate[2].isEmpty()) {

				log.info("if");

				Cell hourlyRate2 = row.createCell(columnCount++);
				hourlyRate2.setCellStyle(currencyStyle);
				hourlyRate2.setCellType(Cell.CELL_TYPE_NUMERIC);
				// hourlyRate2.setCellValue(hourlyRate[0].trim());
				hourlyRate2.setCellValue("$0");
				annualPayroll17 += Double.parseDouble("0.00");

			} else {
				Cell hourlyRate2 = row.createCell(columnCount++);
				hourlyRate2.setCellStyle(currencyStyle);
				hourlyRate2.setCellType(Cell.CELL_TYPE_NUMERIC);
				// double value = Double.parseDouble(hourlyRate[2].trim());
				// double annual_Rate_value = Math.round(value);
				hourlyRate2.setCellValue(Double.parseDouble(hourlyRate[2].trim()));
				annualPayroll17 += Double.parseDouble(hourlyRate[2].trim());
				System.out.println("else annualPayroll17 :: " + annualPayroll17);
			}

		}
		// Grand Total of PayRolls and increasePercent

		System.out.println("annualPayroll TOTAL::::::::::::::   " + annualPayroll);
		System.out.println("annualPayroll17 TOTAL::::::::::::::   " + annualPayroll17);
		increasePercent = (((annualPayroll17 - annualPayroll) / annualPayroll) * 100);
		String stringPercent = String.valueOf(increasePercent);
		// String result = stringPercent.replaceAll("[-+^:,]", "");
		String result = stringPercent;
		System.out.println("increase PerCENTAGE::::::::::::::   " + result);

		Row totalRow = sheet.createRow(rowCount++);
		int totalColumnCount = 0;

		Cell cellt1 = totalRow.createCell(totalColumnCount++);
		cellt1.setCellValue("Grand Total");
		cellt1.setCellStyle(style);
		Cell cellt2 = totalRow.createCell(totalColumnCount++);
		cellt2.setCellValue("");

		Cell cellt3 = totalRow.createCell(totalColumnCount++);
		cellt3.setCellStyle(currencyStyleTotal);
		cellt3.setCellType(Cell.CELL_TYPE_NUMERIC);

		cellt3.setCellValue(annualPayroll);

		/*
		 * Handling null and NAN
		 * 
		 */
		// if(increasePercent < 0)
		// {
		// result="0.00";
		// }

		if (!result.equalsIgnoreCase("NaN") && !result.equalsIgnoreCase("NaN%")) {
			System.out.println("nan in if");
			Cell cellt4 = totalRow.createCell(totalColumnCount++);
			cellt4.setCellStyle(percentageStyleTotal);
			cellt4.setCellType(Cell.CELL_TYPE_NUMERIC);

			// String resultFraction =result;
			// double percentageTruncate=Double.parseDouble(resultFraction);
			// DecimalFormat df1 = new DecimalFormat("#.##");
			// String dx_Result=df1.format(percentageTruncate);
			// percentageTruncate=Double.valueOf(dx_Result);

			cellt4.setCellValue(Double.parseDouble(result) / 100);

		} else {
			Cell cellt4 = totalRow.createCell(totalColumnCount++);
			cellt4.setCellStyle(percentageStyleTotal);
			cellt4.setCellType(Cell.CELL_TYPE_NUMERIC);
			cellt4.setCellValue(Double.parseDouble("0.00"));

		}

		// if (cellt4.getCellType() == cellt4.CELL_TYPE_ERROR) {
		// cellt4.setCellValue("0.00%");
		// }
		// else
		// {
		// cellt4.setCellValue(increasePercent);
		// }
		Cell cellt5 = totalRow.createCell(totalColumnCount++);
		cellt5.setCellStyle(currencyStyleTotal);
		cellt5.setCellType(Cell.CELL_TYPE_NUMERIC);

		cellt5.setCellValue(annualPayroll17);

		// Selected Factory Locations and Employee Shifts Row

		Row emptyRow = sheet.createRow(rowCount++);

		Row selectedRow = sheet.createRow(rowCount++);
		int selectedLocationsColumnCount = 0;

		CellStyle selectedStyle = workbook.createCellStyle();
		HSSFFont selectedfont = workbook.createFont();
		selectedfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		selectedStyle.setFont(font);

		Cell cellSelectedLocations = selectedRow.createCell(selectedLocationsColumnCount++);
		cellSelectedLocations.setCellStyle(selectedStyle);
		cellSelectedLocations.setCellValue("Selected Locations");

		Cell cellSelectedShifts = selectedRow.createCell(selectedLocationsColumnCount++);
		cellSelectedShifts.setCellStyle(selectedStyle);
		cellSelectedShifts.setCellValue("Selected Shifts");

		int m = rowCount;

		for (String locations : factoryLocationList) {
			if (locations.equalsIgnoreCase("all")) {

			} else {
				if (locations != null && !locations.trim().equals("") && !locations.trim().equals(" ")) {
					Row loopRow = sheet.createRow(m++);
					int column1 = 0;
					Cell loopLocation = loopRow.createCell(column1);
					loopLocation.setCellValue(locations);
				}
			}
		}

		int n = rowCount;
		for (Integer shifts : shiftsList) {
			if (shifts == 0) {
				//
			} else {
				if (shifts != null && !String.valueOf(shifts).trim().equals("")
						&& !String.valueOf(shifts).trim().equals(" ")) {
					int column2 = 1;
					Row existRow = sheet.getRow(n++);
					if (existRow != null) {
						Cell loopShifts = existRow.createCell(column2);
						loopShifts.setCellValue(shifts);
					} else {
						Row loopnewRow = sheet.createRow(n - 1);
						Cell loopShifts = loopnewRow.createCell(column2);
						loopShifts.setCellValue(shifts);
					}
				}
			}
		}

		FileOutputStream outputStream = new FileOutputStream(excelReport);
		workbook.write(outputStream);
		outputStream.flush();
		outputStream.close();
	}

	public void addingRoles(Model model, HttpSession session) {

		System.out.println("adding roles");

		StringBuffer employeeHirerachy = (StringBuffer) session.getAttribute("employeeRoles");

		String employeeRole = employeeHirerachy.toString();

		log.info(employeeRole);

		String clockNumber = loginUser.getClockNumber();

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

		// model.addAttribute("dashboard", "dashboard");
		model.addAttribute("hrDashboard", "Manager");
		model.addAttribute("loginUser", loginUser);

	}

	/*
	 * CSV Report File Generator
	 */

}
