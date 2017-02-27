
<html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.lisi.annualassessment.util.Converters"%>

<body class="fixed-left">

<%!String year;%>
	<%
		year = Converters.getCurrentYear();
		pageContext.setAttribute("year", year);
	%>

	<!-- Begin page -->
	<div id="wrapper">

		<!-- Top Bar Start -->
		<div class="topbar">

			<!-- LOGO -->
			<div class="topbar-left">
				<a href="index-2.html" class="logo"><img
					src="assets/images/482449.jpg"></a>
			</div>


			<nav class="navbar navbar-custom">


				<ul class="nav navbar-nav pull-right">



					<li class="nav-item dropdown notification-list"><a
						class="nav-link dropdown-toggle arrow-none waves-effect waves-light nav-user"
						data-toggle="dropdown" href="#" role="button"
						aria-haspopup="false" aria-expanded="false"> <img
							src="assets/images/users/avatar-1.jpg" alt="user"
							class="img-circle">
					</a>
						<div
							class="dropdown-menu dropdown-menu-right dropdown-arrow profile-dropdown "
							aria-labelledby="Preview">
							<!-- item-->
							<div class="dropdown-item noti-title">
								<h5 class="text-overflow">
									<small>Welcome ! John</small>
								</h5>
							</div>

							<!-- item-->
							<a href="javascript:void(0);" class="dropdown-item notify-item">
								<i class="zmdi zmdi-account-circle"></i> <span>Profile</span>
							</a>

							<!-- item-->
							<a href="javascript:void(0);" class="dropdown-item notify-item">
								<i class="zmdi zmdi-settings"></i> <span>Settings</span>
							</a>

							<!-- item-->
							<a href="javascript:void(0);" class="dropdown-item notify-item">
								<i class="zmdi zmdi-lock-open"></i> <span>Lock Screen</span>
							</a>

							<!-- item-->
							<a href="javascript:void(0);" class="dropdown-item notify-item">
								<i class="zmdi zmdi-power"></i> <span>Logout</span>
							</a>
						</div></li>
				</ul>
			</nav>
		</div>
		<!-- Top Bar End -->


		<!-- ========== Left Sidebar Start ========== -->
		<div class="left side-menu">
			<div class="sidebar-inner slimscrollleft">

				<!--- Sidemenu -->
				<div id="sidebar-menu">
					<p>&nbsp;</p>
					<ul>
						<li class="has_sub"><a href="team-members-information.do"
							class="waves-effect"><span>Team Member's Information</span></a></li>
						<li class="has_sub"><a href="interpersonal-skills.do"
							class="waves-effect"><span>Interpersonal Skills</span></a></li>
						<li class="has_sub"><a href="job-knowledge-skills.do"
							class="waves-effect"><span>Job Knowledge & Skills</span></a></li>
						<li class="has_sub"><a
							href="summary-of-performance-review.do"
							class="waves-effect active"><span>Summary of
									Performance Review</span></a></li>
						<li class="has_sub"><a href="training-development.do"
							class="waves-effect"><span>Training & Development</span></a></li>
						<li class="has_sub"><a href="acknowledgment-section.do"
							class="waves-effect"><span>Acknowledgment Section</span></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<!-- Sidebar -->
				<div class="clearfix"></div>
			</div>
		</div>
		<!-- Left Sidebar End -->



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
								<h4 class="page-title">${year} Payroll and ${year+1} Payroll</h4>
								<ol class="breadcrumb p-0">
									<li><a href="#">${year} Payroll and ${year+1} Payroll</a></li>
									<li class="active">Summary of Performance Review</li>
								</ol>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<!-- end row -->


					<div class="row">
						<div class="col-sm-12">
							<div class="card-box">
								<div style="color: red" align=center>
									<c:if test="${!empty message}"> 
                                                   ${message}
                                                </c:if>
								</div>
								<h4 class="header-title m-t-0 m-b-30">Summary of
									Performance Review</h4>
								<div class="row">

									<div class="col-lg-12 col-sm-12 col-xs-12 col-md-12 col-xl-6">
										<form:form action="summaryPerformace.do" method="post"
											modelAttribute="summarybean">

											<c:if test="${!empty summaryOfPerformanceReviewList}">

												<c:forEach var="summaryOfPerformanceReview"
													items="${summaryOfPerformanceReviewList}">


													<div class="form-group">
														<label for="exampleInputEmail1">Supervisor’s
															overall comments</label>
														<textarea class="form-control" id="exampleTextarea"
															name="supervisorsOveralComments" rows="3" cols="30 "><c:out
																value="${summaryOfPerformanceReview.supervisorsOverallComments}" /></textarea>
													</div>
												</c:forEach>
											</c:if>
											<c:if test="${empty summaryOfPerformanceReviewList}">
												<div class="form-group">
													<label for="exampleInputEmail1">Supervisor’s
														overall comments</label>
													<textarea class="form-control" id="exampleTextarea"
														name="supervisorsOveralComments" rows="3" cols="30 "></textarea>
												</div>
											</c:if>
											<button type="submit" class="btn btn-primary">Submit</button>
											<button type="reset"
												class="btn btn-secondary waves-effect m-l-5">
												Cancel</button>


										</form:form>
									</div>
									<!-- end col -->

								</div>
								<!-- end row -->
							</div>
						</div>
						<!-- end col -->
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
</html>