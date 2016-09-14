<!DOCTYPE html>
<html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.lisi.annaulAssessment.util.Converters"%>



<body class="fixed-left">
	<%!String year;%>
	<% year = Converters.getCurrentYear();
	pageContext.setAttribute("year", year); %>
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
								<h4 class="page-title">${year}Payroll</h4>
								<ol class="breadcrumb p-0">
									<li><a href="#">${year} Payroll</a></li>
									<li class="active">Job Knowledge & Skills</li>
								</ol>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<!-- end row -->


					<div class="row">
						<div class="col-sm-12">
							<div class="card-box">
								<div style="color: red" align="center">
									<c:if test="${!empty message}"> 
                                                   ${message}
                                                </c:if>
								</div>
								<h4 class="header-title m-t-0 m-b-30">Job Knowledge &
									Skills</h4>
								<p>
									<strong>SCORE: Rate</strong> each performance factor.
									Unacceptable = 0 – 0.75; Needs Improvement = 1 – 1.75 Meets
									Expectations = 2 – 2.75; Exceeds Expectations 3+. COMMENTS: A
									“Needs Improvement" rating must have an Explanation with Action
									and Follow Up. An "Exceeds Expectations" rating must have a
									justification. All sections MUST have a comment.
								</p>
								<div class="row">

									<div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
										<form:form action="jobknowledgeForm.do" method="post"
											modelAttribute="jobknowledge">
											<c:if test="${!empty jobKnowledgeData}">

												<c:forEach items="${jobKnowledgeData}" var="jdetails">

													<fieldset class="form-group">
														<div class="row">
															<div class="col-xs-10">
																<p>
																	<strong>Safety:</strong> <br> Team Member abides
																	with Company HSE and governmental safety procedures and
																	environmental and hazardous materials regulations.
																	Always wears Personal Protective Equipment (PPE) in the
																	required areas. Team Member attends safety training
																	regularly. Operates machinery and/or assigned equipment
																	following all safety practices. Maintains an orderly
																	work area with minimum supervision to promote a safe
																	working environment.
																</p>
															</div>
															<div class="col-xs-2">
																<label for="exampleInputPassword1">SCORE:</label> <input
																	type="text" class="form-control" id="sscore"
																	placeholder="score" name="safetyScore" required
																	onkeyup="avg();"  value=" <c:out value="${jdetails.safetyScore}" />">
															</div>
														</div>
													</fieldset>


													<fieldset class="form-group">
														<label for="exampleInputEmail1">Supervisor’s
															Comments:</label>
														<textarea class="form-control" id="exampleTextarea"
															rows="1" name="safetySupervisorsComments" required><c:out value="${jdetails.safetySupervisorsComments}" /></textarea>
													</fieldset>

													<fieldset class="form-group">
														<div class="row">
															<div class="col-xs-10">
																<p>
																	<strong>Quality:</strong> <br> Work completed with
																	neat and detailed accuracy that meets Company, "right
																	the first time" principals. Team Member has the
																	required knowledge, competency, and attitude to
																	consistently produce good quality work with low levels
																	of errors.
																</p>
															</div>
															<div class="col-xs-2">
																<label for="exampleInputPassword1">SCORE:</label> <input
																	type="text" class="form-control" id="qscore"
																	placeholder="score" name="qualityScore" required
																	onkeyup="avg();" value=" <c:out value="${jdetails.qualityScore}" />">
															</div>
														</div>
													</fieldset>

													<fieldset class="form-group">
														<label for="exampleInputEmail1">Supervisor’s
															Comments:</label>
														<textarea class="form-control" id="exampleTextarea"
															rows="3" cols="20" name="qualitySupervisiorsComments"
															required><c:out value="${jdetails.qualitySupervisorsComments}" /></textarea>
													</fieldset>
													<fieldset class="form-group">
														<div class="row">
															<div class="col-xs-10">
																<p>
																	<strong>Productivity:</strong> <br> Effectively
																	uses work time, plans and prioritizes work load to
																	attain, "right the first time" results. Accomplishes
																	goals and completes job assignments on schedule.
																</p>
															</div>
															<div class="col-xs-2">
																<label for="exampleInputPassword1">SCORE:</label> <input
																	type="text" class="form-control" id="pscore"
																	placeholder="score" name="productivityScore" required
																	onkeyup="avg();" value="<c:out value="${jdetails.productivityScore}" />">
															</div>
														</div>
													</fieldset>
													<fieldset class="form-group">
														<label for="exampleInputEmail1">Supervisor’s
															Comments:</label>
														<textarea class="form-control" id="exampleTextarea"
															rows="1" name="productivitySupervisorsComments" required><c:out value="${jdetails.productivitySupervisorsComments}" /></textarea>
													</fieldset>
													<fieldset class="form-group">
														<div class="row">
															<div class="col-xs-10">
																<p>
																	<strong>Job Knowledge & Skills:</strong> <br> Team
																	Member understands and performs the essential job
																	requirements and duties of the position. Is proficient
																	and familiar with the equipment needed to perform the
																	job successfully.
																</p>
															</div>
															<div class="col-xs-2">
																<label for="exampleInputPassword1">SCORE:</label> <input
																	type="text" class="form-control" id="jkscore"
																	placeholder="score" name="jobKnowledgeAndSkillsScore"
																	required onkeyup="avg();" value=" <c:out value="${jdetails.jobKnowledgeAndSkillsScore}" />">
															</div>
														</div>
													</fieldset>
													<fieldset class="form-group">
														<label for="exampleInputEmail1">Supervisor’s
															Comments:</label>
														<textarea class="form-control" id="exampleTextarea"
															rows="1" name="jobKnowledgeAndSkillsSupervisorsComments"><c:out value="${jdetails.jobKnowledgeAndSkillsSupervisorsComments}" /></textarea>
													</fieldset>
													<div class="form-group row">
														<div class="col-sm-9">
															<label>&nbsp;</label>
														</div>
														<div class="col-sm-3" >
															<label>Average Score  </label> <p id="ascore" >${jdetails.avgScore}</p>
															<input type="hidden" name="avgScore" id="avgscore">
														</div>
														</div>
													<h4 class="header-title m-t-0 m-b-30">Summary of
														Performance Review</h4>
													<div class="form-group">
														<label for="exampleInputEmail1">Supervisor’s
															overall comments</label>
														<textarea class="form-control" id="exampleTextarea" 
															rows="2" name="supervisorsOveralComments"><c:out value="${jdetails.supervisorsOverallComments}" /></textarea>
													</div>
													<div class="form-group row">
														<div class="col-sm-8">
															<label>&nbsp;</label>
														</div>
														<div class="col-sm-4">
															<label>Average Overall Score 0.00</label>
														</div>
													</div>
												</c:forEach>
											</c:if>
											<c:if test="${empty jobKnowledgeData}">


												<fieldset class="form-group">
													<div class="row">
														<div class="col-xs-10">
															<p>
																<strong>Safety:</strong> <br> Team Member abides
																with Company HSE and governmental safety procedures and
																environmental and hazardous materials regulations.
																Always wears Personal Protective Equipment (PPE) in the
																required areas. Team Member attends safety training
																regularly. Operates machinery and/or assigned equipment
																following all safety practices. Maintains an orderly
																work area with minimum supervision to promote a safe
																working environment.
															</p>
														</div>
														<div class="col-xs-2">
															<label for="exampleInputPassword1">SCORE:</label> <input
																type="text" class="form-control" id="sscore"
																placeholder="score" name="safetyScore" required
																onkeyup="avg();">
														</div>
													</div>
												</fieldset>


												<fieldset class="form-group">
													<label for="exampleInputEmail1">Supervisor’s
														Comments:</label>
													<textarea class="form-control" id="exampleTextarea"
														rows="1" name="safetySupervisorsComments" required></textarea>
												</fieldset>

												<fieldset class="form-group">
													<div class="row">
														<div class="col-xs-10">
															<p>
																<strong>Quality:</strong> <br> Work completed with
																neat and detailed accuracy that meets Company, "right
																the first time" principals. Team Member has the required
																knowledge, competency, and attitude to consistently
																produce good quality work with low levels of errors.
															</p>
														</div>
														<div class="col-xs-2">
															<label for="exampleInputPassword1">SCORE:</label> <input
																type="text" class="form-control" id="qscore"
																placeholder="score" name="qualityScore" required
																onkeyup="avg();">
														</div>
													</div>
												</fieldset>

												<fieldset class="form-group">
													<label for="exampleInputEmail1">Supervisor’s
														Comments:</label>
													<textarea class="form-control" id="exampleTextarea"
														rows="3" cols="20" name="qualitySupervisiorsComments"
														required></textarea>
												</fieldset>
												<fieldset class="form-group">
													<div class="row">
														<div class="col-xs-10">
															<p>
																<strong>Productivity:</strong> <br> Effectively
																uses work time, plans and prioritizes work load to
																attain, "right the first time" results. Accomplishes
																goals and completes job assignments on schedule.
															</p>
														</div>
														<div class="col-xs-2">
															<label for="exampleInputPassword1">SCORE:</label> <input
																type="text" class="form-control" id="pscore"
																placeholder="score" name="productivityScore" required
																onkeyup="avg();" >
														</div>
													</div>
												</fieldset>
												<fieldset class="form-group">
													<label for="exampleInputEmail1">Supervisor’s
														Comments:</label>
													<textarea class="form-control" id="exampleTextarea"
														rows="1" name="productivitySupervisorsComments" required></textarea>
												</fieldset>
												<fieldset class="form-group">
													<div class="row">
														<div class="col-xs-10">
															<p>
																<strong>Job Knowledge & Skills:</strong> <br> Team
																Member understands and performs the essential job
																requirements and duties of the position. Is proficient
																and familiar with the equipment needed to perform the
																job successfully.
															</p>
														</div>
														<div class="col-xs-2">
															<label for="exampleInputPassword1">SCORE:</label> <input
																type="text" class="form-control" id="jkscore"
																placeholder="score" name="jobKnowledgeAndSkillsScore"
																required onkeyup="avg();">
														</div>
													</div>
												</fieldset>
												<fieldset class="form-group">
													<label for="exampleInputEmail1">Supervisor’s
														Comments:</label>
													<textarea class="form-control" id="exampleTextarea"
														rows="1" name="jobKnowledgeAndSkillsSupervisorsComments"></textarea>
												</fieldset>
												
													<div class="form-group row">
														<div class="col-sm-9">
															<label>&nbsp;</label>
														</div>
														<div class="col-sm-3" >
															<label>Average Score  </label> <p id="ascore"></p>
															<input type="hidden" name="avgScore" id="avgscore">
														</div>
														</div>
												<h4 class="header-title m-t-0 m-b-30">Summary of
													Performance Review</h4>
												<div class="form-group">
													<label for="exampleInputEmail1">Supervisor’s
														overall comments</label>
													<textarea class="form-control" id="exampleTextarea"
														rows="2" name="supervisorsOveralComments"></textarea>
												</div>
												<div class="form-group row">
													<div class="col-sm-8">
														<label>&nbsp;</label>
													</div>
													<div class="col-sm-4">
														<label>Average Overall Score 0.00</label>
													</div>
												</div>
											</c:if>
											<div class="form-group row col-sm-12 col-xs-12">
												<input type="submit" value="3 of 5">
											</div>

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