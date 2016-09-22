<%@page import="com.lisi.annaulAssessment.util.Converters"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white"
	onload="object()">
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
					<li><span>Objective Achievement</span></li>
				</ul>
			</div>
			<!-- END PAGE BAR -->
			<!-- BEGIN PAGE TITLE-->
			<h3 class="page-title">Objective Achievement</h3>
			<!-- END PAGE TITLE-->
			<!-- END PAGE HEADER-->
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN VALIDATION STATES-->
					<div class="portlet light portlet-fit portlet-form bordered">

						<div class="portlet-body">
							<!-- BEGIN FORM-->
							<form:form
								action="/AnnaulAssessmenT/objectiveAchievementOperation.do"
								method="post" modelAttribute="exemptSection2Pojo"
								id="form_sample_3" class="form-horizontal"
								onsubmit="return object()">
								<c:if test="${!empty objectiveAchievement }">
									<c:forEach var="objData" items="${objectiveAchievement}">
										<div class="form-body">
											<div class="form-group">
												<div class="col-md-10">
													<br>
													<%=Converters.getCurrentYear()%>
													Agreed Upon Objectives
												</div>
												<div class="col-md-2">Achievement Level For 2015</div>
											</div>

											<div class="form-group">
												<div class="col-md-1">1</div>
												<div class="col-md-9">
													<textarea class="form-control" rows="2" cols="75"
														maxlength="150" id="1" name="section2A1Objective"
														title="Maximum length of this field is 150 characters"
														style="font-family: Arial; font-size: 12pt;"
														onkeyup="object()">${objData.section2A1Objective}</textarea>
												</div>


												<div class="col-md-2">
													<input type="text" class="form-control" id="1l" onkeyup="object()"
														
														placeholder="0 to 100%" title="Enter Numerics"
														name="Section2A1Level" value="${objData.section2A1Level}" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
												</div>
											</div>

											<div class="form-group">
												<div class="col-md-1">2</div>
												<div class="col-md-9">
													<textarea class="form-control" rows="2" cols="75"
														maxlength="150" id="2" name="section2A2Objective"
														title="Maximum length of this field is 150 characters"
														style="font-family: Arial; font-size: 12pt;"
														onkeyup="object()">${objData.section2A2Objective}</textarea>
												</div>

												<div class="col-md-2">
													<input type="text" class="form-control" id="2l"
														onkeyup="object()"
														placeholder="0 to 100%" onkeyup="object()"
														title="Enter Numerics" name="Section2A2Level"
														value="${objData.section2A2Level}" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
												</div>
											</div>

											<div class="form-group">
												<div class="col-md-1">3</div>
												<div class="col-md-9">
													<textarea class="form-control" rows="2" cols="75"
														maxlength="150" id="3" name="section2A3Objective"
														title="Maximum length of this field is 150 characters"
														style="font-family: Arial; font-size: 12pt;"
														onkeyup="object()">${objData.section2A3Objective}</textarea>
												</div>
												<div class="col-md-2">
													<input type="text" class="form-control" id="3l"
														
														placeholder="0 to 100%" onkeyup="object()"
														title="Enter Numerics" name="Section2A3Level"
														value="${objData.section2A3Level}" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
												</div>
											</div>

											<div class="form-group">
												<div class="col-md-1">4</div>
												<div class="col-md-9">
													<textarea class="form-control" rows="2" cols="75"
														maxlength="150" id="4" name="section2A4Objective"
														title="Maximum length of this field is 150 characters"
														style="font-family: Arial; font-size: 12pt;"
														onkeyup="object()">${objData.section2A4Objective}</textarea>
												</div>
												<div class="col-md-2">
													<input type="text" class="form-control" id="4l"
														onkeyup="object()"
														placeholder="0 to 100%" onkeyup="object()"
														title="Enter Numerics" name="Section2A4Level"
														value="${objData.section2A4Level}" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
												</div>
											</div>

											<div class="form-group">
												<div class="col-md-1">5</div>
												<div class="col-md-9">
													<textarea class="form-control" rows="2" cols="75"
														maxlength="150" id="5" name="section2A5Objective"
														title="Maximum length of this field is 150 characters"
														style="font-family: Arial; font-size: 12pt;"
														onkeyup="object()">${objData.section2A5Objective}</textarea>
												</div>
												<div class="col-md-2">
													<input type="text" class="form-control" id="5l"
														onkeyup="object()"
														placeholder="0 to 100%" onkeyup="object()"
														title="Enter Numerics" name="Section2A5Level"
														value="${objData.section2A5Level}" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
												</div>
											</div>


											<div class="form-group">
												<div class="col-md-10"></div>
												<div class="col-md-2">
													Total:
													<p id="sumofavg"></p>
												</div>

												<input type="hidden" name="sumofavg" id="hiddenavg">

												<div class="col-xs-2" onkeyup="object()"></div>
											</div>

											<div class="form-group">
												<div class="col-md-12">
													Additional Comments:<br>
													<textarea class="form-control" id="Comments"
														maxlength="200" rows="2" name="Section2AdditionalComments"
														style="font-family: Arial; font-size: 12pt;">${objData.section2AdditionalComments}</textarea>
												</div>
											</div>

										</div>
										<div class="form-actions">
											<div class="row">
												<div class="col-md-12">
												 <%
												String statusMssg =(String)session.getAttribute("supervisorstatus");

													if (String.valueOf(statusMssg).equalsIgnoreCase("MANAGER COMPLETED")) {
											%>
										
											
											
											<%
												}else{
													
												
											%> 
													<button type="submit" id="button" name="nextandsave"
														class="btn green">Next & Save</button>
														
														<%
														}%>
												</div>
											</div>
											<div class="row" align="right">1 of
												3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
										</div>
									</c:forEach>
								</c:if>
								<c:if test="${empty objectiveAchievement }">

									<div class="form-body">
										<div class="form-group">
											<div class="col-md-10">
												<br> 2015 Agreed Upon Objectives
											</div>
											<div class="col-md-2">Achievement Level For 2015</div>
										</div>

										<div class="form-group">
											<div class="col-md-1">1</div>
											<div class="col-md-9">
												<textarea class="form-control" rows="2" cols="75"
													maxlength="150" id="1" name="section2A1Objective"
													></textarea>
											</div>
											<!-- <p id="demo"></p> -->
											<div class="col-md-2">
												<input type="text" class="form-control" id="1l"
													onkeyup="object()" placeholder="0 to 100%"
													 name="Section2A1Level" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-1">2</div>
											<div class="col-md-9">
												<textarea class="form-control" rows="2" cols="75"
													maxlength="150" id="2" name="section2A2Objective"></textarea>
											</div>
											<div class="col-md-2">
												<input type="text" class="form-control" id="2l"
													placeholder="0 to 100%" onkeyup="object()"
													name="Section2A2Level" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-1">3</div>
											<div class="col-md-9">
												<textarea class="form-control" rows="2" cols="75"
													maxlength="150" id="3" name="section2A3Objective"></textarea>
											</div>
											<div class="col-md-2">
												<input type="text" class="form-control" id="3l"
													placeholder="0 to 100%" onkeyup="object()"
													name="Section2A3Level" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-1">4</div>
											<div class="col-md-9">
												<textarea class="form-control" rows="2" cols="75"
													maxlength="150" id="4" name="section2A4Objective"></textarea>
											</div>
											<div class="col-md-2">
												<input type="text" class="form-control" id="4l"
													placeholder="0 to 100%" onkeyup="object()"
													name="Section2A4Level" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-1">5</div>
											<div class="col-md-9">
												<textarea class="form-control" rows="2" cols="75"
													maxlength="150" id="5" name="section2A5Objective"></textarea>
											</div>
											<div class="col-md-2">
												<input type="text" class="form-control" id="5l"
													placeholder="0 to 100%" onkeyup="object()"
													name="Section2A5Level" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-10"></div>
											<div class="col-md-2">
												Total:
												<p id="sumofavg"></p>
											</div>
											<div class="col-xs-2" onkeyup="object()"></div>
										</div>

										<div class="form-group">
											<div class="col-md-12">
												Additional Comments:<br>
												<textarea class="form-control" id="Comments" maxlength="200"
													rows="4" name="Section2AdditionalComments"></textarea>
											</div>
										</div>

									</div>
									<div class="form-actions">
										<div class="row">
                                                <div class="col-md-12">
                                                    <button type="submit" id="button" name="nextandsave" class="btn green">Next & Save</button>
                                                </div>
                                            </div>
                                            <div class="row" align="right">1 of
                                            3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
									</div>

								</c:if>
								<!-- END FORM-->
							</form:form>
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




