<%@page import="java.util.Date"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.lisi.annualassessment.util.Converters"%>

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

<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">


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
							<form:form action="acknowledgment-section-Action.do"
								id="form_sample_3" method="post" class="form-horizontal">


								<c:if test="${!empty employee}">

									<c:forEach items="${employee}" var="empDetail">

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
														value=" <c:out value="${empDetail.supervisorLasttName}"/> <c:out value=", "/><c:out value="${empDetail.supervisorFirstName}"/>" />
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

											<c:set var="disableStatus" value="${status}" scope="request" />
											<%!String disableStatus;%>
											<%
												System.out.println("disable status");
													disableStatus = (String) request.getAttribute("disableStatus");
													disableStatus = disableStatus.toUpperCase();
													System.out.println("disable status " + String.valueOf(disableStatus));
											%>

											<%
												if (disableStatus.equalsIgnoreCase("COMPLETED") || disableStatus.equalsIgnoreCase("MANAGER COMPLETED")
															|| disableStatus.equalsIgnoreCase("HR APPROVED") || disableStatus.equalsIgnoreCase("CLOSED")) {
											%>

											<%
												} else {
											%>

											<a href="<c:url value="training-development.do"></c:url>"
												class="btn green">Back</a> &nbsp;&nbsp;&nbsp;
											<button type="submit" class="btn green" name="submit">Submit</button>

											<%
												}
											%>

											<%
												if (disableStatus.equalsIgnoreCase("HR APPROVED")) {
											%>
											<%-- <a href="<c:url value="training-development.do"></c:url>" class="btn green">Back</a> --%>
											&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
											<button type="button"
												onclick="window.open('/AnnualAssessmenT/nonExemptReport.do', '_blank');"
												name="printBtn" class="btn green">Print</button>
											<%
												} else if (disableStatus.equalsIgnoreCase("CLOSED")) {
											%>
											&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
											<button type="button"
												onclick="window.open('/AnnualAssessmenT/nonExemptReport.do', '_blank');"
												name="printBtn" class="btn green">Print</button>
											<%
												}
											%>

										</div>
									</div>
									<div class="row" align="right">5 of
										5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
								</div>
							</form:form>
							<!-- END FORM-->
							<%
								StringBuffer employeeHirerachy = (StringBuffer) session.getAttribute("employeeRoles");

								String employeeRole = employeeHirerachy.toString();

								if (employeeRole.contains("HRGeneralist") || employeeRole.contains("HrManager")
										|| employeeRole.contains("HRAdmin")) {
							%>

							<c:if test="${status=='MANAGER COMPLETED' }">

								<%-- <c:if test="${loginClock!=nonExempt }"> --%>
							
							&nbsp;&nbsp;&nbsp;<a
									href="/AnnualAssessmenT/managerStatus.do?managerStatus=managerApproved"><button
										onclick="return approveReject(this);" name="approve"
										class="btn green">Approved</button></a>&nbsp;&nbsp;&nbsp; <a
									href="/AnnualAssessmenT/managerStatus.do?managerStatus=managerRejected"><button
										onclick="return approveReject(this);" name="reject"
										class="btn green">Rejected</button></a>

								<%-- 	</c:if> --%>

							</c:if>

							<%
								} else {
							%>

							<%
								}
							%>


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
