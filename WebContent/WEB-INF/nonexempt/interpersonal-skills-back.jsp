<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.lisi.annaulAssessment.util.Converters"%>
<head>
<%-- <spring:url value="/js/index.js" var="index" />

    <script src="${index}"></script>
     <script src="<c:url value="js/index.js" />"></script>
	<script type="text/javascript"> --%>
<!-- <script>
	function sum1() {
		alert("Hi welcome to index");
	    var result=0;
	var responsibilityScore=document.getElementById('score').value;
	var adaptabilityScore=document.getElementById('score').value;
	var judgementScore=document.getElementById('score').value;
	var writtenAndOralCommunicationScore=document.getElementById('score').value;
	var punctualityAndCommitmentScore=document.getElementById('score').value;

	 var result = (parseInt(responsibilityScore) + parseInt(adaptabilityScore)+parseInt(judgementScore)+parseInt(writtenAndOralCommunicationScore)+parseInt( punctualityAndCommitmentScore))/5;
	 if (!isNaN(result)) 
	    { 
	        document.getElementById('score').value = result;
	    } 
	}
	</script> -->
</head>

<body class="fixed-left">




	<%!int year;%>
	<%
		year = Integer.parseInt((Converters.getCurrentYear()));
		pageContext.setAttribute("year", year);
	%>
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
									<li class="active">Interpersonal Skills</li>
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
								<h4 class="header-title m-t-0 m-b-30">Interpersonal Skills</h4>
								<p>SCORE: Rate each performance factor. Unacceptable = 0 –
									0.75; Needs Improvement = 1 – 1.75 Meets Expectations = 2 –
									2.75; Exceeds Expectations 3+. COMMENTS: A “Needs Improvement”
									rating must have an Explanation with Action and Follow Up. An
									“Exceeds Expectations” rating must have a justification. All
									sections MUST have a comment.</p>
								<div class="row">

									<div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
										<form:form action="interpersonalForm.do" method="post"
											modelAttribute="interpersonal">

											<c:if test="${!empty interpersonalData}">

												<c:forEach items="${interpersonalData}" var="idetails">

													<fieldset class="form-group">
														<div class="row">
															<div class="col-xs-10">
																<p>
																	<strong>Responsibility:</strong><br> Makes sound
																	decisions with factual data and can present objective
																	arguments for those decisions. Minimal decision making
																	by subjectivity.
																</p>
															</div>
															<div class="col-xs-2">
																<label for="exampleInputPassword1">SCORE:</label> <input
																	type="text" class="form-control" id="rscore"
																	placeholder="score" name="responsibilityScore" required
																	onkeyup="sum1();"
																	value=" <c:out value="${idetails.responsibilityScore}" />">
															</div>
														</div>
													</fieldset>


													<fieldset class="form-group">
														<label for="exampleInputEmail1">Supervisor's
															Comments:</label>
														<textarea rows="2" cols="75" maxlength="150"
															class="form-control" id="exampleTextarea"
															name="responsibilitySupervisorsComments"><c:out
																value="${idetails.responsibilitySupervisorsComments}" /> </textarea>
													</fieldset>

													<fieldset class="form-group">
														<div class="row">
															<div class="col-xs-10">
																<p>
																	<strong>Adaptability: </strong><br> Team Member is
																	able to adjust to a variety of situations. Flexible to
																	company needs. Carries out assignments, jobs, tasks,
																	and projects consistently and completely. Overcomes
																	obstacles and accepts challenges with enthusiasm.
																</p>
															</div>
															<div class="col-xs-2">
																<label for="exampleInputPassword1">SCORE:</label> <input
																	type="text" class="form-control" id="ascore"
																	placeholder="score" name="adaptabilityScore" required
																	onkeyup="sum1();"
																	value=" <c:out value="${idetails.adaptabilityScore}" />">
															</div>
														</div>
													</fieldset>

													<fieldset class="form-group">
														<label for="exampleInputEmail1">Supervisor's
															Comments:</label>
														<textarea maxlength="150" rows="2" cols="75"
															class="form-control" id="exampleTextarea"
															name="adaptabilitySupervisorsComments" required><c:out
																value="${idetails.adaptabilitySupervisorsComments}" /></textarea>
													</fieldset>
													<fieldset class="form-group">
														<div class="row">
															<div class="col-xs-10">
																<p>
																	<strong>Initiative:</strong> <br> Team Member
																	consistently demonstrates self-motivation by
																	maintaining a solid work rhythm. Moves on to the next
																	assignment without reminders. Seeks additional projects
																	and/or offers to assist other team members.
																</p>
															</div>
															<div class="col-xs-2">
																<label for="exampleInputPassword1">SCORE:</label> <input
																	type="text" class="form-control" id="iscore"
																	placeholder="score" name="initiativeScore" required
																	onkeyup="sum1();"
																	value=" <c:out value="${idetails.initiativeScore}" />">
															</div>
														</div>
													</fieldset>
													<fieldset class="form-group">
														<label for="exampleInputEmail1">Supervisor's
															Comments:</label>
														<textarea class="form-control" id="exampleTextarea"
															maxlength="150" rows="2" cols="75"
															name="initiativeSupervisorsComments" required><c:out
																value="${idetails.initiativeSupervisorsComments}" /></textarea>
													</fieldset>
													<fieldset class="form-group">
														<div class="row">
															<div class="col-xs-10">
																<p>
																	<strong>Judgement:</strong> <br> Uses logical and
																	sound judgment organizes and prioritizes work even when
																	encountered with conflicting priorities, seeks guidance
																	if necessary.
																</p>
															</div>
															<div class="col-xs-2">
																<label for="exampleInputPassword1">SCORE:</label> <input
																	type="text" class="form-control" id="jscore"
																	placeholder="score" name="judgementScore" required
																	onkeyup="sum1();"
																	value=" <c:out value="${idetails.judgementScore}" />">
															</div>
														</div>
													</fieldset>
													<fieldset class="form-group">
														<label for="exampleInputEmail1">Supervisor's
															Comments:</label>
														<textarea class="form-control" id="exampleTextarea"
															maxlength="150" rows="2" cols="75"
															name="judgementSupervisorsComments" required><c:out
																value="${idetails.judgementSupervisorsComments}" /></textarea>
													</fieldset>
													<fieldset class="form-group">
														<div class="row">
															<div class="col-xs-10">
																<p>
																	<strong>Written and Oral Communication:</strong> <br>
																	Communicates in a logical and clear manner with others.
																	Effectively listens, suggests and interacts with other
																	team members and supervisors on all job related items.
																	Welcomes and seeks constructive feedback on own
																	performance for improvement. Elevates and Informs
																	supervisors on job related matters, seeking advice and
																	assistance to obtain a positive department/ Company
																	image.
																</p>
															</div>
															<div class="col-xs-2">
																<label for="exampleInputPassword1">SCORE:</label> <input
																	type="text" class="form-control" id="wscore"
																	placeholder="score"
																	name="writtenAndOralCommunicationScore" required
																	onkeyup="sum1();"
																	value=" <c:out value="${idetails.writtenAndOralCommunicationScore}" />">
															</div>
														</div>
													</fieldset>
													<fieldset class="form-group">
														<label for="exampleInputEmail1">Supervisor's
															Comments:</label>
														<textarea class="form-control" id="exampleTextarea"
															maxlength="150" rows="2" cols="75"
															name="writtenAndOralCommunicationSupervisorsComments"
															required><c:out
																value="${idetails.writtenAndOralCommunicationSupervisorsComments}" /></textarea>
													</fieldset>

													<!-- <fieldset class="form-group">
													<div class="row">
														<div class="col-xs-10">
															<p>
																<strong>Written and Oral Communication:</strong> <br>
																Communicates in a logical and clear manner with others.
																Effectively listens, suggests and interacts with other
																team members and supervisors on all job related items.
																Welcomes and seeks constructive feedback on own
																performance for improvement. Elevates and Informs
																supervisors on job related matters, seeking advice and
																assistance to obtain a positive department/ Company
																image.
															</p>
														</div>
														<div class="col-xs-2">
															<label for="exampleInputPassword1">SCORE:</label> <input
																type="text" class="form-control" id="score"
																placeholder="score">
														</div>
													</div>
												</fieldset>
												<fieldset class="form-group">
													<label for="exampleInputEmail1">Supervisor’s
														Comments:</label>
													<textarea class="form-control" id="exampleTextarea"
														rows="1"></textarea>
												</fieldset> -->

													<fieldset class="form-group">
														<div class="row">
															<div class="col-xs-10">
																<p>
																	<strong>Attendance, Punctuality and
																		Commitment:</strong> <br> Punctual and regular attendance.
																	Meets deadlines without close supervision. Reliable in
																	completing assigned tasks.
																</p>
															</div>
															<div class="col-xs-2">
																<label for="exampleInputPassword1">SCORE:</label> <input
																	type="text" class="form-control" id="pscore"
																	placeholder="score"
																	name="punctualityAndCommitmentScore" required
																	onkeyup="sum1();"
																	value=" <c:out value="${idetails.punctualityAndCommitmentScore}" />">
															</div>
														</div>
													</fieldset>
													<fieldset class="form-group">
														<label for="exampleInputEmail1">Supervisor's
															Comments:</label>
														<textarea class="form-control" id="exampleTextarea"
															maxlength="150" rows="2" cols="75"
															name="punctualityAndCommitmentSupervisorsComments"
															required><c:out
																value="${idetails.punctualityAndCommitmentSupervisorsComments}" /></textarea>
													</fieldset>
													<div class="form-group row">
														<div class="col-sm-9">
															<label>&nbsp;</label>
														</div>
														<div class="col-sm-3">
															<label>Average Score </label>
															<p id="tscore">${idetails.avgScore}</p>
															<input type="hidden" name="avgScore" id="totalscore">
														</div>
													</div>
												</c:forEach>
											</c:if>
											<c:if test="${empty interpersonalData}">
												<fieldset class="form-group">
													<div class="row">
														<div class="col-xs-10">
															<p>
																<strong>Responsibility:</strong><br> Makes sound
																decisions with factual data and can present objective
																arguments for those decisions. Minimal decision making
																by subjectivity.
															</p>
														</div>
														<div class="col-xs-2">
															<label for="exampleInputPassword1">SCORE:</label> <input
																type="text" class="form-control" id="rscore"
																placeholder="score" name="responsibilityScore" required
																onkeyup="sum1();">
														</div>
													</div>
												</fieldset>


												<fieldset class="form-group">
													<label for="exampleInputEmail1">Supervisor's
														Comments:</label>
													<textarea class="form-control" id="exampleTextarea"
														maxlength="150" rows="2" cols="75"
														name="responsibilitySupervisorsComments" required></textarea>
												</fieldset>

												<fieldset class="form-group">
													<div class="row">
														<div class="col-xs-10">
															<p>
																<strong>Adaptability: </strong><br> Team Member is
																able to adjust to a variety of situations. Flexible to
																company needs. Carries out assignments, jobs, tasks, and
																projects consistently and completely. Overcomes
																obstacles and accepts challenges with enthusiasm.
															</p>
														</div>
														<div class="col-xs-2">
															<label for="exampleInputPassword1">SCORE:</label> <input
																type="text" class="form-control" id="ascore"
																placeholder="score" name="adaptabilityScore" required
																onkeyup="sum1();">
														</div>
													</div>
												</fieldset>

												<fieldset class="form-group">
													<label for="exampleInputEmail1">Supervisor's
														Comments:</label>
													<textarea class="form-control" id="exampleTextarea"
														maxlength="150" rows="2" cols="75"
														name="adaptabilitySupervisorsComments" required></textarea>
												</fieldset>
												<fieldset class="form-group">
													<div class="row">
														<div class="col-xs-10">
															<p>
																<strong>Initiative:</strong> <br> Team Member
																consistently demonstrates self-motivation by maintaining
																a solid work rhythm. Moves on to the next assignment
																without reminders. Seeks additional projects and/or
																offers to assist other team members.
															</p>
														</div>
														<div class="col-xs-2">
															<label for="exampleInputPassword1">SCORE:</label> <input
																type="text" class="form-control" id="iscore"
																placeholder="score" name="initiativeScore" required
																onkeyup="sum1();">
														</div>
													</div>
												</fieldset>
												<fieldset class="form-group">
													<label for="exampleInputEmail1">Supervisor's
														Comments:</label>
													<textarea class="form-control" id="exampleTextarea"
														maxlength="150" rows="2" cols="75"
														name="initiativeSupervisorsComments" required></textarea>
												</fieldset>
												<fieldset class="form-group">
													<div class="row">
														<div class="col-xs-10">
															<p>
																<strong>Judgement:</strong> <br> Uses logical and
																sound judgment organizes and prioritizes work even when
																encountered with conflicting priorities, seeks guidance
																if necessary.
															</p>
														</div>
														<div class="col-xs-2">
															<label for="exampleInputPassword1">SCORE:</label> <input
																type="text" class="form-control" id="jscore"
																placeholder="score" name="judgementScore" required
																onkeyup="sum1();">
														</div>
													</div>
												</fieldset>
												<fieldset class="form-group">
													<label for="exampleInputEmail1">Supervisor's
														Comments:</label>
													<textarea class="form-control" id="exampleTextarea"
														maxlength="150" rows="2" cols="75"
														name="judgementSupervisorsComments" required></textarea>
												</fieldset>
												<fieldset class="form-group">
													<div class="row">
														<div class="col-xs-10">
															<p>
																<strong>Written and Oral Communication:</strong> <br>
																Communicates in a logical and clear manner with others.
																Effectively listens, suggests and interacts with other
																team members and supervisors on all job related items.
																Welcomes and seeks constructive feedback on own
																performance for improvement. Elevates and Informs
																supervisors on job related matters, seeking advice and
																assistance to obtain a positive department/ Company
																image.
															</p>
														</div>
														<div class="col-xs-2">
															<label for="exampleInputPassword1">SCORE:</label> <input
																type="text" class="form-control" id="wscore"
																placeholder="score"
																name="writtenAndOralCommunicationScore" required
																onkeyup="sum1();">
														</div>
													</div>
												</fieldset>
												<fieldset class="form-group">
													<label for="exampleInputEmail1">Supervisor's
														Comments:</label>
													<textarea class="form-control" id="exampleTextarea"
														maxlength="150" rows="2" cols="75"
														name="writtenAndOralCommunicationSupervisorsComments"
														required></textarea>
												</fieldset>

												<!-- <fieldset class="form-group">
													<div class="row">
														<div class="col-xs-10">
															<p>
																<strong>Written and Oral Communication:</strong> <br>
																Communicates in a logical and clear manner with others.
																Effectively listens, suggests and interacts with other
																team members and supervisors on all job related items.
																Welcomes and seeks constructive feedback on own
																performance for improvement. Elevates and Informs
																supervisors on job related matters, seeking advice and
																assistance to obtain a positive department/ Company
																image.
															</p>
														</div>
														<div class="col-xs-2">
															<label for="exampleInputPassword1">SCORE:</label> <input
																type="text" class="form-control" id="score"
																placeholder="score">
														</div>
													</div>
												</fieldset>
												<fieldset class="form-group">
													<label for="exampleInputEmail1">Supervisor’s
														Comments:</label>
													<textarea class="form-control" id="exampleTextarea"
														rows="1"></textarea>
												</fieldset> -->

												<fieldset class="form-group">
													<div class="row">
														<div class="col-xs-10">
															<p>
																<strong>Attendance, Punctuality and Commitment:</strong>
																<br> Punctual and regular attendance. Meets
																deadlines without close supervision. Reliable in
																completing assigned tasks.
															</p>
														</div>
														<div class="col-xs-2">
															<label for="exampleInputPassword1">SCORE:</label> <input
																type="text" class="form-control" id="pscore"
																placeholder="score" name="punctualityAndCommitmentScore"
																required required onkeyup="sum1();">
														</div>
													</div>
												</fieldset>
												<fieldset class="form-group">
													<label for="exampleInputEmail1">Supervisor's
														Comments:</label>
													<textarea class="form-control" id="exampleTextarea"
														maxlength="150" rows="2" cols="75"
														name="punctualityAndCommitmentSupervisorsComments"
														required></textarea>
												</fieldset>

												<div class="form-group row">
													<div class="col-sm-9">
														<label>&nbsp;</label>
													</div>
													<div class="col-sm-3">
														<label>Average Score </label>
														<p id="tscore"></p>

														<input type="hidden" name="avgScore" id="totalscore">
													</div>
												</div>
											</c:if>
											<div class="form-group row col-sm-12 col-xs-12">
												<input type="submit" class="btn btn-primary waves-length" value="2 of 5">
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