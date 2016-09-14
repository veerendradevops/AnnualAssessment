
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body class="fixed-left">
	<!-- Begin page -->
	<div id="wrapper">

		<!-- ============================================================== -->
		<!-- Start right Content here -->
		<!-- ============================================================== -->
		<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<div class="container">
					<div class="row">
						<div class="col-xs-12">
							<div class="page-title-box">
								<h4 class="page-title">Team Member Personal Information</h4>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<!-- end row -->
					<div class="row">
						<div class="col-xs-12">
							<div class="card-box">
								<h4 class="header-title">Team Member Personal Information</h4>
								<form>
									<c:if test="${!empty employeeDetails}">

										<c:forEach items="${employeeDetails}" var="empDetail">

											<div class="form-group row">

												<div class="col-sm-6">
													<label>Name:</label> <input type="text" id="pass1"
														maxlength="200" class="form-control"
														value=" <c:out value="${empDetail.empfirstName}" />" />
												</div>
												<div class="col-sm-6">
													<label>Date of Review:</label>
													<div class="input-group">
														<input type="text" class="form-control"
															placeholder="mm/dd/yyyy" id="datepicker-autoclose">
														<span class="input-group-addon bg-custom b-0"><i
															class="icon-calender"></i></span>
													</div>
													<!-- input-group -->
												</div>
												<div class="col-sm-12">
													<label>Job Title:</label> <input type="text" id="pass1"
														maxlength="200" class="form-control"
														value=" <c:out value="${empDetail.jobTitle}" />" />
												</div>

												<div class="col-sm-6">
													<label>Date of Hire:</label>
													<div class="input-group">
														<input type="text" class="form-control"
															placeholder="mm/dd/yyyy" id="datepicker-autoclose"
															value="<c:out value="${empDetail.DOH}" />"> <span
															class="input-group-addon bg-custom b-0"><i
															class="icon-calender"></i></span>
													</div>
													<!-- input-group -->
												</div>
												<div class="col-sm-6">
													<label>Department:</label> <input type="text" id="pass2"
														maxlength="200" class="form-control" />
												</div>

												<div class="col-sm-6">
													<label>Factory/ Division:</label> <input type="text"
														id="pass2" maxlength="200" class="form-control" />

												</div>
												<div class="col-sm-6">
													<label>Date of last review:</label>
													<div class="input-group">
														<input type="text" class="form-control"
															placeholder="mm/dd/yyyy" id="datepicker-autoclose">
														<span class="input-group-addon bg-custom b-0"><i
															class="icon-calender"></i></span>
													</div>
													<!-- input-group -->
												</div>
												<div class="col-sm-6">
													<label>Department Manager:</label> <input type="text"
														id="pass2" maxlength="200" class="form-control" />

												</div>
												<div class="col-sm-6">
													<label>MoR (Manager-once-Removed):</label> <input
														type="text" id="pass2" maxlength="200"
														class="form-control"
														value="<c:out value="${empDetail.mor}" />" />
												</div>

											</div>

											<div class="form-group">
												<button type="submit"
													class="btn btn-primary waves-effect waves-light">Submit</button>
												<button type="reset"
													class="btn btn-secondary waves-effect m-l-5">Cancel</button>
											</div>
										</c:forEach>
									</c:if>
								</form>


							</div>
						</div>
						<!-- end col-->
					</div>
					<!-- end row -->
				</div>
				<!-- container -->
			</div>
			<!-- content -->

		</div>
		<!-- End content-page -->


		<!-- ============================================================== -->
		<!-- End Right content here -->
		<!-- ============================================================== -->




		<footer class="footer text-right"> 2016 © Lisi Aerospace. </footer>


	</div>
	<!-- END wrapper -->



</body>
