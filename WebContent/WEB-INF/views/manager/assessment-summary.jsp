
<%@page import="com.lisi.annaulAssessment.util.Converters"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
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
					<li><span>Summary</span></li>
				</ul>
			</div>
			<!-- END PAGE BAR -->
			<!-- BEGIN PAGE TITLE-->
			<h3 class="page-title">Summary</h3>
			<!-- END PAGE TITLE-->
			<!-- END PAGE HEADER-->



			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN VALIDATION STATES-->
					<div class="portlet light portlet-fit portlet-form bordered">

						<div class="portlet-body">
							<!-- BEGIN FORM-->
							<form:form action="/AnnaulAssessmenT/assessmentsummary.do"
								method="GET" modelAttribute="exemptSection2Data"
								id="form_sample_3" class="form-horizontal">
								<c:if test="${!empty assessmentsummary }">
									<c:forEach var="objData" items="${assessmentsummary}">
										<div class="form-body">
											<h4>Manager’s Assessment Summary</h4>
											<div class="form-group">
												<div class="col-md-6">
													Summary Strengths
													<textarea class="form-control" id="Comments" rows="3"
														cols="100" maxlength="200" name="section2C1"
														style="font-family: Arial; font-size: 12pt;" required>${objData.section2CSummeryStrength}</textarea>

												</div>
												<div class="col-md-6">
													Summary of Areas of Improvement
													<textarea class="form-control" id="Comments" rows="3"
														cols="100" maxlength="200" name="section2C2"
														style="font-family: Arial; font-size: 12pt;" required>${objData.section2CSummeryImprovement}</textarea>
												</div>
											</div>
											<h4>Summary of Accomplishment and Development Areas for
												Improvement</h4>
											General comments about the Team Member overall performance
											and key accomplishments and needed development for the coming
											year.
											<div class="form-group">
												<div class="col-md-12">
													<textarea class="form-control" id="Comments" rows="3"
														cols="100" maxlength="300" name="Section2D1"
														style="font-family: Arial; font-size: 12pt;" required>${objData.section2DSummeryOfAccomplishmentAndAreasImprovement}</textarea>
												</div>

											</div>
											<h4>Overall Rating Per Manager</h4>

											<div class="form-group">
												<div class="col-md-6">
													Assessment Summary
													<%=Converters.getCurrentYear()%>
													<select class="form-control" id="exampleSelect1"
														name="section2E1">

														<option value=""
															${objData.section2EAssessmentSummary==''?'selected':''}>Pick
															a value</option>
														<option value="Exceeds Job Requirements"
															${objData.section2EAssessmentSummary=='Exceeds Job Requirements'?'selected':''}>Exceeds
															Job Requirements</option>
														<option value="Meets Job Requirements"
															${objData.section2EAssessmentSummary=='Meets Job Requirements'?'selected':''}>Meets
															Job Requirements</option>
														<option value="Does Not Meet Job Requirement"
															${objData.section2EAssessmentSummary=='Does Not Meet Job Requirement'?'selected':''}>Does
															Not Meet Job Requirement</option>
														<option
															value="New in the position,too early to decide
											(seniority 1 year)"
															${objData.section2EAssessmentSummary=='New in the position,too early to decide
															(seniority 1 year)'?'selected':''}>New
															in the position,too early to decide (seniority 1 year)</option>

														<%-- <option>${objData.section2EAssessmentSummary}</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option>
														<option>New in the position,too early to decide
															(seniority 1 year)</option> --%>
													</select>
												</div>
												<div class="col-md-6"><%=Converters.getCurrentYear()%>
													Assessment compared to
													<%=(Integer.parseInt(Converters.getCurrentYear()) - 1)%><select
														class="form-control" id="exampleSelect1" name="section2E2">
														
														<option value="" ${objData.section2EAssessmentcompared==''?'selected':''}>Pick a value</option>
													<option value="Has Performed exceedingly higher or
															continues to exceeds job requirements" ${objData.section2EAssessmentcompared=='Has Performed exceedingly higher or
															continues to exceeds job requirements'?'selected':''}>Has Performed exceedingly higher or
															continues to exceeds job requirements</option>
													<option value="Meeting Job requirements or performance
															has remained the same" ${objData.section2EAssessmentcompared=='Meeting Job requirements or performance
															has remained the same'?'selected':''}>Meeting Job requirements or performance
															has remained the same</option>
													<option value="Partially Meets Job requirments or
															Performance has deteriorated" ${objData.section2EAssessmentcompared=='Partially Meets Job requirments or
															Performance has deteriorated'?'selected':''}>Partially Meets Job requirments or
															Performance has deteriorated</option>
													<option value="Does not meet job requirments
															sufficiently or performance has not improved" ${objData.section2EAssessmentcompared=='Does not meet job requirments
															sufficiently or performance has not improved'?'selected':''}>Does not meet job requirments sufficiently or performance has not improved</option>
														
														<%-- <option>${objData.section2EAssessmentcompared}</option>
														<option>Has Performed exceedingly higher or
															continues to exceeds job requirements
														<option>
														<option>Meeting Job requirements or performance
															has remained the same</option>
														<option>Partially Meets Job requirments or
															Performance has deteriorated</option>
														<option>Does not meet job requirments
															sufficiently or performance has not improved</option> --%>
													</select>
												</div>
											</div>




										</div>
										<div class="form-actions">
									<div class="row">
                                                <div class="col-sm-12">
                                                    <%
												String statusMssg =(String)session.getAttribute("supervisorstatus");

													if (String.valueOf(statusMssg).equalsIgnoreCase("MANAGER COMPLETED")) {
											%>
										
											
											
											<%
												}else{
													
												
											%>  
                                                    <button type="submit" name="backandsave" class="btn green">Back & Save</button>
                                                &nbsp;&nbsp;&nbsp;
                                                <button type="submit" name="submit" class="btn green">Submit</button>
                                                <%
                                                }
                                                %>

                                                </div>
                                            </div>
                                            <div class="row" align="right">3 of
                                            3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
									
								</div>
									</c:forEach>
								</c:if>
								<!--for inserting data -->
								<c:if test="${empty assessmentsummary }">
									<div class="form-body">
										<h4>Manager’s Assessment Summary</h4>
										<div class="form-group">
											<div class="col-md-6">
												Summary Strengths
												<textarea class="form-control" id="Comments" rows="3"
													cols="100" maxlength="200" name="section2C1"
													style="font-family: Arial; font-size: 12pt;" required></textarea>

											</div>
											<div class="col-md-6">
												Summary of Areas of Improvement
												<textarea class="form-control" id="Comments" rows="2"
													cols="100" maxlength="200" name="section2C2"
													style="font-family: Arial; font-size: 12pt;" required></textarea>
											</div>
										</div>
										<h4>Summary of Accomplishment and Development Areas for
											Improvement</h4>
										General comments about the Team Member overall performance and
										key accomplishments and needed development for the coming
										year.
										<div class="form-group">
											<div class="col-md-12">
												<textarea class="form-control" id="Comments" rows="3"
													cols="100" maxlength="300" name="Section2D1"
													style="font-family: Arial; font-size: 12pt;" required></textarea>
											</div>

										</div>
										<h4>Overall Rating Per Manager</h4>

										<div class="form-group">
											<div class="col-md-6">
												Assessment Summary 2015<select class="form-control"
													id="exampleSelect1" name="section2E1">
													<option selected="selected" value="">Pick a value</option>
													<option>Exceeds Job Requirements</option>
													<option>Meets Job Requirements</option>
													<option>Does Not Meet Job Requirement</option>
													<option>New in the position,too early to decide
														(seniority 1 year)</option>
												</select>
											</div>
											<div class="col-md-6">
												2015 Assessment compared to 2014<select class="form-control"
													id="exampleSelect1" name="section2E2">
													<option selected="selected" value="">Pick a value</option>
													<option>Has Performed exceedingly higher or
														continues to exceeds job requirements
													<option>
													<option>Meeting Job requirements or performance
														has remained the same</option>
													<option>Partially Meets Job requirments or
														Performance has deteriorated</option>
													<option>Does not meet job requirments sufficiently
														or performance has not improved</option>
												</select>
											</div>
										</div>




									</div>
									<div class="form-actions">
									<div class="row">
                                                <div class="col-sm-12">
                                                    
                                                    <button type="submit" name="backandsave" class="btn green">Back & Save</button>
                                                &nbsp;&nbsp;&nbsp;
                                                <button type="submit" name="submit" class="btn green">Submit</button>

                                                </div>
                                            </div>
                                            <div class="row" align="right">3 of
                                            3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
								</div>
									<%--  </c:forEach> --%>
								</c:if>
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