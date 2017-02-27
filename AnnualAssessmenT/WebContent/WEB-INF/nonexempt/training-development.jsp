<!DOCTYPE html>
<%@page import="java.util.Date"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.lisi.annualassessment.util.Converters"%>

<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">

	<script type="text/javascript">
		$(document).ready(
				function() {

					//alert('<c:out value="${status}"/>');

					<c:if test="${status=='COMPLETED' || status=='MANAGER COMPLETED'||status=='HR APPROVED' || status=='CLOSED'}">

					$("#testDiv").find("input,textarea,select,radio,button").attr(
							"disabled", "disabled");

					</c:if>

				}); 
	</script>

	<!-- BEGIN CONTENT -->
	<div class="page-content-wrapper" id="testDiv">
		<!-- BEGIN CONTENT BODY -->
		<div class="page-content">
			<!-- BEGIN PAGE HEADER-->

			<!-- BEGIN PAGE BAR -->
			<div class="page-bar">
				<ul class="page-breadcrumb">
					<li><a href="#" class="disabled">Home</a> <i
						class="fa fa-circle"></i></li>
					<li><span>Training & Development</span></li>
				</ul>
			</div>
			<!-- END PAGE BAR -->
			<!-- BEGIN PAGE TITLE-->
			<h3 class="page-title">Training & Development</h3>
			<!-- END PAGE TITLE-->
			<!-- END PAGE HEADER-->



			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN VALIDATION STATES-->
					<div class="portlet light portlet-fit portlet-form bordered">

						<div class="portlet-body">
							<!-- BEGIN FORM-->

							<form:form action="training-developmentForm.do" method="post"
								modelAttribute="trainingAndDevelopment" id="form_sample_3"
								class="form-horizontal">
								<c:if test="${!empty trainingAndDevelopement}">

									<c:forEach items="${trainingAndDevelopement}" var="jdetails">
										<div class="form-body">
											<p>Indicate training area or focus need</p>

											<div class="form-group">
												<label class="control-label col-md-2">1. Area/Focus:</label>
												<div class="col-md-10">
													<%-- <input type="text" class="form-control" id="score" maxlength="150" title="Maximum length allowed is 150 characters"
														placeholder="Area/Focus" name="firstAreaorFocus" 
														value="<c:out value="${jdetails.firstAreaorFocus }"/>"> --%>
													<textarea class="form-control" id="Comments"
														maxlength="150" rows="2" cols="75"
														title="Maximum length allowed is 150 characters"
														name="firstAreaorFocus"><c:out
															value="${jdetails.firstAreaorFocus }" /></textarea>


												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-2">Training Topic</label>
												<div class="col-md-4">
													<select class="form-control" name="firstTrainingTopic">
														<option value=""
															${jdetails.firstTrainingTopic==''?'selected':''}>Pick
															a value</option>
														<option value="HSE"
															${jdetails.firstTrainingTopic=='HSE'?'selected':''}>HSE</option>
														<option value="Quality"
															${jdetails.firstTrainingTopic=='Quality'?'selected':''}>Quality</option>
														<option value="Work Instruction"
															${jdetails.firstTrainingTopic=='Work Instruction'?'selected':''}>Work
															Instruction</option>
														<option value="On The Job (OJT)"
															${jdetails.firstTrainingTopic=='On The Job (OJT)'?'selected':''}>On
															The Job (OJT)</option>
														<option value="Management"
															${jdetails.firstTrainingTopic=='Management'?'selected':''}>Management</option>
														<option value="Personal Development"
															${jdetails.firstTrainingTopic=='Personal Development'?'selected':''}>Personal
															Development</option>
														<option value="Policy"
															${jdetails.firstTrainingTopic=='Policy'?'selected':''}>Policy</option>
														<option value="Regulatory"
															${jdetails.firstTrainingTopic=='Regulatory'?'selected':''}>Regulatory</option>
														<option value="Technical"
															${jdetails.firstTrainingTopic=='Technical'?'selected':''}>Technical</option>

														<%-- <option>${jdetails.firstTrainingTopic}</option>
														<option>HSE</option>
														<option>Quality</option>
														<option>Work Instruction</option>
														<option>On The Job (OJT)</option>
														<option>Management</option>
														<option>Personal Development</option>
														<option>Policy</option>
														<option>Regulatory</option>
														<option>Technical</option> --%>
													</select>
												</div>

												<label class="control-label col-md-2">Training
													Description</label>
												<div class="col-md-4">
													<textarea class="form-control" id="Comments"
														maxlength="150" rows="2" cols="75"
														title="Maximum length allowed is 150 characters"
														name="firstTrainingDescription"><c:out
															value="${jdetails.firstTrainingDescription}" /></textarea>

												</div>
											</div>
											<div class="form-group">
												<div class="col-md-6">&nbsp;</div>
												<label class="control-label col-md-2">Due Date:</label>
												<c:set var="date" value="${jdetails.firstDateDue }"
													scope="request" />
												<%
													String stringDate = "";
																String formatedDate = "";
																System.out.println("startinggg first date due");

																if (String.valueOf(request.getAttribute("date")).equals("null")) {
																	stringDate = (String) request.getAttribute("date");
																	System.out.println("ending first date due");
																	System.out.println(stringDate);
																	if (String.valueOf(stringDate).equalsIgnoreCase("null")) {
																		formatedDate = "";
																		System.out.println("if");
																		System.out.println("if" + formatedDate);
																	}
																} else {
																	Date date = (Date) request.getAttribute("date");
																	formatedDate = Converters.getDateInString(date);
																	System.out.println("else");
																	System.out.println("else " + formatedDate);
																}
												%>
												<div class="col-md-4">
													<div class="input-group date date-picker"
														data-date-format="mm/dd/yyyy">
														<input type="text" class="form-control"
															placeholder="mm/dd/yyyy" id="datepicker-autoclose"
															name="firstDateDue" value="<%=formatedDate%>">
														<%-- <input type="text" class="form-control"
																			placeholder="mm/dd/yyyy" id="datepicker-autoclose"
																			name="firstDateDue"
																			value="<%=formatedDate %>"> --%>
														<span class="input-group-btn">
															<button class="btn default" type="button">
																<i class="fa fa-calendar"></i>
															</button>
														</span>
													</div>
													<!-- /input-group -->
												</div>


											</div>

											<div class="form-group">
												<label class="control-label col-md-2">2. Area/Focus:</label>
												<div class="col-md-10">
													<%-- 	<input type="text" class="form-control"
																	id="score" placeholder="Area/Focus" title="Maximum length allowed is 150 characters"
																	name="secondAreaorFocus"
																	value="<c:out value="${jdetails.secondAreaorFocus }"/>"> --%>
													<textarea class="form-control" id="Comments"
														maxlength="150" rows="2" cols="75"
														title="Maximum length allowed is 150 characters"
														name="secondAreaorFocus"><c:out
															value="${jdetails.secondAreaorFocus }" /></textarea>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-2">Training Topic</label>
												<div class="col-md-4">
													<select class="form-control" name="secondTrainingTopic">
														<option value=""
															${jdetails.secondTrainingTopic==''?'selected':''}>Pick
															a value</option>
														<option value="HSE"
															${jdetails.secondTrainingTopic=='HSE'?'selected':''}>HSE</option>
														<option value="Quality"
															${jdetails.secondTrainingTopic=='Quality'?'selected':''}>Quality</option>
														<option value="Work Instruction"
															${jdetails.secondTrainingTopic=='Work Instruction'?'selected':''}>Work
															Instruction</option>
														<option value="On The Job (OJT)"
															${jdetails.secondTrainingTopic=='On The Job (OJT)'?'selected':''}>On
															The Job (OJT)</option>
														<option value="Management"
															${jdetails.secondTrainingTopic=='Management'?'selected':''}>Management</option>
														<option value="Personal Development"
															${jdetails.secondTrainingTopic=='Personal Development'?'selected':''}>Personal
															Development</option>
														<option value="Policy"
															${jdetails.secondTrainingTopic=='Policy'?'selected':''}>Policy</option>
														<option value="Regulatory"
															${jdetails.secondTrainingTopic=='Regulatory'?'selected':''}>Regulatory</option>
														<option value="Technical"
															${jdetails.secondTrainingTopic=='Technical'?'selected':''}>Technical</option>


													</select>
												</div>

												<label class="control-label col-md-2">Training
													Description</label>
												<div class="col-md-4">
													<textarea class="form-control" id="Comments"
														maxlength="150" rows="2" cols="75"
														title="Maximum length allowed is 150 characters"
														name="secondTrainingDescription"><c:out
															value="${jdetails.secondTrainingDescription}" /></textarea>
												</div>
											</div>
											<div class="form-group">
												<div class="col-md-6">&nbsp;</div>
												<label class="control-label col-md-2">Due Date:</label>
												<div class="col-md-4">
													<c:set var="date" value="${jdetails.secondfDateDue }"
														scope="request" />
													<%
														String secondformatedDate = "";
																	if (String.valueOf(request.getAttribute("date")).equals("null")) {
																		stringDate = (String) request.getAttribute("date");
																		System.out.println("ending second date due");
																		System.out.println(stringDate);
																		if (String.valueOf(stringDate).equalsIgnoreCase("null")) {
																			secondformatedDate = "";
																			System.out.println("if");
																			System.out.println("if" + secondformatedDate);
																		}
																	} else {

																		Date SecondDate = (Date) request.getAttribute("date");
																		secondformatedDate = Converters.getDateInString(SecondDate);
																	}
													%>
													<div class="input-group date date-picker"
														data-date-format="mm/dd/yyyy">
														<input type="text" class="form-control"
															placeholder="mm/dd/yyyy" id="datepicker-autoclose"
															name="secondfDateDue" value="<%=secondformatedDate%>">
														<span class="input-group-btn">
															<button class="btn default" type="button">
																<i class="fa fa-calendar"></i>
															</button>
														</span>
													</div>
													<!-- /input-group -->
												</div>


											</div>

											<div class="form-group">
												<label class="control-label col-md-2">3. Area/Focus:</label>
												<div class="col-md-10">
													<%-- <input type="text" class="form-control"
																	id="score" placeholder="Area/Focus" title="Maximum length allowed is 150 characters"
																	name="thirdAreaorFocus"
																	value="<c:out value="${jdetails.thirdAreaorFocus }"/>"> --%>
													<textarea class="form-control" id="Comments"
														maxlength="150" rows="2" cols="75"
														title="Maximum length allowed is 150 characters"
														name="thirdAreaorFocus"><c:out
															value="${jdetails.thirdAreaorFocus }" /></textarea>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-2">Training Topic</label>
												<div class="col-md-4">
													<select class="form-control" name="thirdTrainingTopic">

														<option value=""
															${jdetails.thirdTrainingTopic==''?'selected':''}>Pick
															a value</option>
														<option value="HSE"
															${jdetails.thirdTrainingTopic=='HSE'?'selected':''}>HSE</option>
														<option value="Quality"
															${jdetails.thirdTrainingTopic=='Quality'?'selected':''}>Quality</option>
														<option value="Work Instruction"
															${jdetails.thirdTrainingTopic=='Work Instruction'?'selected':''}>Work
															Instruction</option>
														<option value="On The Job (OJT)"
															${jdetails.thirdTrainingTopic=='On The Job (OJT)'?'selected':''}>On
															The Job (OJT)</option>
														<option value="Management"
															${jdetails.thirdTrainingTopic=='Management'?'selected':''}>Management</option>
														<option value="Personal Development"
															${jdetails.thirdTrainingTopic=='Personal Development'?'selected':''}>Personal
															Development</option>
														<option value="Policy"
															${jdetails.thirdTrainingTopic=='Policy'?'selected':''}>Policy</option>
														<option value="Regulatory"
															${jdetails.thirdTrainingTopic=='Regulatory'?'selected':''}>Regulatory</option>
														<option value="Technical"
															${jdetails.thirdTrainingTopic=='Technical'?'selected':''}>Technical</option>



														<%-- <option>${jdetails.thirdTrainingTopic}</option>
														<option>HSE</option>
														<option>Quality</option>
														<option>Work Instruction</option>
														<option>On The Job (OJT)</option>
														<option>Management</option>
														<option>Personal Development</option>
														<option>Policy</option>
														<option>Regulatory</option>
														<option>Technical</option> --%>
													</select>
												</div>

												<label class="control-label col-md-2">Training
													Description</label>
												<div class="col-md-4">
													<textarea class="form-control" id="Comments"
														title="Maximum length allowed is 150 characters"
														maxlength="150" rows="2" cols="75"
														name="thirdTrainingDescription"><c:out
															value="${jdetails.thirdTrainingDescription }" /></textarea>
												</div>
											</div>
											<div class="form-group">
												<div class="col-md-6">&nbsp;</div>
												<label class="control-label col-md-2">Due Date:</label>
												<c:set var="date" value="${jdetails.thirdDateDue }"
													scope="request" />
												<%
													String thirdformatedDate = "";
																if (String.valueOf(request.getAttribute("date")).equals("null")) {
																	stringDate = (String) request.getAttribute("date");
																	System.out.println("ending second date due");
																	System.out.println(stringDate);
																	if (String.valueOf(stringDate).equalsIgnoreCase("null")) {
																		thirdformatedDate = "";
																		System.out.println("if");
																		System.out.println("if" + thirdformatedDate);
																	}
																} else {

																	Date thirdDate = (Date) request.getAttribute("date");
																	thirdformatedDate = Converters.getDateInString(thirdDate);
																}
												%>

												<div class="col-md-4">
													<div class="input-group date date-picker"
														data-date-format="mm/dd/yyyy">
														<input type="text" class="form-control"
															placeholder="mm/dd/yyyy" id="datepicker-autoclose"
															name="thirdDateDue" value="<%=thirdformatedDate%>">
														<span class="input-group-btn">
															<button class="btn default" type="button">
																<i class="fa fa-calendar"></i>
															</button>
														</span>
													</div>
													<!-- /input-group -->
												</div>


											</div>



										</div>
										<!-- <div class="form-actions">
											<div class="row">
												<div class="col-md-12">
											<button type="button" class="btn green">Back & Save</button>										
											&nbsp;&nbsp;&nbsp;<button type="submit" class="btn green">Next & Save</button>										
										</div>										
									</div>
									<div class="row" align="right">4 of 5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
										</div> -->
									</c:forEach>
								</c:if>

								<c:if test="${empty trainingAndDevelopement}">


									<div class="form-body">
										<p>Indicate training area or focus need</p>

										<div class="form-group">
											<label class="control-label col-md-2">1. Area/Focus:</label>
											<div class="col-md-10">
												<!-- <input type="text" class="form-control" id="score" maxlength="150" title="Maximum length allowed is 150 characters"
														placeholder="Area/Focus" name="firstAreaorFocus"
														> -->
												<textarea rows="2" cols="45" class="form-control" id="score"
													title="Maximum length allowed is 150 characters"
													placeholder="Area/Focus" name="firstAreaorFocus"
													maxlength="150"></textarea>

											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-2">Training Topic</label>
											<div class="col-md-4">
												<select class="form-control" name="firstTrainingTopic">
													<!-- CHANGES MADE TO ADD OPTION TO SELECT VALUE INSTEAD OF FIRST ONE -->
													<option selected="selected" value="">Pick a value</option>
													<option>HSE</option>
													<option>Quality</option>
													<option>Work Instruction</option>
													<option>On The Job (OJT)</option>
													<option>Management</option>
													<option>Personal Development</option>
													<option>Policy</option>
													<option>Regulatory</option>
													<option>Technical</option>
												</select>
											</div>

											<label class="control-label col-md-2">Training
												Description</label>
											<div class="col-md-4">
												<textarea class="form-control" id="Comments"
													title="Maximum length allowed is 150 characters"
													maxlength="150" rows="2" cols="75"
													name="firstTrainingDescription"></textarea>

											</div>
										</div>
										<div class="form-group">
											<div class="col-md-6">&nbsp;</div>
											<label class="control-label col-md-2">Due Date:</label>
											<div class="col-md-4">

												<div class="input-group date date-picker"
													data-date-format="mm/dd/yyyy">
													<input type="text" class="form-control"
														placeholder="mm/dd/yyyy" id="datepicker-autoclose"
														name="firstDateDue"> <span class="input-group-btn">
														<button class="btn default" type="button">
															<i class="fa fa-calendar"></i>
														</button>
													</span>
												</div>
												<!-- /input-group -->
											</div>


										</div>

										<div class="form-group">
											<label class="control-label col-md-2">2. Area/Focus:</label>
											<div class="col-md-10">
												<!-- 	<input type="text" class="form-control" 
																	id="score" placeholder="Area/Focus" title="Maximum length allowed is 150 characters"
																	name="secondAreaorFocus"
																	> -->
												<textarea rows="2" cols="45" class="form-control" id="score"
													title="Maximum length allowed is 150 characters"
													placeholder="Area/Focus" name="secondAreaorFocus"
													maxlength="150"></textarea>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-2">Training Topic</label>
											<div class="col-md-4">
												<select class="form-control" name="secondTrainingTopic">
													<option selected="selected" value="">Pick a value</option>
													<option>HSE</option>
													<option>Quality</option>
													<option>Work Instruction</option>
													<option>On The Job (OJT)</option>
													<option>Management</option>
													<option>Personal Development</option>
													<option>Policy</option>
													<option>Regulatory</option>
													<option>Technical</option>
												</select>
											</div>

											<label class="control-label col-md-2">Training
												Description</label>
											<div class="col-md-4">
												<textarea class="form-control" id="Comments" maxlength="150"
													rows="2" cols="75"
													title="Maximum length allowed is 150 characters"
													name="secondTrainingDescription"></textarea>
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-6">&nbsp;</div>
											<label class="control-label col-md-2">Due Date:</label>
											<div class="col-md-4">

												<div class="input-group date date-picker"
													data-date-format="mm/dd/yyyy">
													<input type="text" class="form-control"
														placeholder="mm/dd/yyyy" id="datepicker-autoclose"
														name="secondfDateDue"> <span
														class="input-group-btn">
														<button class="btn default" type="button">
															<i class="fa fa-calendar"></i>
														</button>
													</span>
												</div>
												<!-- /input-group -->
											</div>


										</div>

										<div class="form-group">
											<label class="control-label col-md-2">3. Area/Focus:</label>
											<div class="col-md-10">
												<!-- <input type="text" class="form-control"
																	id="score" placeholder="Area/Focus" title="Maximum length allowed is 150 characters"
																	name="thirdAreaorFocus"
																	> -->
												<textarea rows="2" cols="45" class="form-control" id="score"
													title="Maximum length allowed is 150 characters"
													placeholder="Area/Focus" name="thirdAreaorFocus"
													maxlength="150"></textarea>

											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-2">Training Topic</label>
											<div class="col-md-4">
												<select class="form-control" name="thirdTrainingTopic">
													<option selected="selected" value="">Pick a value</option>
													<option>HSE</option>
													<option>Quality</option>
													<option>Work Instruction</option>
													<option>On The Job (OJT)</option>
													<option>Management</option>
													<option>Personal Development</option>
													<option>Policy</option>
													<option>Regulatory</option>
													<option>Technical</option>
												</select>
											</div>

											<label class="control-label col-md-2">Training
												Description</label>
											<div class="col-md-4">
												<textarea class="form-control" id="Comments" maxlength="150"
													rows="2" cols="75"
													title="Maximum length allowed is 150 characters"
													name="thirdTrainingDescription"></textarea>
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-6">&nbsp;</div>
											<label class="control-label col-md-2">Due Date:</label>


											<div class="col-md-4">
												<div class="input-group date date-picker"
													data-date-format="mm/dd/yyyy">
													<input type="text" class="form-control"
														placeholder="mm/dd/yyyy" id="datepicker-autoclose"
														name="thirdDateDue"> <span class="input-group-btn">
														<button class="btn default" type="button">
															<i class="fa fa-calendar"></i>
														</button>
													</span>
												</div>
												<!-- /input-group -->
											</div>


										</div>



									</div>
									<!-- 	<div class="form-actions">
											<div class="row">
												<div class="col-md-12">
											<button type="button" class="btn green">Back & Save</button>										
											&nbsp;&nbsp;&nbsp;<button type="submit" class="btn green">Next & Save</button>										
										</div>										
									</div>
									<div class="row" align="right">4 of 5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
										</div> -->

								</c:if>
								<div class="form-actions">
									<div class="row">
										<div class="col-md-12">

											<c:set var="disableStatus" value="${status}" scope="request" />
											<%!String disableStatus;%>
											<%
												disableStatus = (String) request.getAttribute("disableStatus");
													disableStatus = disableStatus.toUpperCase();
											%>

											<%
												if (disableStatus.equals("COMPLETED")||disableStatus.equals("MANAGER COMPLETED") ||
														disableStatus.equalsIgnoreCase("HR APPROVED")||disableStatus.equals("CLOSED")) {
											%>
											<a href="<c:url value="job-knowledge-skills.do"></c:url>" class="btn green">Back</a>&nbsp;&nbsp;&nbsp;
											
											<a href="<c:url value="acknowledgment-section.do"></c:url>" class="btn green">Next</a>
											<%
												} else {
											%>

											<button type="submit" class="btn green" name="btnBackSave">Back
												& Save</button>
											&nbsp;&nbsp;&nbsp;	
												<button type="submit" class="btn green" name="btnSave">Save</button>
											&nbsp;&nbsp;&nbsp;
											<button type="submit" class="btn green" name="nextSave">Next
												& Save</button>
											<!-- 	&nbsp;&nbsp;&nbsp;
											<button type="submit" class="btn green" name="btnSubmit">Submit</button>

											&nbsp;&nbsp;&nbsp;
											<button type="button"
												onclick="window.open('/AnnualAssessmenT/nonExemptReport.do', '_blank');"
												name="printBtn" class="btn green">Print</button> -->

											<%
												}
											%>

											<!-- &nbsp;&nbsp;&nbsp;
											<button type="button"
												onclick="window.open('/AnnualAssessmenT/nonExemptReport.do', '_blank');"
												name="printBtn" class="btn green">Print</button> -->
											<!-- 	&nbsp;&nbsp;&nbsp;<a
												href="/AnnualAssessmenT/managerStatus.do?managerStatus=managerApproved"><button
													class="btn green">Approved</button></a>&nbsp;&nbsp;&nbsp; <a
												href="/AnnualAssessmenT/managerStatus.do?managerStatus=managerRejected"><button
													class="btn green">Rejected</button></a>
 -->
										</div>
									</div>
									<div class="row" align="right">4 of
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