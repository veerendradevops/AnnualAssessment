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
									<c:if test="${!empty employee}">

										<c:forEach items="${employee}" var="empDetail">


											<div class="form-group row">

												<div class="col-sm-6">
													<label>Name:</label> <input type="text" id="pass1"
														maxlength="200" class="form-control" readonly
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
													<label>Clock Number:</label> <input type="text"
														class="form-control" readonly>

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

											<div class="form-group row col-sm-12 col-xs-12">
												<input type="submit" value="1 of 10">

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


	<script>
		var resizefunc = [];
	</script>

	<!-- jQuery  -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/tether.min.js"></script>
	<!-- Tether for Bootstrap -->
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/detect.js"></script>
	<script src="assets/js/fastclick.js"></script>
	<script src="assets/js/jquery.blockUI.js"></script>
	<script src="assets/js/waves.js"></script>
	<script src="assets/js/jquery.nicescroll.js"></script>
	<script src="assets/js/jquery.scrollTo.min.js"></script>
	<script src="assets/js/jquery.slimscroll.js"></script>
	<script src="assets/plugins/switchery/switchery.min.js"></script>

	<script src="assets/plugins/moment/moment.js"></script>
	<script src="assets/plugins/timepicker/bootstrap-timepicker.min.js"></script>
	<script
		src="assets/plugins/mjolnic-bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
	<script
		src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
	<script src="assets/plugins/clockpicker/bootstrap-clockpicker.js"></script>
	<script
		src="assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>

	<script src="assets/pages/jquery.form-pickers.init.js"></script>

	<!-- App js -->
	<script src="assets/js/jquery.core.js"></script>
	<script src="assets/js/jquery.app.js"></script>
</body>
