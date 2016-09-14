<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
								<h4 class="page-title">2016 Payroll</h4>
								<ol class="breadcrumb p-0">
									<li><a href="#">2016 Payroll</a></li>
									<li class="active">Meeting Summary</li>
								</ol>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<!-- end row -->
					<div class="row">
						<div class="col-xs-12">
							<div class="card-box">
								<h4 class="header-title">Meeting Summary</h4>
								<form:form action="/AnnaulAssessmenT/meetingsummary.do"
									modelAttribute="meetingsummary" method="post">
									<c:if test="${! empty meetingsummary}">
										<c:forEach var="meetingsummary" items="${meetingsummary}">
											<div class="form-group row">
												<div class="col-sm-12">
													<div class="form-group">
														<label>Assessment Meeting Comments by Manager:</label>
														<textarea class="form-control" id="Comments"
															maxlength="300" rows="3" name="meetingSummaryManager">${meetingsummary.meetingSummaryManager }</textarea>
													</div>

													<div class="form-group">
														<label>Assessment Meeting Comments by Team Member:</label>
														<textarea class="form-control" id="Comments"
															maxlength="300" rows="3" name="meetingSummaryTeamMember">${meetingsummary.meetingSummaryTeamMember }</textarea>
													</div>
												</div>

											</div>

											<div class="form-group row col-sm-12 col-xs-12">
												<!-- <a href="exempt-acknowledgment-section.html" class="btn btn-secondary m-l-5">9 of 10</a> -->
												<input type="submit" value="9 of 10"
													class="btn btn-secondary m-l-5">
											</div>
											</c:forEach>
											</c:if>
											<c:if test="${ empty meetingsummary}">
											<div class="form-group row">
												<div class="col-sm-12">
													<div class="form-group">
														<label>Assessment Meeting Comments by Manager:</label>
														<textarea class="form-control" id="Comments"
															maxlength="300" rows="3" name="meetingSummaryManager"></textarea>
													</div>

													<div class="form-group">
														<label>Assessment Meeting Comments by Team Member:</label>
														<textarea class="form-control" id="Comments"
															maxlength="300" rows="3" name="meetingSummaryTeamMember"></textarea>
													</div>
												</div>



											</div>

											<div class="form-group row col-sm-12 col-xs-12">
												<!-- <a href="exempt-acknowledgment-section.html" class="btn btn-secondary m-l-5">9 of 10</a> -->
												<input type="submit" value="9 of 10"
													class="btn btn-secondary m-l-5">
											</div>
											</c:if>
											</form:form>
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
