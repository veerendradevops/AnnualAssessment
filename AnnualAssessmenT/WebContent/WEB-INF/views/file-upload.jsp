<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- <script>
	function upload() {

	//	var fileName = document.getElementById("filer_input1").val;

		alert("first");
		/* if (fileName == "") {

			alert("please pick a file.");
			return;
		} */

	}
</script> -->

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
					<li><a href="index.html">Home</a> <i class="fa fa-circle"></i>
					</li>
					<li><span>HR Admin</span></li>
				</ul>
			</div>
			<!-- END PAGE BAR -->
			<!-- BEGIN PAGE TITLE-->
			<h3 class="page-title">HR Admin</h3>
			<!-- END PAGE TITLE-->
			<!-- END PAGE HEADER-->
			<P>
				<c:if test="${!empty errorMsg}">
					<h3>
						<font color="red"><center>${errorMsg}</center></font>
					</h3>
				</c:if>

			</P>
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN VALIDATION STATES-->
					<div class="portlet light portlet-fit portlet-form bordered">

						<div class="portlet-body">
							<!-- BEGIN FORM-->
							<form:form id="form_sample_3" class="form-horizontal"
								action="/AnnualAssessmenT/sourceFileUpload.do"
								enctype="multipart/form-data" method="POST">
								<div class="form-body">

									<div class="form-body">

										<div class="form-group">
											<h4 style="margin-left: 10px;">Initial File Upload</h4>
											<p style="margin-left: 10px;">Note, this is a 2 step
												process. Step1: will require you to provide location of the
												excel file to upload in addition to location of error report
												that would result from the validation process. Step 2: If
												satisfied by upload, post review of the error report, one
												has to then click on the START APPRAISAL PROCESS button
												which will in fact send out the email to all applicable
												EXEMPT and Supervisors to initiate the process.</p>
											<label class="control-label col-md-2">Employee Excel
												file to upload </label>
											<div class="col-md-4">
												<input type="file" name="file" id="filer_input1"
													multiple="multiple">
											</div>
											<div class="col-md-8"></div>
											Year&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;<select
												name="uploadYear">
												<option value="2016">2016</option>
												<option value="2017">2017</option>

											</select>
											<!-- <label class="control-label col-md-2"></label>
										<div class="col-md-4">

											<input type="file" name="files[]" id="filer_input1"
												multiple="multiple">

										</div> -->
										</div>

										<div class="form-group">
											<label class="control-label col-md-2">Step 1</label>
											<div class="col-md-4">
												<button type="submit" name="upload"
													class="btn btn-primary waves-effect waves-light"
													onclick="upload();">UPLOAD</button>
											</div>

											<label class="control-label col-md-2">Step 2</label>
											<div class="col-md-4">

												<button type="submit" name="sendMail"
													class="btn btn-primary waves-effect waves-light">START
													APPRAISAL PROCESS</button>

											</div>
										</div>
										<hr>
										<div class="form-group">
											<h4 style="margin-left: 10px;">Trigger Salary Review
												Process</h4>
											<p style="margin-left: 10px;">Note a selection of
												location and SUBMIT will result in email being sent to each
												supervisor at the selected Location (s) for the first time
												now will supervisors be able to see the salary review sereen
												to complete that process.</p>
											<label class="control-label col-md-2">City of
												Industry</label>
											<c:choose>
												<c:when test="${CityOFIndustry=='Activated'}">
													<div class="col-md-1">

														<input type="checkbox" value="City of Industry" name="coi"
															checked disabled>
													</div>
												</c:when>
												<c:otherwise>
													<div class="col-md-1">

														<input type="checkbox" value="City of Industry" name="coi">
													</div>
												</c:otherwise>
											</c:choose>

											<label class="control-label col-md-1">Torrance </label>
											<c:choose>
												<c:when test="${Torranace=='Activated'}">
													<div class="col-md-1">

														<input type="checkbox" value="Torrance" name="torrance"
															checked disabled>
													</div>
												</c:when>
												<c:otherwise>
													<div class="col-md-1">

														<input type="checkbox" value="Torrance" name="torrance">
													</div>
												</c:otherwise>
											</c:choose>


											<!-- <div class="col-md-1">
												<input type="checkbox" value="Torrance" name="torrance">
											</div> -->
											<label class="control-label col-md-2">North America</label>
											<c:choose>
												<c:when test="${NorthAmerica=='Activated'}">
													<div class="col-md-1">
														<input type="checkbox" value="North America"
															name="america" checked disabled>
													</div>
												</c:when>
												<c:otherwise>
													<div class="col-md-1">
														<input type="checkbox" value="North America"
															name="america">
													</div>
												</c:otherwise>
											</c:choose>


											<div class="col-md-4">
												<button type="submit" name="selectedlocaion"
													class="btn btn-primary waves-effect waves-light">START
													SALARY REVIEW</button>
											</div>
										</div>

									</div>
								</div>
							</form:form>
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


	<!-- END CONTAINER -->

</body>

</html>