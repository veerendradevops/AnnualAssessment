<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="com.lisi.annualassessment.util.Converters"%>
<%@ page import="com.lisi.annualassessment.controller.LoginController"%>

<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">


	<!-- BEGIN CONTENT -->
	<div class="page-content-wrapper">
		<!-- BEGIN CONTENT BODY -->
		<div class="page-content">
			<!-- BEGIN PAGE HEADER-->

			<!-- BEGIN PAGE BAR -->
			<p></p>
			<p></p>
			<p></p>
			<div class="page-bar">
				<ul class="page-breadcrumb">
					<li><a href="#" class="disabled">Home</a> <i class="fa fa-circle"></i>
					</li>
					<li><span>Team Member Personal Information</span></li>
				</ul>
			</div>
			<!-- END PAGE BAR -->
			<!-- BEGIN PAGE TITLE-->
			<h3 class="page-title">Team Member Personal Information</h3>
			<!-- END PAGE TITLE-->
			<!-- END PAGE HEADER-->



			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN VALIDATION STATES-->
					<div class="portlet light portlet-fit portlet-form bordered">

						<div class="portlet-body">
							<!-- BEGIN FORM-->
							<div class="alert alert-success">
								<strong></strong>
							</div>
							<form:form id="form_sample_3" name="CensusForm"
								action="interpersonal-skills.do" method="get"
								modelAttribute="interpersonal" class="form-horizontal">
								<c:if test="${!empty employee}">

									<c:forEach items="${employee}" var="empDetail">
										<div class="form-body">

											<div class="form-group">
												<label class="control-label col-md-2">Name</label>
												<div class="col-md-4">
													<input type="text" id="pass1" maxlength="200"
														class="form-control"
														value=" <c:out value="${empDetail.emplastName}"/> <c:out value=", "/><c:out value="${empDetail.empfirstName}"/>"
														readonly />
												</div>
												<label class="control-label col-md-2">Date of
													Review:</label>
												<div class="col-md-4">
													<!-- <div class="input-group date date-picker"
														data-date-format="mm/dd/yyyy">
														<input type="text" class="form-control"
															placeholder="mm/dd/yyyy" id="datepicker-autoclose"
															readonly> <span class="input-group-btn">
															<button class="btn default" type="button">
																<i class="fa fa-calendar"></i>
															</button>
														</span>
													</div> -->
												
													<input type="text" id="pass2" maxlength="200"
														class="form-control" readonly
														 value="<c:out value="${empDetail.printDate}" />"/>
											
													<!-- /input-group -->
												</div>


											</div>
											<div class="form-group">
												<label class="control-label col-md-2">Job title:</label>
												<div class="col-md-10">
													<input type="text" id="pass1" class="form-control"
														value=" <c:out value="${empDetail.jobTitle}" />" readonly />
												</div>
											</div>
											<div class="form-group">

												<label class="control-label col-md-2">Date of Hire:</label>
												<c:set var="date" value="${empDetail.DOH}" scope="request"></c:set>
												<%
													Date date = (Date) request.getAttribute("date");
																String formatedDate = Converters.getDateInString(date);
																
												%>
											
													<%-- <div class="input-group date date-picker"
														data-date-format="mm/dd/yyyy">
														<input type="text" class="form-control"
															placeholder="mm/dd/yyyy" id="datepicker-autoclose"
															value="<%=formatedDate%>" readonly> <span
															class="input-group-btn">
															<button class="btn default" type="button">
																<i class="fa fa-calendar"></i>
															</button>
														</span>
													</div> --%>
													<div class="col-md-4">
													<input type="text" id="pass2" maxlength="200"
														class="form-control" readonly
														value=" <c:out value="<%=formatedDate%>" />" />
											
													<!-- /input-group -->
												</div>
												<label class="control-label col-md-2">Department:</label>
												<div class="col-md-4">
													<input type="text" id="pass2" maxlength="200"
														class="form-control" readonly
														value=" <c:out value="${empDetail.costCenter}" />" />
												</div>

											</div>


											<div class="form-group">
												<label class="control-label col-md-2">Factory/
													Division:</label>
												<div class="col-md-4">
													<input type="text" id="pass2" maxlength="200"
														class="form-control" readonly
														value="${empDetail.factoryLocation }" />
												</div>

												<label class="control-label col-md-2">Clock Number:</label>
												<div class="col-md-4">

													<input type="text" class="form-control"
														value="<c:out value="${empDetail.empClockNumber}"/>"
														readonly>

												</div>
											</div>

											<div class="form-group">
												<label class="control-label col-md-2">Department
													Manager:</label>
												<div class="col-md-4">
													<input type="text" id="pass2" maxlength="200"
														class="form-control" readonly
														value=" <c:out value="${empDetail.supervisorLasttName}"/> <c:out value=", "/><c:out value="${empDetail.supervisorFirstName}"/>"
														
														/>
												</div>

												<label class="control-label col-md-2">MoR
													(Manager-once-Removed):</label>
												<div class="col-md-4">
													<input type="text" id="pass2" maxlength="200"
														class="form-control"
														value="<c:out value="${empDetail.mor}" />" readonly />
												</div>
											</div>


										</div>
									</c:forEach>
								</c:if>
								<div class="form-actions">
									<div class="row">
										<div class="col-md-12">
											<button type="submit" class="btn green">Next</button>										
										</div>										
									</div>
									<div class="row" align="right">1 of 5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
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
