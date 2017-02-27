<%@page import="com.lisi.annualassessment.util.Converters"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white"
	onload="total(1);">
	<script type="text/javascript">
		$(document).ready(
				function() {
					//alert('<c:out value="${status}"/>');
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
					<li><span><%=Converters.getCurrentYear() %> Objectives</span></li>
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
								action="/AnnualAssessmenT/presentYearObjectivesAction.do"
								modelAttribute="presentYearObjectives" method="post"
								id="form_sample_3" class="form-horizontal"
								onsubmit="total(20);">

								<c:if test="${! empty presentYearObjectives}">
									<%-- <c:forEach var="presentYearObj"
										items="${presentYearObjectives}"> --%>





									<div class="form-body">
										<p>Agreed Upon Objectives (Specific, Measurable,
											Achievable, Results Based, and Time Bound)</p>


										<table style="width: 100%">
											<tr>
												<td width="85%" colspan="2"><%=Converters.getCurrentYear() %>
													Agreed Upon Performance Objectives/Results</td>
												<td>&nbsp;</td>
												<td width="14%">Weight in %</td>
											</tr>
										</table>
										<br>
										<table style="width: 100%">
											<tr>
												<td width="3%">1</td>
												<td width="82%"><textarea class="form-control"
														name="objectivesOne" id="firstarea" rows="2"
														maxlength="150" onkeyup="total(1);"
														style="font-family: Arial; font-size: 12pt;"
														title="Maximum length allowed is 150 characters">${presentYearObjectives.objectivesOne}</textarea></td>
												<td>&nbsp;</td>
												<td width="14%"><input type="text"
													name="objectivesOneWeight" required="required"
													class="form-control" id="first" onkeyup="total();"
													placeholder="1 to 100%"
													value="${presentYearObjectives.objectivesOneWeight}"
													onkeypress='return event.charCode >= 48 && event.charCode <= 57'
													onPaste="return false"></td>
											</tr>

										</table>
										<p id="1lp"
											style="color: red; position: absolute; left: 69em;"></p>
										<br>


										<table style="width: 100%">
											<tr>
												<td width="3%">2</td>
												<td width="82%"><textarea class="form-control"
														name="objectivesTwo" id="secondarea" rows="2"
														maxlength="150" onkeyup="total(2);"
														style="font-family: Arial; font-size: 12pt;"
														title="Maximum length allowed is 150 characters">${presentYearObjectives.objectivesTwo}</textarea></td>
												<td>&nbsp;</td>
												<td width="14%"><input type="text"
													name="objectivesTwoWeight" required="required"
													class="form-control" id="second" onkeyup="total();"
													placeholder="1 to 100%"
													value="${presentYearObjectives.objectivesTwoWeight}"
													onkeypress='return event.charCode >= 48 && event.charCode <= 57'
													onPaste="return false"></td>
											</tr>

										</table>
										<p id="2lp"
											style="color: red; position: absolute; left: 69em;"></p>
										<br>


										<table style="width: 100%">
											<tr>
												<td width="3%">3</td>
												<td width="82%"><textarea class="form-control"
														name="objectivesThree" id="thirdarea" rows="2"
														maxlength="150"
														title="Maximum length allowed is 150 characters"
														style="font-family: Arial; font-size: 12pt;"
														onkeyup="total(3);" placeholder="3">${presentYearObjectives.objectivesThree}</textarea></td>
												<td>&nbsp;</td>
												<td width="14%"><input type="text"
													name="objectivesThreeWeight" required="required"
													class="form-control" id="third" onkeyup="total();"
													placeholder="1 to 100%"
													value="${presentYearObjectives.objectivesThreeWeight}"
													onkeypress='return event.charCode >= 48 && event.charCode <= 57'
													onPaste="return false"></td>
											</tr>

										</table>
										<p id="3lp"
											style="color: red; position: absolute; left: 69em;"></p>
										<br>

										<table style="width: 100%">
											<tr>
												<td width="3%">4</td>
												<td width="82%"><textarea class="form-control"
														name="objectivesFour" id="fourarea" rows="2"
														maxlength="150"
														title="Maximum length allowed is 150 characters"
														style="font-family: Arial; font-size: 12pt;"
														onkeyup="total(4);" placeholder="4">${presentYearObjectives.objectivesFour}</textarea></td>
												<td>&nbsp;</td>
												<td width="14%"><input type="text"
													name="objectivesFourWeight" required="required"
													class="form-control" id="four" onkeyup="total();"
													placeholder="1 to 100%"
													value="${presentYearObjectives.objectivesFourWeight}"
													onkeypress='return event.charCode >= 48 && event.charCode <= 57'
													onPaste="return false"></td>
											</tr>

										</table>
										<p id="4lp"
											style="color: red; position: absolute; left: 69em;"></p>
										<br>

										<table style="width: 100%">
											<tr>
												<td width="3%">5</td>
												<td width="82%"><textarea class="form-control"
														name="objectivesFive" id="fivearea" rows="2"
														maxlength="150"
														title="Maximum length allowed is 150 characters"
														style="font-family: Arial; font-size: 12pt;"
														onkeyup="total(5);" placeholder="5">${presentYearObjectives.objectivesFive}</textarea></td>
												<td>&nbsp;</td>
												<td width="14%"><input type="text"
													name="objectivesFiveWeight" required="required"
													class="form-control" id="five" onkeyup="total();"
													placeholder="1 to 100%"
													value="${presentYearObjectives.objectivesFiveWeight}"
													onkeypress='return event.charCode >= 48 && event.charCode <= 57'
													onPaste="return false"></td>
											</tr>

										</table>
										<p id="5lp"
											style="color: red; position: absolute; left: 69em;"></p>
										<br>

										<table style="width: 100%">
											<tr>
												<td width="3%">&nbsp;</td>
												<td width="82%"></td>
												<td>&nbsp;</td>
												<td width="14%">Total: <span id="tscore"></span>
											</tr>
										</table>
										<br> <input type="hidden" name="overallScore"
											id="totalScore" value="${presentYearObjectives.overallScore}">
										</td>


									</div>




									<%-- <div class="form-actions">
										<div class="row">
											<div class="col-md-12">
												<!-- <button type="button" class="btn green" href="#">Back
													& Save</button> -->
												&nbsp;&nbsp;&nbsp;
												<%
													String statusMssg = (String) session.getAttribute("supervisorstatus");

															if (String.valueOf(statusMssg).equalsIgnoreCase("MANAGER COMPLETED")) {
												%>



												<%
													} else {
												%>
												<button type="submit" class="btn green" name="backAndSave">Back
													& Save</button>
												&nbsp;&nbsp;&nbsp;
												<button type="submit" class="btn green" name="nextAndSave">Next
													& Save</button>

												<%
													}
												%>
											</div>
											<!-- 												<div class="col-md-12"> -->
											<!-- 													<input type="submit" value="7 of 10" class="btn green"> -->
											<!-- 												</div> -->
										</div>

										<lable type="button"
											style="position: relative;left: 73em; bottom: 19px">4
										of 7</lable>


									</div> --%>

									<%-- 	</c:forEach> --%>
								</c:if>



								<c:if test="${empty presentYearObjectives}">

									<div class="form-body">
										<p>Agreed Upon Objectives (Specific, Measurable,
											Achievable, Results Based, and Time Bound)</p>

										<table style="width: 100%">
											<tr>
												<td width="85%" colspan="2">2017 
													Agreed Upon Performance Objectives/Results</td>
												<td>&nbsp;</td>
												<td width="14%">Weight in %</td>
											</tr>
										</table>
										<br>


										<table style="width: 100%">
											<tr>
												<td width="3%">1</td>
												<td width="82%"><textarea class="form-control"
														name="objectivesOne" rows="2" id="firstarea"
														maxlength="150"
														title="Maximum length allowed is 150 characters"
														style="font-family: Arial; font-size: 12pt;"
														onkeyup="total(1);"></textarea></td>
												<td>&nbsp;</td>
												<td width="14%"><input type="text"
													name="objectivesOneWeight" required="required"
													class="form-control" id="first" onkeyup="total(11);"
													placeholder="1 to 100%"
													onkeypress='return event.charCode >= 48 && event.charCode <= 57'
													onPaste="return false"></td>

											</tr>

										</table>
										<p id="1lp"
											style="color: red; position: absolute; left: 69em;"></p>
										<br>

										<table style="width: 100%">
											<tr>
												<td width="3%">2</td>
												<td width="82%"><textarea class="form-control"
														name="objectivesTwo" rows="2" id="secondarea"
														onkeyup="total(2)" maxlength="150"
														style="font-family: Arial; font-size: 12pt;"
														title="Maximum length allowed is 150 characters"></textarea></td>
												<td>&nbsp;</td>
												<td width="14%"><input type="text"
													name="objectivesTwoWeight" required="required"
													class="form-control" id="second" onkeyup="total()"
													placeholder="1 to 100%"
													onkeypress='return event.charCode >= 48 && event.charCode <= 57'
													onPaste="return false"></td>
											</tr>

										</table>
										<p id="2lp"
											style="color: red; position: absolute; left: 69em;"></p>
										<br>

										<table style="width: 100%">
											<tr>
												<td width="3%">3</td>
												<td width="82%"><textarea class="form-control"
														name="objectivesThree" id="thirdarea" rows="2"
														maxlength="150" onkeyup="total(3)"
														style="font-family: Arial; font-size: 12pt;"
														title="Maximum length allowed is 150 characters"></textarea></td>
												<td>&nbsp;</td>
												<td width="14%"><input type="text"
													name="objectivesThreeWeight" required="required"
													class="form-control" id="third" onkeyup="total()"
													placeholder="1 to 100%"
													onkeypress='return event.charCode >= 48 && event.charCode <= 57'
													onPaste="return false"></td>
											</tr>

										</table>
										<p id="3lp"
											style="color: red; position: absolute; left: 69em;"></p>
										<br>

										<table style="width: 100%">
											<tr>
												<td width="3%">4</td>
												<td width="82%"><textarea class="form-control"
														name="objectivesFour" onkeyup="total(4)" id="fourarea"
														rows="2" maxlength="150"
														style="font-family: Arial; font-size: 12pt;"
														title="Maximum length allowed is 150 characters"></textarea></td>
												<td>&nbsp;</td>
												<td width="14%"><input type="text"
													name="objectivesFourWeight" required="required"
													class="form-control" id="four" onkeyup="total();"
													placeholder="1 to 100%"
													onkeypress='return event.charCode >= 48 && event.charCode <= 57'
													onPaste="return false"></td>
											</tr>

										</table>
										<p id="4lp"
											style="color: red; position: absolute; left: 69em;"></p>
										<br>

										<table style="width: 100%">
											<tr>
												<td width="3%">5</td>
												<td width="82%"><textarea class="form-control"
														name="objectivesFive" id="fivearea" rows="2"
														maxlength="150"
														title="Maximum length allowed is 150 characters"
														style="font-family: Arial; font-size: 12pt;"
														onkeyup="total(5)"></textarea></td>
												<td>&nbsp;</td>
												<td width="14%"><input type="text"
													name="objectivesFiveWeight" required="required"
													class="form-control" id="five" onkeyup="total();"
													placeholder="1 to 100%"
													onkeypress='return event.charCode >= 48 && event.charCode <= 57'
													onPaste="return false"></td>
											</tr>

										</table>
										<p id="5lp"
											style="color: red; position: absolute; left: 69em;"></p>
										<br>


										<table style="width: 100%">
											<tr>
												<td width="3%">&nbsp;</td>
												<td width="82%"></td>
												<td>&nbsp;</td>
												<td width="14%">Total: <span id="tscore"></span>
											</tr>
										</table>
										<br> <input type="hidden" name="overallScore"
											id="totalScore">
									</div>

									<!-- <div class="form-actions">
										<div class="row">
											<div class="col-md-12">
												<button type="submit" class="btn green" name="backAndSave">Back
													& Save</button>
												&nbsp;&nbsp;&nbsp;
												<button type="submit" class="btn green" name="nextAndSave">Next
													& Save</button>
											</div>
																						<div class="col-md-12">
																							<input type="submit" value="7 of 10" class="btn green">
																						</div>
										</div>

										<lable type="button"
											style="position: relative;left: 73em; bottom: 18px">4
										of 7</lable>


									</div> -->
								</c:if>



								<div class="form-actions">
									<div class="row">
										<div class="col-md-12">
											<!-- <button type="button" class="btn green" href="#">Back
													& Save</button> -->
											&nbsp;&nbsp;&nbsp;
											<%
												String statusMssg = (String) session.getAttribute("supervisorstatus");

											if ((String.valueOf(statusMssg).equalsIgnoreCase("MANAGER COMPLETED")) ||
													(String.valueOf(statusMssg).equalsIgnoreCase("HR APPROVED"))
													||(String.valueOf(statusMssg).equalsIgnoreCase("CLOSED"))){
											%>

											<a href="<c:url value="developmentGoalsScreen.do"></c:url>" class="btn green">Next</a>

											<%
												} else {
											%>
											<button type="submit" class="btn green" name="backAndSave">Back
												& Save</button>		&nbsp;&nbsp;&nbsp;
													<button type="submit" class="btn green" name="save">
												 Save</button>
											&nbsp;&nbsp;&nbsp;
									
											<button type="submit" class="btn green" name="nextAndSave">Next
												& Save</button>

											<%
												}
											%>
										</div>
										<!-- 												<div class="col-md-12"> -->
										<!-- 													<input type="submit" value="7 of 10" class="btn green"> -->
										<!-- 												</div> -->
									</div>

									<lable type="button"
										style="position: relative;left: 73em; bottom: 19px">4
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

<script>
	function total(i) {

		//	alert(i);
		var result;
		var first;
		var second;
		var third;
		var four;
		var five;

		first = document.getElementById('first').value;
		second = document.getElementById('second').value;
		third = document.getElementById('third').value;
		four = document.getElementById('four').value;
		five = document.getElementById('five').value;

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
		/* 
		 if (i == 20) {

		 if (document.getElementById("first").value == 0
		 || document.getElementById("second").value == 0
		 || document.getElementById("third").value == 0
		 || document.getElementById("four").value == 0
		 || document.getElementById("five").value == 0) {

		 alert("field should be 1 to 100%")

		 return false;

		 }

		 } */

		if (i == 1 || i == 0) {

			document.getElementById('first').disabled = true;
			document.getElementById('secondarea').disabled = true;
			document.getElementById('second').disabled = true;
			document.getElementById('thirdarea').disabled = true;
			document.getElementById('third').disabled = true;
			document.getElementById('fourarea').disabled = true;
			document.getElementById('four').disabled = true;
			document.getElementById('fivearea').disabled = true;
			document.getElementById('five').disabled = true;

		}

		var firstarea = document.getElementById('firstarea').value;

		if (firstarea.trim()) {

			document.getElementById('first').disabled = false;
			document.getElementById('secondarea').disabled = false;

			if (i == 20) {

				if (document.getElementById("first").value == 0
						|| document.getElementById("first").value > 100) {

					alert("Each row has to be between 1% and 100%");

			//		return false;
				}
			}

		}
		var secondarea = document.getElementById('secondarea').value;

		if (secondarea.trim()) {

			document.getElementById('second').disabled = false;
			document.getElementById('thirdarea').disabled = false;

			if (i == 20) {

				if (document.getElementById("second").value == 0
						|| document.getElementById("second").value > 100) {

					alert("Each row has to be between 1% and 100%");

			//		return false;
				}
			}

			if (first == 0) {

				document.getElementById("1lp").innerHTML = "please enter the value.";
				document.getElementById("1lp").style.color = "red";

			} else {
				document.getElementById("1lp").innerHTML = "";
				document.getElementById("1lp").style.color = "black";

			}

		}

		if (!secondarea.trim()) {

			document.getElementById('second').disabled = true;
			document.getElementById('second').value = "";
			document.getElementById('thirdarea').disabled = true;
			document.getElementById('third').disabled = true;
			document.getElementById('fourarea').disabled = true;
			document.getElementById('four').disabled = true;
			document.getElementById('fivearea').disabled = true;
			document.getElementById('five').disabled = true;
			document.getElementById("2lp").innerHTML = "";

		}

		var thirdarea = document.getElementById('thirdarea').value;
		if (thirdarea.trim()) {

			document.getElementById('third').disabled = false;
			document.getElementById('fourarea').disabled = false;

			if (i == 20) {

				if (document.getElementById("third").value == 0
						|| document.getElementById("third").value > 100) {

					alert("Each row has to be between 1% and 100%");

				//	return false;
				}
			}

			if (second == 0) {

				document.getElementById("2lp").innerHTML = "please enter the value.";
				document.getElementById("2lp").style.color = "red";

			} else {
				document.getElementById("2lp").innerHTML = "";
				document.getElementById("2lp").style.color = "black";

			}

		}
		if (!thirdarea.trim()) {

			document.getElementById('third').disabled = true;
			document.getElementById('third').value = "";
			document.getElementById('fourarea').disabled = true;
			document.getElementById('four').disabled = true;
			document.getElementById('four').value = "";
			document.getElementById('fivearea').disabled = true;
			document.getElementById('five').disabled = true;
			document.getElementById('five').value = "";
			document.getElementById("3lp").innerHTML = "";

		}

		var fourarea = document.getElementById('fourarea').value;
		if (fourarea.trim()) {

			document.getElementById('four').disabled = false;
			document.getElementById('fivearea').disabled = false;

			if (i == 20) {

				if (document.getElementById("four").value == 0
						|| document.getElementById("four").value > 100) {

					alert("Each row has to be between 1% and 100%");

			//	return false;
				}
			}

			if (third == 0) {

				document.getElementById("3lp").innerHTML = "please enter the value.";
				document.getElementById("3lp").style.color = "red";

			} else {
				document.getElementById("3lp").innerHTML = "";
				document.getElementById("3lp").style.color = "black";

			}
		}
		if (!fourarea.trim()) {
			// is empty

			document.getElementById('four').disabled = true;
			document.getElementById('four').value = "";
			document.getElementById('fivearea').disabled = true;
			document.getElementById('five').disabled = true;
			document.getElementById('five').value = "";
			document.getElementById("4lp").innerHTML = "";

		}
		var fivearea = document.getElementById('fivearea').value;

		if (fivearea.trim()) {

			document.getElementById('five').disabled = false;

			if (i == 20) {

				if (document.getElementById("five").value == 0
						|| document.getElementById("five").value > 100) {

					alert("Each row has to be between 1% and 100%");

			//		return false;
				}
			}

			if (four == 0) {

				document.getElementById("4lp").innerHTML = "please enter the value.";
				document.getElementById("4lp").style.color = "red";

			} else {
				document.getElementById("4lp").innerHTML = "";
				document.getElementById("4lp").style.color = "black";

			}

			if (five == 0) {

				document.getElementById("5lp").innerHTML = "please enter the value.";
				document.getElementById("5lp").style.color = "red";
				//		return false;

			} else {
				document.getElementById("5lp").innerHTML = "";
				document.getElementById("5lp").style.color = "black";

			}

		}
		if (!fivearea.trim()) {

			document.getElementById('five').disabled = true;
			document.getElementById('five').value = "";
			document.getElementById("5lp").innerHTML = "";

		}

		result = parseFloat(first) + parseFloat(second) + parseFloat(third)
				+ parseInt(four) + parseFloat(five);
		 if (result > 100) {
			alert("Total has exceeded 100%");
			document.getElementById('tscore').innerHTML = result;
			document.getElementById('totalScore').value = result;
			document.getElementById("tscore").style.color = "red";
			return false;

		} 
		if (result != 100) {

			if (i == 20) {

				alert("Total has to be 100%");
			}

			document.getElementById('tscore').innerHTML = result;
			document.getElementById('totalScore').value = result;
			document.getElementById("tscore").style.color = "red";

		//	return false;

		}

		if (result == 100) {
			document.getElementById('tscore').innerHTML = result;
			document.getElementById('totalScore').value = result;
			document.getElementById("tscore").style.color = "black";
		}

		if (i == 20) {

			if (result != 100) {
				alert("Total has to be 100%");
			}
		}

	}
	window.onload = total(0);
</script>


</html>