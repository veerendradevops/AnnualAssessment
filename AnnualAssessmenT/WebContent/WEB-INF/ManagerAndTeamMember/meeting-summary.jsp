
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
	
	<script type="text/javascript">
/* $(document).ready(function() {
   //alert('<c:out value="${status}"/>');
   <c:if test="${status=='MANAGER COMPLETED'}">
     
   $("#testDiv").find("input,textarea,select,radio").attr("disabled", "disabled");
   
   </c:if>
   
}); */
</script>


	<!-- BEGIN CONTENT -->
	<div class="page-content-wrapper" id="testDiv">
		<!-- BEGIN CONTENT BODY -->
		<div class="page-content">
			<!-- BEGIN PAGE HEADER-->

			<!-- BEGIN PAGE BAR -->
			<div class="page-bar">
				<ul class="page-breadcrumb">
					<li><a href="#">Home</a> <i class="fa fa-circle"></i>
					</li>
					<li><span>Meeting Summary</span></li>
				</ul>
			</div>
			<!-- END PAGE BAR -->
			<!-- BEGIN PAGE TITLE-->
			<h3 class="page-title">Meeting Summary</h3>







			<!-- END PAGE TITLE-->
			<!-- END PAGE HEADER-->



			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN VALIDATION STATES-->
					<div class="portlet light portlet-fit portlet-form bordered">

						<div class="portlet-body">
						<h3>Please note, all fields on this screen have to be completed manually after a PRINT (PRINT enabled only post HR review)</h3>
							<!-- BEGIN FORM-->


							<form:form action="/AnnualAssessmenT/meetingsummary.do"
								modelAttribute="meetingsummary" method="post" id="form_sample_3"
								class="form-horizontal">
								<%-- <c:if test="${! empty meetingsummary}">
									<c:forEach var="meetingsummary" items="${meetingsummary}">



										<div class="form-body">
											<div class="form-group">
												<div class="col-md-12">
													Assessment Meeting Comments by Manager:
													<textarea class="form-control" id="Comments"
														maxlength="300" rows="3" title="Maximum length allowed is 300 characters" name="meetingSummaryManager">${meetingsummary.meetingSummaryManager }</textarea>
												</div>
											</div>

											<div class="form-group">
												<div class="col-md-12">
													Assessment Meeting Comments by Team Member:

													<textarea class="form-control" id="Comments"
														maxlength="300" rows="3" title="Maximum length allowed is 300 characters" name="meetingSummaryTeamMember">${meetingsummary.meetingSummaryTeamMember }</textarea>

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
											
											<button type="submit" name="backAndSave" class="btn green">Back & Save</button>										
											&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" name="save" class="btn green"> Save</button>												
											&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" name="completed" class="btn green">Submit</button>
											&nbsp;&nbsp;&nbsp;&nbsp;<button type="button"  onclick="window.open('/AnnualAssessmenT/exemptReport.do', '_blank');" name="printBtn" class="btn green">Print</button>	
											<%
												}
											%>	
											&nbsp;&nbsp;&nbsp;&nbsp;<button type="button"  onclick="window.open('/AnnualAssessmenT/exemptReport.do', '_blank');" name="printBtn" class="btn green">Print</button>
																			
										</div>	
										 <lable type="button" style="position: relative;left: 73em; bottom: 18px">6 of 7</lable>
<!-- 												<div class="col-md-12"> -->
													
<!-- 														<input type="submit" value="submit" -->
<!-- 													class="btn green"> -->
<!-- 												</div> -->
											</div>
										</div>

									</c:forEach>
								</c:if> --%>

							<%-- 	<c:if test="${empty meetingsummary}"> --%>

									<div class="form-body">
										<div class="form-group">
											<div class="col-md-12">
												Assessment Meeting Comments by Manager:
												<textarea class="form-control" id="Comments" maxlength="300" title="Maximum length allowed is 300 characters"
													rows="3" name="meetingSummaryManager" disabled="disabled"></textarea>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-12">
												Assessment Meeting Comments by Team Member:

												<textarea class="form-control" id="Comments" maxlength="300" title="Maximum length allowed is 300 characters"
													rows="3" name="meetingSummaryTeamMember" disabled="disabled"></textarea>

											</div>
										</div>
									</div>
									<div class="form-actions">
										<div class="row">
										<div class="col-md-12">
											<!-- <button type="submit" name="backAndSave" class="btn green">Back & Save</button>
											<button type="submit" name="save" class="btn green"> Save</button>												
											&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" name="completed" class="btn green">Submit</button>	
											&nbsp;&nbsp;&nbsp;&nbsp;<button type="button"  onclick="window.open('/AnnualAssessmenT/exemptReport.do', '_blank');" name="printBtn" class="btn green">Print</button> -->
											 <%
												String statusMssg =(String)session.getAttribute("supervisorstatus");

											 if ((String.valueOf(statusMssg).equalsIgnoreCase("MANAGER COMPLETED")) ||
														(String.valueOf(statusMssg).equalsIgnoreCase("HR APPROVED"))) {
											%>
										
											<a href="<c:url value="acknowledgmentScreenNext.do"></c:url>" class="btn green">Next</a>
											
											<!-- <button type="submit" name="nextAndSave" class="btn green">Next</button> -->
											
											
											<%
												}else{
													
												
											%> 
											
											<button type="submit" name="backAndSave" class="btn green">Back</button>										
											<!-- &nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" name="save" class="btn green" disabled="disabled"> Save</button> -->												
											&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" name="completed" class="btn green">Next</button>
											<!-- &nbsp;&nbsp;&nbsp;&nbsp;<button type="button"  onclick="window.open('/AnnualAssessmenT/exemptReport.do', '_blank');" name="printBtn" class="btn green">Print</button> -->	
											<%
												}
											%>	 
											
											
																		
										</div>	
<!-- 											<div class="col-md-12"> -->
<!-- 												<a href="acknowledgment-section.html" class="btn green">9
<!-- 													of 10</a> -->
<!-- 													<input type="submit" value="9 of 10" -->
<!-- 													class="btn green"> -->
										 <lable type="button" style="position: relative;left: 73em; bottom: 18px">6 of 7</lable>			
<!-- 											</div> -->
										</div>
									</div>

							<%-- 	</c:if> --%>


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




</html>