<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.lisi.annualassessment.util.Converters"%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>

<meta charset="utf-8" />
<title>Non-Exempt Report</title>
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
<link href="./assets1/global/plugins/select2/css/select2.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="./assets1/global/plugins/select2/css/select2-bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="./assets1/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css"
	rel="stylesheet" type="text/css" />
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
<script src="./assets1/global/plugins/jquery.min.js"
	type="text/javascript"></script>
<script src="./assets1/global/plugins/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>
<link
	href="./assets1/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="./assets1/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

<style type="text/css">
.print:last-child {
	page-break-after: auto;
}
</style>

<style type="text/css">
@page {
	size: auto;
	margin: 0.8cm;
}

@media print {
	body {
		background-color: #FFFFFF;
		background-image: none;
		color: #000000;
		margin: 0px;
	}
}
</style>
</head>
<!-- END HEAD -->


<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">

	

		<div>
			<p>&nbsp;</p>
		</div>

		<c:if test="${!empty employeeDetails}">
			<c:forEach var="empDetail" items="${employeeDetails}">
				<div align="left" style="font-size: 12px; margin-left: 40px;">
					<b> <c:out value="${empDetail.emplastName}"></c:out>,<c:out
							value="${ empDetail.empfirstName}"></c:out>
					</b>
					</div>
			</c:forEach>
			
		</c:if>
		<div align="right">

			<a href="/AnnualAssessmenT/downloadPDF.do"
				style="font-size: 12px; margin-right: 100px;"><img
				src="./images/pdf_icon_32x32.png" border=0 align="middle" height="30px" width="30px">
				Download PDF</a>
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

								<!-- Page 1 Started -->

								<div
									class="page-break portlet light portlet-fit portlet-form bordered"
									style="page-break-after: always; padding: 40px;">

									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td><img src="./assets1/logo.gif" width="173"
												height="77">
											</td>
											<td><h3>2016 
													ANNUAL PERFORMANCE REVIEW
												</h3></td>
										</tr>
									</table>

									<div align="center">
										<h4>SECTION #1 TEAM MEMBER&#39;S INFORMATION</h4>
									</div>

									<c:if test="${!empty employeeDetails}">
										<c:forEach items="${employeeDetails}" var="employeeDetail">
											<table width="100%" class="table table-bordered">

												<tbody>
													<tr>
														<td width="20%">Name:</td>
														<td width="30%"><c:out
																value="${employeeDetail.emplastName}"></c:out>,<c:out
																value="${employeeDetail.empfirstName}"></c:out></td>
														<td width="20%">Date of interview:</td>
														<td width="30%"><jsp:useBean id="topRightDate"
																class="java.util.Date" /> <fmt:formatDate
																value="${topRightDate}" pattern="MM/dd/yyyy" /></td>
													</tr>
													<tr>
														<td>Job Title:</td>
														<td colspan="3"><c:out
																value="${employeeDetail.jobTitle}"></c:out></td>
														<%-- <td>Clock #:</td>
													<td><c:out value="${employeeDetail.empClockNumber}"></c:out></td> --%>
													</tr>
													<tr>
														<td>Date of Hire:</td>
														<td><fmt:formatDate pattern="MM/dd/yyyy"
																value="${employeeDetail.DOH}" /></td>
														<td>Date of last interview:</td>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td>Department:</td>
														<td><c:out value="${employeeDetail.costCenter}"></c:out></td>
														<td>Department Manager:</td>
														<td><c:out
																value="${employeeDetail.supervisorLasttName}"></c:out>,<c:out
																value="${employeeDetail.supervisorFirstName}"></c:out></td>
													</tr>
													<tr>
														<td>Factory/ Division:</td>
														<td><c:out value="${employeeDetail.factoryLocation}"></c:out></td>
														<td>MoR (Manager-once-Removed):</td>
														<td><c:out value="${employeeDetail.mor}"></c:out></td>
													</tr>
												</tbody>
											</table>
										</c:forEach>
									</c:if>

									<!-- For EmployeeDetails Empty Employee List -->

									<c:if test="${empty employeeDetails}">

										<table width="100%" class="table table-bordered">

											<tbody>
												<tr>
													<td width="20%">Name:</td>
													<td width="30%">&nbsp;</td>
													<td width="20%">Date of interview:</td>
													<td width="30%">&nbsp;</td>
												</tr>
												<tr>
													<td>Job Title:</td>
													<td colspan="3">&nbsp;</td>
													<!-- <td>Clock #:</td>
													<td>&nbsp;</td> -->
												</tr>
												<tr>
													<td>Date of Hire:</td>
													<td>&nbsp;</td>
													<td>Date of last interview:</td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td>Department:</td>
													<td>&nbsp;</td>
													<td>Department Manager:</td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td>Factory/ Division:</td>
													<td>&nbsp;</td>
													<td>MoR (Manager-once-Removed):</td>
													<td>&nbsp;</td>
												</tr>
											</tbody>
										</table>

									</c:if>

									<table width="90%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="33%">&nbsp;</td>
											<td width="34%" align="center">1 of 7</td>
											<td width="33%" align="right">Version: 2016</td>
										</tr>
									</table>

								</div>

								<p>&nbsp;</p>

								<div
									class="page-break portlet light portlet-fit portlet-form bordered"
									style="page-break-after: always; padding: 40px;">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td><img src="./assets1/logo.gif" width="173"
												height="77">
											</td>
											<td><h3>2016
													ANNUAL PERFORMANCE REVIEW
												</h3></td>
										</tr>
									</table>

									<div align="center">
										<h4>SECTION #2 INTERPERSONAL SKILLS</h4>
									</div>
									<p>
										<strong>SCORE:</strong> Rate each performance factor.
										Unacceptable = 0 - 0.75; Needs Improvement = 1 - 1.75 Meets
										Expectations = 2 - 2.75; Exceeds Expectations 3. COMMENTS: A
										"Needs Improvement" rating must have an Explanation with
										Action and Follow Up. An "Exceeds Expectations" rating must
										have a justification. All sections MUST have a comment.
									</p>
									<c:if test="${!empty interpersonalSkills}">
										<c:forEach items="${interpersonalSkills}"
											var="interpersonalSkill">
											<table width="100%" class="table table-bordered">
												<tr>
													<td><p>
															<strong>Responsibility:&nbsp;</strong><i>Makes sound
																decisions with factual data and can present objective
																arguments for those decisions. Minimal decision making
																by subjectivity.</i>
														</p></td>
													<td><p>
															<strong>SCORE:<c:out
																	value="${interpersonalSkill.responsibilityScore}"></c:out></strong>
														</p></td>
												</tr>
												<tr>
													<td colspan="2" height="100"><p>
															<strong>Supervisor&#39;s Comments:&nbsp;</strong>
															<c:out
																value="${interpersonalSkill.responsibilitySupervisorsComments}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>
															<strong>Adaptability:</strong>&nbsp;<i> Team Member
																is able to adjust to a variety of situations. Flexible
																to company needs. Carries out assignments, jobs, tasks,
																and projects consistently and completely. Overcomes
																obstacles and accepts challenges with enthusiasm.</i>
														</p></td>
													<td><p>
															<strong>SCORE:<c:out
																	value="${interpersonalSkill.adaptabilityScore}"></c:out></strong>
														</p></td>
												</tr>
												<tr>
													<td colspan="2" height="100"><p>
															<strong>Supervisor&#39;s Comments:</strong>&nbsp;
															<c:out
																value="${interpersonalSkill.adaptabilitySupervisorsComments}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>
															<strong>Initiative:</strong>&nbsp;<i>Team Member
																consistently demonstrates self-motivation by maintaining
																a solid work rhythm. Moves on to the next assignment
																without reminders. Seeks additional projects and/or
																offers to assist other team members.</i>
														</p></td>
													<td><p>
															<strong>SCORE:<c:out
																	value="${interpersonalSkill.initiativeScore}"></c:out></strong>
														</p></td>
												</tr>
												<tr>
													<td colspan="2" height="100"><p>
															<strong>Supervisor&#39;s Comments:</strong>&nbsp;
															<c:out
																value="${interpersonalSkill.initiativeSupervisorsComments}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>
															<strong>Judgement:</strong>&nbsp;<i>Uses logical and
																sound judgement organizes and prioritizes work even when
																encountered with conflicting priorities, seeks guidance
																if necessary.</i>
														</p></td>
													<td><p>
															<strong>SCORE:<c:out
																	value="${interpersonalSkill.judgementScore}"></c:out></strong>
														</p></td>
												</tr>
												<tr>
													<td colspan="2" height="100"><p>
															<strong>Supervisor&#39;s Comments:</strong>&nbsp;
															<c:out
																value="${interpersonalSkill.judgementSupervisorsComments}"></c:out>
														</p></td>
												</tr>
											</table>
										</c:forEach>
									</c:if>

									<!-- For InterpersonalSkills Empty Values -->

									<c:if test="${empty interpersonalSkills}">
										<table width="100%" class="table table-bordered">
											<tr>
												<td><p>
														<strong>Responsibility:</strong>&nbsp;<i>Makes sound
															decisions with factual data and can present objective
															arguments for those decisions. Minimal decision making by
															subjectivity.</i>
													</p></td>
												<td><p>
														<strong>SCORE:</strong>
													</p></td>
											</tr>
											<tr>
												<td colspan="2" height="100"><p>
														<strong>Supervisor&#39;s Comments:</strong>
													</p></td>
											</tr>
											<tr>
												<td><p>
														<strong>Adaptability: </strong>&nbsp;<i>Team Member is
															able to adjust to a variety of situations. Flexible to
															company needs. Carries out assignments, jobs, tasks, and
															projects consistently and completely. Overcomes obstacles
															and accepts challenges with enthusiasm.</i>
													</p></td>
												<td><p>
														<strong>SCORE:</strong>
													</p></td>
											</tr>
											<tr>
												<td colspan="2" height="100"><p>
														<strong>Supervisor&#39;s Comments:</strong>
													</p></td>
											</tr>
											<tr>
												<td><p>
														<strong>Initiative:</strong>&nbsp;<i>Team Member
															consistently demonstrates self-motivation by maintaining
															a solid work rhythm. Moves on to the next assignment
															without reminders. Seeks additional projects and/or
															offers to assist other team members.</i>
													</p></td>
												<td><p>
														<strong>SCORE:</strong>
													</p></td>
											</tr>
											<tr>
												<td colspan="2" height="100"><p>
														<strong>Supervisor&#39;s Comments:</strong>
													</p></td>
											</tr>
											<tr>
												<td><p>
														<strong>Judgement: </strong>&nbsp;<i>Uses logical and
															sound judgement organizes and prioritizes work even when
															encountered with conflicting priorities, seeks guidance
															if necessary.</i>
													</p></td>
												<td><p>
														<strong>SCORE:</strong>
													</p></td>
											</tr>
											<tr>
												<td colspan="2" height="100"><p>
														<strong>Supervisor&#39;s Comments:</strong>
													</p></td>
											</tr>
										</table>

									</c:if>

									<table width="90%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="33%">&nbsp;</td>
											<td width="34%" align="center">2 of 7</td>
											<td width="33%" align="right">Version: 2016</td>
										</tr>
									</table>
								</div>

								<!-- End of Page1 -->
								<p>&nbsp;</p>
								<!-- Page2 Started -->

								<div
									class="page-break portlet light portlet-fit portlet-form bordered"
									style="page-break-after: always; padding: 40px;">

									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td><img src="./assets1/logo.gif" width="173"
												height="77">
											</td>
											<td><h3>2016 
													ANNUAL PERFORMANCE REVIEW
												</h3></td>
										</tr>
									</table>
									<p>&nbsp;</p>

									<c:if test="${!empty interpersonalSkills}">
										<c:forEach items="${interpersonalSkills}"
											var="interpersonalSkill">
											<table width="100%" class="table table-bordered">
												<tr>
													<td><p>
															<strong>Written and Oral Communication:</strong>&nbsp;<i>Communicates
																in a logical and clear manner with others. Effectively
																listens, suggests, and interacts with other team members
																and supervisors on all job related items. Welcomes and
																seeks constructive feedback on own performance for
																improvement. Elevates and informs supervisors on job
																related matters, seeking advice and assistance to obtain
																a positive department/ Company image.</i>
														</p></td>
													<td><p>
															<strong>SCORE:<c:out
																	value="${interpersonalSkill.writtenAndOralCommunicationScore}"></c:out></strong>
														</p></td>
												</tr>
												<tr>
													<td colspan="2" height="100"><p>
															<strong>Supervisor&#39;s Comments:</strong>&nbsp;
															<c:out
																value="${interpersonalSkill.writtenAndOralCommunicationSupervisorsComments}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>
															<strong>Attendance, Punctuality, and Commitment:</strong>&nbsp;<i>Punctual
																and regular attendance. Meets deadlines without close
																supervision. Reliable in completing assigned tasks.</i>
														</p></td>
													<td><p>
															<strong>SCORE:<c:out
																	value="${interpersonalSkill.punctualityAndCommitmentScore}"></c:out></strong>
														</p></td>
												</tr>
												<tr>
													<td colspan="2" height="100"><p>
															<strong>Supervisor&#39;s Comments:</strong>&nbsp;
															<c:out
																value="${interpersonalSkill.punctualityAndCommitmentSupervisorsComments}"></c:out>
														</p></td>
												</tr>
											</table>
											<div align="right">
												<strong>Section #2 Average Score:<c:out
														value="${interpersonalSkill.avgScore}"></c:out>
												</strong>
											</div>
										</c:forEach>
									</c:if>

									<!-- For InterpersonalSkills Empty Values -->
									<c:if test="${empty interpersonalSkills}">

										<table width="100%" class="table table-bordered">
											<tr>
												<td><p>
														<strong>Written and Oral Communication:</strong>&nbsp;<i>Communicates
															in a logical and clear manner with others. Effectively
															listens, suggests, and interacts with other team members
															and supervisors on all job related items. Welcomes and
															seeks constructive feedback on own performance for
															improvement. Elevates and informs supervisors on job
															related matters, seeking advice and assistance to obtain
															a positive department/ Company image.</i>
													</p></td>
												<td><p>
														<strong>SCORE:</strong>
													</p></td>
											</tr>
											<tr>
												<td colspan="2" height="100"><p>
														<strong>Supervisor&#39;s Comments:</strong>
													</p></td>
											</tr>
											<tr>
												<td><p>
														<strong>Attendance, Punctuality, and Commitment:</strong>&nbsp;<i>Punctual
															and regular attendance. Meets deadlines without close
															supervision. Reliable in completing assigned tasks.</i>
													</p></td>
												<td><p>
														<strong>SCORE:</strong>
													</p></td>
											</tr>
											<tr>
												<td colspan="2" height="100"><p>
														<strong>Supervisor&#39;s Comments:</strong>
													</p></td>
											</tr>
										</table>
										<div align="right">
											<strong>Section #2 Average Score: </strong>
										</div>
									</c:if>
									<!-- <div align="right"><strong>Section #2 Average Score: </strong></div> -->


									<table width="90%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="33%">&nbsp;</td>
											<td width="34%" align="center">3 of 7</td>
											<td width="33%" align="right">Version: 2016</td>
										</tr>
									</table>

								</div>



								<div
									class="page-break portlet light portlet-fit portlet-form bordered"
									style="page-break-after: always; padding: 40px;">


									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td><img src="./assets1/logo.gif" width="173"
												height="77">
											</td>
											<td><h3>2016
													ANNUAL PERFORMANCE REVIEW
												</h3></td>
										</tr>
									</table>

									<div align="center">
										<h4>SECTION #3 JOB KNOWLEDGE & SKILLS</h4>
									</div>
									<p>
										<strong>SCORE:</strong> Rate each performance factor.
										Unacceptable = 0 - 0.75; Needs Improvement = 1 - 1.75 Meets
										Expectations = 2 - 2.75; Exceeds Expectations 3. COMMENTS: A
										"Needs Improvement" rating must have an Explanation with
										Action and Follow Up. An "Exceeds Expectations" rating must
										have a justification. All sections MUST have a comment.
									</p>
									<c:if test="${!empty jobKnowledgeAndSkill}">
										<c:forEach items="${jobKnowledgeAndSkill}"
											var="jobKnowledgeAndSkills">
											<table width="100%" class="table table-bordered">
												<tr>
													<td><p>
															<strong>Safety:</strong>&nbsp;<i>Team Member abides
																with Company HSE and governmental safety procedures and
																environmental and hazardous materials regulations.
																Always wears Personal Protective Equipment (PPE) in the
																required areas. Team Member attends safety training
																regularly. Operates machinery and/or assigned equipment
																following all safety practices. Maintains an orderly
																work area with minimum supervision to promote a safe
																working environment.</i>
														</p></td>
													<td><p>
															<strong>SCORE:<c:out
																	value="${jobKnowledgeAndSkills.safetyScore}"></c:out></strong>
														</p></td>
												</tr>
												<tr>
													<td colspan="2" height="100"><p>
															<strong>Supervisor&#39;s Comments:</strong>&nbsp;
															<c:out
																value="${jobKnowledgeAndSkills.safetySupervisorsComments}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>
															<strong>Quality:</strong>&nbsp;<i>Work completed with
																neat and detailed accuracy that meets Company, "right
																the first time" principals. Team Member has the required
																knowledge, competency, and attitude to consistently
																produce good quality work with low levels of errors.</i>
														</p></td>
													<td><p>
															<strong>SCORE:<c:out
																	value="${jobKnowledgeAndSkills.qualityScore}"></c:out></strong>
														</p></td>
												</tr>
												<tr>
													<td colspan="2" height="100"><p>
															<strong>Supervisor&#39;s Comments:</strong>&nbsp;
															<c:out
																value="${jobKnowledgeAndSkills.qualitySupervisorsComments}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>
															<strong>Productivity:</strong>&nbsp;<i>Effectively
																uses work time, plans and prioritizes work load to
																attain, "right the first time" results. Accomplishes
																goals and completes job assignments on schedule.</i>
														</p></td>
													<td><p>
															<strong>SCORE:<c:out
																	value="${jobKnowledgeAndSkills.productivityScore}"></c:out></strong>
														</p></td>
												</tr>
												<tr>
													<td colspan="2" height="100"><p>
															<strong>Supervisor&#39;s Comments:</strong>&nbsp;
															<c:out
																value="${jobKnowledgeAndSkills.productivitySupervisorsComments}"></c:out>
														</p></td>
												</tr>
												<tr>
													<td><p>
															<strong>Job Knowledge &amp; Skills:</strong>&nbsp;<i>Team
																Member understands and performs the essential job
																requirements and duties of the position. Is proficient
																and familiar with the equipment needed to perform the
																job successfully.</i>
														</p></td>
													<td><p>
															<strong>SCORE:<c:out
																	value="${jobKnowledgeAndSkills.jobKnowledgeAndSkillsScore}"></c:out></strong>
														</p></td>
												</tr>
												<tr>
													<td colspan="2" height="100"><p>
															<strong>Supervisor&#39;s Comments:</strong>&nbsp;
															<c:out
																value="${jobKnowledgeAndSkills.jobKnowledgeAndSkillsSupervisorsComments}"></c:out>
														</p></td>
												</tr>
											</table>
											<div align="right">
												<strong>Section #3 Average Score:<c:out
														value="${jobKnowledgeAndSkills.avgScore}"></c:out></strong>
											</div>
										</c:forEach>
									</c:if>

									<!-- For JobKnowledgeAndSkill Empty Values -->

									<c:if test="${empty jobKnowledgeAndSkill}">

										<table width="100%" class="table table-bordered">
											<tr>
												<td><p>
														<strong>Safety:</strong>&nbsp;<i>Team Member abides
															with Company HSE and governmental safety procedures and
															environmental and hazardous materials regulations. Always
															wears Personal Protective Equipment (PPE) in the required
															areas. Team Member attends safety training regularly.
															Operates machinery and/or assigned equipment following
															all safety practices. Maintains an orderly work area with
															minimum supervision to promote a safe working
															environment.</i>
													</p></td>
												<td><p>
														<strong>SCORE:</strong>
													</p></td>
											</tr>
											<tr>
												<td colspan="2" height="100"><p>
														<strong>Supervisor&#39;s Comments:</strong>
													</p></td>
											</tr>
											<tr>
												<td><p>
														<strong>Quality:</strong>&nbsp;<i>Work completed with
															neat and detailed accuracy that meets Company, "right the
															first time" principals. Team Member has the required
															knowledge, competency, and attitude to consistently
															produce good quality work with low levels of errors.</i>
													</p></td>
												<td><p>
														<strong>SCORE:</strong>
													</p></td>
											</tr>
											<tr>
												<td colspan="2" height="100"><p>
														<strong>Supervisor&#39;s Comments:</strong>
													</p></td>
											</tr>
											<tr>
												<td><p>
														<strong>Productivity:</strong>&nbsp;<i>Effectively
															uses work time, plans and prioritizes work load to
															attain, "right the first time" results. Accomplishes
															goals and completes job assignments on schedule.</i>
													</p></td>
												<td><p>
														<strong>SCORE:</strong>
													</p></td>
											</tr>
											<tr>
												<td colspan="2" height="100"><p>
														<strong>Supervisor&#39;s Comments:</strong>
													</p></td>
											</tr>
											<tr>
												<td><p>
														<strong>Job Knowledge &amp; Skills:</strong>&nbsp;<i>Team
															Member understands and performs the essential job
															requirements and duties of the position. Is proficient
															and familiar with the equipment needed to perform the job
															successfully.</i>
													</p></td>
												<td><p>
														<strong>SCORE:</strong>
													</p></td>
											</tr>
											<tr>
												<td colspan="2" height="100"><p>
														<strong>Supervisor&#39;s Comments:</strong>
													</p></td>
											</tr>
										</table>
										<div align="right">
											<strong>Section #3 Average Score:</strong>
										</div>
									</c:if>



									<table width="90%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="33%">&nbsp;</td>
											<td width="34%" align="center">4 of 7</td>
											<td width="33%" align="right">Version: 2016</td>
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
												height="77">
											</td>
											<td><h3>2016
													ANNUAL PERFORMANCE REVIEW
												</h3></td>
										</tr>
									</table>
									<p>&nbsp;</p>
									<div align="center">
										<h4>SECTION #4 SUMMARY OF PERFORMANCE REVIEW</h4>
									</div>
									<c:if test="${!empty jobKnowledgeAndSkill}">
										<c:forEach items="${jobKnowledgeAndSkill}"
											var="jobKnowledgeAndSkills">
											<table width="100%" class="table table-bordered">

												<tbody>
													<tr class="active">
														<td><strong>Supervisor&#39;s overall
																comments</strong></td>
													</tr>
													<tr>
														<td height="300"><c:out
																value="${jobKnowledgeAndSkills.supervisorsOverallComments}"></c:out></td>
													</tr>
												</tbody>
											</table>
											<div align="right">
												<strong>Average Overall Score:<c:out
														value="${jobKnowledgeAndSkills.summaryAvgScore}"></c:out></strong>
											</div>
										</c:forEach>
									</c:if>

									<!-- For Empty Values -->
									<c:if test="${empty jobKnowledgeAndSkill}">

										<table width="100%" class="table table-bordered">

											<tbody>
												<tr class="active">
													<td><strong>Supervisor&#39;s overall comments</strong></td>
												</tr>
												<tr>
													<td height="300">&nbsp;</td>
												</tr>
											</tbody>
										</table>
										<div align="right">
											<strong>Average Overall Score:</strong>
										</div>
									</c:if>


									<div align="center">
										<h4>SECTION #5 TRAINING & DEVELOPMENT</h4>
									</div>
									<p>Indicate training area or focus need</p>
									<c:if test="${!empty trainingAndDevelopment}">
										<c:forEach items="${trainingAndDevelopment}"
											var="trainingAndDevelopments">
											<table width="100%" class="table table-bordered">

												<tbody>
													<tr class="active">
														<td><strong>1. Area/Focus:</strong>&nbsp;<c:out
																value="${trainingAndDevelopments.firstAreaorFocus}"></c:out></td>
													</tr>
													<%-- <tr>
												<td><c:out value="${trainingAndDevelopments.firstAreaorFocus}"></c:out></td>
											</tr> --%>
													<tr class="active">
														<td><strong>Method of Training:</strong>&nbsp;<c:out
																value="${trainingAndDevelopments.firstTrainingTopic}"></c:out></td>
													</tr>
													<%-- <tr>
												<td><c:out value="${trainingAndDevelopments.firstTrainingTopic}"></c:out></td>
											</tr> --%>
													<tr class="active">
														<td><strong>Training Description:</strong>&nbsp;<c:out
																value="${trainingAndDevelopments.firstTrainingDescription}"></c:out></td>
													</tr>
													<%-- <tr>
												<td><c:out value="${trainingAndDevelopments.firstTrainingDescription}"></c:out></td>
											</tr> --%>

													<tr class="active">
														<td><strong>Date Due:&nbsp;</strong>
														<fmt:formatDate pattern="MM/dd/yyyy"
																value="${trainingAndDevelopments.firstDateDue}" /></td>
													</tr>

												</tbody>
											</table>



											<table width="100%" class="table table-bordered">

												<tbody>
													<tr class="active">
														<td><strong>2. Area/Focus:</strong>&nbsp;<c:out
																value="${trainingAndDevelopments.secondAreaorFocus}"></c:out></td>
													</tr>
													<%-- <tr>
												<td><c:out value="${trainingAndDevelopments.firstAreaorFocus}"></c:out></td>
											</tr> --%>
													<tr class="active">
														<td><strong>Method of Training:</strong>&nbsp;<c:out
																value="${trainingAndDevelopments.secondTrainingTopic}"></c:out></td>
													</tr>
													<%-- <tr>
												<td><c:out value="${trainingAndDevelopments.firstTrainingTopic}"></c:out></td>
											</tr> --%>
													<tr class="active">
														<td><strong>Training Description:</strong>&nbsp;<c:out
																value="${trainingAndDevelopments.secondTrainingDescription}"></c:out></td>
													</tr>
													<%-- <tr>
												<td><c:out value="${trainingAndDevelopments.secondTrainingDescription}"></c:out></td>
											</tr> --%>

													<tr class="active">
														<td><strong>Date Due:&nbsp;</strong>
														<fmt:formatDate pattern="MM/dd/yyyy"
																value="${trainingAndDevelopments.secondfDateDue}" /></td>
													</tr>

												</tbody>
											</table>

											<table width="100%" class="table table-bordered">

												<tbody>
													<tr class="active">
														<td><strong>3. Area/Focus:</strong>&nbsp;<c:out
																value="${trainingAndDevelopments.thirdAreaorFocus}"></c:out></td>
													</tr>
													<%-- <tr>
												<td><c:out value="${trainingAndDevelopments.thirdAreaorFocus}"></c:out></td>
											</tr> --%>
													<tr class="active">
														<td><strong>Method of Training:</strong>&nbsp;<c:out
																value="${trainingAndDevelopments.thirdTrainingTopic}"></c:out></td>
													</tr>
													<%-- <tr>
												<td><c:out value="${trainingAndDevelopments.thirdTrainingTopic}"></c:out></td>
											</tr> --%>
													<tr class="active">
														<td><strong>Training Description:</strong>&nbsp;<c:out
																value="${trainingAndDevelopments.thirdTrainingDescription}"></c:out></td>
													</tr>
													<%-- <tr>
												<td><c:out value="${trainingAndDevelopments.thirdTrainingDescription}"></c:out></td>
											</tr> --%>

													<tr class="active">
														<td><strong>Date Due:&nbsp;</strong>
														<fmt:formatDate pattern="MM/dd/yyyy"
																value="${trainingAndDevelopments.thirdDateDue}" /></td>
													</tr>

												</tbody>
											</table>



										</c:forEach>
									</c:if>
									<!-- For TrainingAndDevelopment Empty Values -->
									<c:if test="${empty trainingAndDevelopment}">

										<table width="100%" class="table table-bordered">

											<tbody>
												<tr class="active">
													<td><strong>1. Area/Focus:</strong></td>
												</tr>
												<!-- <tr>
												<td>&nbsp;</td>
											</tr> -->
												<tr class="active">
													<td><strong>Method of Training:</strong></td>
												</tr>
												<!-- <tr>
												<td>&nbsp;</td>
											</tr> -->
												<tr class="active">
													<td><strong>Training Description:</strong></td>
												</tr>
												<!-- <tr>
												<td>&nbsp;</td>
											</tr> -->
											</tbody>
										</table>


										<div align="right">
											<strong>Date Due:</strong>
										</div>
										<table width="100%" class="table table-bordered">

											<tbody>
												<tr class="active">
													<td><strong>2. Area/Focus:</strong></td>
												</tr>
												<!-- <tr>
												<td>&nbsp;</td>
											</tr> -->
												<tr class="active">
													<td><strong>Method of Training:</strong></td>
												</tr>
												<!-- <tr>
												<td>&nbsp;</td>
											</tr> -->
												<tr class="active">
													<td><strong>Training Description:</strong></td>
												</tr>
												<!-- <tr>
												<td>&nbsp;</td>
											</tr> -->
											</tbody>
										</table>
										<div align="right">
											<strong>Date Due:</strong>
										</div>
										<table width="100%" class="table table-bordered">

											<tbody>
												<tr class="active">
													<td><strong>3. Area/Focus:</strong></td>
												</tr>
												<!-- <tr>
												<td>&nbsp;</td>
											</tr> -->
												<tr class="active">
													<td><strong>Method of Training:</strong></td>
												</tr>
												<!-- <tr>
												<td>&nbsp;</td>
											</tr> -->
												<tr class="active">
													<td><strong>Training Description:</strong></td>
												</tr>
												<!-- <tr>
												<td>&nbsp;</td>
											</tr> -->
											</tbody>
										</table>
										<div align="right">
											<strong>Date Due:</strong>
										</div>

									</c:if>

									<table width="90%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="33%">&nbsp;</td>
											<td width="34%" align="center">5 of 7</td>
											<td width="33%" align="right">Version: 2016</td>
										</tr>
									</table>

								</div>
								<!-- Page5 end -->

								<p>&nbsp;</p>

								<!-- Page6 start -->

								<div
									class="page-break portlet light portlet-fit portlet-form bordered"
									style="page-break-after: always; padding: 40px;">


									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td><img src="./assets1/logo.gif" width="173"
												height="77">
											</td>
											<td><h3>2016
													ANNUAL PERFORMANCE REVIEW
												</h3></td>
										</tr>
									</table>

									<div align="center">
										<h4>SECTION #6 ACKNOWLEDGMENT SECTION</h4>
									</div>
									<%-- <c:if test="${!empty acknowledgmentSection}">
                                              <c:forEach items="${acknowledgmentSection}" var="acknowledgmentSections">
									<table width="100%" class="table table-bordered">

										<tbody>
											<tr class="active">
												<td>Team Member&#39;s comments:</td>
											</tr>
											<tr>
												<td height="300"><c:out value="${teamMembersComments}"></c:out></td>
											</tr>
										</tbody>
									</table>
									</c:forEach>
									</c:if> --%>
									<!-- For AcknowledgmentSection Empty Values -->


									<table width="100%" class="table table-bordered">

										<tbody>
											<tr class="active">
												<td><strong>Team Member&#39;s comments:</strong></td>
											</tr>
											<tr>
												<td height="400">&nbsp;</td>
											</tr>
										</tbody>
									</table>


									<p>Your employment with LISI Aerospace is at the mutual
										consent of you and LISI Aerospace. Either party can terminate
										the relationship at any time, with or without cause and with
										or without advance notice.</p>

									<p>&nbsp;</p>

									<table width="90%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="33%">&nbsp;</td>
											<td width="34%" align="center">6 of 7</td>
											<td width="33%" align="right">Version: 2016</td>
										</tr>
									</table>


								</div>

								<!-- End of Page6 -->

								<p>&nbsp;</p>


								<!-- Acknowledge section -->


								<div
									class="page-break portlet light portlet-fit portlet-form bordered"
									style="padding: 40px;">

									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td><img src="./assets1/logo.gif" width="173"
												height="77">
											</td>
											<td><h3>2016
													ANNUAL PERFORMANCE REVIEW
												</h3></td>
										</tr>
									</table>

									<p>&nbsp;</p>
									<p>Performance Reviews are conducted at a minimum of annual
										basis for the purpose of reviewing and measuring Team
										Member&#39;s performance and do not necessarly warrant or
										guarantee a change in compensation regardless of outcome.</p>

									<p>The above Performance Review has been discussed with me.</p>

									<c:if test="${!empty employeeDetails}">
										<c:forEach var="empDetail" items="${employeeDetails}">

											<table class="table table-bordered">

												<tr>
													<td height="100"><p>
															Team Member&#39;s Name:&nbsp;
															<c:out value="${empDetail.emplastName}"></c:out>
															,
															<c:out value="${ empDetail.empfirstName}"></c:out>
														</p></td>
													<td height="100" s><p>Team Member&#39;s Signature
															and Date:</p></td>
												</tr>

												<tr>
													<td height="100"><p>
															Supervisor&#39;s Name:&nbsp;
															<c:out value="${empDetail.supervisorLasttName}"></c:out>
															,
															<c:out value="${ empDetail.supervisorFirstName}"></c:out>
														</p></td>
													<td height="100"><p>Supervisor&#39;s Signature and
															Date:</p></td>
												</tr>

												<tr>
													<td height="100"><p>
															Human Resources Representative&#39;s Name:&nbsp;
															<c:out value="${empDetail.hrGeneralistLastName}"></c:out>
															,
															<c:out value="${ empDetail.hrGeneralistFirstName}"></c:out>
														</p></td>
													<td height="100"><p>Human Resources
															Representative&#39;s Signature and Date:</p></td>
												</tr>
											</table>
										</c:forEach>
									</c:if>

									<!-- For Empty Values -->
									<c:if test="${empty employeeDetails}">

										<table class="table table-bordered">

											<tr>
												<td height="100"><p>Team Member&#39;s Name:&nbsp;</p></td>
												<td height="100"><p>Team Member&#39;s Signature and
														Date:</p></td>
											</tr>

											<tr>
												<td height="100"><p>Supervisor&#39;s Name:&nbsp;</p></td>
												<td height="100"><p>Supervisor&#39;s Signature and
														Date:</p></td>
											</tr>

											<tr>
												<td height="100"><p>Human Resources
														Representative&#39;s Name:&nbsp;</p></td>
												<td height="100"><p>Human Resources
														Representative&#39;s Signature: and Date</p></td>
											</tr>
										</table>

									</c:if>

									<div align="center">
										<strong>***END OF SECTION***</strong>
									</div>

									<div align="left">

										<p>
											<strong>Next Steps for Manager:</strong></br> Print filled out
											form.</br> Sign form. Team Member and Manager sign form in
											designated section in this page.</br> Provide a signed copy to
											Team Member.</br> Send original signed form to your Human
											Resources Representative.</br> Email electronic copy to your Human
											Resources Representative.
										</p>

									</div>


									<table width="90%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="33%">&nbsp;</td>
											<td width="34%" align="center">7 of 7</td>
											<td width="33%" align="right">Version: 2016</td>
										</tr>
									</table>


								</div>


								<!-- End of Page4 -->


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