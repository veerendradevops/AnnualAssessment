<%@page import="com.lisi.annaulAssessment.util.Converters"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white"
	onload="total()">


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
					<li><span><%=Converters.getCurrentYear()%> Objectives</span></li>
				</ul>
			</div>
			<!-- END PAGE BAR -->
			<!-- BEGIN PAGE TITLE-->
			<h3 class="page-title"><%=Converters.getCurrentYear()%>
				Objectives
			</h3>
			<!-- END PAGE TITLE-->
			<!-- END PAGE HEADER-->



			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN VALIDATION STATES-->
					<div class="portlet light portlet-fit portlet-form bordered">

						<div class="portlet-body">
							<!-- BEGIN FORM-->

							<form:form
								action="/AnnaulAssessmenT/presentYearObjectivesAction.do"
								modelAttribute="presentYearObjectives" method="post"
								id="form_sample_3" class="form-horizontal" onsubmit=" return total();">

								<c:if test="${! empty presentYearObjectives}">
									<%-- <c:forEach var="presentYearObj"
										items="${presentYearObjectives}"> --%>


									<div class="form-body">
										<p>Agreed Upon Objectives (Specific, Measurable,
											Achievable, Results Based, and Time Bound)</p>
										<div class="form-group">
											<div class="col-md-10"><%=Converters.getCurrentYear()%>
												Agreed Upon Performance Objectives/Results
											</div>
											<div class="col-md-2">Weight in %</div>
										</div>

										<div class="form-group">
											<div class="col-md-1">1</div>
											<div class="col-md-9">
												<textarea class="form-control" name="objectivesOne"
													id="firstarea" rows="2" maxlength="150"
													title="Maximum length allowed is 150 characters">${presentYearObjectives.objectivesOne}</textarea>
											</div>
											<div class="col-md-2">
												<input type="text" name="objectivesOneWeight"
													class="form-control" id="first" onkeyup="total();"
													placeholder="0 to 100%"
													value="${presentYearObjectives.objectivesOneWeight}" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-1">2</div>
											<div class="col-md-9">
												<textarea class="form-control" name="objectivesTwo"
													id="secondarea" rows="2" maxlength="150"
													title="Maximum length allowed is 150 characters">${presentYearObjectives.objectivesTwo}</textarea>
											</div>

											<div class="col-md-2">
												<input type="text" name="objectivesTwoWeight"
													class="form-control" id="second" onkeyup="total();"
													placeholder="0 to 100%"
													value="${presentYearObjectives.objectivesTwoWeight}" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-1">3</div>
											<div class="col-md-9">
												<textarea class="form-control" name="objectivesThree"
													id="thirdarea" rows="2" maxlength="150"
													title="Maximum length allowed is 150 characters"
													placeholder="3">${presentYearObjectives.objectivesThree}</textarea>
											</div>
											<div class="col-md-2">
												<input type="text" name="objectivesThreeWeight"
													class="form-control" id="third" onkeyup="total();"
													placeholder="0 to 100%"
													value="${presentYearObjectives.objectivesThreeWeight}" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-1">4</div>
											<div class="col-md-9">
												<textarea class="form-control" name="objectivesFour"
													id="fourarea" rows="2" maxlength="150"
													title="Maximum length allowed is 150 characters"
													placeholder="4">${presentYearObjectives.objectivesFour}</textarea>
											</div>
											<div class="col-md-2">
												<input type="text" name="objectivesFourWeight"
													class="form-control" id="four" onkeyup="total();"
													placeholder="0 to 100%"
													value="${presentYearObjectives.objectivesFourWeight}" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-1">5</div>
											<div class="col-md-9">
												<textarea class="form-control" name="objectivesFive"
													id="fivearea" rows="2" maxlength="150"
													title="Maximum length allowed is 150 characters"
													placeholder="5">${presentYearObjectives.objectivesFive}</textarea>
											</div>
											<div class="col-md-2">
												<input type="text" name="objectivesFiveWeight"
													class="form-control" id="five" onkeyup="total();"
													placeholder="0 to 100%"
													value="${presentYearObjectives.objectivesFiveWeight}" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
											</div>
										</div>


										<div class="form-group">
											<div class="row">
												<div class="col-md-3"
													style="position: relative; left: 62em; bottom: 0px;">
													Total:
													<p id="tscore"
														style="position: relative; bottom: 18px; left: 54px;"></p>
												</div>
												<!-- 												<lable type="button" style="position: relative;left: 48em; bottom: 3px">Total<p id="tscore" /></lable> -->
												<!-- 													<div class="col-xs-10">Total</div> -->
												<!-- 													<div style="position: relative;left: 54em; bottom: 3px"> -->

												<%-- 														${presentYearObjectives.overallScore} --%>
											</div>
											<input type="hidden" name="overallScore" id="totalScore"
												value="${presentYearObjectives.overallScore}">
										</div>
									</div>




									<div class="form-actions">
										<div class="row">
											<div class="col-md-12">
												<!-- <button type="button" class="btn green" href="#">Back
													& Save</button> -->
												&nbsp;&nbsp;&nbsp;
												 <%
												String statusMssg =(String)session.getAttribute("supervisorstatus");

													if (String.valueOf(statusMssg).equalsIgnoreCase("MANAGER COMPLETED")) {
											%>
										
											
											
											<%
												}else{
													
												
											%> 
												
											<button type="submit" class="btn green" name="nextAndSave">Next & Save</button>
											
											<%
												}
											%>	
											</div>
											<!-- 												<div class="col-md-12"> -->
											<!-- 													<input type="submit" value="7 of 10" class="btn green"> -->
											<!-- 												</div> -->
										</div>

										<lable type="button"
											style="position: relative;left: 73em; bottom: 19px">1
										of 4</lable>


									</div>

									<%-- 	</c:forEach> --%>
								</c:if>



								<c:if test="${empty presentYearObjectives}">

									<div class="form-body">
										<p>Agreed Upon Objectives (Specific, Measurable,
											Achievable, Results Based, and Time Bound)</p>
										<div class="form-group">
											<div class="col-md-10">2016 Agreed Upon Performance
												Objectives/Results</div>
											<div class="col-md-2">Weight in %</div>
										</div>

										<div class="form-group">
											<div class="col-md-1">1</div>
											<div class="col-md-9">
												<textarea class="form-control" name="objectivesOne" rows="2"
													id="firstarea" maxlength="150"
													title="Maximum length allowed is 150 characters"
													onkeyup="total();"></textarea>
											</div>
											<div class="col-md-2">
												<input type="text" name="objectivesOneWeight"
													class="form-control" id="first" onkeyup="total();"
													placeholder="0 to 100%" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-1">2</div>
											<div class="col-md-9">
												<textarea class="form-control" name="objectivesTwo" rows="2"
													id="secondarea" onkeyup="total()" maxlength="150"
													title="Maximum length allowed is 150 characters"></textarea>
											</div>

											<div class="col-md-2">
												<input type="text" name="objectivesTwoWeight"
													class="form-control" id="second" onkeyup="total()"
													placeholder="0 to 100%" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-1">3</div>
											<div class="col-md-9">
												<textarea class="form-control" name="objectivesThree"
													id="thirdarea" rows="2" maxlength="150" onkeyup="total()"
													title="Maximum length allowed is 150 characters"
													placeholder="3"></textarea>
											</div>
											<div class="col-md-2">
												<input type="text" name="objectivesThreeWeight"
													class="form-control" id="third" onkeyup="total()"
													placeholder="0 to 100%" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-1">4</div>
											<div class="col-md-9">
												<textarea class="form-control" name="objectivesFour"
													onkeyup="total()" id="fourarea" rows="2" maxlength="150"
													title="Maximum length allowed is 150 characters"></textarea>
											</div>
											<div class="col-md-2">
												<input type="text" name="objectivesFourWeight"
													class="form-control" id="four" onkeyup="total();"
													placeholder="0 to 100%" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

											</div>
										</div>

										<div class="form-group">
											<div class="col-md-1">5</div>
											<div class="col-md-9">
												<textarea class="form-control" name="objectivesFive"
													id="fivearea" rows="2" maxlength="150"
													title="Maximum length allowed is 150 characters"
													onkeyup="total()"></textarea>
											</div>
											<div class="col-md-2">
												<input type="text" name="objectivesFiveWeight"
													class="form-control" id="five" onkeyup="total();"
													placeholder="0 to 100%" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

											</div>
										</div>


										<div class="form-group">
											<div class="row">
												<div class="col-md-3"
													style="position: relative; left: 62em; bottom: 0px;">
													Total:
													<p id="tscore"
														style="position: relative; bottom: 18px; left: 54px;"></p>
												</div>
												<!-- 											<lable type="button" style="position: relative;left: 48em; bottom: 3px">Total <p id="tscore" /></lable> -->
												<!-- 												<div class="col-xs-10">Total</div> -->
												<!-- 												<div class="col-xs-2"> -->


											</div>
											<input type="hidden" name="overallScore" id="totalScore">

										</div>
									</div>

									<div class="form-actions">
										<div class="row">
											<div class="col-md-12">
												<!-- <button type="submit" class="btn green" name="nextAndSave" >Back
													& Save</button> -->
												&nbsp;&nbsp;&nbsp;
												<button type="submit" class="btn green" name="nextAndSave">Next & Save</button>
											</div>
											<!-- 											<div class="col-md-12"> -->
											<!-- 												<input type="submit" value="7 of 10" class="btn green"> -->
											<!-- 											</div> -->
										</div>

										<lable type="button"
											style="position: relative;left: 73em; bottom: 18px">1
										of 4</lable>


									</div>
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

<script>
	function total() {
	//	alert("total");

		var result;
		var first ;
		var second ;
		var third ;
		var four ;
		var five ;

		
		
		first = document.getElementById('first').value;
		second = document.getElementById('second').value;
		third = document.getElementById('third').value;
		four = document.getElementById('four').value;
		five = document.getElementById('five').value;

	//	alert("first" + first);
		if (first == null || first.length == 0) {
			//	alert("new if" );
			first = 0;

		}

		if (second == null || second.length == 0) {
			//	alert("new if" );
			second = 0;

		}
		if (third == null || third.length == 0) {
			//		alert("new if" );
			third = 0;

		}
		if (four == null || four.length == 0) {
			//		alert("new if" );
			four = 0;

		}
		if (five == null || five.length == 0) {
			//	alert("new if" );
			five = 0;

		}
		if (first >= 100) {
			document.getElementById('second').disabled = true;
			document.getElementById('third').disabled = true;
			document.getElementById('four').disabled = true;
			document.getElementById('five').disabled = true;
			//
			document.getElementById('secondarea').disabled = true;
			document.getElementById('thirdarea').disabled = true;
			document.getElementById('fourarea').disabled = true;
			document.getElementById('fivearea').disabled = true;

		}
		if (first < 100) {

			document.getElementById("second").disabled = false;
			document.getElementById("third").disabled = false;
			document.getElementById("four").disabled = false;
			document.getElementById("five").disabled = false;
			// Disable for Achievement Level Textareas
			document.getElementById("secondarea").disabled = false;
			document.getElementById("thirdarea").disabled = false;
			document.getElementById("fourarea").disabled = false;
			document.getElementById("fivearea").disabled = false;

		}
		var addfirstsecond = parseInt(first) + parseInt(second);
		if (addfirstsecond >= 100) {
			document.getElementById('third').disabled = true;
			document.getElementById('four').disabled = true;
			document.getElementById('five').disabled = true;
			//
			document.getElementById("thirdarea").disabled = true;
			document.getElementById("fourarea").disabled = true;
			document.getElementById("fivearea").disabled = true;
		}
		if (addfirstsecond < 100) {
			document.getElementById("third").disabled = false;
			document.getElementById("four").disabled = false;
			document.getElementById("five").disabled = false;
			//
			document.getElementById("thirdarea").disabled = false;
			document.getElementById("fourarea").disabled = false;
			document.getElementById("fivearea").disabled = false;
		}
		var addthirdfourth = parseInt(addfirstsecond) + parseInt(third);
		if (addthirdfourth >= 100) {
			document.getElementById('four').disabled = true;
			document.getElementById('five').disabled = true;
			//
			document.getElementById("fourarea").disabled = true;
			document.getElementById("fivearea").disabled = true;
		}
		if (addthirdfourth < 100) {
			document.getElementById("four").disabled = false;
			document.getElementById("five").disabled = false;
			//
			document.getElementById("fourarea").disabled = false;
			document.getElementById("fivearea").disabled = false;
		}
		var addfourthfiveth = parseInt(addthirdfourth) + parseInt(four);
		if (addfourthfiveth >= 100) {
			document.getElementById('five').disabled = true;
			document.getElementById("fivearea").disabled = true;

		}
		if (addfourthfiveth < 100) {
			document.getElementById("five").disabled = false;
			document.getElementById("fivearea").disabled = false;
		}

		result = parseFloat(first) + parseFloat(second) + parseFloat(third)
				+ parseInt(four) + parseFloat(five);
	//	alert(result);
		if (!isNaN(result)) {
			// 			alert(result);
			document.getElementById('tscore').innerHTML = result;
			document.getElementById('totalScore').value = result;
		}
		
		
		//alert(result);
		 if(result>100 ){
			alert("you must enter score 100");
			document.getElementById('tscore').innerHTML = result;
			document.getElementById('totalScore').value = result;
			document.getElementById("tscore").style.color = "red";
			return false;
			
		}
	}
</script>


</html>