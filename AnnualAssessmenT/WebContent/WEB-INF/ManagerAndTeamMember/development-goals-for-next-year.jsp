<%@page import="com.lisi.annualassessment.util.Converters"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
#objscreen {
	
}
</style>

<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
	<script type="text/javascript">
		$(document).ready(
				function() {
					<c:if test="${status=='MANAGER COMPLETED' || status=='HR APPROVED' || status=='CLOSED'}">
					$("#testDiv").find("input,button,textarea,select,radio")
							.attr("disabled", "disabled");

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
				<%-- 	<li><span><c:out value="${sessionScope.loginYear}"></c:out> Development --%>
					<li><span><%=Converters.getCurrentYear() %> Development 
							Goals</span></li>
				</ul>
			</div>
			<!-- END PAGE BAR -->
			<!-- BEGIN PAGE TITLE-->
			<h3 class="page-title"><%=Converters.getCurrentYear() %>
				Development Goals
			</h3>
			<!-- END PAGE TITLE-->
			<!-- END PAGE HEADER-->



			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN VALIDATION STATES-->
					<div class="portlet light portlet-fit portlet-form bordered">

						<p>
							<center><c:if test="${!empty objscreen }">
								<h3 id="objscreen">${objscreen}</h3>
							</c:if></center>
						</p>
						<div class="portlet-body">
							<!-- BEGIN FORM-->
							<form:form action="/AnnualAssessmenT/developmentGoals.do"
								modelAttribute="devlopmentGoals" method="post"
								id="form_sample_3" class="form-horizontal">
								<c:if test="${! empty devgoals}">
									<%--    <c:forEach var="presentYearObj" items="${devgoals}"> --%>
									<div class="form-body">
										<div class="form-group">
											<div class="col-md-1">1</div>
											<div class="col-md-11">
												<textarea class="form-control" name="developmentGoalsOne"
													rows="2" maxlength="150"
													title="Maximum length allowed is 150 characters"
													placeholder="1">${devgoals.developmentGoalsOne}</textarea>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-1">2</div>
											<div class="col-md-11">
												<textarea class="form-control" name="developmentGoalsTwo"
													rows="2" maxlength="150"
													title="Maximum length allowed is 150 characters"
													placeholder="2">${devgoals.developmentGoalsTwo}</textarea>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-1">3</div>
											<div class="col-md-11">
												<textarea class="form-control" name="developmentGoalsThree"
													rows="2" maxlength="150"
													title="Maximum length allowed is 150 characters"
													placeholder="3">${devgoals.developmentGoalsThree}</textarea>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-1">4</div>
											<div class="col-md-11">
												<textarea class="form-control" name="developmentGoalsFour"
													rows="2" maxlength="150"
													title="Maximum length allowed is 150 characters"
													placeholder="4">${devgoals.developmentGoalsFour}</textarea>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-1">5</div>
											<div class="col-md-11">
												<textarea class="form-control" name="developmentGoalsFive"
													rows="2" maxlength="150"
													title="Maximum length allowed is 150 characters"
													placeholder="5">${devgoals.developmentGoalsFive}</textarea>
											</div>
										</div>

									</div>
									<%-- <div class="form-actions">
										<div class="row">
											<div class="col-md-12">

												<%
												String statusMssg =(String)session.getAttribute("supervisorstatus");

													if (String.valueOf(statusMssg).equalsIgnoreCase("MANAGER COMPLETED")) {
											%>



												<%
												}else{
													
												
											%>
												<button type="submit" class="btn green" name="backAndSave">Back
													& Save</button>
												&nbsp;&nbsp;&nbsp;&nbsp;
												<button type="submit" class="btn green" name="nextAndSave">Next
													& Save</button>
												<%
												}
											%>
											</div>
											<!-- 											<div class="col-md-12"> -->
											<!-- 												<input type="submit" value="8 of 10" class="btn green"> -->
											<!-- 											</div> -->
										</div>
										<lable type="button"
											style="position: relative;left: 73em; bottom: 18px">5
										of 7</lable>
									</div> --%>
								</c:if>
								<c:if test="${ empty devgoals}">

									<div class="form-body">
										<div class="form-group">
											<div class="col-md-1">1</div>
											<div class="col-md-11">
												<textarea class="form-control" name="developmentGoalsOne"
													rows="2" maxlength="150"
													title="Maximum length allowed is 150 characters"
													placeholder="1"></textarea>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-1">2</div>
											<div class="col-md-11">
												<textarea class="form-control" name="developmentGoalsTwo"
													rows="2" maxlength="150"
													title="Maximum length allowed is 150 characters"
													placeholder="2"></textarea>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-1">3</div>
											<div class="col-md-11">
												<textarea class="form-control" name="developmentGoalsThree"
													rows="2" maxlength="150"
													title="Maximum length allowed is 150 characters"
													placeholder="3"></textarea>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-1">4</div>
											<div class="col-md-11">
												<textarea class="form-control" name="developmentGoalsFour"
													rows="2" maxlength="150"
													title="Maximum length allowed is 150 characters"
													placeholder="4"></textarea>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-1">5</div>
											<div class="col-md-11">
												<textarea class="form-control" name="developmentGoalsFive"
													rows="2" maxlength="150"
													title="Maximum length allowed is 150 characters"
													placeholder="5"></textarea>
											</div>
										</div>

									</div>
									<!-- <div class="form-actions">
										<div class="row">
											<div class="col-md-12">
												<button type="submit" class="btn green" name="backAndSave">Back
													& Save</button>
												&nbsp;&nbsp;&nbsp;&nbsp;
												<button type="submit" class="btn green" name="nextAndSave">Next
													& Save</button>
											</div>
																						<div class="col-md-12">
																							<input type="submit" value="8 of 10" class="btn green">
																						</div>
										</div>
										<lable type="button"
											style="position: relative;left: 73em; bottom: 18px">5
										of 7</lable>
									</div> -->

								</c:if>

								<div class="form-actions">
									<div class="row">
										<div class="col-md-12">

											<%
												String statusMssg =(String)session.getAttribute("supervisorstatus");

											if ((String.valueOf(statusMssg).equalsIgnoreCase("MANAGER COMPLETED")) ||
													(String.valueOf(statusMssg).equalsIgnoreCase("HR APPROVED"))
													|| (String.valueOf(statusMssg).equalsIgnoreCase("CLOSED"))) {
											%>

											<a href="<c:url value="meetingsummaryscreen.do"></c:url>" class="btn green">Next</a>

											<%
												}else{
													
												
											%>
											<button type="submit" class="btn green" name="backAndSave">Back
												& Save</button>
												&nbsp;&nbsp;&nbsp;&nbsp;
											<button type="submit" class="btn green" name="save">
												Save</button>
											&nbsp;&nbsp;&nbsp;&nbsp;
											<button type="submit" class="btn green" name="nextAndSave">Next
												& Save</button>
											<%
												}
											%>
										</div>
										<!-- 											<div class="col-md-12"> -->
										<!-- 												<input type="submit" value="8 of 10" class="btn green"> -->
										<!-- 											</div> -->
									</div>
									<lable type="button"
										style="position: relative;left: 73em; bottom: 18px">5
									of 7</lable>
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




</html>