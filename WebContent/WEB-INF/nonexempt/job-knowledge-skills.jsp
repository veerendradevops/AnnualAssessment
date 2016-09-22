

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.lisi.annaulAssessment.util.Converters"%>



<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white" onload="avg();">


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
					<li><span>Job Knowledge & Skills</span></li>
				</ul>
			</div>
			<!-- END PAGE BAR -->
			<!-- BEGIN PAGE TITLE-->
			<h3 class="page-title">Job Knowledge & Skills</h3>
			<!-- END PAGE TITLE-->
			<!-- END PAGE HEADER-->



			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN VALIDATION STATES-->
					<div class="portlet light portlet-fit portlet-form bordered">

						<div class="portlet-body">
							<!-- BEGIN FORM-->
							<form:form action="jobknowledgeForm.do" method="post"
								modelAttribute="jobknowledge" id="form_sample_3"
								class="form-horizontal">
								<c:if test="${!empty jobKnowledgeData}">

									<c:forEach items="${jobKnowledgeData}" var="jdetails">

										<div class="form-body">
											<p>SCORE: Rate each performance factor. Unacceptable = 0 &#45
												0.75; Needs Improvement = 1 &#45 1.75 Meets Expectations = 2
												&#45 2.75; Exceeds Expectations 3+. COMMENTS: A &#34Needs
												Improvement" rating must have an Explanation with Action and
												Follow Up. An "Exceeds Expectations" rating must have a
												justification. All sections MUST have a comment.</p>

											<div class="form-group">
												<label class="control-label col-md-10"><strong>Safety:</strong><br>Team
													Member abides with Company HSE and governmental safety
													procedures and environmental and hazardous materials
													regulations. Always wears Personal Protective Equipment
													(PPE) in the required areas. Team Member attends safety
													training regularly. Operates machinery and/or assigned
													equipment following all safety practices. Maintains an
													orderly work area with minimum supervision to promote a
													safe working environment.</label>
												<div class="col-md-2">
													Score:<br>
													<input type="text" class="form-control" id="sscore"
														placeholder="score" name="safetyScore"  required
														onkeyup="avg();" onkeypress='return event.charCode >= 48 && event.charCode <= 57'
														value=" <c:out value="${jdetails.safetyScore}" />">
												</div>
											</div>
											<div class="form-group">
												<div class="col-md-12">
													Supervisor&#39s Comments:<br>
													<textarea class="form-control" id="exampleTextarea"
														maxlength="150" rows="2" cols="75"
														name="safetySupervisorsComments" title="Maximum length allowed is 150 characters" required><c:out
															value="${jdetails.safetySupervisorsComments}" /></textarea>
												</div>
											</div>


											<div class="form-group">
												<label class="control-label col-md-10"><strong>Quality:</strong><br>Work
													completed with neat and detailed accuracy that meets
													Company, "right the first time" principals. Team Member has
													the required knowledge, competency, and attitude to
													consistently produce good quality work with low levels of
													errors.</label>
												<div class="col-md-2">
													Score:<br> <input type="text" class="form-control"
														id="qscore" placeholder="score" name="qualityScore"
														required onkeyup="avg();" onkeypress='return event.charCode >= 48 && event.charCode <= 57'
														value=" <c:out value="${jdetails.qualityScore}" />">
												</div>
											</div>
											<div class="form-group">
												<div class="col-md-12">
													Supervisor&#39s Comments:<br>
													<textarea class="form-control" id="exampleTextarea"
														maxlength="150" rows="2" cols="75"
														name="qualitySupervisiorsComments" title="Maximum length allowed is 150 characters" required><c:out
															value="${jdetails.qualitySupervisorsComments}" /></textarea>
												</div>
											</div>

											<div class="form-group">
												<label class="control-label col-md-10"><strong>Productivity:</strong><br>Effectively
													uses work time, plans and prioritizes work load to attain,
													"right the first time" results. Accomplishes goals and
													completes job assignments on schedule.</label>
												<div class="col-md-2">
													Score:<br> <input type="text" class="form-control"
														id="pscore" placeholder="score" name="productivityScore" onkeypress='return event.charCode >= 48 && event.charCode <= 57'
														required onkeyup="avg();"
														value="<c:out value="${jdetails.productivityScore}" />">
												</div>
											</div>
											<div class="form-group">
												<div class="col-md-12">
													Supervisor&#39s Comments:<br>
													<textarea class="form-control" id="exampleTextarea"
														maxlength="150" rows="2" cols="75"
														name="productivitySupervisorsComments" title="Maximum length allowed is 150 characters" required><c:out
															value="${jdetails.productivitySupervisorsComments}" /></textarea>
												</div>
											</div>

											<div class="form-group">
												<label class="control-label col-md-10"><strong>Job
														Knowledge & Skills:</strong><br>Team Member understands and
													performs the essential job requirements and duties of the
													position. Is proficient and familiar with the equipment
													needed to perform the job successfully.</label>
												<div class="col-md-2">
													Score:<br> <input type="text" class="form-control"
														id="jkscore" placeholder="score"
														name="jobKnowledgeAndSkillsScore" onkeypress='return event.charCode >= 48 && event.charCode <= 57' required
														onkeyup="avg();"
														value=" <c:out value="${jdetails.jobKnowledgeAndSkillsScore}" />">
												</div>
											</div>
											<div class="form-group">
												<div class="col-md-12">
													Supervisor&#39s Comments:<br>
													<textarea class="form-control" id="exampleTextarea"
														maxlength="150" rows="2" cols="75"
														name="jobKnowledgeAndSkillsSupervisorsComments" title="Maximum length allowed is 150 characters" required><c:out
															value="${jdetails.jobKnowledgeAndSkillsSupervisorsComments}" /></textarea>
												</div>
											</div>

											<div class="form-group">
												<div class="col-md-9"></div>
												<div class="col-md-3">
													Average Score:
													<p id="ascore">${jdetails.avgScore}</p>
													<input type="hidden" name="avgScore" id="avgscore">
												</div>
											</div>
											<h4>Summary of Performance Review</h4>

											<div class="form-group">
												<div class="col-md-12">
													Supervisor&#39s overall comments<br>
													<textarea class="form-control" id="exampleTextarea"
														maxlength="150" rows="2" cols="75"
														name="supervisorsOveralComments" title="Maximum length allowed is 150 characters" required><c:out
															value="${jdetails.supervisorsOverallComments}" /></textarea>
												</div>
											</div>

											<div class="form-group">
												<div class="col-md-9"></div>
												<div class="col-md-3">Average Score : 
												<p id="summaryScore"><%-- ${jdetails.summaryAvgScore} --%></p>
												
												</div>
												<input type="hidden" name="summaryAvgScore" id="summaryPerformanceScore">
											</div>

										</div>
										<!-- <div class="form-actions">
											<div class="row">
												<div class="col-md-12">
													<a href="training-development.html" class="btn green">3
														of 5</a>
												</div>
											</div>
										</div> -->
									</c:forEach>
									<input type="hidden" name="interpersonalScore"
										id="interpersonalScore" value="${avgScore }">
									<!-- <input type="hidden" name="summaryAvgScore" id="summaryScore"> -->

								</c:if>
								<c:if test="${empty jobKnowledgeData}">

									

										<div class="form-body">
											<p>SCORE: Rate each performance factor. Unacceptable = 0
												&#45 0.75; Needs Improvement = 1 &#45 1.75 Meets Expectations = 2
												&#45 2.75; Exceeds Expectations 3+. COMMENTS: A &#34Needs
												Improvement" rating must have an Explanation with Action and
												Follow Up. An "Exceeds Expectations" rating must have a
												justification. All sections MUST have a comment.</p>

											<div class="form-group">
												<label class="control-label col-md-10"><strong>Safety:</strong><br>Team
													Member abides with Company HSE and governmental safety
													procedures and environmental and hazardous materials
													regulations. Always wears Personal Protective Equipment
													(PPE) in the required areas. Team Member attends safety
													training regularly. Operates machinery and/or assigned
													equipment following all safety practices. Maintains an
													orderly work area with minimum supervision to promote a
													safe working environment.</label>
												<div class="col-md-2">
													Score:<br>
													<input type="text" class="form-control" id="sscore"
														placeholder="score" name="safetyScore"  onkeypress='return event.charCode >= 48 && event.charCode <= 57' required
														onkeyup="avg();">
												</div>
											</div>
											<div class="form-group">
												<div class="col-md-12">
													Supervisor&#39s Comments:<br>
													<textarea class="form-control" id="exampleTextarea"
														maxlength="150" rows="2" cols="75" title="Maximum length allowed is 150 characters"
														name="safetySupervisorsComments" required></textarea>
												</div>
											</div>


											<div class="form-group">
												<label class="control-label col-md-10"><strong>Quality:</strong><br>Work
													completed with neat and detailed accuracy that meets
													Company, "right the first time" principals. Team Member has
													the required knowledge, competency, and attitude to
													consistently produce good quality work with low levels of
													errors.</label>
												<div class="col-md-2">
													Score:<br> <input type="text" class="form-control"
														id="qscore" placeholder="score" name="qualityScore" onkeypress='return event.charCode >= 48 && event.charCode <= 57'
														required onkeyup="avg();">
												</div>
											</div>
											<div class="form-group">
												<div class="col-md-12">
													Supervisor&#39s Comments:<br>
													<textarea class="form-control" id="exampleTextarea"
														maxlength="150" rows="2" cols="75" title="Maximum length allowed is 150 characters"
														name="qualitySupervisiorsComments" required></textarea>
												</div>
											</div>

											<div class="form-group">
												<label class="control-label col-md-10"><strong>Productivity:</strong><br>Effectively
													uses work time, plans and prioritizes work load to attain,
													"right the first time" results. Accomplishes goals and
													completes job assignments on schedule.</label>
												<div class="col-md-2">
													Score:<br> <input type="text" class="form-control"
														id="pscore" placeholder="score" name="productivityScore" onkeypress='return event.charCode >= 48 && event.charCode <= 57'
														required onkeyup="avg();">
												</div>
											</div>
											<div class="form-group">
												<div class="col-md-12">
													Supervisor&#39s Comments:<br>
													<textarea class="form-control" id="exampleTextarea"
														maxlength="150" rows="2" cols="75" title="Maximum length allowed is 150 characters"
														name="productivitySupervisorsComments" required></textarea>
												</div>
											</div>

											<div class="form-group">
												<label class="control-label col-md-10"><strong>Job
														Knowledge & Skills:</strong><br>Team Member understands and
													performs the essential job requirements and duties of the
													position. Is proficient and familiar with the equipment
													needed to perform the job successfully.</label>
												<div class="col-md-2">
													Score:<br> <input type="text" class="form-control"
														id="jkscore" placeholder="score"
														name="jobKnowledgeAndSkillsScore" onkeypress='return event.charCode >= 48 && event.charCode <= 57' required
														onkeyup="avg();">
												</div>
											</div>
											<div class="form-group">
												<div class="col-md-12">
													Supervisor&#39s Comments:<br>
													<textarea class="form-control" id="exampleTextarea"
														maxlength="150" rows="2" cols="75" title="Maximum length allowed is 150 characters"
														name="jobKnowledgeAndSkillsSupervisorsComments" required></textarea>
												</div>
											</div>

											<div class="form-group">
												<div class="col-md-9"></div>
												<div class="col-md-3">
													Average Score
													<p id="ascore">${jdetails.avgScore}</p>
													<input type="hidden" name="avgScore" id="avgscore">
												</div>
											</div>
											<h4>Summary of Performance Review</h4>

											<div class="form-group">
												<div class="col-md-12">
													Supervisor&#39s overall comments<br>
													<textarea class="form-control" id="exampleTextarea"
														maxlength="150" rows="2" cols="75" title="Maximum length allowed is 150 characters"
														name="supervisorsOveralComments" required></textarea>
												</div>
											</div>

											<div class="form-group">
												<div class="col-md-9"></div>
												<div class="col-md-3">Average Score :
												 <p id="summaryScore">${jdetails.summaryAvgScore}</p>
												
												</div>
												<input type="hidden" name="summaryAvgScore" id="summaryPerformanceScore">
											</div>

										</div>

									
									<input type="hidden" name="interpersonalScore"
										id="interpersonalScore" value="${avgScore }">
									  <input type="hidden" name="summaryAvgScore" id="summaryScore"> 

								</c:if>
								<div class="form-actions">
									<div class="row">
										<div class="col-md-12">
											<button type="button" class="btn green">Back & Save</button>										
											&nbsp;&nbsp;&nbsp;<button type="submit" class="btn green">Next & Save</button>										
										</div>										
									</div>
									<div class="row" align="right">3 of 5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
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