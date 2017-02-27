<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script type="text/javascript">
	function approveReject(control) {
		var buttonName = control.name;

		if (buttonName.trim() == 'approve') {

			if (confirm("You are about to ACCEPT a Supervisor completed Appraisal.  In doing so, it will send an email to"
					+ " "
					+ "the Supervisor to inform that this step is now COMPLETED.  After this the Supervisor does a PRINT of the form, the status of this form will then be changed to CLOSED.")) {
				yourformelement.submit();
			} else {
				return false;
			}

		}

		if (buttonName.trim() == 'reject') {

			if (confirm("You are about to REJECT a Supervisor completed Appraisal.  In doing so, it will send this Appraisal back to the Supervisor for corrections.")) {
				yourformelement.submit();
			} else {
				return false;
			}

		}

	}
</script>
<style>
.loader {
	position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 9999;
	background: url('images/page-loader.gif') 50% 50% no-repeat
		rgb(249, 249, 249);
}
</style>
<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
	<!-- <div class="loader" style="display:none"></div> -->

	<!-- BEGIN CONTENT -->
	<div class="page-content-wrapper">
		<!-- BEGIN CONTENT BODY -->
		<div class="page-content">
			<!-- BEGIN PAGE HEADER-->

			<!-- BEGIN PAGE BAR -->
			<div class="page-bar">
				<ul class="page-breadcrumb">
					<li><a href="#" class="disabled">Home</a> <i
						class="fa fa-circle"></i></li>
					<li><span>Acknowledgment Section</span></li>
				</ul>
			</div>
			<!-- END PAGE BAR -->
			<!-- BEGIN PAGE TITLE-->
			<h3 class="page-title">Acknowledgment Section</h3>
			<!-- END PAGE TITLE-->
			<!-- END PAGE HEADER-->



			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN VALIDATION STATES-->
					<div class="portlet light portlet-fit portlet-form bordered">

						<div class="portlet-body">

							<h3>Please note, necessary signatures are required after a
								PRINT (PRINT enabled only post HR review)</h3>

							<center>
								<c:if test="${!empty email }">
						
						${email }
						
						</c:if>
							</center>

							<!-- BEGIN FORM-->
							<form action="/AnnualAssessmenT/acknowledgmentPage.do"
								method="get" id="form_sample_3" class="form-horizontal">

								<c:if test="${!empty employeeList}">

									<c:forEach items="${employeeList}" var="empDetail">

										<div class="form-body">

											<p>Performance Reviews are conducted at the minimum
												annually for the purpose of reviewing and measuring Employee
												performance and do not necessarily warrant or guarantee a
												change in compensation regardless of outcome.</p>

											<p>Your employment with LISI-Aerospace is at the mutual
												consent of you and LISI-Aerospace. Either party can
												terminate the relationship at any time, with or without
												cause and with or without advance notice.</p>

											<div class="form-group">
												<label class="control-label col-md-2">Team
													Member&#39s Name:</label>
												<div class="col-md-4">
													<input name="occupation" type="text" class="form-control"
														value="<c:out value="${empDetail.emplastName}"/> <c:out value=", "/><c:out value="${empDetail.empfirstName}"/>" />
												</div>
												<label class="control-label col-md-2">Team
													Member&#39s Signature and Date</label>
												<div class="col-md-4">
													<input name="occupation" type="text" class="form-control" />
												</div>
											</div>

											<div class="form-group">
												<label class="control-label col-md-2">Supervisor&#39s
													Name:</label>
												<div class="col-md-4">
													<input name="occupation" type="text" class="form-control"
														value="<c:out value="${empDetail.supervisorLasttName}"/> <c:out value=", "/><c:out value="${empDetail.supervisorFirstName}"/>" />
												</div>
												<label class="control-label col-md-2">Supervisor&#39s
													Signature and Date</label>
												<div class="col-md-4">
													<input name="occupation" type="text" class="form-control" />
												</div>
											</div>
										</div>

									</c:forEach>
								</c:if>

								<div class="form-actions">
									<div class="row">

										<div class="col-md-12">
											<!--  <button type="submit" class="btn btn-primary m-l-5">Print</button> -->
											<%
												String statusMssg = (String) session.getAttribute("supervisorstatus");

												if (String.valueOf(statusMssg).equalsIgnoreCase("MANAGER COMPLETED")
														|| String.valueOf(statusMssg).equalsIgnoreCase("HR APPROVED")
														|| String.valueOf(statusMssg).equalsIgnoreCase("CLOSED")) {
											%>



											<%
												} else {
											%>

											<button type="submit" name="submit"
												class="btn btn-primary m-l-5"
												onclick="return formSubmission(this);">Submit</button>

											<%
												}
											%>
											<%
												String statusMssgone = (String) session.getAttribute("supervisorstatus");

												if (String.valueOf(statusMssgone).equalsIgnoreCase("HR APPROVED")) {
											%>

											<button type="button"
												onclick="window.open('/AnnualAssessmenT/exemptReport.do', '_blank');"
												name="printBtn" class="btn btn-primary m-l-5">Print</button>

											<%
												} else if (String.valueOf(statusMssgone).equalsIgnoreCase("CLOSED")) {
											%>
											<button type="button"
												onclick="window.open('/AnnualAssessmenT/exemptReport.do', '_blank');"
												name="printBtn" class="btn btn-primary m-l-5">Print</button>

											<%
												}
											%>
										</div>
										<lable type="button"
											style="position: relative;left: 73em; bottom: 18px">7
										of 7</lable>
									</div>
								</div>
							</form>

						
							
							<c:if
						test="${(fn:contains(loginUser.roles, 'HRGeneralist') || fn:contains(loginUser.roles, 'HrManager') ||
						fn:contains(loginUser.roles, 'HRAdmin')) && fn:contains(loginUser.exemptEmployeeFormStatus, 'MANAGER COMPLETED')}">
						
						

							&nbsp;&nbsp;&nbsp;<a
								href="/AnnualAssessmenT/managerStatusExempt.do?managerStatus=managerApproved"><button
									onclick="return approveReject(this);" name="approve"
									class="btn green">Approved</button></a>&nbsp;&nbsp;&nbsp; <a
								href="/AnnualAssessmenT/managerStatusExempt.do?managerStatus=managerRejected"><button
									onclick="return approveReject(this);" name="reject"
									class="btn green">Rejected</button></a>
							
							
							</c:if>
							
							<!-- END FORM-->
						</div>
						<!-- END VALIDATION STATES-->
					</div>
				</div>
			</div>
		</div>
		<!-- END CONTENT BODY -->
	</div>
	<!-- END CONTENT -->

	</div>
	<!-- END CONTAINER -->





</body>
