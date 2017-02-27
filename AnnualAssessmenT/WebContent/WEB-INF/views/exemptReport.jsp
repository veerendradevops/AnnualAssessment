<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.lisi.annualassessment.util.Converters"%>
<%@ page import="java.util.ResourceBundle"%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>

<meta charset="utf-8" />
<title>Exempt Report</title>
<link href="modal-fullscreen.css" rel="stylesheet" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="" name="author" />
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&amp;subset=all"
	rel="stylesheet" type="text/css" />
<link
	href="./assets1/global/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="./assets1/global/plugins/simple-line-icons/simple-line-icons.min.css"
	rel="stylesheet" type="text/css" />
<link href="./assets1/global/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link href="./assets1/global/plugins/uniform/css/uniform.default.css"
	rel="stylesheet" type="text/css" />
<link
	href="./assets1/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css"
	rel="stylesheet" type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL PLUGINS -->

<link
	href="./assets1/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css"
	rel="stylesheet" type="text/css" />
<link
	href="./assets1/global/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css"
	rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN THEME GLOBAL STYLES -->
<link href="./assets1/global/css/components.min.css" rel="stylesheet"
	id="style_components" type="text/css" />
<link href="./assets1/global/css/plugins.min.css" rel="stylesheet"
	type="text/css" />
<!-- END THEME GLOBAL STYLES -->
<!-- BEGIN THEME LAYOUT STYLES -->
<link href="./assets1/layouts/layout/css/layout.min.css"
	rel="stylesheet" type="text/css" />
<link href="./assets1/layouts/layout/css/themes/darkblue.min.css"
	rel="stylesheet" type="text/css" id="style_color" />
<link href="./assets1/layouts/layout/css/custom.min.css"
	rel="stylesheet" type="text/css" />
<!-- END THEME LAYOUT STYLES -->
<link rel="shortcut icon" href="favicon.ico" />

<link href="./assets1/global/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />

<!-- <script>
function doit(){
if (!window.print){
alert("You need to use the print button!")
return
}
window.print();
}

</script> -->

<style type="text/css" media="print">
.dontprint {
	display: none;
}
</style>

<style type="text/css">
@page {
	size: auto;
	margin-left: 0.75cm;
	margin-right: 0.75cm;
	margin-top: 0cm;
	margin-bottom: 0cm;
	height: auto;
}

html,body {
	width: 100%;
	height: 100%; @media print { body {
	height: auto;
	background-color: #FFFFFF;
	background-image: none;
	color: #000000;
	margin: 0px;
	position: absolute;
}
}
}
</style>


</head>
<!-- END HEAD -->


<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">

	<%-- <%
		ResourceBundle rb = ResourceBundle
				.getBundle("com.lisi.annaulAssessment.util.report");
	%>
 --%>
	<!-- <div align="right" class="dontprint">
		<a href="javascript:saveAsPDF()" style="font-size: 12px;"><img
			src="./images/icon-48-print.png" border=0 align="middle">
			Click here to Print the Page</a>
	</div> -->

	<div>
		<p>&nbsp;</p>
	</div>

	<div>
		<p>&nbsp;</p>
	</div>

	<c:if test="${!empty employeeDetails}">
		<c:forEach var="empDetail" items="${employeeDetails}">

			<div align="left" style="font-size: 12px; margin-left: 50px;">
				<b> <c:out value="${empDetail.emplastName}"></c:out>,<c:out value="${empDetail.empfirstName}"></c:out>
				</b>
			</div>
		</c:forEach>
	</c:if>

	<div align="right">

		<a href="/AnnualAssessmenT/downloadPDF.do"
			style="font-size: 12px; margin-right: 100px;"><img
			src="./images/pdf_icon_32x32.png" border=0 align="middle"
			height="30px" width="30px"> Download PDF</a>
	</div>

	<!-- BEGIN CONTENT -->
	<div class="page-content-wrapper">
		<!-- BEGIN CONTENT BODY -->
		<div class="page-content">
			<div class="row">
				<div class="col-md-12">

					<div class="portlet-body">
						<!-- BEGIN FORM-->
						<form action="#" id="form_sample_3" class="form-horizontal">


							<div class="form-body" align="left">


								<!-- Page3 Started -->

								<div
									class="page-break portlet light portlet-fit portlet-form bordered"
									style="page-break-after: always; padding: 40px;">

									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td><img src="./assets1/logo.gif" width="173"
												height="77" /></td>
											<td><div class="alert alert-success">
													<c:out value="${sessionScope.loginYear}"></c:out>&nbsp; Annual Assessment<br>
													HRP616.02 Form Instructions
												</div></td>
										</tr>
									</table>

									<div class="form-group">
										<div class="col-md-10" align="center">
											<h4>TEAM MEMBER'S PERSONAL INFORMATION</h4>
										</div>
										<!-- <div class="col-md-2">
											<input name="occupation" type="text" class="form-control"
												readonly />
										</div> -->
									</div>


									<table width="100%" class="table table-bordered">

										<c:if test="${!empty employeeDetails}">
											<tbody>
												<c:forEach var="empDetail" items="${employeeDetails}">
													<tr>
														<td width="20%">Name:</td>
														<td width="30%"><c:out
																value="${ empDetail.emplastName}"></c:out>,<c:out
																value="${ empDetail.empfirstName}"></c:out></td>
														<td width="20%">Date of Review:</td>
														<td width="30%"><jsp:useBean id="topRightDate"
																class="java.util.Date" /> <fmt:formatDate
																value="${topRightDate}" pattern="MM/dd/yyyy" /></td>
													</tr>
													<tr>
														<td><b>Job Title:</b></td>
														<td colspan="3"><c:out value="${ empDetail.jobTitle}"></c:out></td>
													</tr>
													<tr>
														<td><b>Date of Hire:</b></td>
														<td><fmt:formatDate value="${empDetail.DOH}"
																pattern="MM/dd/yyyy" /></td>
														<td><b>Department:</b></td>
														<td><c:out value="${ empDetail.costCenter}"></c:out></td>
													</tr>
													<tr>
														<td><b>Factory/ Division:</b></td>
														<td><c:out value="${ empDetail.factoryLocation}"></c:out></td>
														<td>Date of last review:</td>
														<td>&nbsp;</td>
														</td>
													</tr>
													<tr>
														<td><b>Department Manager:</b></td>
														<td><c:out value="${empDetail.supervisorLasttName}"></c:out>,<c:out
																value="${empDetail.supervisorFirstName}"></c:out></td>
														<td><b>MoR (Manager-once-Removed):</b></td>
														<td><c:out value="${ empDetail.mor}"></c:out></td>
													</tr>

												</c:forEach>
											</tbody>
										</c:if>

										<c:if test="${empty employeeDetails}">
											<tbody>

												<tr>
													<td width="20%"><b>Name:</b></td>
													<td width="30%">&nbsp;</td>
													<td width="20%"><b>Date of Review:</b></td>
													<td width="30%">&nbsp;</td>
												</tr>
												<tr>
													<td><b>Job Title:</b></td>
													<td colspan="3">&nbsp;</td>
												</tr>
												<tr>
													<td><b>Date of Hire:</b></td>
													<td>&nbsp;</td>
													<td><b>Department:</b></td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td><b>Factory/ Division:</b></td>
													<td>&nbsp;</td>
													<td><b>Date of last review:</b></td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td><b>Department Manager:</b></td>
													<td>&nbsp;</td>
													<td><b>MoR (Manager-once-Removed):</b></td>
													<td>&nbsp;</td>
												</tr>

											</tbody>
										</c:if>

									</table>

									<div align="center">
										<h3>
											<span
												style="background: #000080; color: #FFFFFF; padding: 3PX;">SECTION
												I &#45; TEAM MEMBER MUST COMPLETE</span>
										</h3>
									</div>

									<h3>
										REVIEW OF
										<c:out value="${sessionScope.loginYear}"></c:out>
										YEAR
									</h3>

									<table width="100%" class="table table-bordered">

										<c:if test="${!empty tmReviewOfPastYearDetails}">
											<c:forEach var="tmReviewOfPastYearDetail"
												items="${tmReviewOfPastYearDetails}">
												<c:if test="${!empty tmReviewOfPastYearDetail.section1A}">
													<tbody>

														<tr class="active">
															<td width="25%"><strong>A. Describe past
																	year&#39;s key events and assess your results/
																	achievement:</strong><br /> Include your contribution to
																business goals (Safety, Financial Results, Productivity,
																Improvements):</td>
														</tr>
														<tr>
															<td height="100"><c:out
																	value="${tmReviewOfPastYearDetail.section1A}"></c:out></td>
														</tr>

													</tbody>
												</c:if>

											</c:forEach>
										</c:if>

										<c:if test="${empty tmReviewOfPastYearDetails}">
											<tbody>

												<tr class="active">
													<td width="25%"><strong>A. Describe past
															year&#39;s key events and assess your results/
															achievement:</strong><br /> Include your contribution to business
														goals (Safety, Financial Results, Productivity,
														Improvements):</td>
												</tr>
												<tr>
													<td height="100">&nbsp;</td>
												</tr>

											</tbody>
										</c:if>



									</table>


									<table width="100%" class="table table-bordered">

										<c:if test="${!empty tmReviewOfPastYearDetails}">
											<c:forEach var="tmReviewOfPastYearDetail"
												items="${tmReviewOfPastYearDetails}">


												<tbody>
													<tr class="active">
														<td colspan="3"><strong>B. List of training
																completed in <c:out value="${sessionScope.loginYear}"></c:out>:
														</strong></td>
													</tr>


													<tr>
														<td width="5%">1</td>
														<td colspan="2"><c:out
																value="${tmReviewOfPastYearDetail.section1B1}"></c:out></td>
													</tr>



													<tr>
														<td align="right" colspan="2">Effectiveness of
															training:</td>
														<td width="20%"><c:out
																value="${tmReviewOfPastYearDetail.effectivenessOfB1}"></c:out></td>
													</tr>



													<tr>
														<td width="5%">2</td>
														<td colspan="2"><c:out
																value="${tmReviewOfPastYearDetail.section1B2}"></c:out></td>
													</tr>


													<tr>
														<td align="right" colspan="2">Effectiveness of
															training:</td>
														<td width="20%"><c:out
																value="${tmReviewOfPastYearDetail.effectivenessOfB2}"></c:out></td>
													</tr>




													<tr>
														<td width="5%">3</td>
														<td colspan="2"><c:out
																value="${tmReviewOfPastYearDetail.section1B3}"></c:out></td>
													</tr>

													<tr>
														<td align="right" colspan="2">Effectiveness of
															training:</td>
														<td width="20%"><c:out
																value="${tmReviewOfPastYearDetail.effectivenessOfB3}"></c:out></td>
													</tr>



													<tr>
														<td width="5%">4</td>
														<td colspan="2"><c:out
																value="${tmReviewOfPastYearDetail.section1B4}"></c:out></td>
													</tr>

													<tr>
														<td align="right" colspan="2">Effectiveness of
															training:</td>
														<td width="20%"><c:out
																value="${tmReviewOfPastYearDetail.effectivenessOfB4}"></c:out></td>
													</tr>


												</tbody>

											</c:forEach>
										</c:if>


										<c:if test="${empty tmReviewOfPastYearDetails}">


											<tbody>
												<tr class="active">
													<td colspan="3"><strong>B. List of training
															completed in <c:out value="${sessionScope.loginYear}"></c:out>:
													</strong></td>
												</tr>
												<tr>
													<td width="5%">1</td>
													<td colspan="2">&nbsp;</td>
												</tr>
												<tr>
													<td align="right" colspan="2">Effectiveness of
														training:</td>
													<td width="20%">&nbsp;</td>
												</tr>
												<tr>
													<td width="5%">2</td>
													<td colspan="2">&nbsp;</td>
												</tr>
												<tr>
													<td align="right" colspan="2">Effectiveness of
														training:</td>
													<td width="20%">&nbsp;</td>
												</tr>
												<tr>
													<td width="5%">3</td>
													<td colspan="2">&nbsp;</td>
												</tr>
												<tr>
													<td align="right" colspan="2">Effectiveness of
														training:</td>
													<td width="20%">&nbsp;</td>
												</tr>
												<tr>
													<td width="5%">4</td>
													<td colspan="2">&nbsp;</td>
												</tr>
												<tr>
													<td align="right" colspan="2">Effectiveness of
														training:</td>
													<td width="20%">&nbsp;</td>
												</tr>

											</tbody>

										</c:if>



									</table>


									<table width="90%">

										<tr>
											<td width="33%">&nbsp;</td>
											<td width="34%" align="center">1 of 12</td>
											<td align="right" width="33%">Version: <c:out value="${sessionScope.loginYear}"></c:out></td>
										</tr>

									</table>

								</div>


								<!-- End of Page3 -->

								<p>&nbsp;</p>

								<!-- Page4 Started -->

								<div
									class="page-break portlet light portlet-fit portlet-form bordered"
									style="page-break-after: always; padding: 40px;">

									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td><img src="./assets1/logo.gif" width="173"
												height="77"></td>
											<td><div class="alert alert-success">
													<c:out value="${sessionScope.loginYear}"></c:out>&nbsp; Annual Assessment<br>
													HRP616.02 Form Instructions
												</div></td>
										</tr>
									</table>


									<table width="100%" class="table table-bordered">
										<c:if test="${!empty tmReviewOfPastYearDetails}">
											<c:forEach var="tmReviewOfPastYearDetail"
												items="${tmReviewOfPastYearDetails}">
												<tbody>
													<tr class="active">
														<td width="25%"><strong>C. Improvements,
																suggestions, or comments on training:</strong><br /> Include
															your contribution to business goals (Safety, Financial
															Results, Productivity, Improvements):</td>
													</tr>
													<tr>
														<td height="100"><c:out
																value="${tmReviewOfPastYearDetail.section1C}"></c:out></td>
													</tr>
												</tbody>
											</c:forEach>
										</c:if>
									</table>


									<table width="100%" class="table table-bordered">
										<c:if test="${!empty tmReviewOfPastYearDetails}">
											<c:forEach var="tmReviewOfPastYearDetail"
												items="${tmReviewOfPastYearDetails}">

												<tbody>
													<tr class="active">
														<td width="25%"><strong>D. TEAM MEMBER'S
																DEVELOPMENT RESULTS AND OBJECTIVES</strong></td>
													</tr>
													<tr>
														<td>
															<p><c:out value="${sessionScope.loginYear}"></c:out>
																Personal and Professional Development Achieved
															</p>
														</td>
													</tr>
													<tr>
														<td height="100"><c:out
																value="${tmReviewOfPastYearDetail.section1D1}"></c:out></td>
													</tr>
													<tr>
														<td><p>
																2017 Development Objectives (List any other development
																goals you have set yourself in
																<c:out value="${sessionScope.loginYear}"></c:out>)
															</p></td>
													</tr>
													<tr>
														<td height="100"><c:out
																value="${tmReviewOfPastYearDetail.section1D2}"></c:out></td>
													</tr>
												</tbody>

											</c:forEach>
										</c:if>

										<c:if test="${empty tmReviewOfPastYearDetails}">

											<tbody>
												<tr class="active">
													<td width="25%"><strong>D. TEAM MEMBER'S
															DEVELOPMENT RESULTS AND OBJECTIVES</strong></td>
												</tr>
												<tr>
													<td>
														<p><c:out value="${sessionScope.loginYear}"></c:out>
															Personal and Professional Development Achieved
														</p>
													</td>
												</tr>
												<tr>
													<td height="100">&nbsp;</td>
												</tr>
												<tr>
													<td><p>
															2017 Development Objectives (List any other development
															goals you have set yourself in
															2016)
														</p></td>
												</tr>
												<tr>
													<td height="100">&nbsp;</td>
												</tr>
											</tbody>

										</c:if>

									</table>

									<h4>F. CAREER MOBILITY</h4>

									<table width="100%" class="table table-bordered">

										<c:if test="${!empty tmReviewOfPastYearDetails}">
											<c:forEach var="tmReviewOfPastYearDetail"
												items="${tmReviewOfPastYearDetails}">

												<tbody>

													<tr>
														<td width="5%">
															<p>1</p>
														</td>



														<td width="95%"><c:if
																test="${tmReviewOfPastYearDetail.section1F1=='yes'}">

																<p>
																	I am interested in exploring different career
																	opportunities in a different functional area within the
																	company? (<b><c:out
																			value="${tmReviewOfPastYearDetail.section1F1}"></c:out></b>)
																</p>
															</c:if> <c:if
																test="${tmReviewOfPastYearDetail.section1F1=='no'}">
																<p>
																	I am interested in exploring different career
																	opportunities in a different functional area within the
																	company? (<b><c:out
																			value="${tmReviewOfPastYearDetail.section1F1}"></c:out></b>)
																</p>
															</c:if></td>
													</tr>

													<c:if test="${tmReviewOfPastYearDetail.section1F1=='yes'}">

														<tr>
															<td>2</td>
															<td><label class="control-label col-md-2">b.
																	If YES, What Job Function?</label>
																<div class="col-md-4">
																	<b><c:out
																			value="${tmReviewOfPastYearDetail.section1F2ONE}"></c:out></b>
																</div> <label class="control-label col-md-2">And/or US
																	Facility?</label>
																<div class="col-md-4">
																	<b><c:out
																			value="${tmReviewOfPastYearDetail.section1F2TWO}"></c:out></b>
																</div></td>
														</tr>

													</c:if>

													

														<tr>
															<td><p>3</p></td>
															<td><c:if
																	test="${tmReviewOfPastYearDetail.section1F3A=='yes'}">
																	<p>
																		I am interested in an International Assignments and/or
																		mobility? (<b><c:out
																				value="${tmReviewOfPastYearDetail.section1F3A}"></c:out></b>)
																	</p>
																</c:if> <c:if
																	test="${tmReviewOfPastYearDetail.section1F3A=='no'}">
																	<p>I am interested in an International Assignments and/or
																		mobility?(<b><c:out
																				value="${tmReviewOfPastYearDetail.section1F3A}"></c:out></b>)</p>
																</c:if> <c:if
																	test="${tmReviewOfPastYearDetail.section1F3A=='yes'}">

																	<p>
																		If YES, what region would you consider exploring as an
																		International Assignment? <b><c:out
																				value="${tmReviewOfPastYearDetail.section1F3B}"></c:out></b>
																	</p>

																	<p>
																		(i) What length of assignment would you consider? <b><c:out
																				value="${tmReviewOfPastYearDetail.section1F3B1}"></c:out></b>
																	</p>

																	<p>
																		(ii) I am currently unable to consider any relocation
																		or mobility in the next 12 months? (<b><c:out
																				value="${tmReviewOfPastYearDetail.section1F3B2}"></c:out></b>)
																	</p>

																</c:if></td>
														</tr>

												


												</tbody>

											</c:forEach>
										</c:if>


										<c:if test="${empty tmReviewOfPastYearDetails}">

											<tbody>

												<tr>
													<td width="5%">
														<p>1</p>
													</td>
													<td width="95%">
														<p>I am interested in exploring different career
															opportunities in a different functional area within the
															company?</p>
														<div class="form-group">
															<div class="col-sm-1">
																<input type="radio" name="optradio" disabled="disabled">
																<label class="control-label">Yes</label>
															</div>
															<div class="col-sm-1">
																<input type="radio" name="optradio" disabled="disabled">
																<label class="control-label">No</label>
															</div>
														</div>
														<p>a. If NO, continue with question number three.</p>

													</td>
												</tr>
												<tr>
													<td>2</td>
													<td><label class="control-label col-md-2">b.
															If YES, What Job Function?</label>
														<div class="col-md-4">
															<input name="occupation" type="text" class="form-control"
																disabled="disabled" />
														</div> <label class="control-label col-md-2">And/or US
															Facility?</label>
														<div class="col-md-4">
															<input name="occupation" type="text" class="form-control"
																disabled="disabled" />
														</div>
														</div></td>
												</tr>
												<tr>
													<td><p>3</p></td>
													<td>


														<p>I am interested in an International Assignments
															and/or mobility?</p>
														<div class="form-group">
															<div class="col-sm-1">
																<input type="radio" name="optradio" disabled="disabled">
																<label class="control-label">Yes</label>
															</div>
															<div class="col-sm-1">
																<input type="radio" name="optradio" disabled="disabled">
																<label class="control-label">No</label>
															</div>
														</div>
														<p>a. If NO, continue to next page.</p>
														<p>If YES, what region would you consider exploring as
															an International Assignment?</p>
														<div class="form-group">
															<div class="col-sm-2">
																<input type="radio" name="optradio" disabled="disabled">
																<label class="control-label">Canada</label>
															</div>
															<div class="col-sm-2">
																<input type="radio" name="optradio" disabled="disabled">
																<label class="control-label">USA</label>
															</div>
															<div class="col-sm-2">
																<input type="radio" name="optradio" disabled="disabled">
																<label class="control-label">France</label>
															</div>
															<div class="col-sm-2">
																<input type="radio" name="optradio" disabled="disabled">
																<label class="control-label">UK</label>
															</div>
															<div class="col-sm-2">
																<input type="radio" name="optradio" disabled="disabled">
																<label class="control-label">Turkey</label>
															</div>
															<div class="col-sm-2">
																<input type="radio" name="optradio" disabled="disabled">
																<label class="control-label">India</label>
															</div>
															<div class="col-sm-2">
																<input type="radio" name="optradio" disabled="disabled">
																<label class="control-label">Morocco</label>
															</div>
															<div class="col-sm-1">
																<label class="control-label">Other</label>
															</div>
															<div class="col-sm-2">
																<input name="occupation" type="text"
																	class="form-control" disabled="disabled" />
															</div>
														</div>
														<p>(i) What length of assignment would you consider?</p>
														<div class="form-group">
															<div class="col-sm-2">
																<input type="radio" name="optradio" disabled="disabled">
																<label class="control-label">1 year or less</label>
															</div>
															<div class="col-sm-2">
																<input type="radio" name="optradio" disabled="disabled">
																<label class="control-label">1 to 2 years</label>
															</div>
															<div class="col-sm-3">
																<input type="radio" name="optradio" disabled="disabled">
																<label class="control-label">More than 2 years</label>
															</div>
														</div>
														<p>(ii) I am currently unable to consider any
															relocation or mobility in the next 12 months?</p>
														<div class="form-group">
															<div class="col-sm-1">
																<input type="radio" name="optradio" disabled="disabled">
																<label class="control-label">Yes</label>
															</div>
															<div class="col-sm-1">
																<input type="radio" name="optradio" disabled="disabled">
																<label class="control-label">No</label>
															</div>
														</div>
													</td>
												</tr>
											</tbody>


										</c:if>


									</table>




									<table width="90%">

										<tr>
											<td width="33%">&nbsp;</td>
											<td width="34%" align="center">2 of 12</td>
											<td align="right" width="33%">Version: <c:out value="${sessionScope.loginYear}"></c:out></td>
										</tr>

									</table>


								</div>

								<!-- End of Page4 -->

								<p>&nbsp;</p>
								<!-- Page5 Started -->

								<div
									class="page-break portlet light portlet-fit portlet-form bordered"
									style="page-break-after: always; padding: 40px;">

									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td><img src="./assets1/logo.gif" width="173"
												height="77"></td>
											<td><div class="alert alert-success">
													<c:out value="${sessionScope.loginYear}"></c:out>&nbsp; Annual Assessment<br>
													HRP616.02 Form Instructions
												</div></td>
										</tr>
									</table>

									<h4>G. SELF ASSESSMENT</h4>
									<p>Complete assessment and provide specific examples and
										attach sheets if necessary</p>


									<table class="table table-bordered">

										<c:if test="${!empty skillsSelfAssessmentDetails}">

											<tbody>
												<tr class="success">
													<td width="80%"><p>
															<strong>SKILLS</strong>
														</p></td>
													<td width="20%"><p>
															<strong>COMPETENCY LEVEL</strong>
														</p></td>
												</tr>
												<tr>
													<td><p>Makes sound decisions with factual data and
															can present objective arguments for those decisions.
															Minimal decision making by subjectivity.</p></td>
													<td><p>
															<c:out value="${skillsSelfAssessmentDetails.skills1}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Initiates and implement new
															ideas/processes.</p></td>
													<td><p>
															<c:out value="${skillsSelfAssessmentDetails.skills2}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Organizes and prioritizes work even when
															encountered with conflicting priorities, seeks guidance
															if necessary.</p></td>
													<td><p>
															<c:out value="${skillsSelfAssessmentDetails.skills3}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Displays a positive approach towards work
															assignments and people. Overcomes obstacles and accepts
															challenges with enthusiasm.</p></td>
													<td><p>
															<c:out value="${skillsSelfAssessmentDetails.skills4}"></c:out>
														</p></td>
												</tr>

												<tr>
													<td width="80%"><p>Able to work well with internal
															and external customers and build
															relationships/partnerships with other departments and
															team members.</p></td>
													<td width="20%"><p>
															<c:out value="${skillsSelfAssessmentDetails.skills5}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Possesses and applies technical knowledge
															required for positions.</p></td>
													<td><p>
															<c:out value="${skillsSelfAssessmentDetails.skills6}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Able to analyze situations and tasks
															accurately.</p></td>
													<td><p>
															<c:out value="${skillsSelfAssessmentDetails.skills7}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Takes required risk as needed by position.</p></td>
													<td><p>
															<c:out value="${skillsSelfAssessmentDetails.skills8}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Ability to resolve conflicts at all levels
															of the Company.</p></td>
													<td><p>
															<c:out value="${skillsSelfAssessmentDetails.skills9}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Able to work independently on agreed upon
															tasks.</p></td>
													<td><p>
															<c:out value="${skillsSelfAssessmentDetails.skills10}"></c:out>
														</p></td>
												</tr>

											</tbody>


										</c:if>


										<c:if test="${empty skillsSelfAssessmentDetails}">


											<tbody>
												<tr class="success">
													<td width="80%"><p>
															<strong>SKILLS</strong>
														</p></td>
													<td width="20%"><p>
															<strong>COMPETENCY LEVEL</strong>
														</p></td>
												</tr>
												<tr>
													<td><p>Makes sound decisions with factual data and
															can present objective arguments for those decisions.
															Minimal decision making by subjectivity.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Initiates and implement new
															ideas/processes.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Organizes and prioritizes work even when
															encountered with conflicting priorities, seeks guidance
															if necessary.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Displays a positive approach towards work
															assignments and people. Overcomes obstacles and accepts
															challenges with enthusiasm.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>

												<tr>
													<td width="80%"><p>Able to work well with internal
															and external customers and build
															relationships/partnerships with other departments and
															team members.</p></td>
													<td width="20%"><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Possesses and applies technical knowledge
															required for positions.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Able to analyze situations and tasks
															accurately.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Takes required risk as needed by position.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Ability to resolve conflicts at all levels
															of the Company.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Able to work independently on agreed upon
															tasks.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>

											</tbody>

										</c:if>

									</table>




									<table width="90%">

										<tr>
											<td width="33%">&nbsp;</td>
											<td width="34%" align="center">3 of 12</td>
											<td align="right" width="33%">Version: 2016</td>
										</tr>

									</table>

								</div>

								<!-- End of Page5 -->


								<!-- Page6 Started -->

								<div
									class="page-break portlet light portlet-fit portlet-form bordered"
									style="page-break-after: always; padding: 40px;">

									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td><img src="./assets1/logo.gif" width="173"
												height="77"></td>
											<td><div class="alert alert-success">
													<c:out value="${sessionScope.loginYear}"></c:out>&nbsp; Annual Assessment<br>
													HRP616.02 Form Instructions
												</div></td>
										</tr>
									</table>

									<table class="table table-bordered">

										<c:if test="${!empty skillsSelfAssessmentDetails}">

											<tbody>

												<tr class="success">
													<td width="80%"><p>
															<strong>WAYS OF WORKING</strong>
														</p></td>
													<td width="20%"><p>
															<strong>COMPETENCY LEVEL</strong>
														</p></td>
												</tr>
												<tr>
													<td><p>Consistently adheres to all rules and
															regulations.</p></td>
													<td><p>
															<c:out
																value="${skillsSelfAssessmentDetails.waysOfWorking1}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Has commitment to meet agreed upon goals
															displaying positive behaviors. Attends meetings and does
															what he/she says is going to do. Communicates and/or
															re-negotiates agreed upon expectations if not able to
															meet deadlines.</p></td>
													<td><p>
															<c:out
																value="${skillsSelfAssessmentDetails.waysOfWorking2}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Organization of duties, work, and tasks
															(method, delegation, control).</p></td>
													<td><p>
															<c:out
																value="${skillsSelfAssessmentDetails.waysOfWorking3}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Able to articulate thoughts, ideas, and
															events in writing and orally.</p></td>
													<td><p>
															<c:out
																value="${skillsSelfAssessmentDetails.waysOfWorking4}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Displays commitment to the Company&#39;s
															continuous improvement efforts and implements/supports
															continuous improvement in area(s) of responsibility.</p></td>
													<td><p>
															<c:out
																value="${skillsSelfAssessmentDetails.waysOfWorking5}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Establishes high standards and goals, works
															diligently on meeting set standards and goals overcoming
															obstacles.</p></td>
													<td><p>
															<c:out
																value="${skillsSelfAssessmentDetails.waysOfWorking6}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Handles multiple projects and tasks
															concurrently and is able to prioritize and re-prioritize
															with minimal guidance.</p></td>
													<td><p>
															<c:out
																value="${skillsSelfAssessmentDetails.waysOfWorking7}"></c:out>
														</p></td>
												</tr>

											</tbody>
										</c:if>


										<c:if test="${empty skillsSelfAssessmentDetails}">

											<tbody>

												<tr class="success">
													<td width="80%"><p>
															<strong>WAYS OF WORKING</strong>
														</p></td>
													<td width="20%"><p>
															<strong>COMPETENCY LEVEL</strong>
														</p></td>
												</tr>
												<tr>
													<td><p>Consistently adheres to all rules and
															regulations.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>
															Has commitment to meet agreed upon goals displaying
															positive behaviors. Attends meetings and does what he/she
															says is going to do. Communicates<br /> and/or
															re-negotiates agreed upon expectations if not able to
															meet deadlines.
														</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Organization of duties, work, and tasks
															(method, delegation, control).</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Able to articulate thoughts, ideas, and
															events in writing and orally.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Displays commitment to the Company&#39;s
															continuous improvement efforts and implements/supports
															continuous improvement in area(s) of responsibility.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Establishes high standards and goals, works
															diligently on meeting set standards and goals overcoming
															obstacles.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Handles multiple projects and tasks
															concurrently and is able to prioritize and re-prioritize
															with minimal guidance.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>

											</tbody>
										</c:if>

									</table>

									<table width="90%">

										<tr>
											<td width="33%">&nbsp;</td>
											<td width="34%" align="center">4 of 12</td>
											<td align="right" width="33%">Version:<c:out value="${sessionScope.loginYear}"></c:out></td>
										</tr>

									</table>

								</div>

								<!-- End of Page6 -->
								<p>&nbsp;</p>
								<!-- Page7 Started -->

								<div
									class="page-break portlet light portlet-fit portlet-form bordered"
									style="page-break-after: always; padding: 40px;">

									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td><img src="./assets1/logo.gif" width="173"
												height="77"></td>
											<td><div class="alert alert-success">
													<c:out value="${sessionScope.loginYear}"></c:out>&nbsp; Annual Assessment<br>
													HRP616.02 Form Instructions
												</div></td>
										</tr>
									</table>


									<table class="table table-bordered">

										<c:if test="${!empty skillsSelfAssessmentDetails}">

											<tbody>


												<tr class="success">
													<td><p>&nbsp;</p></td>
													<td><p>
															<strong>COMPETENCY LEVEL</strong>
														</p></td>
												</tr>
												<tr>
													<td width="80%"><p>Manages tasks and projects with
															minimal guidance (Plan, Do, Check, Act). When assigned
															leadership role, is able to lead and achieve results with
															collaboration from other team members.</p></td>
													<td width="20%"><p>
															<c:out
																value="${skillsSelfAssessmentDetails.selfManagementandLeadership1}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Adheres to Company policies, practices and
															legal requirements. Implements agreed upon direction even
															if personal point of view may be in conflict.</p></td>
													<td><p>
															<c:out
																value="${skillsSelfAssessmentDetails.selfManagementandLeadership2}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Recognizes his/her mistakes and implements
															corrective action/preventive actions.</p></td>
													<td><p>
															<c:out
																value="${skillsSelfAssessmentDetails.selfManagementandLeadership3}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Exemplifies the Company guiding principle
															of integrity in his/her decision making and dealing with
															supervisors, peers, and external customers.</p></td>
													<td><p>
															<c:out
																value="${skillsSelfAssessmentDetails.selfManagementandLeadership4}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Listens attentively to others and responds
															with respect. Accepts differences of opinions, style, and
															approach.</p></td>
													<td><p>
															<c:out
																value="${skillsSelfAssessmentDetails.selfManagementandLeadership5}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>
															Anticipates departmental needs and understands his/her
															role in achieving <br /> Company objectives.
														</p></td>
													<td><p>
															<c:out
																value="${skillsSelfAssessmentDetails.selfManagementandLeadership6}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Participates and works well in a team
															environment. Is flexible as a team member and supports
															team consensus.</p></td>
													<td><p>
															<c:out
																value="${skillsSelfAssessmentDetails.selfManagementandLeadership7}"></c:out>
														</p></td>
												</tr>

											</tbody>
										</c:if>

										<c:if test="${empty skillsSelfAssessmentDetails}">

											<tbody>


												<tr class="success">
													<td><p>&nbsp;</p></td>
													<td><p>
															<strong>COMPETENCY LEVEL</strong>
														</p></td>
												</tr>
												<tr>
													<td width="80%"><p>
															Manages tasks and projects with minimal guidance (Plan,
															Do, Check, Act). When assigned leadership role, is able
															to lead and achieve results with<br /> collaboration
															from other team members.
														</p></td>
													<td width="20%"><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Adheres to Company policies, practices and
															legal requirements. Implements agreed upon direction even
															if personal point of view may be in conflict.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Recognizes his/her mistakes and implements
															corrective action/preventive actions.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td width="80%"><p>Exemplifies the Company guiding
															principle of integrity in his/her decision making and
															dealing with supervisors, peers, and external customers.</p></td>
													<td width="20%"><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Listens attentively to others and responds
															with respect. Accepts differences of opinions, style, and
															approach.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>
															Anticipates departmental needs and understands his/her
															role in achieving <br /> Company objectives.
														</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Participates and works well in a team
															environment. Is flexible as a team member and supports
															team consensus.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>

											</tbody>
										</c:if>

									</table>


									<table class="table table-bordered">


										<c:if test="${!empty skillsSelfAssessmentDetails}">

											<tbody>
												<tr class="success">
													<td><strong>SELF ASSESSMENT SUMMARY</strong></td>
												</tr>
												<tr>
													<td>Summary Strengths:</td>
												</tr>
												<tr>
													<td height="100"><p>
															<c:out value="${skillsSelfAssessmentDetails.section1G4}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td>Summary of Areas of Improvement:</td>
												</tr>
												<tr>
													<td height="100"><p>
															<c:out value="${skillsSelfAssessmentDetails.section1G5}"></c:out>
														</p></td>
												</tr>
											</tbody>

										</c:if>


										<c:if test="${empty skillsSelfAssessmentDetails}">

											<tbody>
												<tr class="success">
													<td><strong>SELF ASSESSMENT SUMMARY</strong></td>
												</tr>
												<tr>
													<td>Summary Strengths:</td>
												</tr>
												<tr>
													<td height="100">&nbsp;</td>
												</tr>
												<tr>
													<td>Summary of Areas of Improvement:</td>
												</tr>
												<tr>
													<td height="100">&nbsp;</td>
												</tr>
											</tbody>

										</c:if>

									</table>

									<div align="center">
										<strong>*** END OF SECTION 1 - TEAM MEMBER'S SELF
											ASSESSMENT***</strong>
									</div>

									<p align="left">
										<b>Next steps:</b><br> Your manager will fill out SECTION
										II then schedule a meeting to review<br> Section I and II
										with you. Afterwards, you and your manager will fill out<br>
										Section III of this form.
									</p>




									<table width="90%">

										<tr>
											<td width="33%">&nbsp;</td>
											<td width="34%" align="center">5 of 12</td>
											<td align="right" width="33%">Version: <c:out value="${sessionScope.loginYear}"></c:out></td>
										</tr>

									</table>

								</div>

								<!-- End of Page7 -->


								<p>&nbsp;</p>
								<!-- Page8 Started -->

								<div
									class="page-break portlet light portlet-fit portlet-form bordered"
									style="page-break-after: always; padding: 40px;">




									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td><img src="./assets1/logo.gif" width="173"
												height="77"></td>
											<td><div class="alert alert-success">
													<c:out value="${sessionScope.loginYear}"></c:out>&nbsp; Annual Assessment<br>
													HRP616.02 Form Instructions
												</div></td>
										</tr>
									</table>

									<div align="center">
										<h3>
											<span
												style="background: #000080; color: #FFFFFF; padding: 3PX;">SECTION
												II &#45; TO BE COMPLETED BY MANAGER</span>
										</h3>
									</div>

									<h4>A. OBJECTIVE ACHIEVEMENT</h4>

									<table class="table table-bordered">
										<c:if test="${!empty objectAchievementDetails }">
											<c:forEach var="objectAchievementDetail"
												items="${objectAchievementDetails}">
												<tbody>

													<tr class="success">
														<td colspan="2"><p>
																<strong><c:out value="${sessionScope.loginYear}"></c:out> AGREED
																	UPON OBJECTIVES</strong>
															</p></td>
														<td><p>
																<strong>ACHIEVEMENT LEVEL FOR <c:out value="${sessionScope.loginYear}"></c:out></strong>
															</p></td>
													</tr>
													<tr>
														<td width="5%"><p>1.</p></td>
														<td width="80%"><p>
																<c:out
																	value="${objectAchievementDetail.section2A1Objective}"></c:out>
															</p></td>
														<td width="15%"><p>
																<c:out
																	value="${objectAchievementDetail.section2A1Level}"></c:out>
															</p></td>
													</tr>
													<tr>
														<td><p>2.</p></td>
														<td><p>
																<c:out
																	value="${objectAchievementDetail.section2A2Objective}"></c:out>
															</p></td>
														<td><p>
																<c:out
																	value="${objectAchievementDetail.section2A2Level}"></c:out>
															</p></td>
													</tr>
													<tr>
														<td><p>3.</p></td>
														<td><p>
																<c:out
																	value="${objectAchievementDetail.section2A3Objective}"></c:out>
															</p></td>
														<td><p>
																<c:out
																	value="${objectAchievementDetail.section2A3Level}"></c:out>
															</p></td>
													</tr>
													<tr>
														<td><p>4.</p></td>
														<td><p>
																<c:out
																	value="${objectAchievementDetail.section2A4Objective}"></c:out>
															</p></td>
														<td><p>
																<c:out
																	value="${objectAchievementDetail.section2A4Level}"></c:out>
															</p></td>
													</tr>
													<tr>
														<td><p>5.</p></td>
														<td><p>
																<c:out
																	value="${objectAchievementDetail.section2A5Objective}"></c:out>
															</p></td>
														<td><p>
																<c:out
																	value="${objectAchievementDetail.section2A5Level}"></c:out>
															</p></td>
													</tr>
													<tr>
														<td></td>
														<td><p>Total:</p></td>

														<td><p>

																<c:out
																	value="${objectAchievementDetail.section2A1Level+objectAchievementDetail.section2A2Level+objectAchievementDetail.section2A3Level+objectAchievementDetail.section2A4Level+objectAchievementDetail.section2A5Level}"></c:out>

															</p></td>
													</tr>

													<tr class="active">

														<td width="100%" colspan="3"><strong>Additional
																Comments:</strong></td>
													</tr>
													<tr>
														<td colspan="3" height="100"><c:out
																value="${objectAchievementDetail.section2AdditionalComments}"></c:out></td>
													</tr>

												</tbody>
											</c:forEach>
										</c:if>


										<c:if test="${empty objectAchievementDetails}">

											<tbody>

												<tr class="success">
													<td colspan="2"><p>
															<strong><c:out value="${sessionScope.loginYear}"></c:out> AGREED
																UPON OBJECTIVES</strong>
														</p></td>
													<td><p>
															<strong>ACHIEVEMENT LEVEL FOR <c:out value="${sessionScope.loginYear}"></c:out></strong>
														</p></td>
												</tr>
												<tr>
													<td width="5%"><p>1.</p></td>
													<td width="80%">&nbsp;</td>
													<td width="15%"><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>2.</p></td>
													<td>&nbsp;</td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>3.</p></td>
													<td>&nbsp;</td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>4.</p></td>
													<td>&nbsp;</td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>5.</p></td>
													<td>&nbsp;</td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td></td>
													<td><p>Total:</p></td>
													<td>0.00</td>
												</tr>

												<tr class="active">

													<td width="100%" colspan="3"><strong>Additional
															Comments:</strong></td>
												</tr>
												<tr>
													<td colspan="3" height="100">&nbsp;</td>
												</tr>

											</tbody>

										</c:if>

									</table>

									<table width="90%">

										<tr>
											<td width="33%">&nbsp;</td>
											<td width="34%" align="center">6 of 12</td>
											<td align="right" width="33%">Version: <c:out value="${sessionScope.loginYear}"></c:out></td>
										</tr>

									</table>

								</div>
								<!-- End of Page8 -->

								<p>&nbsp;</p>

								<!-- Page9 Started -->

								<div
									class="page-break portlet light portlet-fit portlet-form bordered"
									style="page-break-after: always; padding: 40px;">

									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td><img src="./assets1/logo.gif" width="173"
												height="77"></td>
											<td><div class="alert alert-success">
													<c:out value="${sessionScope.loginYear}"></c:out>&nbsp; Annual Assessment<br>
													HRP616.02 Form Instructions
												</div></td>
										</tr>
									</table>

									<h4>B. MANAGER&#39;S ASSESSMENT</h4>
									<p>Complete assessment and provide specific examples in
										attach sheets if necessary</p>

									<table class="table table-bordered">
										<c:if test="${!empty managerSkillsAssessmentDetails}">
											<tbody>

												<tr class="success">
													<td width="80%"><p>
															<strong>SKILLS</strong>
														</p></td>
													<td width="20%"><p>
															<strong>COMPETENCY LEVEL</strong>
														</p></td>
												</tr>
												<tr>
													<td><p>Makes sound decisions with factual data and
															can present objective arguments for those decisions.
															Minimal decision making by subjectivity.</p></td>
													<td><p>
															<c:out value="${managerSkillsAssessmentDetails.skills1}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Initiates and implement new
															ideas/processes.</p></td>
													<td><p>
															<c:out value="${managerSkillsAssessmentDetails.skills2}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Organizes and prioritizes work even when
															encountered with conflicting priorities, seeks guidance
															if necessary.</p></td>
													<td><p>
															<c:out value="${managerSkillsAssessmentDetails.skills3}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Displays a positive approach towards work
															assignments and people. Overcomes obstacles and accepts
															challenges with enthusiasm.</p></td>
													<td><p>
															<c:out value="${managerSkillsAssessmentDetails.skills4}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Able to work well with internal and
															external customers and build relationships/partnerships
															with other departments and team members.</p></td>
													<td><p>
															<c:out value="${managerSkillsAssessmentDetails.skills5}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Possesses and applies technical knowledge
															required for positions.</p></td>
													<td><p>
															<c:out value="${managerSkillsAssessmentDetails.skills6}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Able to analyze situations and tasks
															accurately.</p></td>
													<td><p>
															<c:out value="${managerSkillsAssessmentDetails.skills7}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Takes required risk as needed by position.</p></td>
													<td><p>
															<c:out value="${managerSkillsAssessmentDetails.skills8}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Ability to resolve conflicts at all levels
															of the Company.</p></td>
													<td><p>
															<c:out value="${managerSkillsAssessmentDetails.skills9}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Able to work independently on agreed upon
															tasks.</p></td>
													<td><p>
															<c:out value="${managerSkillsAssessmentDetails.skills10}"></c:out>
														</p></td>
												</tr>

											</tbody>

										</c:if>


										<c:if test="${empty managerSkillsAssessmentDetails}">
											<tbody>

												<tr class="success">
													<td width="80%"><p>
															<strong>SKILLS</strong>
														</p></td>
													<td width="20%"><p>
															<strong>COMPETENCY LEVEL</strong>
														</p></td>
												</tr>
												<tr>
													<td><p>Makes sound decisions with factual data and
															can present objective arguments for those decisions.
															Minimal decision making by subjectivity.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Initiates and implement new
															ideas/processes.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Organizes and prioritizes work even when
															encountered with conflicting priorities, seeks guidance
															if necessary.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Displays a positive approach towards work
															assignments and people. Overcomes obstacles and accepts
															challenges with enthusiasm.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td width="80%"><p>Able to work well with internal
															and external customers and build
															relationships/partnerships with other departments and
															team members.</p></td>
													<td width="20%"><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Possesses and applies technical knowledge
															required for positions.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Able to analyze situations and tasks
															accurately.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Takes required risk as needed by position.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Ability to resolve conflicts at all levels
															of the Company.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Able to work independently on agreed upon
															tasks.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>

											</tbody>

										</c:if>

									</table>

									<table width="90%">

										<tr>
											<td width="33%">&nbsp;</td>
											<td width="34%" align="center">7 of 12</td>
											<td align="right" width="33%">Version: <c:out value="${sessionScope.loginYear}"></c:out></td>
										</tr>

									</table>

								</div>

								<!-- End of Page9 Started -->

								<p>&nbsp;</p>

								<!-- Page10 Started -->

								<div
									class="page-break portlet light portlet-fit portlet-form bordered"
									style="page-break-after: always; padding: 40px;">

									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td><img src="./assets1/logo.gif" width="173"
												height="77"></td>
											<td><div class="alert alert-success">
													<c:out value="${sessionScope.loginYear}"></c:out>&nbsp; Annual Assessment<br>
													HRP616.02 Form Instructions
												</div></td>
										</tr>
									</table>

									<table class="table table-bordered">

										<c:if test="${!empty managerSkillsAssessmentDetails}">

											<tbody>

												<tr class="success">
													<td width="80%"><p>
															<strong>WAYS OF WORKING</strong>
														</p></td>
													<td width="20%"><p>
															<strong>COMPETENCY LEVEL</strong>
														</p></td>
												</tr>
												<tr>
													<td><p>Consistently adheres to all rules and
															regulations.</p></td>
													<td><p>
															<c:out
																value="${managerSkillsAssessmentDetails.waysOfWorking1}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Has commitment to meet agreed upon goals
															displaying positive behaviors. Attends meetings and does
															what he/she says is going to do. Communicates and/or
															re-negotiates agreed upon expectations if not able to
															meet deadlines.</p></td>
													<td><p>
															<c:out
																value="${managerSkillsAssessmentDetails.waysOfWorking2}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Organization of duties, work, and tasks
															(method, delegation, control).</p></td>
													<td><p>
															<c:out
																value="${managerSkillsAssessmentDetails.waysOfWorking3}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Able to articulate thoughts, ideas, and
															events in writing and orally.</p></td>
													<td><p>
															<c:out
																value="${managerSkillsAssessmentDetails.waysOfWorking4}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Displays commitment to the Company&#39;s
															continuous improvement efforts and implements/supports
															continuous improvement in area(s) of responsibility.</p></td>
													<td><p>
															<c:out
																value="${managerSkillsAssessmentDetails.waysOfWorking5}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Establishes high standards and goals, works
															diligently on meeting set standards and goals overcoming
															obstacles.</p></td>
													<td><p>
															<c:out
																value="${managerSkillsAssessmentDetails.waysOfWorking6}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Handles multiple projects and tasks
															concurrently and is able to prioritize and re-prioritize
															with minimal guidance.</p></td>
													<td><p>
															<c:out
																value="${managerSkillsAssessmentDetails.waysOfWorking7}"></c:out>
														</p></td>
												</tr>

											</tbody>
										</c:if>


										<c:if test="${empty managerSkillsAssessmentDetails}">

											<tbody>

												<tr class="success">
													<td width="80%"><p>
															<strong>WAYS OF WORKING</strong>
														</p></td>
													<td width="20%"><p>
															<strong>COMPETENCY LEVEL</strong>
														</p></td>
												</tr>
												<tr>
													<td><p>Consistently adheres to all rules and
															regulations.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>
															Has commitment to meet agreed upon goals displaying
															positive behaviors. Attends meetings and does what he/she
															says is going to do. Communicates<br /> and/or
															re-negotiates agreed upon expectations if not able to
															meet deadlines.
														</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Organization of duties, work, and tasks
															(method, delegation, control).</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Able to articulate thoughts, ideas, and
															events in writing and orally.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Displays commitment to the Company&#39;s
															continuous improvement efforts and implements/supports
															continuous improvement in area(s) of responsibility.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Establishes high standards and goals, works
															diligently on meeting set standards and goals overcoming
															obstacles.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Handles multiple projects and tasks
															concurrently and is able to prioritize and re-prioritize
															with minimal guidance.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
											</tbody>
										</c:if>


									</table>


									<table class="table table-bordered">

										<c:if test="${!empty managerSkillsAssessmentDetails}">
											<tbody>

												<tr class="success">
													<td><p>
															<strong>SELF-MANAGEMENT AND LEADERSHIP</strong>
														</p></td>
													<td><p>
															<strong>COMPETENCY LEVEL</strong>
														</p></td>
												</tr>
												<tr>
													<td width="80%"><p>Manages tasks and projects with
															minimal guidance (Plan, Do, Check, Act). When assigned
															leadership role, is able to lead and achieve results with
															collaboration from other team members.</p></td>
													<td width="20%"><p>
															<c:out
																value="${managerSkillsAssessmentDetails.selfManagementandLeadership1}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Adheres to Company policies, practices and
															legal requirements. Implements agreed upon direction even
															if personal point of view may be in conflict.</p></td>
													<td><p>
															<c:out
																value="${managerSkillsAssessmentDetails.selfManagementandLeadership2}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Recognizes his/her mistakes and implements
															corrective action/preventive actions.</p></td>
													<td><p>
															<c:out
																value="${managerSkillsAssessmentDetails.selfManagementandLeadership3}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Exemplifies the Company guiding principle
															of integrity in his/her decision making and dealing with
															supervisors, peers, and external customers.</p></td>
													<td><p>
															<c:out
																value="${managerSkillsAssessmentDetails.selfManagementandLeadership4}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Listens attentively to others and responds
															with respect. Accepts differences of opinions, style, and
															approach.</p></td>
													<td><p>
															<c:out
																value="${managerSkillsAssessmentDetails.selfManagementandLeadership5}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>
															Anticipates departmental needs and understands his/her
															role in achieving <br /> Company objectives.
														</p></td>
													<td><p>
															<c:out
																value="${managerSkillsAssessmentDetails.selfManagementandLeadership6}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>Participates and works well in a team
															environment. Is flexible as a team member and supports
															team consensus.</p></td>
													<td><p>
															<c:out
																value="${managerSkillsAssessmentDetails.selfManagementandLeadership7}"></c:out>
														</p></td>
												</tr>

											</tbody>
										</c:if>

										<c:if test="${empty managerSkillsAssessmentDetails}">
											<tbody>

												<tr class="success">
													<td><p>
															<strong>SELF-MANAGEMENT AND LEADERSHIP</strong>
														</p></td>
													<td><p>
															<strong>COMPETENCY LEVEL</strong>
														</p></td>
												</tr>
												<tr>
													<td width="80%"><p>Manages tasks and projects with
															minimal guidance (Plan, Do, Check, Act). When assigned
															leadership role, is able to lead and achieve results with
															collaboration from other team members.</p></td>
													<td width="20%"><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Adheres to Company policies, practices and
															legal requirements. Implements agreed upon direction even
															if personal point of view may be in conflict.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Recognizes his/her mistakes and implements
															corrective action/preventive actions.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Exemplifies the Company guiding principle
															of integrity in his/her decision making and dealing with
															supervisors, peers, and external customers.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Listens attentively to others and responds
															with respect. Accepts differences of opinions, style, and
															approach.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>
															Anticipates departmental needs and understands his/her
															role in achieving <br /> Company objectives.
														</p></td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>Participates and works well in a team
															environment. Is flexible as a team member and supports
															team consensus.</p></td>
													<td><p>&nbsp;</p></td>
												</tr>

											</tbody>
										</c:if>

									</table>


									<table width="90%">

										<tr>
											<td width="33%">&nbsp;</td>
											<td width="34%" align="center">8 of 12</td>
											<td align="right" width="33%">Version: <c:out value="${sessionScope.loginYear}"></c:out></td>
										</tr>

									</table>

								</div>

								<!-- End of Page10 -->

								<p>&nbsp;</p>

								<!-- Page11 Started -->

								<div
									class="page-break portlet light portlet-fit portlet-form bordered"
									style="page-break-after: always; padding: 40px;">

									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td><img src="./assets1/logo.gif" width="173"
												height="77"></td>
											<td><div class="alert alert-success">
													<c:out value="${sessionScope.loginYear}"></c:out>&nbsp; Annual Assessment<br>
													HRP616.02 Form Instructions
												</div></td>
										</tr>
									</table>

									<table class="table table-bordered">

										<c:if test="${!empty managerSkillsAssessmentDetails}">

											<tbody>
												<tr class="success">
													<td><strong>MANAGER&#39;S ASSESMENT SUMMARY</strong></td>
												</tr>
												<tr>
													<td>Summary Strengths:</td>
												</tr>
												<tr>
													<td height="90"><p>
															<c:out
																value="${managerSkillsAssessmentDetails.section2CSummeryStrength}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td>Summary of Areas of Improvement:</td>
												</tr>
												<tr>
													<td height="90"><p>
															<c:out
																value="${managerSkillsAssessmentDetails.section2CSummeryImprovement}"></c:out>
														</p></td>
												</tr>
											</tbody>

										</c:if>

										<c:if test="${empty managerSkillsAssessmentDetails}">

											<tbody>
												<tr class="success">
													<td><strong>MANAGER&#39;S ASSESMENT SUMMARY</strong></td>
												</tr>
												<tr>
													<td>Summary Strengths:</td>
												</tr>
												<tr>
													<td height="90">&nbsp;</td>
												</tr>
												<tr>
													<td>Summary of Areas of Improvement:</td>
												</tr>
												<tr>
													<td height="90">&nbsp;</td>
												</tr>
											</tbody>

										</c:if>

									</table>

									<h4>D. SUMMARY OF ACCOMPLISHMENT AND DEVELOPMENT AREAS FOR
										IMPROVEMENT</h4>

									<table class="table table-bordered">
										<c:if test="${!empty managerSkillsAssessmentDetails}">
											<tbody>
												<tr class="active">
													<td>General comments about the team member's overall
														performance and key accomplishments and needed development
														for the coming year.</td>
												</tr>
												<tr>
													<td height="90"><p>
															<c:out
																value="${managerSkillsAssessmentDetails.section2DSummeryOfAccomplishmentAndAreasImprovement}"></c:out>
														</p></td>
												</tr>
											</tbody>
										</c:if>

										<c:if test="${empty managerSkillsAssessmentDetails}">
											<tbody>
												<tr class="active">
													<td>General comments about the team member's overall
														performance and key accomplishments and needed development
														for the coming year.</td>
												</tr>
												<tr>
													<td height="90">&nbsp;</td>
												</tr>
											</tbody>
										</c:if>

									</table>

									<h4>
										E. OVERALL RATING PER MANAGER</strong>
									</h4>

									<table class="table table-bordered">

										<c:if test="${!empty managerSkillsAssessmentDetails}">
											<tbody>
												<tr class="active">
													<td>Assessment Summary <c:out value="${sessionScope.loginYear}"></c:out></td>
												</tr>
												<tr>
													<td height="90"><p>
															<c:out
																value="${managerSkillsAssessmentDetails.section2EAssessmentSummary}"></c:out>
														</p></td>
												</tr>
												<tr class="active">
													<td><c:out value="${sessionScope.loginYear}"></c:out> Assessment
														compared to 2015</td>
												</tr>
												<tr>
													<td height="90"><p>
															<c:out
																value="${managerSkillsAssessmentDetails.section2EAssessmentcompared}"></c:out>
														</p></td>
												</tr>
											</tbody>
										</c:if>

										<c:if test="${empty managerSkillsAssessmentDetails}">
											<tbody>
												<tr class="active">
													<td>Assessment Summary <c:out value="${sessionScope.loginYear}"></c:out></td>
												</tr>
												<tr>
													<td height="90">&nbsp;</td>
												</tr>
												<tr class="active">
													<td><c:out value="${sessionScope.loginYear}"></c:out> Assessment
														compared to 2015</td>
												</tr>
												<tr>
													<td height="90">&nbsp;</td>
												</tr>
											</tbody>
										</c:if>

									</table>
									<div align="center">
										<strong>*** END OF SECTION II - MANAGER ASSESSMENT***</strong>
									</div>


									<p align="left">
										<b>Next Steps:</b><br> Schedule a meeting with Team
										Member to review Section I and II. Then fill out Section III
										with Team Member. ("Once you receive approval from HR.")
									</p>

									<table width="90%">

										<tr>
											<td width="33%">&nbsp;</td>
											<td width="34%" align="center">9 of 12</td>
											<td align="right" width="33%">Version: <c:out value="${sessionScope.loginYear}"></c:out></td>
										</tr>

									</table>

								</div>

								<!-- End of Page11 -->

								<p>&nbsp;</p>

								<!-- Page12 Started -->

								<div
									class="page-break portlet light portlet-fit portlet-form bordered"
									style="page-break-after: always; padding: 40px;">

									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td><img src="./assets1/logo.gif" width="173"
												height="77"></td>
											<td><div class="alert alert-success">
													<c:out value="${sessionScope.loginYear}"></c:out>
													Annual Assessment<br> HRP616.02 Form Instructions
												</div></td>
										</tr>
									</table>
									<h3>SECTION III &#45; TO BE COMPLETED BY MANAGER AND TEAM
										MEMBER</h3>

									<h4>
										A.
										2017
										OBJECTIVES
									</h4>

									<p>AGREED UPON OBJECTIVES (SPECIFIC, MEASURABLE,
										ACHIEVABLE, RESULTS BASED, AND TIME BOUND)</p>

									<table class="table table-bordered">

										<c:if test="${!empty presentYearObjectives}">
											<tbody>

												<tr class="success">
													<td colspan="2"><p>
															<strong>2017 AGREED UPON PERFORMANCE
																OBJECTIVES/RESULTS</strong>
														</p></td>
													<td><p>
															<strong>WEIGHT %</strong>
														</p></td>
												</tr>
												<tr>
													<td width="5%"><p>1.</p></td>
													<td width="85%"><c:out
															value="${presentYearObjectives.objectivesOne}"></c:out></td>
													<td width="10%"><p>
															<c:out
																value="${presentYearObjectives.objectivesOneWeight}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>2.</p></td>
													<td><c:out
															value="${presentYearObjectives.objectivesTwo}"></c:out></td>
													<td><p>
															<c:out
																value="${presentYearObjectives.objectivesTwoWeight}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>3.</p></td>
													<td><c:out
															value="${presentYearObjectives.objectivesThree}"></c:out></td>
													<td><p>
															<c:out
																value="${presentYearObjectives.objectivesThreeWeight}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>4.</p></td>
													<td><c:out
															value="${presentYearObjectives.objectivesFour}"></c:out></td>
													<td><p>
															<c:out
																value="${presentYearObjectives.objectivesFourWeight}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>5.</p></td>
													<td><c:out
															value="${presentYearObjectives.objectivesFive}"></c:out></td>
													<td><p>
															<c:out
																value="${presentYearObjectives.objectivesFiveWeight}"></c:out>
														</p></td>
												</tr>

												<tr>
													<td><p>&nbsp;</p></td>
													<td><p>Total:</p></td>
													<td><p>
															<c:out
																value="${presentYearObjectives.objectivesOneWeight+presentYearObjectives.objectivesTwoWeight+presentYearObjectives.objectivesThreeWeight+presentYearObjectives.objectivesFourWeight+presentYearObjectives.objectivesFiveWeight}"></c:out>

														</p></td>
												</tr>

											</tbody>
										</c:if>

										<c:if test="${empty presentYearObjectives}">
											<tbody>

												<tr class="success">
													<td colspan="2"><p>
															<strong>2017 AGREED UPON PERFORMANCE
																OBJECTIVES/RESULTS</strong>
														</p></td>
													<td><p>
															<strong>WEIGHT %</strong>
														</p></td>
												</tr>
												<tr>
													<td width="5%"><p>1.</p></td>
													<td width="85%">&nbsp;</td>
													<td width="10%"><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>2.</p></td>
													<td>&nbsp;</td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>3.</p></td>
													<td>&nbsp;</td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>4.</p></td>
													<td>&nbsp;</td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>5.</p></td>
													<td>&nbsp;</td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>&nbsp;</p></td>
													<td><p>Total:</p></td>
													<td><p>&nbsp;</p></td>
												</tr>

											</tbody>
										</c:if>

									</table>


									<h4>B. DEVELOPMENT GOALS FOR NEXT YEAR</h4>

									<p>2017 AGREED UPON DEVELOPMENT GOALS AND TRAINING</p>

									<table class="table table-bordered">
										<c:if test="${!empty presentYearObjectives}">
											<tbody>
												<tr>
													<td width="5%"><p>1.</p></td>
													<td width="85%"><c:out
															value="${presentYearObjectives.developmentGoalsOne}"></c:out></td>
												</tr>
												<tr>
													<td><p>2.</p></td>
													<td><c:out
															value="${presentYearObjectives.developmentGoalsTwo}"></c:out></td>
												</tr>
												<tr>
													<td><p>3.</p></td>
													<td><c:out
															value="${presentYearObjectives.developmentGoalsThree}"></c:out></td>
												</tr>
												<tr>
													<td><p>4.</p></td>
													<td><c:out
															value="${presentYearObjectives.developmentGoalsFour}"></c:out></td>
												</tr>
												<tr>
													<td><p>5.</p></td>
													<td><c:out
															value="${presentYearObjectives.developmentGoalsFive}"></c:out></td>
												</tr>

											</tbody>
										</c:if>

										<c:if test="${empty presentYearObjectives}">
											<tbody>
												<tr>
													<td width="5%"><p>1.</p></td>
													<td width="85%">&nbsp;</td>
													<td width="10%"><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>2.</p></td>
													<td>&nbsp;</td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>3.</p></td>
													<td>&nbsp;</td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>4.</p></td>
													<td>&nbsp;</td>
													<td><p>&nbsp;</p></td>
												</tr>
												<tr>
													<td><p>5.</p></td>
													<td>&nbsp;</td>
													<td><p>&nbsp;</p></td>
												</tr>

											</tbody>
										</c:if>

									</table>

									<table width="90%">

										<tr>
											<td width="33%">&nbsp;</td>
											<td width="34%" align="center">10 of 12</td>
											<td align="right" width="33%">Version: <c:out value="${sessionScope.loginYear}"></c:out></td>
										</tr>

									</table>

								</div>

								<!-- End of Page12 -->

								<p>&nbsp;</p>

								<!-- Page13 Started -->

								<div
									class="page-break portlet light portlet-fit portlet-form bordered"
									style="page-break-after: always; padding: 40px;">

									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td><img src="./assets1/logo.gif" width="173"
												height="77"></td>
											<td><div class="alert alert-success">
													<c:out value="${sessionScope.loginYear}"></c:out>
													Annual Assessment<br> HRP616.02 Form Instructions
												</div></td>
										</tr>
									</table>
									<h4>C. MEETING SUMMARY</h4>
									<table class="table table-bordered">

										<%-- <c:if test="${!empty presentYearObjectives}">
									
										<tbody>
											<tr class="active">
												<td>Assessment Meeting Comments by Team Member:</td>
											</tr>
											<tr>
												<td height="100"><p><c:out value="${presentYearObjectives.meetingSummaryManager}"></c:out></p></td>
											</tr>
											<tr class="active">
												<td>Assessment Meeting Comments by Manager:</td>
											</tr>
											<tr>
												<td height="100"><p><c:out value="${presentYearObjectives.meetingSummaryTeamMember}"></c:out></p></td>
											</tr>
										</tbody>
										</c:if> --%>



										<tbody>
											<tr class="active">
												<td>Assessment Meeting Comments by Team Member:</td>
											</tr>
											<tr>
												<td height="300">&nbsp;</td>
											</tr>

											<tr class="active">
												<td>Assessment Meeting Comments by Manager:</td>
											</tr>
											<tr>
												<td height="300">&nbsp;</td>
											</tr>
										</tbody>


									</table>

									<table width="90%">

										<tr>
											<td width="33%">&nbsp;</td>
											<td width="34%" align="center">11 of 12</td>
											<td align="right" width="33%">Version: <c:out value="${sessionScope.loginYear}"></c:out></td>
										</tr>

									</table>

								</div>


								<!-- Acknowledgrment Section -->

								<div
									class="page-break portlet light portlet-fit portlet-form bordered"
									style="padding: 40px;">

									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td><img src="./assets1/logo.gif" width="173"
												height="77"></td>
											<td><div class="alert alert-success">
													<c:out value="${sessionScope.loginYear}"></c:out>
													Annual Assessment<br> HRP616.02 Form Instructions
												</div></td>
										</tr>
									</table>

									<h4>D. ACKNOWLEDGEMENT SECTION:</h4>
									<p>Performance Reviews are conducted at the minimum
										annually for the purpose of reviewing and measuring Employee
										performance and do not necessarily warrant or guarantee a
										change in compensation regardless of outcome.</p>
									<p>Your employment with LISI-Aerospace is at the mutual
										consent of you and LISI-Aerospace. Either party can terminate
										the relationship at any time, with or without cause and with
										or without advance notice.</p>
									<table class="table table-bordered" width="100%">

										<c:if test="${!empty employeeDetails}">
											<c:forEach var="empDetail" items="${employeeDetails}">


												<tbody>
													<tr>
														<td height="100"><p>
																Team Member&#39;s Name:&nbsp;
																<c:out value="${empDetail.emplastName}"></c:out>
																,
																<c:out value="${ empDetail.empfirstName}"></c:out>
															</p></td>
														<td height="100"><p>Team Member&#39;s Signature
																and Date:</p></td>
													</tr>

													<tr>
														<td height="100"><p>
																Manager&#39;s Name:&nbsp;
																<c:out value="${empDetail.supervisorLasttName}"></c:out>
																,
																<c:out value="${ empDetail.supervisorFirstName}"></c:out>
															</p></td>
														<td height="100"><p>Manager&#39;s Signature and
																Date:</p></td>
													</tr>

												</tbody>

											</c:forEach>
										</c:if>

										<c:if test="${empty employeeDetails}">
											<tbody>

												<tr>
													<td height="100"><p>Team Member&#39;s Name:</p></td>
													<td height="100"><p>Team Member&#39;s Signature
															and Date:</p></td>
												</tr>

												<tr>
													<td height="100"><p>Manager&#39;s Name:</p></td>
													<td height="100"><p>Manager&#39;s Signature and
															Date:</p></td>
												</tr>

											</tbody>
										</c:if>

									</table>

									<div align="center">
										<strong>*** END OF SECTION III****</strong>
									</div>

									<div align="left">
										<table>

											<tr>
												<td><b>Next Steps for Manager:</b></td>
											</tr>

											<tr>
												<td>Sign form. Team Member and Manager sign form in
													designated section in this page.</td>
											</tr>
											<tr>
												<td>Provide a signed copy to Team Member.</td>
											</tr>
											<tr>
												<td>Send original signed form to your Human Resources
													Representative.</td>
											</tr>
											<tr>
												<td>Email electronic copy to your Human Resources
													Representative.</td>
											</tr>
										</table>

									</div>


									<table width="90%">

										<tr>
											<td width="33%">&nbsp;</td>
											<td width="34%" align="center">12 of 12</td>
											<td align="right" width="33%">Version: <c:out value="${sessionScope.loginYear}"></c:out></td>
										</tr>

									</table>

								</div>

								<!-- End of Page13 -->


							</div>
					</div>


					</form>
					<!-- END FORM-->

				</div>
			</div>
		</div>
		<!-- END CONTENT BODY -->
	</div>
	<!-- END CONTENT -->

	</div>
	<!-- END CONTAINER -->


</body>

</html>