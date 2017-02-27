package com.lisi.annualassessment.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.DataFormat;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;

import com.lisi.annualassessment.emp.form.EncryptDecryptProcess;
import com.lisi.annualassessment.orm.CensusForm;

public class WriteXLSX {

	public static void buildDetailXLSX(Map<String, String> departmentMap, List<CensusForm> censusFormList,
			Map<String, List<String>> exemptSection2Map, Map<String, List<String>> nonExemptSection3Map,
			File excelReport, String annualYear, List<String> factoryLocationsList, List<Integer> shiftsList)
			throws FileNotFoundException, IOException, ParseException, NullPointerException {
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet("DetailedReport");
		CellStyle style = workbook.createCellStyle();
		HSSFFont font = workbook.createFont();
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		style.setFont(font);
		FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();

		String header[] = { "Clock Number", "Last Name", "First Name", "PSID", "DOH", "H-S", "E-Status", "A-Status",
				"Job Title", "Shift", "Supervisor", "Cost Center", "Cost Center Desc", "Factory Location",
				"Reason For Comp Record", "Comp Start Date", "Min", "Mid", "Max", "Paygrade", "CURRENT Hrly Rate",
				"CURRENT Annual Rate", "% Increase",
				"" + (Integer.parseInt(annualYear.trim().toString()) + 1) + " Hrly Rate",
				"" + (Integer.parseInt(annualYear.trim().toString()) + 1) + " Annual Rate",
				"" + annualYear.trim().toString() + " Performance Review Rating",
				"" + annualYear.trim().toString() + " Performance Review Comments / And Other Comments" };

		int rowCount = 0;
		Row headerRow = sheet.createRow(rowCount++);
		int headercolumnCount = 0;
		for (String aBook : header) {
			Cell cell = headerRow.createCell(headercolumnCount++);
			cell.setCellValue(aBook);
		}

		Iterator<CensusForm> employeesListItr = censusFormList.iterator();

		double totalCurrentHrlyRate = 0.00;
		double totalCurrentAnnualRate = 0.00;
		double increasePercentTotal = 0.00;
		double totalFutureHrlyRate = 0.00;
		double totalFutureAnnualRate = 0.00;

		HSSFCellStyle twoDigitCurrencyStyle = workbook.createCellStyle();
		twoDigitCurrencyStyle.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
		DataFormat twoDigitCurrencyFmt = workbook.createDataFormat();
		twoDigitCurrencyStyle.setDataFormat(twoDigitCurrencyFmt.getFormat("$#,##0.00"));

		HSSFCellStyle fourDigitCurrencyStyle = workbook.createCellStyle();
		fourDigitCurrencyStyle.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
		DataFormat fourDigitCurrencyFmt = workbook.createDataFormat();
		fourDigitCurrencyStyle.setDataFormat(fourDigitCurrencyFmt.getFormat("$#,####0.0000"));

		HSSFCellStyle percentageCurrencyStyle = workbook.createCellStyle();
		percentageCurrencyStyle.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
		DataFormat percentageFmt = workbook.createDataFormat();
		percentageCurrencyStyle.setDataFormat(percentageFmt.getFormat("0.0000000000%"));
		/*
		 * Total Values of Detail Report
		 */
		HSSFCellStyle twoDigitCurrencyStyleTotal = workbook.createCellStyle();
		twoDigitCurrencyStyleTotal.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
		DataFormat twoDigitCurrencyTotal = workbook.createDataFormat();
		twoDigitCurrencyStyleTotal.setDataFormat(twoDigitCurrencyTotal.getFormat("$#,##0.00"));
		HSSFFont fontTotal = workbook.createFont(); // HERE!
		fontTotal.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		twoDigitCurrencyStyleTotal.setFont(fontTotal);

		HSSFCellStyle fourDigitCurrencyStyleTotal = workbook.createCellStyle();
		fourDigitCurrencyStyleTotal.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
		DataFormat fourDigitCurrencyFmtTotal = workbook.createDataFormat();
		fourDigitCurrencyStyleTotal.setDataFormat(fourDigitCurrencyFmtTotal.getFormat("$#,####0.0000"));
		fourDigitCurrencyStyleTotal.setFont(fontTotal);

		HSSFCellStyle percentageCurrencyStyleTotal = workbook.createCellStyle();
		percentageCurrencyStyleTotal.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
		DataFormat percentageFmtTotal = workbook.createDataFormat();
		percentageCurrencyStyleTotal.setDataFormat(percentageFmtTotal.getFormat("0.0000000000%"));
		percentageCurrencyStyleTotal.setFont(fontTotal);

		while (employeesListItr.hasNext()) {
			Row row = sheet.createRow(rowCount++);
			int columnCount = 0;
			CensusForm censusForm = employeesListItr.next();
			System.out.println("=========================================================");
			System.out.println("CostCenter:::::::::::::::::   " + censusForm.getCostCenter());
			System.out.println("Shift:::::::::::::::::   " + censusForm.getShift());

			Cell cell = row.createCell(columnCount++);
			cell.setCellValue(censusForm.getEmpClockNumber());

			cell = row.createCell(columnCount++);
			cell.setCellValue(censusForm.getEmplastName());

			cell = row.createCell(columnCount++);
			cell.setCellValue(censusForm.getEmpfirstName());

			cell = row.createCell(columnCount++);
			cell.setCellValue(censusForm.getCompanyPsid());

			cell = row.createCell(columnCount++);
			cell.setCellValue(Converters.getDateInString(censusForm.getDOH()));

			cell = row.createCell(columnCount++);
			cell.setCellValue(censusForm.getHourlyOrSalary());

			cell = row.createCell(columnCount++);
			cell.setCellValue(censusForm.geteStatus());
			
			cell = row.createCell(columnCount++);
			cell.setCellValue(censusForm.getStatus());

			cell = row.createCell(columnCount++);
			cell.setCellValue(censusForm.getJobTitle());

			cell = row.createCell(columnCount++);
			cell.setCellValue(censusForm.getShift());

			cell = row.createCell(columnCount++);
			cell.setCellValue(censusForm.getSupervisorLasttName() + "," + censusForm.getSupervisorFirstName());

			cell = row.createCell(columnCount++);
			cell.setCellValue(censusForm.getCostCenter());
			/*
			 * COST CENTER DESCRIPTION IS NOT EXIST IN DATABASE
			 */

			cell = row.createCell(columnCount++);
			cell.setCellValue(departmentMap.get(censusForm.getCostCenter().trim()));
			
			cell = row.createCell(columnCount++);
			cell.setCellValue(censusForm.getFactoryLocation().trim());


			cell = row.createCell(columnCount++);
			cell.setCellValue(censusForm.getReasonForCompRecord());
			
			
			/* censusForm.getCompStartDate() is getting null values */
			if (censusForm.getCompStartDate() != null) {
				cell = row.createCell(columnCount++);
				cell.setCellValue(Converters.getDateInString(censusForm.getCompStartDate()));
			} else {
				cell = row.createCell(columnCount++);
				cell.setCellValue("");
			}

			Cell min = row.createCell(columnCount++);
			min.setCellStyle(twoDigitCurrencyStyle);
			min.setCellType(Cell.CELL_TYPE_NUMERIC);
			String minDecryptedValue = censusForm.getMinValue().trim();
			String minDecrypt = EncryptDecryptProcess.decryptTechnique(minDecryptedValue);
			min.setCellValue(Double.parseDouble(minDecrypt));

			Cell mid = row.createCell(columnCount++);
			mid.setCellStyle(twoDigitCurrencyStyle);
			mid.setCellType(Cell.CELL_TYPE_NUMERIC);
			String midDecryptedValue = censusForm.getMidValue().trim();
			String midDecrypt = EncryptDecryptProcess.decryptTechnique(midDecryptedValue);
			mid.setCellValue(Double.parseDouble(midDecrypt));

			Cell max = row.createCell(columnCount++);
			max.setCellStyle(twoDigitCurrencyStyle);
			max.setCellType(Cell.CELL_TYPE_NUMERIC);
			String maxDecryptedValue = censusForm.getMaxValue().trim();
			String maxDecrypt = EncryptDecryptProcess.decryptTechnique(maxDecryptedValue);
			max.setCellValue(Double.parseDouble(maxDecrypt));

			cell = row.createCell(columnCount++);
			cell.setCellValue(censusForm.getPayGradeId().trim());

			/*
			 * if (censusForm.getCurrentHrlyRate() != null &&
			 * !censusForm.getCurrentHrlyRate().isEmpty() &&
			 * !censusForm.getCurrentHrlyRate().equalsIgnoreCase("null")) {
			 * 
			 * Cell curntHourlyRate = row.createCell(columnCount++);
			 * curntHourlyRate.setCellStyle(twoDigitCurrencyStyle);
			 * curntHourlyRate.setCellType(Cell.CELL_TYPE_NUMERIC); String
			 * curntHourlyRate_DecryptedValue =
			 * censusForm.getCurrentHrlyRate().trim(); String
			 * curntHourlyRate_Decrypt = EncryptDecryptProcess.decryptTechnique(
			 * curntHourlyRate_DecryptedValue);
			 * curntHourlyRate.setCellValue(Double.parseDouble(
			 * curntHourlyRate_Decrypt));
			 * 
			 * totalCurrentHrlyRate +=
			 * Double.parseDouble(curntHourlyRate_Decrypt);
			 * 
			 * } else { Cell curntHourlyRate = row.createCell(columnCount++);
			 * curntHourlyRate.setCellStyle(twoDigitCurrencyStyle);
			 * curntHourlyRate.setCellType(Cell.CELL_TYPE_NUMERIC);
			 * curntHourlyRate.setCellValue(Double.parseDouble("0.00"));
			 * 
			 * totalCurrentHrlyRate += Double.parseDouble("0.00"); }
			 */

			if (censusForm.getAnnaulRate() != null && !censusForm.getAnnaulRate().isEmpty()
					&& !censusForm.getAnnaulRate().equalsIgnoreCase("null")) {
				Cell curntHourlyRate = row.createCell(columnCount++);
				curntHourlyRate.setCellStyle(twoDigitCurrencyStyle);
				curntHourlyRate.setCellType(Cell.CELL_TYPE_NUMERIC);
				String annualRate_DecryptedValue = censusForm.getAnnaulRate().trim();
				String annualRate_Decrypt = EncryptDecryptProcess.decryptTechnique(annualRate_DecryptedValue);
				curntHourlyRate.setCellValue((Double.parseDouble(annualRate_Decrypt) / 2080));
				totalCurrentHrlyRate += (Double.parseDouble(annualRate_Decrypt) / 2080);

			} else {
				Cell curntHourlyRate = row.createCell(columnCount++);
				curntHourlyRate.setCellStyle(twoDigitCurrencyStyle);
				curntHourlyRate.setCellType(Cell.CELL_TYPE_NUMERIC);
				curntHourlyRate.setCellValue(Double.parseDouble("0.00"));
				totalCurrentHrlyRate += Double.parseDouble("0.00");
			}

			if (censusForm.getAnnaulRate() != null && !censusForm.getAnnaulRate().isEmpty()
					&& !censusForm.getAnnaulRate().equalsIgnoreCase("null")) {

				Cell curntannualRate = row.createCell(columnCount++);
				curntannualRate.setCellStyle(twoDigitCurrencyStyle);
				curntannualRate.setCellType(Cell.CELL_TYPE_NUMERIC);
				String annualRate_DecryptedValue = censusForm.getAnnaulRate().trim();
				String annualRate_Decrypt = EncryptDecryptProcess.decryptTechnique(annualRate_DecryptedValue);

				curntannualRate.setCellValue(Double.parseDouble(annualRate_Decrypt));

				totalCurrentAnnualRate += Double.parseDouble(annualRate_Decrypt);

			} else {
				Cell curntannualRate = row.createCell(columnCount++);
				curntannualRate.setCellStyle(twoDigitCurrencyStyle);
				curntannualRate.setCellType(Cell.CELL_TYPE_NUMERIC);
				curntannualRate.setCellValue(Double.parseDouble("0.00"));

				totalCurrentAnnualRate += Double.parseDouble("0.00");
			}

			/*
			 * Increase IS NOT EXIST IN DATABASE AND KEPT EMPTY
			 */

			double multiplyByRate = 0.00;

			if (censusForm.getPercentageOfIncrease() != null && !censusForm.getPercentageOfIncrease().isEmpty()
					&& !censusForm.getPercentageOfIncrease().equalsIgnoreCase("null")) {

				Cell increasePercentage = row.createCell(columnCount++);
				increasePercentage.setCellStyle(percentageCurrencyStyle);
				increasePercentage.setCellType(Cell.CELL_TYPE_NUMERIC);
				increasePercentage.setCellValue(Double.parseDouble(censusForm.getPercentageOfIncrease().trim()) / 100);

				System.out.println(
						"Percent Of Increase:::::::::::  " + censusForm.getPercentageOfIncrease().trim().toString());
				multiplyByRate = Double.parseDouble(censusForm.getPercentageOfIncrease().trim());
				multiplyByRate = multiplyByRate / 100;
				System.out.println("Multiply RateL::::::::::: " + multiplyByRate);

			} else {
				Cell increasePercentage = row.createCell(columnCount++);
				increasePercentage.setCellStyle(percentageCurrencyStyle);
				increasePercentage.setCellType(Cell.CELL_TYPE_NUMERIC);
				increasePercentage.setCellValue(Double.parseDouble("0.00"));

				multiplyByRate = 0.00;
				System.out.println("Multiply RateL::::::::::: " + multiplyByRate);
			}

			/* 2016 Hrly Rate IS NOT EXIST IN DATABASE AND KEPT EMPTY */
			/*
			 * if (censusForm.getCurrentHrlyRate() != null &&
			 * !censusForm.getCurrentHrlyRate().isEmpty() &&
			 * !censusForm.getCurrentHrlyRate().equalsIgnoreCase("null")) {
			 * double inputHrlyRate = Double.parseDouble(
			 * EncryptDecryptProcess.decryptTechnique(censusForm.
			 * getCurrentHrlyRate().trim().toString())); // BigDecimal
			 * inputHrlyRate = new //
			 * BigDecimal(censusForm.getCurrentHrlyRate().trim().toString());
			 * double resultHrlyRate = (inputHrlyRate * multiplyByRate);
			 * resultHrlyRate = (resultHrlyRate + inputHrlyRate);
			 * 
			 * String hrlyRate = String.valueOf(resultHrlyRate);
			 * 
			 * Cell futureHourlyRate = row.createCell(columnCount++);
			 * futureHourlyRate.setCellStyle(fourDigitCurrencyStyle);
			 * futureHourlyRate.setCellType(Cell.CELL_TYPE_NUMERIC);
			 * futureHourlyRate.setCellValue(
			 * Double.parseDouble(hrlyRate.trim()));
			 * 
			 * totalFutureHrlyRate += Double.parseDouble(hrlyRate.trim());
			 * 
			 * } else { Cell futureHourlyRate = row.createCell(columnCount++);
			 * futureHourlyRate.setCellStyle(percentageCurrencyStyle);
			 * futureHourlyRate.setCellType(Cell.CELL_TYPE_NUMERIC);
			 * futureHourlyRate.setCellValue(Double.parseDouble("0.00"));
			 * 
			 * totalFutureHrlyRate += Double.parseDouble("0.00"); }
			 */

			if (censusForm.getAnnaulRate() != null && !censusForm.getAnnaulRate().isEmpty()
					&& !censusForm.getAnnaulRate().equalsIgnoreCase("null")) {
				double inputAnnaulRate = Double
						.parseDouble(EncryptDecryptProcess.decryptTechnique(censusForm.getAnnaulRate().toString()));
				// BigDecimal inputAnnaulRate = new
				// BigDecimal(censusForm.getAnnaulRate().toString());
				double resultAnnaulRate = (inputAnnaulRate * multiplyByRate);
				resultAnnaulRate = (resultAnnaulRate + inputAnnaulRate);

				String annualRate = String.valueOf(resultAnnaulRate);
				Cell futureHourlyRate = row.createCell(columnCount++);
				futureHourlyRate.setCellStyle(twoDigitCurrencyStyle);
				futureHourlyRate.setCellType(Cell.CELL_TYPE_NUMERIC);
				futureHourlyRate.setCellValue((Double.parseDouble(annualRate.trim())) / 2080);

				totalFutureHrlyRate += (Double.parseDouble(annualRate.trim()) / 2080);

			} else {
				Cell futureHourlyRate = row.createCell(columnCount++);
				futureHourlyRate.setCellStyle(twoDigitCurrencyStyle);
				futureHourlyRate.setCellType(Cell.CELL_TYPE_NUMERIC);
				futureHourlyRate.setCellValue(Double.parseDouble("0.00"));
				totalFutureHrlyRate += Double.parseDouble("0.00");
			}

			/* 2016 Annual Rate IS NOT EXIST IN DATABASE AND KEPT EMPTY */
			if (censusForm.getAnnaulRate() != null && !censusForm.getAnnaulRate().isEmpty()
					&& !censusForm.getAnnaulRate().equalsIgnoreCase("null")) {
				double inputAnnaulRate = Double
						.parseDouble(EncryptDecryptProcess.decryptTechnique(censusForm.getAnnaulRate().toString()));
				// BigDecimal inputAnnaulRate = new
				// BigDecimal(censusForm.getAnnaulRate().toString());
				double resultAnnaulRate = (inputAnnaulRate * multiplyByRate);
				resultAnnaulRate = (resultAnnaulRate + inputAnnaulRate);

				String annualRate = String.valueOf(resultAnnaulRate);

				Cell futreAnnualRate = row.createCell(columnCount++);
				futreAnnualRate.setCellStyle(twoDigitCurrencyStyle);
				futreAnnualRate.setCellType(Cell.CELL_TYPE_NUMERIC);
				futreAnnualRate.setCellValue(Double.parseDouble(annualRate.trim()));

				totalFutureAnnualRate += Double.parseDouble(annualRate.trim());

			} else {
				Cell futreAnnualRate = row.createCell(columnCount++);
				futreAnnualRate.setCellStyle(twoDigitCurrencyStyle);
				futreAnnualRate.setCellType(Cell.CELL_TYPE_NUMERIC);
				futreAnnualRate.setCellValue(Double.parseDouble("0.00"));

				totalFutureAnnualRate += Double.parseDouble("0.00");
			}

			/*
			 * 2015 Performance Review Rating IS NOT EXIST IN DATABASE AND KEPT
			 * EMPTY
			 */

			if (censusForm.getExemptOrNonExempt().equalsIgnoreCase("exempt")) {
				List<String> resultData = exemptSection2Map.get(String.valueOf(censusForm.getEmpClockNumber()));
				if (resultData != null && !resultData.isEmpty()) {
					cell = row.createCell(columnCount++);
					cell.setCellValue(resultData.get(0));
				} else {
					cell = row.createCell(columnCount++);
					cell.setCellValue("");
				}
			}

			if (censusForm.getExemptOrNonExempt().equalsIgnoreCase("non-Exempt")) {
				List<String> resultData = nonExemptSection3Map.get(String.valueOf(censusForm.getEmpClockNumber()));
				if (resultData != null && !resultData.isEmpty()) {
					cell = row.createCell(columnCount++);
					cell.setCellValue(resultData.get(0));
				} else {
					cell = row.createCell(columnCount++);
					cell.setCellValue("");
				}
			}

			/*
			 * 2015 Performance Review Comments / And Other Comments IS NOT
			 * EXIST IN DATABASE AND KEPT EMPTY
			 */
			if (censusForm.getExemptOrNonExempt().equalsIgnoreCase("exempt")) {
				List<String> resultData = exemptSection2Map.get(String.valueOf(censusForm.getEmpClockNumber()));
				if (resultData != null && !resultData.isEmpty()) {
					cell = row.createCell(columnCount++);
					cell.setCellValue(resultData.get(1));
				} else {
					cell = row.createCell(columnCount++);
					cell.setCellValue("");
				}
			}

			if (censusForm.getExemptOrNonExempt().equalsIgnoreCase("non-Exempt")) {
				List<String> resultData = nonExemptSection3Map.get(String.valueOf(censusForm.getEmpClockNumber()));
				if (resultData != null && !resultData.isEmpty()) {
					cell = row.createCell(columnCount++);
					cell.setCellValue(resultData.get(1));
				} else {
					cell = row.createCell(columnCount++);
					cell.setCellValue("");
				}
			}
			System.out.println("=========================================================");
		}

		Row totalHeaderRow = sheet.createRow(rowCount++);
		int totalHeaderColumnCount = 0;

		/*
		 * calculating Increase Percentage
		 */

		increasePercentTotal += (((totalFutureAnnualRate - totalCurrentAnnualRate) / totalCurrentAnnualRate) * 100);
		
		Cell celle0 = totalHeaderRow.createCell(totalHeaderColumnCount++);
		celle0.setCellValue("");
		
		Cell celle1 = totalHeaderRow.createCell(totalHeaderColumnCount++);
		celle1.setCellValue("");

		Cell celle2 = totalHeaderRow.createCell(totalHeaderColumnCount++);
		celle2.setCellValue("");

		Cell celle3 = totalHeaderRow.createCell(totalHeaderColumnCount++);
		celle3.setCellValue("");

		Cell celle4 = totalHeaderRow.createCell(totalHeaderColumnCount++);
		celle4.setCellValue("");

		Cell celle5 = totalHeaderRow.createCell(totalHeaderColumnCount++);
		celle5.setCellValue("");

		Cell celle6 = totalHeaderRow.createCell(totalHeaderColumnCount++);
		celle6.setCellValue("");

		Cell celle7 = totalHeaderRow.createCell(totalHeaderColumnCount++);
		celle7.setCellValue("");

		Cell celle8 = totalHeaderRow.createCell(totalHeaderColumnCount++);
		celle8.setCellValue("");

		Cell celle9 = totalHeaderRow.createCell(totalHeaderColumnCount++);
		celle9.setCellValue("");

		Cell celle10 = totalHeaderRow.createCell(totalHeaderColumnCount++);
		celle10.setCellValue("");

		Cell celle11 = totalHeaderRow.createCell(totalHeaderColumnCount++);
		celle11.setCellValue("");

		Cell celle12 = totalHeaderRow.createCell(totalHeaderColumnCount++);
		celle12.setCellValue("");

		Cell celle13 = totalHeaderRow.createCell(totalHeaderColumnCount++);
		celle13.setCellValue("");

		Cell celle14 = totalHeaderRow.createCell(totalHeaderColumnCount++);
		celle14.setCellValue("");

		Cell celle15 = totalHeaderRow.createCell(totalHeaderColumnCount++);
		celle15.setCellValue("");

		Cell celle16 = totalHeaderRow.createCell(totalHeaderColumnCount++);
		celle16.setCellValue("");

		Cell celle17 = totalHeaderRow.createCell(totalHeaderColumnCount++);
		celle17.setCellValue("");

		Cell celle18 = totalHeaderRow.createCell(totalHeaderColumnCount++);
		celle18.setCellValue("");
		Cell celle24 = totalHeaderRow.createCell(totalHeaderColumnCount++);
		celle24.setCellValue("");

		Cell celle19 = totalHeaderRow.createCell(totalHeaderColumnCount++);
		celle19.setCellValue("Total of Current Hrly Rate");
		celle19.setCellStyle(style);
		Cell celle20 = totalHeaderRow.createCell(totalHeaderColumnCount++);
		celle20.setCellValue("Total of Current Annual Rate");
		celle20.setCellStyle(style);
		Cell celle21 = totalHeaderRow.createCell(totalHeaderColumnCount++);
		celle21.setCellValue("Total of % Increase");
		celle21.setCellStyle(style);
		Cell celle22 = totalHeaderRow.createCell(totalHeaderColumnCount++);
		celle22.setCellValue("Total of " + (Integer.parseInt(annualYear.trim().toString()) + 1) + " Hrly Rate");
		celle22.setCellStyle(style);
		Cell celle23 = totalHeaderRow.createCell(totalHeaderColumnCount++);
		celle23.setCellValue("Total of " + (Integer.parseInt(annualYear.trim().toString()) + 1) + " Annual Rate");
		celle23.setCellStyle(style);

		// Total of Hrly Rate and Annual Rate

		Row totalRow = sheet.createRow(rowCount++);
		int totalColumnCount = 0;
		
		Cell cellt0 = totalRow.createCell(totalColumnCount++);
		cellt0.setCellValue("");
		
		Cell cellt1 = totalRow.createCell(totalColumnCount++);
		cellt1.setCellValue("");

		Cell cellt2 = totalRow.createCell(totalColumnCount++);
		cellt2.setCellValue("");

		Cell cellt3 = totalRow.createCell(totalColumnCount++);
		cellt3.setCellValue("");

		Cell cellt4 = totalRow.createCell(totalColumnCount++);
		cellt4.setCellValue("");

		Cell cellt5 = totalRow.createCell(totalColumnCount++);
		cellt5.setCellValue("");

		Cell cellt6 = totalRow.createCell(totalColumnCount++);
		cellt6.setCellValue("");

		Cell cellt7 = totalRow.createCell(totalColumnCount++);
		cellt7.setCellValue("");

		Cell cellt8 = totalRow.createCell(totalColumnCount++);
		cellt8.setCellValue("");

		Cell cellt9 = totalRow.createCell(totalColumnCount++);
		cellt9.setCellValue("");

		Cell cellt10 = totalRow.createCell(totalColumnCount++);
		cellt10.setCellValue("");

		Cell cellt11 = totalRow.createCell(totalColumnCount++);
		cellt11.setCellValue("");

		Cell cellt12 = totalRow.createCell(totalColumnCount++);
		cellt12.setCellValue("");

		Cell cellt13 = totalRow.createCell(totalColumnCount++);
		cellt13.setCellValue("");

		Cell cellt14 = totalRow.createCell(totalColumnCount++);
		cellt14.setCellValue("");

		Cell cellt15 = totalRow.createCell(totalColumnCount++);
		cellt15.setCellValue("");

		Cell cellt16 = totalRow.createCell(totalColumnCount++);
		cellt16.setCellValue("");

		Cell cellt17 = totalRow.createCell(totalColumnCount++);
		cellt17.setCellValue("");

		Cell cellt18 = totalRow.createCell(totalColumnCount++);
		cellt18.setCellValue("");
		// newly added
		Cell cellt24 = totalRow.createCell(totalColumnCount++);
		cellt24.setCellValue("");
		Cell cellt19 = totalRow.createCell(totalColumnCount++);
		cellt19.setCellStyle(twoDigitCurrencyStyleTotal);
		cellt19.setCellType(Cell.CELL_TYPE_NUMERIC);
		cellt19.setCellValue(totalCurrentHrlyRate);

		Cell cellt20 = totalRow.createCell(totalColumnCount++);
		cellt20.setCellStyle(twoDigitCurrencyStyleTotal);
		cellt20.setCellType(Cell.CELL_TYPE_NUMERIC);
		cellt20.setCellValue(totalCurrentAnnualRate);

		Cell cellt21 = totalRow.createCell(totalColumnCount++);
		cellt21.setCellStyle(percentageCurrencyStyleTotal);
		cellt21.setCellType(Cell.CELL_TYPE_NUMERIC);
		cellt21.setCellValue(increasePercentTotal / 100);

		Cell cellt22 = totalRow.createCell(totalColumnCount++);
		cellt22.setCellStyle(twoDigitCurrencyStyleTotal);
		cellt22.setCellType(Cell.CELL_TYPE_NUMERIC);
		cellt22.setCellValue(totalFutureHrlyRate);

		Cell cellt23 = totalRow.createCell(totalColumnCount++);
		cellt23.setCellStyle(twoDigitCurrencyStyleTotal);
		cellt23.setCellType(Cell.CELL_TYPE_NUMERIC);
		cellt23.setCellValue(totalFutureAnnualRate);

		// Selected Factory Locations and Employee Shifts Row

		Row emptyRow1 = sheet.createRow(rowCount++);

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

		for (String locations : factoryLocationsList) {
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

	/*
	 * public static void buildSummaryXLSX(List<CensusForm> censusFormList, File
	 * excelReport) throws FileNotFoundException, IOException { XSSFWorkbook
	 * workbook = new XSSFWorkbook(); XSSFSheet sheet =
	 * workbook.createSheet("Details");
	 * 
	 * String header[] = { "Cost Center", "Cost Center Description",
	 * "2015 Annual Payroll", "Sum of % Inc", "2016 Annual Payroll" };
	 * 
	 * int rowCount = 0; Row headerRow = sheet.createRow(rowCount++); int
	 * headercolumnCount = 0; for (String aBook : header) { Cell cell =
	 * headerRow.createCell(headercolumnCount++); cell.setCellValue(aBook); }
	 * 
	 * Iterator<CensusForm> employeesListItr = censusFormList.iterator();
	 * 
	 * while (employeesListItr.hasNext()) { Row row =
	 * sheet.createRow(rowCount++); int columnCount = 0; CensusForm censusForm =
	 * employeesListItr.next(); Cell cell = row.createCell(columnCount++);
	 * cell.setCellValue(censusForm.getCostCenter());
	 * 
	 * // Cost Center Description empty beacuase not available in database
	 * 
	 * cell = row.createCell(columnCount++); cell.setCellValue("");
	 * 
	 * // 2015 Annual Payroll empty beacuase not available in database
	 * 
	 * cell = row.createCell(columnCount++); cell.setCellValue("");
	 * 
	 * // Sum of % Inc empty beacuase not available in database
	 * 
	 * cell = row.createCell(columnCount++); cell.setCellValue("");
	 * 
	 * // 2016 Annual Payroll empty beacuase not available in database
	 * 
	 * cell = row.createCell(columnCount++); cell.setCellValue(""); }
	 * 
	 * FileOutputStream outputStream = new FileOutputStream(excelReport);
	 * workbook.write(outputStream); outputStream.close(); }
	 */

}
