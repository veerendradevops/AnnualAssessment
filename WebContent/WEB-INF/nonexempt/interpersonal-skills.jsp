<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.lisi.annaulAssessment.util.Converters"%>

<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white" onload="sum1();">

	<%!String year;%>
	<%
		year = Converters.getCurrentYear();
	%>
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
					<li><span>Interpersonal Skills</span></li>
				</ul>
			</div>
			<!-- END PAGE BAR -->
			<!-- BEGIN PAGE TITLE-->
			<h3 class="page-title">Interpersonal Skills</h3>
			<!-- END PAGE TITLE-->
			<!-- END PAGE HEADER-->



			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN VALIDATION STATES-->
					<div class="portlet light portlet-fit portlet-form bordered">

						<div class="portlet-body">
							<!-- BEGIN FORM-->


							<form:form action="interpersonalForm.do" method="post"
								modelAttribute="interpersonal" id="form_sample_3"
								class="form-horizontal">

								<c:if test="${!empty interpersonalData}">

									<c:forEach items="${interpersonalData}" var="idetails">

										<div class="form-body">
											<p>SCORE: Rate each performance factor. Unacceptable = 0 &#45
												0.75; Needs Improvement = 1 &#45 1.75 Meets Expectations = 2 &#45
												2.75; Exceeds Expectations 3+. COMMENTS: A "Needs
												Improvement" rating must have an Explanation with Action and
												Follow Up. An "Exceeds Expectations" rating must have a
												justification. All sections MUST have a comment.</p>

											<div class="form-group">
												<label class="control-label col-md-10"><strong>Responsibility:</strong><br>Makes
													sound decisions with factual data and can present objective
													arguments for those decisions. Minimal decision making by
													subjectivity.</label>
												<div class="col-md-2">
													Score:<br> <input type="text" class="form-control"
														id="rscore" placeholder="score" name="responsibilityScore" onkeypress='return event.charCode >= 48 && event.charCode <= 57'
														required onkeyup="sum1();"
														value=" <c:out value="${idetails.responsibilityScore}" />">
												</div>
												<div class="form-group">
													<div class="col-md-12">
														Supervisor&#39s Comments:<br>
														<textarea rows="2" cols="75" maxlength="150"
															class="form-control" id="exampleTextarea" title="Maximum length allowed is 150 characters"
															name="responsibilitySupervisorsComments" required><c:out
																value="${idetails.responsibilitySupervisorsComments}" /> </textarea>
													</div>
												</div>


												<div class="form-group">
													<label class="control-label col-md-10"><strong>Adaptability:</strong><br>Team
														Member is able to adjust to a variety of situations.
														Flexible to company needs. Carries out assignments, jobs,
														tasks, and projects consistently and completely. Overcomes
														obstacles and accepts challenges with enthusiasm.</label>
													<div class="col-md-2">
														Score:<br> <input type="text" class="form-control"
															id="ascore" placeholder="score" name="adaptabilityScore" onkeypress='return event.charCode >= 48 && event.charCode <= 57'
															required onkeyup="sum1();"
															value=" <c:out value="${idetails.adaptabilityScore}" />">
													</div>
												</div>
												<div class="form-group">
													<div class="col-md-12">
														Supervisor&#39s Comments:<br>
														<textarea maxlength="150" rows="2" cols="75"
															class="form-control" id="exampleTextarea" title="Maximum length allowed is 150 characters"
															name="adaptabilitySupervisorsComments" required><c:out
																value="${idetails.adaptabilitySupervisorsComments}" /></textarea>
													</div>
												</div>

												<div class="form-group">
													<label class="control-label col-md-10"><strong>Initiative:</strong><br>Team
														Member consistently demonstrates self-motivation by
														maintaining a solid work rhythm. Moves on to the next
														assignment without reminders. Seeks additional projects
														and/or offers to assist other team members.</label>
													<div class="col-md-2">
														Score:<br> <input type="text" class="form-control"
															id="iscore" placeholder="score" name="initiativeScore"  onkeypress='return event.charCode >= 48 && event.charCode <= 57'
															required onkeyup="sum1();"
															value=" <c:out value="${idetails.initiativeScore}" />">
													</div>
												</div>
												<div class="form-group">
													<div class="col-md-12">
														Supervisor&#39s Comments:<br>
														<textarea class="form-control" id="exampleTextarea"
															maxlength="150" rows="2" cols="75" title="Maximum length allowed is 150 characters"
															name="initiativeSupervisorsComments" required><c:out
																value="${idetails.initiativeSupervisorsComments}" /></textarea>
													</div>
												</div>

												<div class="form-group">
													<label class="control-label col-md-10"><strong>Judgement:</strong><br>Uses
														logical and sound judgment organizes and prioritizes work
														even when encountered with conflicting priorities, seeks
														guidance if necessary.</label>
													<div class="col-md-2">
														Score:<br> <input type="text" class="form-control"
															id="jscore" placeholder="score" name="judgementScore" onkeypress='return event.charCode >= 48 && event.charCode <= 57'
															required onkeyup="sum1();"
															value=" <c:out value="${idetails.judgementScore}" />">
													</div>
												</div>
												<div class="form-group">
													<div class="col-md-12">
														Supervisor&#39s Comments:<br>
														<textarea class="form-control" id="exampleTextarea"
															maxlength="150" rows="2" cols="75" title="Maximum length allowed is 150 characters"
															name="judgementSupervisorsComments" required><c:out
																value="${idetails.judgementSupervisorsComments}" /></textarea>
													</div>
												</div>

												<div class="form-group">
													<label class="control-label col-md-10"><strong>Written
															and Oral Communication:</strong><br>Communicates in a logical
														and clear manner with others. Effectively listens,
														suggests and interacts with other team members and
														supervisors on all job related items. Welcomes and seeks
														constructive feedback on own performance for improvement.
														Elevates and Informs supervisors on job related matters,
														seeking advice and assistance to obtain a positive
														department/ Company image.</label>
													<div class="col-md-2">
														Score:<br> <input type="text" class="form-control"
															id="wscore" placeholder="score" 
															name="writtenAndOralCommunicationScore" requiredonkeypress='return event.charCode >= 48 && event.charCode <= 57'
															onkeyup="sum1();"
															value=" <c:out value="${idetails.writtenAndOralCommunicationScore}" />">
													</div>
												</div>
												<div class="form-group">
													<div class="col-md-12">
														Supervisor&#39s Comments:<br>
														<textarea class="form-control" id="exampleTextarea"
															maxlength="300" rows="4" cols="75"
															name="writtenAndOralCommunicationSupervisorsComments" title="Maximum length allowed is 300 characters"
															required><c:out
																value="${idetails.writtenAndOralCommunicationSupervisorsComments}" /></textarea>
													</div>
												</div>

												<div class="form-group">
													<label class="control-label col-md-10"><strong>Attendance,
															Punctuality and Commitment:</strong><br>Punctual and regular
														attendance. Meets deadlines without close supervision.
														Reliable in completing assigned tasks.</label>
													<div class="col-md-2">
														Score:<br> <input type="text" class="form-control"
															id="pscore" placeholder="score"
															name="punctualityAndCommitmentScore" required onkeypress='return event.charCode >= 48 && event.charCode <= 57'
															onkeyup="sum1();"
															value=" <c:out value="${idetails.punctualityAndCommitmentScore}" />">
													</div>
												</div>
												<div class="form-group">
													<div class="col-md-12">
														Supervisor&#39s Comments:<br>
														<textarea class="form-control" id="exampleTextarea"
															maxlength="300" rows="4" cols="75"
															name="punctualityAndCommitmentSupervisorsComments" title="Maximum length allowed is 300 characters"
															required><c:out
																value="${idetails.punctualityAndCommitmentSupervisorsComments}" /></textarea>
													</div>
												</div>

												<div class="form-group">
													<div class="col-md-9"></div>
													<div class="col-md-3">
														Average Score:
														<p id="tscore">${idetails.avgScore}</p>
													</div>

													<input type="hidden" name="avgScore" id="totalscore"
														value="${idetails.avgScore}">
												</div>

											</div>
										</div>
									</c:forEach>
								</c:if>


								<c:if test="${empty interpersonalData}">



									<div class="form-body">
										<p>SCORE: Rate each performance factor. Unacceptable = 0&#45
											0.75; Needs Improvement = 1 &#45 1.75 Meets Expectations =
											2 &#45 2.75; Exceeds Expectations 3+. COMMENTS: A "Needs
											Improvement" rating must have an Explanation with Action and
											Follow Up. An "Exceeds Expectations" rating must have a
											justification. All sections MUST have a comment.</p>

										<div class="form-group">
											<label class="control-label col-md-10"><strong>Responsibility:</strong><br>Makes
												sound decisions with factual data and can present objective
												arguments for those decisions. Minimal decision making by
												subjectivity.</label>
											<div class="col-md-2">
												Score:<br> <input type="text" class="form-control"
													id="rscore" placeholder="score" name="responsibilityScore" onkeypress='return event.charCode >= 48 && event.charCode <= 57'
													required onkeyup="sum1();">
											</div>
											<div class="form-group">
												<div class="col-md-12">
													Supervisor&#39s Comments:<br>
													<textarea  class="form-control" rows="2" cols="75" maxlength="150"
														 id="exampleTextarea" title="Maximum length allowed is 150 characters"
														name="responsibilitySupervisorsComments"  required></textarea>
												</div>
											</div>


											<div class="form-group">
												<label class="control-label col-md-10"><strong>Adaptability:</strong><br>Team
													Member is able to adjust to a variety of situations.
													Flexible to company needs. Carries out assignments, jobs,
													tasks, and projects consistently and completely. Overcomes
													obstacles and accepts challenges with enthusiasm.</label>
												<div class="col-md-2">
													Score:<br> <input type="text" class="form-control"
														id="ascore" placeholder="score" name="adaptabilityScore" onkeypress='return event.charCode >= 48 && event.charCode <= 57'
														required onkeyup="sum1();">
												</div>
											</div>
											<div class="form-group">
												<div class="col-md-12">
													Supervisor&#39s Comments:<br>
													<textarea maxlength="150" rows="2" cols="75"
														class="form-control" id="exampleTextarea" title="Maximum length allowed is 150 characters"
														name="adaptabilitySupervisorsComments" required></textarea>
												</div>
											</div>

											<div class="form-group">
												<label class="control-label col-md-10"><strong>Initiative:</strong><br>Team
													Member consistently demonstrates self-motivation by
													maintaining a solid work rhythm. Moves on to the next
													assignment without reminders. Seeks additional projects
													and/or offers to assist other team members.</label>
												<div class="col-md-2">
													Score:<br> <input type="text" class="form-control"
														id="iscore" placeholder="score" name="initiativeScore" onkeypress='return event.charCode >= 48 && event.charCode <= 57'
														required onkeyup="sum1();">
												</div>
											</div>
											<div class="form-group">
												<div class="col-md-12">
													Supervisor&#39s Comments:<br>
													<textarea class="form-control" id="exampleTextarea"
														maxlength="150" rows="2" cols="75" title="Maximum length allowed is 150 characters"
														name="initiativeSupervisorsComments" required></textarea>
												</div>
											</div>

											<div class="form-group">
												<label class="control-label col-md-10"><strong>Judgement:</strong><br>Uses
													logical and sound judgment organizes and prioritizes work
													even when encountered with conflicting priorities, seeks
													guidance if necessary.</label>
												<div class="col-md-2">
													Score:<br> <input type="text" class="form-control"
														id="jscore" placeholder="score" name="judgementScore" onkeypress='return event.charCode >= 48 && event.charCode <= 57'
														required onkeyup="sum1();">
												</div>
											</div>
											<div class="form-group">
												<div class="col-md-12">
													Supervisor&#39s Comments:<br>
													<textarea class="form-control" id="exampleTextarea"
														maxlength="150" rows="2" cols="75" title="Maximum length allowed is 150 characters"
														name="judgementSupervisorsComments" required></textarea>
												</div>
											</div>

											<div class="form-group">
												<label class="control-label col-md-10"><strong>Written
														and Oral Communication:</strong><br>Communicates in a logical
													and clear manner with others. Effectively listens, suggests
													and interacts with other team members and supervisors on
													all job related items. Welcomes and seeks constructive
													feedback on own performance for improvement. Elevates and
													Informs supervisors on job related matters, seeking advice
													and assistance to obtain a positive department/ Company
													image.</label>
												<div class="col-md-2">
													Score:<br> <input type="text" class="form-control"
														id="wscore" placeholder="score"
														name="writtenAndOralCommunicationScore" required onkeypress='return event.charCode >= 48 && event.charCode <= 57'
														onkeyup="sum1();">
												</div>
											</div>
											<div class="form-group">
												<div class="col-md-12">
													Supervisor&#39s Comments:<br>
													<textarea class="form-control" id="exampleTextarea"
														maxlength="300" rows="4" cols="75" title="Maximum length allowed is 300 characters"
														name="writtenAndOralCommunicationSupervisorsComments"
														required></textarea>
												</div>
											</div>

											<div class="form-group">
												<label class="control-label col-md-10"><strong>Attendance,
														Punctuality and Commitment:</strong><br>Punctual and regular
													attendance. Meets deadlines without close supervision.
													Reliable in completing assigned tasks.</label>
												<div class="col-md-2">
													Score:<br> <input type="text" class="form-control"
														id="pscore" placeholder="score" 
														name="punctualityAndCommitmentScore" required onkeypress='return event.charCode >= 48 && event.charCode <= 57'
														onkeyup="sum1();">
												</div>
											</div>
											<div class="form-group">
												<div class="col-md-12">
													Supervisor&#39s Comments:<br>
													<textarea class="form-control" id="exampleTextarea"
														maxlength="300" rows="4" cols="75" title="Maximum length allowed is 300 characters"
														name="punctualityAndCommitmentSupervisorsComments"
														required></textarea>
												</div>
											</div>

											<div class="form-group">
												<div class="col-md-9"></div>
												<div class="col-md-3">
													Average Score :
													<p id="tscore">${idetails.avgScore}</p>
												</div>

												<input type="hidden" name="avgScore" id="totalscore"
													value="${idetails.avgScore}">
											</div>

										</div>
									</div>

								</c:if>
								<div class="form-actions">
									<div class="row">
										<div class="col-md-12">
											<button type="submit" class="btn green" name="btnSubmitBackSave">Back & Save</button>
											&nbsp;&nbsp;&nbsp;
											<button type="submit" class="btn green" name="btnSubmitNextSave">Next & Save</button>
										</div>
									</div>
									<div class="row" align="right">2 of
										5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
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