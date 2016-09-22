package com.lisi.annaulAssessment.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.lisi.annaualAssessment.orm.CensusForm;
import com.lisi.annaualAssessment.orm.Disciplinary;
import com.lisi.annaualAssessment.orm.Hierarchy;
import com.lisi.annaulAssessment.Emp.Form.XLSXFormValidation;
import com.lisi.annaulAssessment.pojo.ClockNumbers;
import com.lisi.annaulAssessment.pojo.UploadForm;
import com.lisi.annaulAssessment.service.EmployeeService;
import com.lisi.annaulAssessment.service.UploadFormService;
import com.lisi.annaulAssessment.util.Converters;

@Controller
public class CensusFileUploadController {

	private static final Logger log = Logger.getLogger(CensusFileUploadController.class);

	@Autowired
	private UploadFormService uploadFormService;

	@Autowired
	private EmployeeService empService;

	public static Set<String> clockNumbers;

	public static Set<String> supervisor = new HashSet<String>();

	public static Set<String> hrManager = new HashSet<String>();

	public static Set<String> hrGeneralist = new HashSet<String>();

	public static Set<String> employee = new HashSet<String>();

	public int errorCount = 1;
	
	public int errorHead=0;
	public static String cellOneErrorMessage;

	public static String cellTwoErrorMessage="";
	
	public static String firstName;
	
	public static String lastName;

	public String rowDead = "";

	@RequestMapping(value = "sourceFileUpload", method = RequestMethod.POST)
	public ModelAndView uploadFile(@ModelAttribute(value = "SOURCEFORM") UploadForm form, BindingResult result)
			throws IOException {

	//	String filePath = "";
	//	String orginalName = "";
		log.info("uploadController");

		List<Integer> dbEmp = empService.getEmployees();

		System.out.println(dbEmp.size() + " db employee size ");
		System.out.println(dbEmp);

		if (!result.hasErrors()) {
			synchronized (this) {

				CommonsMultipartFile multiPartFile = form.getFile();

				String orginalName = multiPartFile.getOriginalFilename();
				
				if (multiPartFile.getName() != null) {
					log.info("if");

					orginalName = multiPartFile.getName();

					log.info(orginalName + " org");

					// filePath = multiPartFile.getOriginalFilename();

				//	filePath = multiPartFile.getOriginalFilename();

				//	log.info(filePath.toString() + " filepath");

				}
				
				String filePath = System.getProperty("java.io.tmpdir")
						+ "/" + orginalName;
				File destination = new File(filePath);
				multiPartFile.transferTo(destination);
				
				
				
		//		FileOutputStream fileOut = new FileOutputStream("C:/Users/pavan.k/Desktop/details/File for Joro 09-20-2016-1.xlsx");
				FileOutputStream fileOut = new FileOutputStream("C:/report.xls");

				HSSFWorkbook workbook = new HSSFWorkbook();
				HSSFSheet worksheet = workbook.createSheet("census Report data");

				
				
				// C:/Users/pavan.k/Desktop/lisi-annaulAssesmenT/threeRow.xlsx

			//	File filePath1 = new File("C:/Users/pavan.k/Desktop/details/Sample File for Joro 08-30-2016.xlsx");

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

				// Iterator<Row> delExistingClock=sheet.iterator();

				// Total number of records.
				int rowsCount = sheet.getLastRowNum();

				clockNumbers = getSuperviousHrclockNumbers(clockIterator);
				log.info(clockNumbers);
	//			log.info("all emp " + employee);

				try {
					// log.info("after clock nums");
					while (rowIterator.hasNext()) {
						Row row = rowIterator.next();

						cellTwoErrorMessage="";
						
						CensusForm censusForm = new CensusForm();
						Hierarchy hierarchy = new Hierarchy();
						Disciplinary disciplinary = new Disciplinary();

						rowDead=" ";
						Iterator<Cell> cellIterator = row.cellIterator();
				//		HSSFRow errorHeader = worksheet.createRow((int) 0);
						while (cellIterator.hasNext()) {

							Cell cell = cellIterator.next();
							if (cell.getRowIndex() < 1) {
								dataHeaderMap.put("" + cell.getRowIndex() + "" + cell.getColumnIndex(),
										cell.getStringCellValue());

								System.out.println(cell.getColumnIndex() + " : " + cell.getStringCellValue());

								censusForm = null;
								// System.out.print(cell.getRowIndex() + "
								// column " +
								// cell.getColumnIndex());

							} else {

								switch (cell.getCellType()) {

								case Cell.CELL_TYPE_STRING:

				//					log.info("0" + cell.getColumnIndex() + " READING COLUMN");
									/*
									 * log.info( "header  " +
									 * dataHeaderMap.get(0 + "" +
									 * cell.getColumnIndex()));
									 */

									censusForm = XLSXFormValidation.setCensusFormFields(censusForm, hierarchy,
											disciplinary, dataHeaderMap.get(0 + "" + cell.getColumnIndex()),
											cell.getStringCellValue());

									break;
								case Cell.CELL_TYPE_NUMERIC:
									// log.info(0 + "numeric" +
									// cell.getColumnIndex());
									/*
									 * log.info("header  " +dataHeaderMap.get(0
									 * + "" + cell.getColumnIndex()));
									 */
									if (DateUtil.isCellDateFormatted(cell)) {
										// System.out.println("if");
					//					log.info(dataHeaderMap.get(0 + "" + cell.getColumnIndex() + " READING COLUMN"));

										censusForm = XLSXFormValidation.setCensusFormFields(censusForm, hierarchy,
												disciplinary, dataHeaderMap.get(0 + "" + cell.getColumnIndex()),
												cell.getDateCellValue() + "");

									} else {

										// System.out.println("else");

										/*
										 * System.out.println(
										 * XLSXFormValidation.replaceDotZeros(
										 * cell.getNumericCellValue() + ""));
										 */
					//					log.info(dataHeaderMap.get(0 + "" + cell.getColumnIndex() + " READING COLUMN"));
										if (cell.getColumnIndex() == 0) {

											if (dbEmp.contains(Integer.parseInt(XLSXFormValidation
													.replaceDotZeros(cell.getNumericCellValue() + "")))) {

												// System.out.println("yes emp
												// exists");
												uploadFormService
														.deleteExistingEmployees(Integer.parseInt(XLSXFormValidation
																.replaceDotZeros(cell.getNumericCellValue() + "")));
												
												uploadFormService.deleteHierarchy(Integer.parseInt(XLSXFormValidation
														.replaceDotZeros(cell.getNumericCellValue() + "")));
												
												uploadFormService.deleteDisciplinary(Integer.parseInt(XLSXFormValidation
														.replaceDotZeros(cell.getNumericCellValue() + "")));

											}
										}

										// System.out.println("min call");
										censusForm = XLSXFormValidation.setCensusFormFields(censusForm, hierarchy,
												disciplinary, dataHeaderMap.get(0 + "" + cell.getColumnIndex()),
												cell.getNumericCellValue() + "");
									}
									break;
								case Cell.CELL_TYPE_BOOLEAN:
									// log.info(0 + "boolean" +
									// cell.getColumnIndex());
									/*
									 * log.info("header  " +dataHeaderMap.get(0
									 * + "" + cell.getColumnIndex()));
									 */
					//				log.info(dataHeaderMap.get(0 + "" + cell.getColumnIndex() + " READING COLUMN"));
									censusForm = XLSXFormValidation.setCensusFormFields(censusForm, hierarchy,
											disciplinary, dataHeaderMap.get(0 + "" + cell.getColumnIndex()),
											cell.getBooleanCellValue() + "");
									break;

								case Cell.CELL_TYPE_BLANK:
									// log.info(0 + "blank" +
									// cell.getColumnIndex());
									/*
									 * log.info("header  " +dataHeaderMap.get(0
									 * + "" + cell.getColumnIndex()));
									 */
						//			log.info(dataHeaderMap.get(0 + "" + cell.getColumnIndex() + " READING COLUMN"));
									censusForm = XLSXFormValidation.setCensusFormFields(censusForm, hierarchy,
											disciplinary, dataHeaderMap.get(0 + "" + cell.getColumnIndex()),
											cell.getStringCellValue());

									break;

								default:

								}

								// breaking the loop, if they are having missing
								// values in a
								// row.

								if (censusForm == null) {
									log.info("censusform is null");

									rowDead = "i am holding null data";

								/*	System.out.println("error count " + errorCount);
									System.out
											.println("record holding an wrong data... clock num" + cellOneErrorMessage);
									System.out
											.println("record holding an wrong data... errormssg" + cellTwoErrorMessage);*/
									
									censusForm = new CensusForm();
									// creating an row for error message part
								/*	HSSFRow errorRow = worksheet.createRow((int) errorCount);

									HSSFCell firstCell = errorRow.createCell((int) 0);
									firstCell.setCellValue(cellOneErrorMessage);
									HSSFCell secondCell = errorRow.createCell((int) 1);
									secondCell.setCellValue(firstLastName);
									HSSFCell thirdCell = errorRow.createCell((int) 2);
									thirdCell.setCellValue(cellTwoErrorMessage);
									// workbook.write(fileOut);
									// fileOut.flush();
									 censusForm = new CensusForm();
									// log.info("obj null break %%%%%%%%");
									 errorCount++;*/
									// break;
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
		///					System.out.println("Error Head"+ errorHead);
						//	if(errorHead == 0){
								
								firstCell = errorHeader.createCell((int) 0);
								firstCell.setCellValue("Clock Number");
								secondCell = errorHeader.createCell((int) 1);
								 secondCell.setCellValue("First Name");
								 thirdCell = errorHeader.createCell((int) 2);
								 thirdCell.setCellValue("Last Name");
								 fourthCell = errorHeader.createCell((int) 3);
								 fourthCell.setCellValue("Error Message");
						//	}
							
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

						// adding objects if they are not accetable.
						if (censusForm != null) {

			//				System.out.println("inserting record...");
							censusFormList.add(censusForm);
			//				System.out.println("censusFormList" + censusFormList);
							censusForm.setAnnaulYear(Converters.getCurrentYear());
							censusForm.setStatus("Not Started");

							Date todayDate = new Date();
							censusForm.setCompletedDate(todayDate.toString());
							
							disciplinary.setEmpClockNumber(censusForm.getEmpClockNumber());

							// log.info(" clck num " +
							// censusForm.getEmpClockNumber());

							
						//	disciplinary.setDisciplinary(censusForm.getDiscDate());
							hierarchy.setApprisalYear(Converters.getCurrentYear());

							// log.info("date : " + censusForm.getDiscDate());

							// log.info("disc " +
							// censusForm.getDisciplinaryDescription());

				//			disciplinary.setDisciplinaryDescription(censusForm.getDisciplinaryDescription());

							uploadFormService.saveEmployeeDetails(censusForm);

							 uploadFormService.saveEmpDisciplinary(disciplinary);

							// log.info(" ");

						}

					}
					workbook.write(fileOut);
					fileOut.flush();

				} catch (Exception e) {

		//			System.out.println("exception...");
					// to delete the record from the database..

					System.out.println();
					
					for (CensusForm delCensusForm : censusFormList) {

						uploadFormService.deleteEmpDetails(delCensusForm);

					}
					
					
					e.printStackTrace();
					e.getMessage();
					System.out.println(e.getMessage());
					log.info(e.getStackTrace());
					log.info(e.getMessage());
					return new ModelAndView("uploadForm");
				}

			}
		}

		return new ModelAndView("loginScreen");
	}

	/*
	 * superiors clock number data
	 */
	private static Set<String> getSuperviousHrclockNumbers(Iterator<Row> rowIterator) {

		String modifiedclockNumber = "";
		Set<String> clockNumbersSet = new HashSet<String>();
		while (rowIterator.hasNext()) {

			Row row = rowIterator.next();

			ClockNumbers clockNumber = new ClockNumbers();

			Iterator<Cell> cellIterators = row.cellIterator();
			while (cellIterators.hasNext()) {

				Cell cell = cellIterators.next();
				if (cell.getRowIndex() < 1) {

					clockNumber = null;

				} else {
					switch (cell.getCellType()) {

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
						if (cell.getColumnIndex() == 23) {

							modifiedclockNumber = XLSXFormValidation
									.replaceDotZeros(String.valueOf(cell.getNumericCellValue()));

							hrGeneralist.add(modifiedclockNumber);

						}

						break;
					case Cell.CELL_TYPE_BOOLEAN:

						break;

					case Cell.CELL_TYPE_BLANK:

						break;

					default:

					}

				}
				if (!modifiedclockNumber.trim().isEmpty()) {
					clockNumbersSet.add(modifiedclockNumber);
				}
			}

		}

		/*
		 * for (String result : clockNumbersSet) {
		 * 
		 * // log.info(" result clock num s " + result); }
		 */

		return clockNumbersSet;

	}

	public void setUploadFormService(UploadFormService uploadFormService) {
		this.uploadFormService = uploadFormService;
	}

	public String getCellOneErrorMessage() {
		return cellOneErrorMessage;
	}



	/*
	 * public void setCellOneErrorMessage(String cellOneErrorMessage) {
	 * this.cellOneErrorMessage = cellOneErrorMessage; }
	 * 
	 * public String getCellTwoErrorMessage() { return cellTwoErrorMessage; }
	 * 
	 * public void setCellTwoErrorMessage(String cellTwoErrorMessage) {
	 * this.cellTwoErrorMessage = cellTwoErrorMessage; }
	 * 
	 */
	

}
