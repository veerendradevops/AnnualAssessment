package com.lisi.annualassessment.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lisi.annualassessment.pojo.LoginUser;
import com.lisi.annualassessment.util.Converters;

@Controller
public class DownloadPDFController {

	@Autowired
	private LoginUser loginUser;
	
	@RequestMapping(value = "/downloadPDF")
	public void downloadPDF(HttpServletRequest request, HttpServletResponse response) throws IOException {
		OutputStream os = null;
		ByteArrayOutputStream baos = null;

		ServletContext servletContext = request.getSession().getServletContext();
		File reportTempDirectory = (File) servletContext.getAttribute("javax.servlet.context.tempdir");

		System.out.println("reportTempDirectory : " + reportTempDirectory);

		String employeeYear = loginUser.getExemptEmployeeYear();
		
		String fileReportName = "";
		if (request.getSession().getAttribute("nonExempt") != null) {
			System.out.println("non exempt");
			fileReportName = "2016" + " Annual Performance Review-"
					+ request.getSession().getAttribute("nonExempt").toString().trim() + "-Report.pdf";
		} else {
			System.out.println("exempt");
			fileReportName = "2016" + " Annual Performance Review-"
					+ request.getSession().getAttribute("exemptEmp").toString().trim() + "-Report.pdf";
		}
		System.out.println("fileReportName : " + fileReportName);

		// String fileName = "NonExemptReport.pdf";
		response.setContentType("application/pdf");
		response.setHeader("Content-disposition", "attachment; filename=" + fileReportName);

		try {
			String reportfilePath = reportTempDirectory + "/" + fileReportName;
			baos = new ByteArrayOutputStream();
			baos = convertPDFToByteArrayOutputStream(reportfilePath);
			os = response.getOutputStream();
			baos.writeTo(os);
			os.flush();
			
			
			
		} catch (Exception e1) {
			e1.printStackTrace();
		} finally {
			if (baos != null) {
				baos.close();
			}
			if (os != null) {
				os.close();
			}
		}

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
					baos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return baos;
	}

}