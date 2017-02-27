
<%@page import="com.lisi.annualassessment.util.Converters"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">




	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							//alert('<c:out value="${status}"/>');
							<c:if test="${status=='MANAGER COMPLETED' || status=='HR APPROVED' || status=='CLOSED'}">

							$("#testDiv").find(
									"input,button,textarea,select,radio").attr(
									"disabled", "disabled");

							</c:if>

						});
		
		$(document).ready(function() {
			   
		var validate="no";
			  <c:if test="${!empty assessmentsummary && empty imessage}">
			   
			   
			  if($("#summerystrength").val()==""){
			   $("#summerystrength").css('border-color', 'red');
			   validate="yes";
			  }
			  
			  if($("#summeryarea").val()==""){
				   $("#summeryarea").css('border-color', 'red');
				   validate="yes";
				  }
			  
			  if($("#summaryaccomplishment").val()==""){
				   $("#summaryaccomplishment").css('border-color', 'red');
				   validate="yes";
				  }
			 
			  if($("#exampleSelect1").val()==""){
				   $("#exampleSelect1").css('border-color', 'red');
				   validate="yes";
				  }
			  
			  if($("#exampleSelect2").val()==""){
				   $("#exampleSelect2").css('border-color', 'red');
				   validate="yes";
				  }
			  
			   if(validate=="yes"){
					
					
					document.getElementById("headermessage").innerHTML="Please note, <font color='red'>ALL FIELDS MARKED IN RED </font> have to be completed before being allowed to the next screen"
				}
			   </c:if>
			   
		});
	</script>


	<!-- BEGIN CONTENT -->
	<div class="page-content-wrapper" id="testDiv">
		<!-- BEGIN CONTENT BODY -->
		<div class="page-content">
			<!-- BEGIN PAGE HEADER-->

			<!-- BEGIN PAGE BAR -->

			<P>
				<c:if test="${!empty errorMsg}">
					<h4>
						<font color="red"><center>${errorMsg}</center></font>
					</h4>
				</c:if>

			</P>

			<div class="page-bar">
				<ul class="page-breadcrumb">
					<li><a href="#" class="disabled">Home</a> <i
						class="fa fa-circle"></i></li>
					<li><span>Summary</span></li>
				</ul>
			</div>
			<!-- END PAGE BAR -->
			<!-- BEGIN PAGE TITLE-->
			<h3 class="page-title">Summary</h3>
			<center>
				<h3>
					<c:if test="${!empty summary}">
			
			${summary}
			
			</c:if>

				</h3>
			</center>
			<h6 id="headermessage">
				<!-- Please note, <font color="red">ALL FIELDS MARKED IN RED </font> have
				to be completed before being allowed to the next screen -->
			</h6>
			<!-- END PAGE TITLE-->
			<!-- END PAGE HEADER-->



			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN VALIDATION STATES-->
					<div class="portlet light portlet-fit portlet-form bordered">

						<div class="portlet-body">
							<!-- BEGIN FORM-->
							<form:form action="/AnnualAssessmenT/assessmentsummary.do"
								method="GET" modelAttribute="exemptSection2Data"
								class="form-horizontal">
								<c:if test="${!empty assessmentsummary }">
									<script type="text/javascript">
									
									function validateUser(){
										
										
										var summerystrength=document.getElementById("summerystrength").value;
										
										if(summerystrength==""){
											
											 document.getElementById('summerystrength').style.borderColor = "red";
										}else{
											
											document.getElementById('summerystrength').style.borderColor = "black";
										}
										
										var summeryarea=document.getElementById("summeryarea").value;
										if(summeryarea==""){
											document.getElementById('summeryarea').style.borderColor = "red";
										}else{
											document.getElementById('summeryarea').style.borderColor ="black";
										}
										
										var summaryaccomplishment=document.getElementById("summaryaccomplishment").value;
										if(summaryaccomplishment==""){
											document.getElementById('summaryaccomplishment').style.borderColor = "red";
										}else{
											document.getElementById('summaryaccomplishment').style.borderColor ="black";
										}
										
										var exampleSelect1=document.getElementById("exampleSelect1").value;
										if(exampleSelect1==""){
											document.getElementById('exampleSelect1').style.borderColor = "red";
										}else{
											document.getElementById('exampleSelect1').style.borderColor ="black";
										}
										
										var exampleSelect2=document.getElementById("exampleSelect2").value;
										if(exampleSelect2==""){
											document.getElementById('exampleSelect2').style.borderColor = "red";
										}else{
											document.getElementById('exampleSelect2').style.borderColor ="black";
										}
										
									}
									
									</script>
									
									
									<c:forEach var="objData" items="${assessmentsummary}">
										<div class="form-body">
											<h4>Manager’s Assessment Summary</h4>
											<div class="form-group">
												<div class="col-md-6">
													Summary Strengths
													<textarea class="form-control" id="summerystrength" rows="3"
														cols="100" maxlength="200" name="section2C1" onkeyup=validateUser();
														style="font-family: Arial; font-size: 12pt;">${objData.section2CSummeryStrength}</textarea>

												</div>
												<div class="col-md-6">
													Summary of Areas of Improvement
													<textarea class="form-control" id="summeryarea" rows="3"
														cols="100" maxlength="200" name="section2C2" onkeyup=validateUser();
														style="font-family: Arial; font-size: 12pt;" >${objData.section2CSummeryImprovement}</textarea>
												</div>
											</div>
											<h4>Summary of Accomplishment and Development Areas for
												Improvement</h4>
											General comments about the Team Member overall performance
											and key accomplishments and needed development for the coming
											year.
											<div class="form-group">
												<div class="col-md-12">
													<textarea class="form-control" id="summaryaccomplishment" rows="3"
														cols="100" maxlength="300" name="Section2D1" onkeyup=validateUser();
														style="font-family: Arial; font-size: 12pt;">${objData.section2DSummeryOfAccomplishmentAndAreasImprovement}</textarea>
												</div>

											</div>
											<h4>Overall Rating Per Manager</h4>

											<div class="form-group">
												<div class="col-md-6">
													Assessment Summary
													<c:out value="${sessionScope.loginYear}"></c:out>
													<select class="form-control" id="exampleSelect1"
														name="section2E1" onchange=validateUser();>

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
															value="New in the position,too early to decide (seniority 1 year)"
															${objData.section2EAssessmentSummary=='New in the position,too early to decide (seniority 1 year)'?'selected':''}>New
															in the position,too early to decide (seniority 1 year)</option>

														<%-- <option>${objData.section2EAssessmentSummary}</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option>
														<option>New in the position,too early to decide
															(seniority 1 year)</option> --%>
													</select>
												</div>
												<div class="col-md-6"><c:out value="${sessionScope.loginYear}"></c:out>
													Assessment compared to
													<c:out value="${sessionScope.loginYear-1}"></c:out><select
														class="form-control" id="exampleSelect2" name="section2E2" onchange=validateUser();
														>

														<option value=""
															${objData.section2EAssessmentcompared==''?'selected':''}>Pick
															a value</option>
														<option
															value="Has Performed exceedingly higher continues to exceeds job requirements"
															${objData.section2EAssessmentcompared=='Has Performed exceedingly higher continues to exceeds job requirements'?'selected':''}>Has
															Performed exceedingly higher or continues to exceeds job
															requirements</option>
														<option
															value="Meeting Job requirements performance has remained the same"
															${objData.section2EAssessmentcompared=='Meeting Job requirements performance has remained the same'?'selected':''}>Meeting
															Job requirements or performance has remained the same</option>
														<option
															value="Partially Meets Job requirments Performance has deteriorated"
															${objData.section2EAssessmentcompared=='Partially Meets Job requirments Performance has deteriorated'?'selected':''}>Partially
															Meets Job requirments or Performance has deteriorated</option>
														<option
															value="Does  meet job requirments sufficiently  performance has  improved"
															${objData.section2EAssessmentcompared=='Does  meet job requirments sufficiently  performance has  improved'?'selected':''}>Does
															not meet job requirments sufficiently or performance has
															not improved</option>

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
										
									</c:forEach>
								</c:if>
								<!--for inserting data -->
								<c:if test="${empty assessmentsummary }">
									<div class="form-body">
										<h4>Manager’s Assessment Summary</h4>
										<div class="form-group">
											<div class="col-md-6">
												Summary Strengths
												<textarea class="form-control" id="summerystrength" rows="3"
													cols="100" maxlength="200" name="section2C1"
													style="font-family: Arial; font-size: 12pt;" ></textarea>

											</div>
											<div class="col-md-6">
												Summary of Areas of Improvement
												<textarea class="form-control" id="summeryarea" rows="2"
													cols="100" maxlength="200" name="section2C2"
													style="font-family: Arial; font-size: 12pt;" ></textarea>
											</div>
										</div>
										<h4>Summary of Accomplishment and Development Areas for
											Improvement</h4>
										General comments about the Team Member overall performance and
										key accomplishments and needed development for the coming
										year.
										<div class="form-group">
											<div class="col-md-12">
												<textarea class="form-control" id="summaryaccomplishment" rows="3"
													cols="100" maxlength="300" name="Section2D1"
													style="font-family: Arial; font-size: 12pt;" ></textarea>
											</div>

										</div>
										<h4>Overall Rating Per Manager</h4>

										<div class="form-group">
											<div class="col-md-6">
												Assessment Summary
												<c:out value="${sessionScope.loginYear}"></c:out><select class="form-control"
													id="exampleSelect1" name="section2E1" >
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
															value="New in the position,too early to decide (seniority 1 year)"
															${objData.section2EAssessmentSummary=='New in the position,too early to decide (seniority 1 year)'?'selected':''}>New
															in the position,too early to decide (seniority 1 year)</option>
												</select>
											</div>
											<div class="col-md-6">
												<c:out value="${sessionScope.loginYear}"></c:out>
												Assessment compared to
												<c:out value="${sessionScope.loginYear-1}"></c:out><select
													class="form-control" id="exampleSelect1" name="section2E2"
													>
													<option value=""
															${objData.section2EAssessmentcompared==''?'selected':''}>Pick
															a value</option>
														<option
															value="Has Performed exceedingly higher continues to exceeds job requirements"
															${objData.section2EAssessmentcompared=='Has Performed exceedingly higher continues to exceeds job requirements'?'selected':''}>Has
															Performed exceedingly higher or continues to exceeds job
															requirements</option>
														<option
															value="Meeting Job requirements performance has remained the same"
															${objData.section2EAssessmentcompared=='Meeting Job requirements performance has remained the same'?'selected':''}>Meeting
															Job requirements or performance has remained the same</option>
														<option
															value="Partially Meets Job requirments Performance has deteriorated"
															${objData.section2EAssessmentcompared=='Partially Meets Job requirments Performance has deteriorated'?'selected':''}>Partially
															Meets Job requirments or Performance has deteriorated</option>
														<option
															value="Does  meet job requirments sufficiently  performance has  improved"
															${objData.section2EAssessmentcompared=='Does  meet job requirments sufficiently  performance has  improved'?'selected':''}>Does
															not meet job requirments sufficiently or performance has
															not improved</option>
												</select>
											</div>
										</div>




									</div>
									<!-- <div class="form-actions">
									<div class="row">
                                                <div class="col-sm-12">
                                                    
                                                    <button type="submit" name="backandsave" class="btn green">Back & Save</button>
                                                &nbsp;&nbsp;&nbsp;
                                                <button type="submit" name="nextAndSave" class="btn green">Next & Save</button>

                                                </div>
                                            </div>
                                            <div class="row" align="right">3 of
                                            7&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
								</div> -->
									<%--  </c:forEach> --%>
								</c:if>
								<div class="form-actions">
									<div class="row">
										<div class="col-sm-12">
											<%
												String statusMssg = (String) session.getAttribute("supervisorstatus");

													if ((String.valueOf(statusMssg).equalsIgnoreCase("MANAGER COMPLETED"))
															|| (String.valueOf(statusMssg).equalsIgnoreCase("HR APPROVED"))
															|| (String.valueOf(statusMssg).equalsIgnoreCase("CLOSED"))) {
											%>

											<%-- <a href="<c:url value="managerSkillAssessment.do"></c:url>" class="btn green">Back</a> --%>
											<a href="<c:url value="presentYearObjectives.do"></c:url>"
												class="btn green">Next</a>


											<%
												} else {
											%>
											<button type="submit" name="backandsave" class="btn green">Back
												& Save</button>
											&nbsp;&nbsp;&nbsp;
											<button type="submit" name="save" class="btn green">Save</button>
											&nbsp;&nbsp;&nbsp;
											<button type="submit" name="nextAndSave" class="btn green">
												Next & Save</button>
											<%
												}
											%>

										</div>
									</div>
									<div class="row" align="right">3 of
										7&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>

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

