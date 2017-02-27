<%@page import="com.lisi.annualassessment.util.Converters"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white"
	onload="object(0)">
	<script type="text/javascript">
		$(document).ready(
				function() {
					//alert('<c:out value="${status}"/>');
					object();
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
								action="/AnnualAssessmenT/objectiveAchievementOperation.do"
								method="post" modelAttribute="exemptSection2Pojo"
								id="form_sample_3" class="form-horizontal"
								onsubmit="return object(20)">
								<c:if test="${!empty objData && empty imessage }">
									
										<div class="form-body">
											<div class="form-group">
												<div class="col-md-10">
													<br>
													<c:out value="${sessionScope.loginYear}"></c:out>
													Agreed Upon Objectives.
												</div>
												<div class="col-md-2">
													Achievement Level For
													<c:out value="${sessionScope.loginYear}"></c:out></div>
											</div>

											<div class="form-group">
												<div class="col-md-1">1</div>
												<div class="col-md-9">
													<textarea class="form-control" rows="2" cols="75"
														maxlength="150" id="1" name="section2A1Objective"
														title="Maximum length of this field is 150 characters"
														style="font-family: Arial; font-size: 12pt;"
														onkeyup="object(1)">${objData.section2A1Objective}</textarea>
												</div>


												<div class="col-md-2">
													<input required="required" type="text" class="form-control"
														id="1l" onkeyup="object()" placeholder="1 to 100%"
														name="Section2A1Level" value="${objData.section2A1Level}"
														onkeypress='return event.charCode >= 48 && event.charCode <= 57'
														onPaste="return false">
													<p id="1lp"></p>
												</div>
											</div>

											<div class="form-group">
												<div class="col-md-1">2</div>
												<div class="col-md-9">
													<textarea class="form-control" rows="2" cols="75"
														maxlength="150" id="2" name="section2A2Objective"
														title="Maximum length of this field is 150 characters"
														style="font-family: Arial; font-size: 12pt;"
														onkeyup="object(2)">${objData.section2A2Objective}</textarea>
												</div>

												<div class="col-md-2">
													<input type="text" class="form-control" id="2l"
														onkeyup="object()" required="required"
														placeholder="1 to 100%" name="Section2A2Level"
														value="${objData.section2A2Level}"
														onkeypress='return event.charCode >= 48 && event.charCode <= 57'
														onPaste="return false">
													<p id="2lp"></p>
												</div>
											</div>

											<div class="form-group">
												<div class="col-md-1">3</div>
												<div class="col-md-9">
													<textarea class="form-control" rows="2" cols="75"
														maxlength="150" id="3" name="section2A3Objective"
														title="Maximum length of this field is 150 characters"
														style="font-family: Arial; font-size: 12pt;"
														onkeyup="object(3)">${objData.section2A3Objective}</textarea>
												</div>
												<div class="col-md-2">
													<input type="text" class="form-control" id="3l"
														required="required" placeholder="1 to 100%"
														onkeyup="object()" name="Section2A3Level"
														value="${objData.section2A3Level}"
														onkeypress='return event.charCode >= 48 && event.charCode <= 57'
														onPaste="return false">
													<p id="3lp"></p>
												</div>
											</div>

											<div class="form-group">
												<div class="col-md-1">4</div>
												<div class="col-md-9">
													<textarea class="form-control" rows="2" cols="75"
														maxlength="150" id="4" name="section2A4Objective"
														title="Maximum length of this field is 150 characters"
														style="font-family: Arial; font-size: 12pt;"
														onkeyup="object(4)">${objData.section2A4Objective}</textarea>
												</div>
												<div class="col-md-2">
													<input type="text" class="form-control" id="4l"
														required="required" onkeyup="object()"
														placeholder="1 to 100%" name="Section2A4Level"
														value="${objData.section2A4Level}"
														onkeypress='return event.charCode >= 48 && event.charCode <= 57'
														onPaste="return false">
													<p id="4lp"></p>
												</div>
											</div>

											<div class="form-group">
												<div class="col-md-1">5</div>
												<div class="col-md-9">
													<textarea class="form-control" rows="2" cols="75"
														maxlength="150" id="5" name="section2A5Objective"
														title="Maximum length of this field is 150 characters"
														style="font-family: Arial; font-size: 12pt;"
														onkeyup="object(5)">${objData.section2A5Objective}</textarea>
												</div>
												<div class="col-md-2">
													<input type="text" class="form-control" id="5l"
														required="required" onkeyup="object()"
														placeholder="1 to 100%" name="Section2A5Level"
														value="${objData.section2A5Level}"
														onkeypress='return event.charCode >= 48 && event.charCode <= 57'
														onPaste="return false">
													<p id="5lp"></p>
												</div>
											</div>


											<div class="form-group">
												<div class="col-md-10"></div>
												<div class="col-md-2">
													Total:&nbsp;<span id="sumofavg"></span>
													<!-- <p id="sumofavg"></p> -->
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
										<%-- <div class="form-actions">
											<div class="row">
												<div class="col-md-12">
													<%
														String statusMssg = (String) session.getAttribute("supervisorstatus");

																	if (String.valueOf(statusMssg).equalsIgnoreCase("MANAGER COMPLETED")) {
													%>



													<%
														} else {
													%>
													<button type="submit" id="button" name="nextandsave"
														class="btn green">Next & Save</button>

													<%
														}
													%>
												</div>
											</div>
											<div class="row" align="right">1 of
												7&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
										</div> --%>
									
								</c:if>
								<c:if test="${(empty objData && !empty imessage)||(!empty objData && !empty imessage)}">
								
									<div class="form-body">
										<div class="form-group">
											<div class="col-md-10">
												<br>
												<c:out value="${sessionScope.loginYear}"></c:out>
												Agreed Upon Objectives
											</div>
											<div class="col-md-2">
												Achievement Level For
												<c:out value="${sessionScope.loginYear}"></c:out></div>
										</div>

										<div class="form-group">
											<div class="col-md-1">1.</div>
											<div class="col-md-9">
												<textarea class="form-control" rows="2" cols="75"
													maxlength="150" id="1" name="section2A1Objective"
													onkeyup="object();"
													style="font-family: Arial; font-size: 12pt;">${objData.section2A1Objective}</textarea>
											</div>
											<!-- <p id="demo"></p> -->
											<div class="col-md-2">
												<input type="text" class="form-control" id="1l"
													onkeyup="object();" name="Section2A1Level"
													placeholder="1 to 100%" value="${objData.section2A1Level}"
													onkeypress='return event.charCode >= 48 && event.charCode <= 57'
													onPaste="return false">
												<p id="1lp"></p>
											</div>

										</div>

										<div class="form-group">
											<div class="col-md-1">2</div>
											<div class="col-md-9">
												<textarea class="form-control" rows="2" cols="75"
													onkeyup="object()" maxlength="150" id="2"
													name="section2A2Objective"
													style="font-family: Arial; font-size: 12pt;">${objData.section2A2Objective}</textarea>
											</div>
											<div class="col-md-2">
												<input type="text" class="form-control" id="2l"
													placeholder="1 to 100%" onkeyup="object()"
													name="Section2A2Level" value="${objData.section2A2Level}"
													onkeypress='return event.charCode >= 48 && event.charCode <= 57'
													onPaste="return false">
												<p id="2lp"></p>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-1">3</div>
											<div class="col-md-9">
												<textarea class="form-control" rows="2" cols="75"
													onkeyup="object(3)" maxlength="150" id="3"
													name="section2A3Objective"
													style="font-family: Arial; font-size: 12pt;">${objData.section2A3Objective}</textarea>
											</div>
											<div class="col-md-2">
												<input type="text" class="form-control" id="3l"
													placeholder="1 to 100%" onkeyup="object()"
													name="Section2A3Level" value="${objData.section2A3Level}"
													onkeypress='return event.charCode >= 48 && event.charCode <= 57'
													onPaste="return false">
												<p id="3lp"></p>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-1">4</div>
											<div class="col-md-9">
												<textarea class="form-control" rows="2" cols="75"
													onkeyup="object(4)" maxlength="150" id="4"
													name="section2A4Objective" 
													style="font-family: Arial; font-size: 12pt;">${objData.section2A4Objective}</textarea>
											</div>
											<div class="col-md-2">
												<input type="text" class="form-control" id="4l"
													placeholder="1 to 100%" onkeyup="object()"
													name="Section2A4Level" value="${objData.section2A4Level}"
													onkeypress='return event.charCode >= 48 && event.charCode <= 57'
													onPaste="return false">
												<p id="4lp"></p>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-1">5</div>
											<div class="col-md-9">
												<textarea class="form-control" rows="2" cols="75"
													onkeyup="object(5)" maxlength="150" id="5"
													name="section2A5Objective"
													style="font-family: Arial; font-size: 12pt;">${objData.section2A5Objective}</textarea>
											</div>
											<div class="col-md-2">
												<input type="text" class="form-control" id="5l"
													placeholder="1 to 100%" onkeyup="object()"
													name="Section2A5Level" value="${objData.section2A5Level}"
													onkeypress='return event.charCode >= 48 && event.charCode <= 57'
													onPaste="return false">
												<p id="5lp"></p>
											</div>
										</div>

										<!-- <div class="form-group">
											<div class="col-md-10"></div>
											<div class="col-md-2">
												Total:
												<p id="sumofavg"></p>
											</div>
											<div class="col-xs-2" onkeyup="object()"></div>
										</div> -->
										<div class="form-group">
											<div class="col-md-10"></div>
											<div class="col-md-2">
												Total:&nbsp;<span id="sumofavg"></</span>
												<!-- <p id="sumofavg"></p> -->
											</div>

											<input type="hidden" name="sumofavg" id="hiddenavg">

											<div class="col-xs-2" onkeyup="object()"></div>
										</div>

										<div class="form-group">
											<div class="col-md-12">
												Additional Comments:<br>
												<textarea class="form-control" id="Comments" maxlength="200"
													rows="4" name="Section2AdditionalComments"
													style="font-family: Arial; font-size: 12pt;"></textarea>
											</div>
										</div>

									</div>
									<!-- <div class="form-actions">
										<div class="row">
											<div class="col-md-12">
												<button type="submit" id="button" name="nextandsave"
													class="btn green">Next & Save</button>
											</div>
										</div>
										<div class="row" align="right">1 of
											7&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
									</div> -->

								
								</c:if>
								<div class="form-actions">
									<div class="row">
										<div class="col-md-12">
											<%
												String statusMssg = (String) session.getAttribute("supervisorstatus");

													if ((String.valueOf(statusMssg).equalsIgnoreCase("MANAGER COMPLETED")) ||
															(String.valueOf(statusMssg).equalsIgnoreCase("HR APPROVED"))
															|| (String.valueOf(statusMssg).equalsIgnoreCase("CLOSED"))) {
											%>
											<a href="<c:url value="SkillsSelfAssessment.do"></c:url>" class="btn green">Back</a>
											<a href="<c:url value="managerSkillAssessment.do"></c:url>" class="btn green">Next</a>
											
											<%
												} else {
											%>
											
												<button type="submit" id="button" name="save"
												class="btn green">Save</button>
											&nbsp;&nbsp;&nbsp;&nbsp;
											<button type="submit" id="button" name="nextandsave"
												class="btn green">Next & Save</button>
												

											<%
												}
											%>
										</div>
									</div>
									<div class="row" align="right">1 of
										7&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
								</div>

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
<script>
	function object(i) {

		var onet = 0;
		var one = 0;
		var two = 0;
		var total = 0;
		var three = 0;
		var total3 = 0;
		var total4 = 0;
		var four = 0;
		var five = 0;
		var total5 = 0;

		var total4 = 0;

		one = document.getElementById("1l").value;
		two = document.getElementById("2l").value;
		three = document.getElementById("3l").value;
		four = document.getElementById("4l").value;
		five = document.getElementById("5l").value;

		if (one == null || one.length == 0) {

			one = 0;
			one = parseInt(one);

		}

		if (two == null || two.length == 0) {

			two = 0;
			two = parseInt(two);
		}
		if (three == null || three.length == 0) {

			three = 0;
			three = parseInt(three);
		}
		if (four == null || four.length == 0) {

			four = 0;
			four = parseInt(four);
		}
		if (five == null || five.length == 0) {

			five = 0;
			five = parseInt(five);
		}

		var firstarea = document.getElementById('1').value;

		if (i == 1 || i == 0) {

			document.getElementById('1l').disabled = true;
			document.getElementById('2').disabled = true;
			document.getElementById('2l').disabled = true;
			document.getElementById('3').disabled = true;
			document.getElementById('3l').disabled = true;
			document.getElementById('4').disabled = true;
			document.getElementById('4l').disabled = true;
			document.getElementById('5').disabled = true;
			document.getElementById('5l').disabled = true;

		}

		if (firstarea.trim()) {

			document.getElementById('1l').disabled = false;
			/* document.getElementById('1l').focus(); */
			document.getElementById('2').disabled = false;

			if (i == 20) {

				if (document.getElementById("1l").value == 0
						|| document.getElementById("1l").value > 100) {

				//	alert("Each row has to be between 1% and 100%");

				//	return false;
				}
			}

		}

		var secondarea = document.getElementById('2').value;

		if (secondarea.trim()) {
			document.getElementById('2l').disabled = false;
			/* document.getElementById('2l').focus(); */
			document.getElementById('3').disabled = false;

			if (i == 20) {

				if (document.getElementById("2l").value == 0
						|| document.getElementById("2l").value > 100) {

				//	alert("field should be 1 to 100 %");

				//	return false;
				}
			}

			if (one == 0) {

				document.getElementById("1lp").innerHTML = "please enter the value.";
				document.getElementById("1lp").style.color = "red";

			} else {
				document.getElementById("1lp").innerHTML = "";
				document.getElementById("1lp").style.color = "black";

			}

			/* if(two==0){
				
			
				return false;
			}  */
		}

		if (!secondarea.trim()) {
			document.getElementById('2l').disabled = true;
			document.getElementById('2l').value = "";
			document.getElementById('3').disabled = true;
			document.getElementById('3l').disabled = true;
			document.getElementById('4').disabled = true;
			document.getElementById('4l').disabled = true;
			document.getElementById('5').disabled = true;
			document.getElementById('5l').disabled = true;
		}

		var thirdarea = document.getElementById('3').value;

		if (thirdarea.trim()) {
			document.getElementById('3l').disabled = false;
			/* document.getElementById('3l').focus(); */
			document.getElementById('4').disabled = false;

			if (i == 20) {

				if (document.getElementById("3l").value == 0
						|| document.getElementById("3l").value > 100) {

					alert("Each row has to be between 1% and 100%");

			//		return false;
				}
			}

			if (two == 0) {

				document.getElementById("2lp").innerHTML = "please enter the value.";
				document.getElementById("2lp").style.color = "red";

			} else {
				document.getElementById("2lp").innerHTML = "";
				document.getElementById("2lp").style.color = "black";

			}

			/* if(three==0){
				
				return false;
			} */
		}

		if (!thirdarea.trim()) {
			document.getElementById('3l').disabled = true;
			document.getElementById('3l').value = "";
			document.getElementById('4').disabled = true;
			document.getElementById('4l').disabled = true;
			document.getElementById('5').disabled = true;
			document.getElementById('5l').disabled = true;
			document.getElementById("2lp").innerHTML = "";
			document.getElementById("2lp").style.color = "black";
		}

		var fourarea = document.getElementById('4').value;

		if (fourarea.trim()) {
			document.getElementById('4l').disabled = false;
			/* document.getElementById('4l').focus(); */
			document.getElementById('5').disabled = false;

			if (i == 20) {

				if (document.getElementById("4l").value == 0
						|| document.getElementById("4l").value > 100) {

					alert("Each row has to be between 1% and 100%");

			//		return false;
				}
			}

			if (three == 0) {

				document.getElementById("3lp").innerHTML = "please enter the value.";
				document.getElementById("3lp").style.color = "red";

			} else {
				document.getElementById("3lp").innerHTML = "";
				document.getElementById("3lp").style.color = "black";

			}
			/* 	if(four==0){
					
					
					return false;
				} */
		}

		if (!fourarea.trim()) {
			document.getElementById('4l').disabled = true;
			document.getElementById('5').disabled = true;
			document.getElementById('5l').disabled = true;
			document.getElementById("3lp").innerHTML = "";
			document.getElementById("3lp").style.color = "black";
			document.getElementById('4l').value = "";
		}

		var fivearea = document.getElementById('5').value;

		if (fivearea.trim()) {
			document.getElementById('5l').disabled = false;
			/* document.getElementById('5l').focus(); */

			if (i == 20) {

				if (document.getElementById("5l").value == 0
						|| document.getElementById("5l").value > 100) {

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

		}// five area..

		if (!fivearea.trim()) {
			document.getElementById('5l').disabled = true;
			document.getElementById("4lp").innerHTML = "";
			document.getElementById("4lp").style.color = "black";
			document.getElementById("5lp").innerHTML = "";
			document.getElementById("5lp").style.color = "black";
			document.getElementById('5l').value = "";
		}

		total = parseInt(one) + parseInt(two);
		total3 = parseInt(total) + parseInt(three);
		total4 = parseInt(total3) + parseInt(four);
		total5 = parseInt(total4) + parseInt(five);

		if (total5 > 100) {

			//	alert("Total has exceeded 100%");
			document.getElementById("sumofavg").innerHTML = total5;
			document.getElementById("sumofavg").style.color = "red";

	//		return false;
		}
		if (total5 != 100) {

			if (i == 20) {

				if (total5 > 100) {

					alert(" Total has to be 100%");

					return false;
				}
			}

			document.getElementById("hiddenavg").value = total5;

			document.getElementById("sumofavg").innerHTML = total5;
			document.getElementById("sumofavg").style.color = "red";
		//	return false;
		}
		if (total5 == 100) {
			document.getElementById("sumofavg").innerHTML = total5;
			document.getElementById("sumofavg").style.color = "black";

		}

		if (i == 20) {

			if (total5 != 100) {

				alert("Total has to be 100%");

			//	return false;
			}
		}

		document.getElementById("sumofavg").innerHTML = total5;

	}
	window.onload = object(0);
</script>