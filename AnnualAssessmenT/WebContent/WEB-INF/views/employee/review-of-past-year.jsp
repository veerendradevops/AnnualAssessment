<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.lisi.annualassessment.util.Converters"%>


<script type="text/javascript">
	$(document)
			.ready(
					function() {

						finalSubmission();

						<c:if test="${status=='COMPLETED' || status=='MANAGER COMPLETED' || status=='HR APPROVED' || status=='CLOSED'}">

						$("#testDiv")
								.find("input,button,textarea,select,radio")
								.attr("disabled", "disabled");

						</c:if>

					});
	$(document).ready(
			function() {
				//alert('<c:out value="${status}"/>');
				<c:if test="${supervisor=='supervisor'}">

				$("#testDiv").find("input,button,textarea,select,radio").attr(
						"disabled", "disabled");

				</c:if>

			});
</script>
<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">

	<!-- onload="verifyChecked()" -->


	<!-- BEGIN CONTENT -->
	<div class="page-content-wrapper" id="testDiv">
		<!-- BEGIN CONTENT BODY -->
		<div class="page-content">
			<!-- BEGIN PAGE HEADER-->
			<p></p>
			<p></p>
			<p></p>
			<!-- BEGIN PAGE BAR -->
			<div class="page-bar">
				<ul class="page-breadcrumb">
					<li><a href="#" class="disabled">Home</a> <i
						class="fa fa-circle"></i></li>
					<li><span>Review of <c:out value="${sessionScope.loginYear}"></c:out>
							Year
					</span></li>
				</ul>
			</div>
			<!-- END PAGE BAR -->
			<!-- BEGIN PAGE TITLE-->
			<h3 class="page-title">
				Review of
				<c:out value="${sessionScope.loginYear}"></c:out>
				Year &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:if test="${! empty errorStatus}">
				<c:out value="${errorStatus}"></c:out>
				</c:if>
			</h3>


			<!-- <h6>
				Please note, <font color="red">ALL FIELDS MARKED IN RED </font> have
				to be completed before being allowed to the next screen
			</h6> -->
			 <h6 id="headermessage">
				
			</h6>
			<!-- END PAGE TITLE-->
			<!-- END PAGE HEADER-->



			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN VALIDATION STATES-->
					<div class="portlet light portlet-fit portlet-form bordered">

						<div class="portlet-body">
							<!-- BEGIN FORM-->

							<form:form class="form-horizontal" name="exemptTeamMemberDetails"
								action="/AnnualAssessmenT/saveReviewOfPastYearDetails.do"
								method="POST" modelAttribute="exemptTeamMember"
								onsubmit="return reviewOfyear(20)">

								<c:if test="${!empty exemptTMDetails && empty imessage}">

									<script type="text/javascript">
										function finalSubmission() {

											var validate="yes";
											var pastyear = document
													.getElementById('pastyear').value;

											if (document
													.getElementById('pastyear').value == '') {

											
												document
														.getElementById('pastyear').style.border = "solid 1px red";
												validate="no"

											} else {

											
												document
														.getElementById('pastyear').style.border = "";
												
											}
											
											
											//changes done by Meeravali
											//First
											if (document
													.getElementById('listoftrainingone').value) {
												if (document
														.getElementById("EffectivenessOfB1").value) {
													document
															.getElementById('EffectivenessOfB1').style.border = "";
												} else {
													document
															.getElementById('EffectivenessOfB1').style.border = "solid 1px red";
													validate="no"
												}
											}

											else {

												document
														.getElementById('EffectivenessOfB1').style.border = "";
												
											}
											//Second

											if (document
													.getElementById('listoftrainingtwo').value) {
												if (document
														.getElementById("EffectivenessOfB2").value) {
													document
															.getElementById('EffectivenessOfB2').style.border = "";
												} else {
													document
															.getElementById('EffectivenessOfB2').style.border = "solid 1px red";
													validate="no"
												}
											}

											else {

												document
														.getElementById('EffectivenessOfB2').style.border = "";
											}
											//three
											if (document
													.getElementById('listoftrainingthree').value) {
												if (document
														.getElementById("EffectivenessOfB3").value) {
													document
															.getElementById('EffectivenessOfB3').style.border = "";
												} else {
													document
															.getElementById('EffectivenessOfB3').style.border = "solid 1px red";
													validate="no"
												}
											}

											else {

												document
														.getElementById('EffectivenessOfB3').style.border = "";
											}
											//fourth
											
											if (document
													.getElementById('listoftrainingfour').value) {
												if (document
														.getElementById("EffectivenessOfB4").value) {
													document
															.getElementById('EffectivenessOfB4').style.border = "";
												} else {
													document
															.getElementById('EffectivenessOfB4').style.border = "solid 1px red";
													validate="no"
												}
											}

											else {

												document
														.getElementById('EffectivenessOfB4').style.border = "";
											}
											

											//section1c
											var section1c = document
													.getElementById('section1c').value;
											
											if (document
													.getElementById('section1c').value == '') {

												document
														.getElementById('section1c').style.border = "solid 1px red";
												validate="no"

											} else {

												document
														.getElementById('section1c').style.border = "";
											}
											
											var section1d = document
													.getElementById('section1d').value;

											if (document
													.getElementById('section1d').value == '') {

												document
														.getElementById('section1d').style.border = "solid 1px red";
												validate="no"

												//		return false;
											} else {

												document
														.getElementById('section1d').style.border = "";
											}

											var section1D2 = document
													.getElementById('section1D2').value;

											if (document
													.getElementById('section1D2').value == '') {

												document
														.getElementById('section1D2').style.border = "solid 1px red";
												validate="no"

												//	return false;
											} else {

												document
														.getElementById('section1D2').style.border = "";
											}

											if ((document
													.getElementsByName("section1F1")[0].checked == false)
													&& (document
															.getElementsByName("section1F1")[1].checked == false)) {

												document
														.getElementById("section1fone").style.border = "solid 1px red";
												validate="no"
												//		return false;
											} else {
												document
														.getElementById("section1fone").style.border = "";
											}

											if ((document
													.getElementsByName("section1F3A")[0].checked == false)
													&& (document
															.getElementsByName("section1F3A")[1].checked == false)) {
												document
														.getElementById("section1ftwo").style.border = "solid 1px red";
												validate="no"

												//		return false;
											} else {
												document
														.getElementById("section1ftwo").style.border = "";
											}
											if ((document
													.getElementsByName("section1F1")[0].checked == true)) {

												if (!document
														.getElementById("Section1F2ONE").value
														.trim()) {
													document
															.getElementById("Section1F2ONE").style.border = "solid 1px red";
													validate="no"
													//alert("please fill the manidatroy fields");

													//		return false;
												}else{
												document
														.getElementById("Section1F2ONE").style.border = "";
												}
											}

											if (document
													.getElementsByName("section1F3A")[0].checked == true) {

												if ((document
														.getElementsByName("section1F3B")[0].checked == false
														&& document
																.getElementsByName("section1F3B")[1].checked == false
														&& document
																.getElementsByName("section1F3B")[2].checked == false
														&& document
																.getElementsByName("section1F3B")[3].checked == false
														&& document
																.getElementsByName("section1F3B")[4].checked == false
														&& document
																.getElementsByName("section1F3B")[5].checked == false && document
														.getElementsByName("section1F3B")[6].checked == false)
														&& (!document
																.getElementById("other").value
																.trim())) {

													document
															.getElementById("country").style.border = "solid 1px red";
													validate="no"

													//	return false;

												} else {
													document
															.getElementById("country").style.border = "";
												}

												
												if (document
														.getElementsByName("section1F3B1")[0].checked == false
														&& document
																.getElementsByName("section1F3B1")[1].checked == false
														&&  document
																.getElementsByName("section1F3B1")[2].checked == false) {
													//alert("plase  length of assignment ");

													document
															.getElementById("lengthAssessignment").style.border = "solid 1px red";
													validate="no"
													//	return false;

												} else {
													document
															.getElementById("lengthAssessignment").style.border = "";
												}

												
												if (document
														.getElementsByName("section1F3B2")[0].checked == false //true
														&& document
																.getElementsByName("section1F3B2")[1].checked == false) {
													document
															.getElementById("relocationMobility").style.border = "solid 1px red";
													validate="no"
													//alert("plase any relocation or mobility in the next 12 months ");
													//	return false;

												} else {
													document
															.getElementById("relocationMobility").style.border = "";
												}

											}// if close section1f3A.

											// validate="no"
											//alert(validate);
											if(validate=='no'){
												
												
												document.getElementById("headermessage").innerHTML="Please note, <font color='red'>ALL FIELDS MARKED IN RED </font> have to be completed before being allowed to the next screen"
											}
											
											
										}
									</script>

									<div class="form-body">
										<h4>A. Describe past year's key events and assess your
											results/achievements:</h4>
										<p>Include your contribution to business goals (Safety,
											Financial Results, Productivity, Improvements):</p>
										<div class="form-group">
											<div class="col-md-12">
												<textarea class="form-control" maxlength="300" rows="3"
													title="Maximum length allowed is 300 characters" cols="100"
													name="Section1A" id="pastyear" onkeyup="finalSubmission();"
													style="font-family: calibri; font-size: 12pt;">${ exemptTMDetails.section1A}</textarea>
											</div>
										</div>

										<h4>
											B. List of training completed in
											<c:out value="${sessionScope.loginYear}"></c:out>

										</h4>
										<div class="form-group">
											<div class="col-md-12">
												<textarea class="form-control"
													title="Maximum length allowed is 300 characters"
													name="section1B1" maxlength="300" rows="3" cols="100"
													placeholder="1" id="listoftrainingone"
													onkeyup="reviewOfyear();finalSubmission();"
													style="font-family: calibri; font-size: 12pt;">${exemptTMDetails.section1B1}</textarea>
											</div>
											<br />
											<%-- <label class="control-label col-md-1">1</label>
												<div class="col-md-11">
													<textarea class="form-control" title="Maximum length allowed is 300 characters" name="section1B1"
														id="Section1B1" maxlength="300" rows="3" cols="100">${exemptTMDetails.section1B1}</textarea>
												</div> --%>
										</div>

										<div class="form-group">
											<div class="col-md-6">&nbsp;</div>
											<label class="control-label col-md-2">Effectiveness
												of training</label>
											<div class="col-md-4">
												<select class="form-control" name="effectivenessOfB1"
													id="EffectivenessOfB1" onchange="finalSubmission();">
													<option value=""
														${exemptTMDetails.effectivenessOfB1==''?'selected':''}>Pick
														a value</option>
													<option value="Very satisfactory"
														${exemptTMDetails.effectivenessOfB1=='Very satisfactory'?'selected':''}>Very
														satisfactory</option>
													<option value="Quite satisfactory"
														${exemptTMDetails.effectivenessOfB1=='Quite satisfactory'?'selected':''}>Quite
														satisfactory</option>
													<option value="Partially satisfactory"
														${exemptTMDetails.effectivenessOfB1=='Partially satisfactory'?'selected':''}>Partially
														satisfactory</option>
													<option value="Unsatisfactory"
														${exemptTMDetails.effectivenessOfB1=='Unsatisfactory'?'selected':''}>Unsatisfactory</option>


													<%-- <option value="${exemptTMDetails.effectivenessOfB1}">${exemptTMDetails.effectivenessOfB1}</option>
														<option>Very satisfactory</option>
														<option>Quite satisfactory</option>
														<option>Partially satisfactory</option>
														<option>Unsatisfactory</option> --%>
												</select>
											</div>

										</div>

										<div class="form-group">
											<div class="col-md-12">
												<textarea class="form-control"
													title="Maximum length allowed is 300 characters"
													name="section1B2" maxlength="300" rows="3" cols="100"
													placeholder="2" id="listoftrainingtwo"
													onkeyup="reviewOfyear();finalSubmission();"
													style="font-family: calibri; font-size: 12pt;">${exemptTMDetails.section1B2}</textarea>
											</div>
											<br />
											<%-- <label class="control-label col-md-1">2</label>
												<div class="col-md-11">
													<textarea class="form-control" title="Maximum length allowed is 300 characters" name="section1B2" 
														id="Section1B2" maxlength="300" rows="3" cols="100">${exemptTMDetails.section1B2}</textarea>
												</div> --%>
										</div>

										<div class="form-group">
											<div class="col-md-6">&nbsp;</div>
											<label class="control-label col-md-2">Effectiveness
												of training</label>
											<div class="col-md-4">
												<select class="form-control" name="effectivenessOfB2"
													id="EffectivenessOfB2" onchange="finalSubmission();">

													<option value=""
														${exemptTMDetails.effectivenessOfB2==''?'selected':''}>Pick
														a value</option>
													<option value="Very satisfactory"
														${exemptTMDetails.effectivenessOfB2=='Very satisfactory'?'selected':''}>Very
														satisfactory</option>
													<option value="Quite satisfactory"
														${exemptTMDetails.effectivenessOfB2=='Quite satisfactory'?'selected':''}>Quite
														satisfactory</option>
													<option value="Partially satisfactory"
														${exemptTMDetails.effectivenessOfB2=='Partially satisfactory'?'selected':''}>Partially
														satisfactory</option>
													<option value="Unsatisfactory"
														${exemptTMDetails.effectivenessOfB2=='Unsatisfactory'?'selected':''}>Unsatisfactory</option>

													<%-- <option value="${exemptTMDetails.effectivenessOfB2}">${exemptTMDetails.effectivenessOfB2}</option>
														<option>Very satisfactory</option>
														<option>Quite satisfactory</option>
														<option>Partially satisfactory</option>
														<option>Unsatisfactory</option> --%>
												</select>
											</div>

										</div>


										<div class="form-group">
											<div class="col-md-12">
												<textarea class="form-control"
													title="Maximum length allowed is 300 characters"
													name="section1B3" maxlength="300" rows="3" cols="100"
													placeholder="3" id="listoftrainingthree"
													onkeyup="reviewOfyear();finalSubmission();"
													style="font-family: calibri; font-size: 12pt;">${exemptTMDetails.section1B3}</textarea>
											</div>
											<br />
											<%-- <label class="control-label col-md-1">3</label>
												<div class="col-md-11">
													<textarea class="form-control" title="Maximum length allowed is 300 characters" id="Comments" maxlength="300" rows="3" cols="100"
														name="section1B3" id="Section1B3">"${exemptTMDetails.section1B3}"</textarea>
												</div> --%>
										</div>

										<div class="form-group">
											<div class="col-md-6">&nbsp;</div>
											<label class="control-label col-md-2">Effectiveness
												of training</label>
											<div class="col-md-4">
												<select class="form-control" name="effectivenessOfB3"
													id="EffectivenessOfB3" onchange="finalSubmission();">
													<option value=""
														${exemptTMDetails.effectivenessOfB3==''?'selected':''}>Pick
														a value</option>
													<option value="Very satisfactory"
														${exemptTMDetails.effectivenessOfB3=='Very satisfactory'?'selected':''}>Very
														satisfactory</option>
													<option value="Quite satisfactory"
														${exemptTMDetails.effectivenessOfB3=='Quite satisfactory'?'selected':''}>Quite
														satisfactory</option>
													<option value="Partially satisfactory"
														${exemptTMDetails.effectivenessOfB3=='Partially satisfactory'?'selected':''}>Partially
														satisfactory</option>
													<option value="Unsatisfactory"
														${exemptTMDetails.effectivenessOfB3=='Unsatisfactory'?'selected':''}>Unsatisfactory</option>

													<%-- <option value="${exemptTMDetails.effectivenessOfB3}">${exemptTMDetails.effectivenessOfB3}</option>
														<option>Very satisfactory</option>
														<option>Quite satisfactory</option>
														<option>Partially satisfactory</option>
														<option>Unsatisfactory</option> --%>
												</select>
											</div>

										</div>


										<div class="form-group">
											<div class="col-md-12">
												<textarea class="form-control"
													title="Maximum length allowed is 300 characters"
													name="section1B4" maxlength="300" rows="3" cols="100"
													placeholder="4" id="listoftrainingfour"
													onkeyup="reviewOfyear();finalSubmission();"
													style="font-family: calibri; font-size: 12pt;">${exemptTMDetails.section1B4}</textarea>
											</div>
											<br />
											<%-- <label class="control-label col-md-1">4</label>
												<div class="col-md-11">
													<textarea class="form-control" title="Maximum length allowed is 300 characters" id="Comments" maxlength="300" rows="3" cols="100"
														name="section1B4" id="Section1B4">"${exemptTMDetails.section1B4}"</textarea>
												</div> --%>
										</div>

										<div class="form-group">
											<div class="col-md-6">&nbsp;</div>
											<label class="control-label col-md-2">Effectiveness
												of training</label>
											<div class="col-md-4">
												<select class="form-control" name="effectivenessOfB4"
													id="EffectivenessOfB4" onchange="finalSubmission();">
													<option value=""
														${exemptTMDetails.effectivenessOfB4==''?'selected':''}>Pick
														a value</option>
													<option value="Very satisfactory"
														${exemptTMDetails.effectivenessOfB4=='Very satisfactory'?'selected':''}>Very
														satisfactory</option>
													<option value="Quite satisfactory"
														${exemptTMDetails.effectivenessOfB4=='Quite satisfactory'?'selected':''}>Quite
														satisfactory</option>
													<option value="Partially satisfactory"
														${exemptTMDetails.effectivenessOfB4=='Partially satisfactory'?'selected':''}>Partially
														satisfactory</option>
													<option value="Unsatisfactory"
														${exemptTMDetails.effectivenessOfB4=='Unsatisfactory'?'selected':''}>Unsatisfactory</option>

													<%-- <option value="${exemptTMDetails.effectivenessOfB4}">${exemptTMDetails.effectivenessOfB4}</option>
														<option>Very satisfactory</option>
														<option>Quite satisfactory</option>
														<option>Partially satisfactory</option>
														<option>Unsatisfactory</option> --%>
												</select>
											</div>

										</div>
										<h4>C. Improvements, suggestions, or comments on
											training:</h4>
										<div class="form-group">

											<div class="col-md-12">
												<textarea class="form-control"
													title="Maximum length allowed is 300 characters"
													id="section1c" maxlength="300" name="section1C"
													style="font-family: calibri; font-size: 12pt;"
													onkeyup="reviewOfyear();">${ exemptTMDetails.section1C}</textarea>
											</div>
										</div>
										<h4>D. Team Member's development results and objectives:</h4>
										<p>
											<c:out value="${sessionScope.loginYear}"></c:out>
											Personal and Professional Development Achieved
										</p>
										<div class="form-group">
											<div class="col-md-12">
												<textarea class="form-control"
													title="Maximum length allowed is 300 characters"
													maxlength="300" name="Section1D1" id="section1d"
													style="font-family: calibri; font-size: 12pt;"
													onkeyup="reviewOfyear();finalSubmission();">${ exemptTMDetails.section1D1}</textarea>
											</div>
										</div>
										<p>
											<c:out value="${sessionScope.loginYear+1}"></c:out>
											Development Objectives (List any other development goals you
											have set for yourself in
											<c:out value="${sessionScope.loginYear}"></c:out>)
										</p>
										<div class="form-group">
											<div class="col-md-12">
												<textarea class="form-control"
													title="Maximum length allowed is 300 characters"
													maxlength="300" name="Section1D2" id="section1D2"
													style="font-family: calibri; font-size: 12pt;"
													onkeyup="reviewOfyear();finalSubmission();">${exemptTMDetails.section1D2}</textarea>
											</div>
										</div>




										<h4>E. Career Mobility :</h4>
										<p>I am interested in exploring different career
											opportunities in a different functional area within the
											company</p>
										<div class="form-group" id="section1fone">
											<div class="col-sm-1">
												<label><input type="radio" name="section1F1"
													id="Section1F1" maxlength="50" value="yes"
													onkeyup="reviewOfyear();finalSubmission();"
													${exemptTMDetails.section1F1=='yes'?'checked':''}
													onclick="onRadioCheck('mobilityDiv','noMobilityDiv')" />
													Yes</label>
											</div>
											<div class="col-sm-1">
												<label> <input type="radio" name="section1F1"
													id="Section1F1" maxlength="50" value="no"
													onkeyup="reviewOfyear();finalSubmission();"
													${exemptTMDetails.section1F1=='no'?'checked':''}
													onclick="onRadioCheck('noMobilityDiv','mobilityDiv')" />
													No
												</label>
											</div>
										</div>
										<div id="noMobilityDiv" style="display: none;">
											<p>a. If NO, continue with question number two.</p>
										</div>
										<div id="mobilityDiv" style="display: none;">
											<div class="form-group">
												<label class="control-label col-md-2">If YES, What
													Job Function?</label>
												<div class="col-md-4">
													<input type="text" class="form-control"
														title="Maximum length allowed is 50 characters"
														maxlength="50" name="section1F2ONE" id="Section1F2ONE"
														onkeyup="reviewOfyear();finalSubmission();"
														style="font-family: calibri; font-size: 12pt;"
														value="<c:out value="${exemptTMDetails.section1F2ONE}"/>" />
												</div>

												<label class="control-label col-md-2"><p>And/or
														US Facility?</p></label>
												<div class="col-md-4">
													<input type="text" class="form-control" maxlength="50"
														name="Section1F2TWO" id="Section1F2TWO"
														style="font-family: calibri; font-size: 12pt;"
														value="<c:out value="${exemptTMDetails.section1F2TWO}" />" />
												</div>
											</div>
										</div>


										<p>I am interested in an International Assignments and/or
											mobility</p>
										<div class="form-group" id="section1ftwo">
											<div class="col-sm-1">

												<label><input type="radio" class="control-label"
													id="section1F3A" name="section1F3A" value="yes" value="yes"
													${exemptTMDetails.section1F3A=='yes'?'checked':''}
													onclick="onRadioCheck('relocationDiv','noRelocationDiv');finalSubmission();" />
													Yes</label>
											</div>
											<div class="col-sm-1">
												<label><input type="radio" class="control-label"
													id="section1F3A" name="section1F3A" value="no"
													${exemptTMDetails.section1F3A=='no'?'checked':''}
													onclick="onRadioCheck('noRelocationDiv','relocationDiv');finalSubmission();" />
													No</label>
											</div>
										</div>
										<div id="noRelocationDiv" style="display: none;">
											<p>a. If NO, continue to next page.</p>
										</div>
										<div id="relocationDiv" style="display: none;">
											<p>If YES, what region would you consider exploring as an
												International ?</p>
											<div class="form-group" id="country">
												<div class="col-sm-2">
													<input type="checkbox" name="section1F3B"
														class="control-label" id="section1F3B" value="Canada"
														onclick="reviewOfyear();"
														${exemptTMDetails.countryOne=='Canada'?'checked':''} />
													Canada
												</div>
												<div class="col-sm-2">
													<input type="checkbox" class="control-label"
														name="section1F3B" id="section1F3B" value="USA"
														onclick="reviewOfyear();"
														${exemptTMDetails.countryTwo=='USA'?'checked':''} /> USA
												</div>
												<div class="col-sm-2">
													<input type="checkbox" class="control-label"
														name="section1F3B" id="section1F3B" value="France"
														onclick="reviewOfyear();"
														${exemptTMDetails.countryThree=='France'?'checked':''} />
													France
												</div>
												<div class="col-sm-2">
													<input type="checkbox" class="control-label"
														name="section1F3B" id="section1F3B" value="UK"
														onclick="reviewOfyear();"
														${exemptTMDetails.countryFour=='UK'?'checked':''} /> UK
												</div>
												<div class="col-sm-2">
													<input type="checkbox" class="control-label"
														name="section1F3B" id="section1F3B" value="Turkey"
														onclick="reviewOfyear();"
														${exemptTMDetails.countryFive=='Turkey'?'checked':''} />
													Turkey
												</div>
												<div class="col-sm-2">
													<input type="checkbox" class="control-label"
														name="section1F3B" id="section1F3B" value="India"
														onclick="reviewOfyear();"
														${exemptTMDetails.countrySix=='India'?'checked':''} />
													India
												</div>
												<div class="col-sm-2">
													<input type="checkbox" class="control-label"
														name="section1F3B" id="section1F3B" value="Morocco"
														onclick="reviewOfyear();"
														${exemptTMDetails.countrySeven=='Morocco'?'checked':''} />
													Morocco
												</div>
												<div class="col-sm-1">
													<label class="control-label"><h5>Other</h5></label>
												</div>
												<div class="col-sm-2">
													<input type="text" class="form-control"
														title="Maximum length allowed is 20 characters"
														maxlength="20"
														style="font-family: calibri; font-size: 12pt; margin-top: 5px;"
														name="other" id="other"
														value="<c:out value="${exemptTMDetails.other}"/>" />

												</div>
											</div>
											<p>(i) What length of assignment would you consider?</p>
											<div class="form-group" id="lengthAssessignment">
												<div class="col-sm-2">
													<input type="radio" class="control-label"
														name="section1F3B1" id="section1F3B1"
														value="1 year or less" onclick="finalSubmission();"
														${exemptTMDetails.section1F3B1=='1 year or less'?'checked':''} />1
													year or less
												</div>
												<div class="col-sm-2">
													<input type="radio" class="control-label"
														name="section1F3B1" id="section1F3B1" value="1 to 2 years"
														onclick="finalSubmission();"
														${exemptTMDetails.section1F3B1=='1 to 2 years'?'checked':''} />1
													to 2 years
												</div>
												<div class="col-sm-3">
													<input type="radio" class="control-label"
														name="section1F3B1" id="section1F3B1"
														value="More than 2 years" onclick="finalSubmission();"
														${exemptTMDetails.section1F3B1 =='More than 2 years'?'checked':''} />More
													than 2 years
												</div>
											</div>
											<p>(ii) I am currently unable to consider any relocation
												or mobility in the next 12 months?</p>


											<div class="form-group" id="relocationMobility">
												<div class="col-sm-1">

													<input type="radio" id="section1F3B2" name="section1F3B2"
														value="yes" style="font-family: calibri; font-size: 12pt;"
														class="control-label" onclick="finalSubmission();"
														${exemptTMDetails.section1F3B2=='yes'?'checked':''} />
													Yes


												</div>
												<div class="col-sm-1">
													<input type="radio" class="control-label" id="section1F3B2"
														style="font-family: calibri; font-size: 12pt;"
														name="section1F3B2" value="no"
														onclick="finalSubmission();"
														${exemptTMDetails.section1F3B2=='no'?'checked':''} /> No

												</div>
											</div>
										</div>
										<c:set var="disableStatus" value="${status}" scope="request" />
									</div>
									<div class="form-actions">
										<div class="row">
											<div class="col-md-12">
												<%
													String status = (String) request.getAttribute("disableStatus");
															String supervisor = (String) session.getAttribute("supervisor");
															System.out.println("review of past year jsp");

															if (String.valueOf(supervisor).equalsIgnoreCase("supervisor")
																	|| String.valueOf(status).equalsIgnoreCase("completed")
																	|| String.valueOf(status).equalsIgnoreCase("MANAGER COMPLETED")
																	|| String.valueOf(status).equalsIgnoreCase("HR APPROVED")
																	|| String.valueOf(status).equalsIgnoreCase("CLOSED")) {
												%>
												<a href="<c:url value="SkillsSelfAssessment.do"></c:url>"
													class="btn green">Next</a>
												<%
													} else {
												%>

												<button type="submit" class="btn green" name="backAndSave">Back
													& Save</button>
														<button type="submit" class="btn green" name="save">
													Save</button>
												&nbsp;&nbsp;&nbsp;
												<button type="submit" class="btn green" name="nextAndSave">Next
													& Save</button>
												<%
													}
												%>

											</div>
										</div>
										<div class="row" align="right">2 of
											3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
									</div>



								</c:if>


								<c:if
									test="${ (empty exemptTMDetails && !empty imessage) || (!empty exemptTMDetails && !empty imessage)}">



									<div class="form-body">
										<h4>A. Describe past year's key events and assess your
											results/achievements:</h4>
										<p>Include your contribution to business goals (Safety,
											Financial Results, Productivity, Improvements):</p>
										<div class="form-group">
											<div class="col-md-12">
												<textarea class="form-control" maxlength="300"
													name="Section1A">${ exemptTMDetails.section1A}</textarea>
											</div>
										</div>

										<h4>
											B. List of training completed in
											<c:out value="${sessionScope.loginYear}"></c:out>:
										</h4>
										<div class="form-group">
											<div class="col-md-12">
												<textarea class="form-control"
													title="Maximum length allowed is 300 characters"
													name="Section1B1" maxlength="300" rows="3" placeholder="1"
													id="listoftrainingone" onkeyup="reviewOfyear();" cols="100">${exemptTMDetails.section1B1}</textarea>
											</div>
											<br />

										</div>

										<div class="form-group">
											<div class="col-md-6">&nbsp;</div>
											<label class="control-label col-md-2">Effectiveness
												of training</label>
											<div class="col-md-4">
												<select class="form-control" name="effectivenessOfB1"
													id="EffectivenessOfB1">
													<option value=""
														${exemptTMDetails.effectivenessOfB1==''?'selected':''}>Pick
														a value</option>
													<option value="Very satisfactory"
														${exemptTMDetails.effectivenessOfB1=='Very satisfactory'?'selected':''}>Very
														satisfactory</option>
													<option value="Quite satisfactory"
														${exemptTMDetails.effectivenessOfB1=='Quite satisfactory'?'selected':''}>Quite
														satisfactory</option>
													<option value="Partially satisfactory"
														${exemptTMDetails.effectivenessOfB1=='Partially satisfactory'?'selected':''}>Partially
														satisfactory</option>
													<option value="Unsatisfactory"
														${exemptTMDetails.effectivenessOfB1=='Unsatisfactory'?'selected':''}>Unsatisfactory</option>
												</select>
											</div>

										</div>

										<div class="form-group">
											<div class="col-md-12">
												<textarea class="form-control"
													title="Maximum length allowed is 300 characters"
													name="section1B2" maxlength="300" rows="3"
													id="listoftrainingtwo" placeholder="2" cols="100"
													onkeyup="reviewOfyear();">${exemptTMDetails.section1B2}</textarea>
											</div>
											<br />
											<!-- <label class="control-label col-md-1">2</label>
												<div class="col-md-11">
													<textarea class="form-control" title="Maximum length allowed is 300 characters" name="section1B2"
														id="Section1B2" maxlength="300" rows="3" cols="100"></textarea>
												</div> -->
										</div>

										<div class="form-group">
											<div class="col-md-6">&nbsp;</div>
											<label class="control-label col-md-2">Effectiveness
												of training</label>
											<div class="col-md-4">
												<select class="form-control" name="effectivenessOfB2"
													id="EffectivenessOfB2">
													<option value=""
														${exemptTMDetails.effectivenessOfB2==''?'selected':''}>Pick
														a value</option>
													<option value="Very satisfactory"
														${exemptTMDetails.effectivenessOfB2=='Very satisfactory'?'selected':''}>Very
														satisfactory</option>
													<option value="Quite satisfactory"
														${exemptTMDetails.effectivenessOfB2=='Quite satisfactory'?'selected':''}>Quite
														satisfactory</option>
													<option value="Partially satisfactory"
														${exemptTMDetails.effectivenessOfB2=='Partially satisfactory'?'selected':''}>Partially
														satisfactory</option>
													<option value="Unsatisfactory"
														${exemptTMDetails.effectivenessOfB2=='Unsatisfactory'?'selected':''}>Unsatisfactory</option>
												</select>
											</div>

										</div>


										<div class="form-group">
											<div class="col-md-12">
												<textarea class="form-control"
													title="Maximum length allowed is 300 characters"
													name="section1B3" maxlength="300" placeholder="3" rows="3"
													onkeyup="reviewOfyear();" id="listoftrainingthree"
													cols="100">${exemptTMDetails.section1B3}</textarea>
											</div>
											<br />
											<!-- <label class="control-label col-md-1">3</label>
												<div class="col-md-11">
													<textarea class="form-control" title="Maximum length allowed is 300 characters" id="Comments" maxlength="300" rows="3" cols="100"
														name="section1B3" id="Section1B3"></textarea>
												</div> -->
										</div>

										<div class="form-group">
											<div class="col-md-6">&nbsp;</div>
											<label class="control-label col-md-2">Effectiveness
												of training</label>
											<div class="col-md-4">
												<select class="form-control" name="effectivenessOfB3"
													id="EffectivenessOfB3">
													<option value=""
														${exemptTMDetails.effectivenessOfB3==''?'selected':''}>Pick
														a value</option>
													<option value="Very satisfactory"
														${exemptTMDetails.effectivenessOfB3=='Very satisfactory'?'selected':''}>Very
														satisfactory</option>
													<option value="Quite satisfactory"
														${exemptTMDetails.effectivenessOfB3=='Quite satisfactory'?'selected':''}>Quite
														satisfactory</option>
													<option value="Partially satisfactory"
														${exemptTMDetails.effectivenessOfB3=='Partially satisfactory'?'selected':''}>Partially
														satisfactory</option>
													<option value="Unsatisfactory"
														${exemptTMDetails.effectivenessOfB3=='Unsatisfactory'?'selected':''}>Unsatisfactory</option>
												</select>
											</div>

										</div>


										<div class="form-group">
											<div class="col-md-12">
												<textarea class="form-control"
													title="Maximum length allowed is 300 characters"
													name="Section1B4" maxlength="300" placeholder="4" rows="3"
													onkeyup="reviewOfyear();" id="listoftrainingfour"
													cols="100">${exemptTMDetails.section1B4}</textarea>
											</div>
											<br />
											<!-- <label class="control-label col-md-1">4</label>
												<div class="col-md-11">
													<textarea class="form-control" title="Maximum length allowed is 300 characters" id="Comments" maxlength="300" rows="3" cols="100"
														name="section1B4" id="Section1B4"></textarea>
												</div> -->
										</div>

										<div class="form-group">
											<div class="col-md-6">&nbsp;</div>
											<label class="control-label col-md-2">Effectiveness
												of training</label>
											<div class="col-md-4">
												<select class="form-control" name="effectivenessOfB4"
													id="EffectivenessOfB4">
													<option value=""
														${exemptTMDetails.effectivenessOfB4==''?'selected':''}>Pick
														a value</option>
													<option value="Very satisfactory"
														${exemptTMDetails.effectivenessOfB4=='Very satisfactory'?'selected':''}>Very
														satisfactory</option>
													<option value="Quite satisfactory"
														${exemptTMDetails.effectivenessOfB4=='Quite satisfactory'?'selected':''}>Quite
														satisfactory</option>
													<option value="Partially satisfactory"
														${exemptTMDetails.effectivenessOfB4=='Partially satisfactory'?'selected':''}>Partially
														satisfactory</option>
													<option value="Unsatisfactory"
														${exemptTMDetails.effectivenessOfB4=='Unsatisfactory'?'selected':''}>Unsatisfactory</option>
												</select>
											</div>

										</div>
										<h4>C. Improvements, suggestions, or comments on
											training:</h4>
										<div class="form-group">
											<div class="col-md-12">
												<textarea class="form-control"
													title="Maximum length allowed is 300 characters"
													id="section1c" maxlength="300" name="section1C">${exemptTMDetails.section1C}</textarea>
											</div>
										</div>
										<h4>D. Team Member's development results and objectives:</h4>
										<p>
											<c:out value="${sessionScope.loginYear}"></c:out>
											Personal and Professional Development Achieved
										</p>
										<div class="form-group">
											<div class="col-md-12">
												<textarea class="form-control"
													title="Maximum length allowed is 300 characters"
													maxlength="300" name="Section1D1">${exemptTMDetails.section1D1}</textarea>
											</div>
										</div>
										<p>
											<c:out value="${sessionScope.loginYear+1}"></c:out>
											Development Objectives (List any other development goals you
											have set for yourself in
											<c:out value="${sessionScope.loginYear}"></c:out>)
										</p>
										<div class="form-group">
											<div class="col-md-12">
												<textarea class="form-control"
													title="Maximum length allowed is 300 characters"
													maxlength="300" name="Section1D2">${exemptTMDetails.section1D2}</textarea>
											</div>
										</div>


										<h4>E. Career Mobility :</h4>
										<p>I am interested in exploring different career
											opportunities in a different functional area within the
											company</p>
										<div class="form-group" id="section1fone">
											<div class="col-sm-1">
												<input type="radio" name="section1F1" id="Section1F1"
													maxlength="50" value="yes"
													${exemptTMDetails.section1F1=='yes'?'checked':''}
													onclick="onRadioCheck('mobilityDiv','noMobilityDiv')" />
												Yes
											</div>
											<div class="col-sm-1">
												<input type="radio" name="section1F1" id="Section1F1"
													maxlength="50" value="no"
													${exemptTMDetails.section1F1=='no'?'checked':''}
													onclick="onRadioCheck('noMobilityDiv','mobilityDiv')" /> No
											</div>
										</div>
										<div id="noMobilityDiv" style="display: none;">
											<p>a. If NO, continue with question number two.</p>
										</div>
										<div id="mobilityDiv" style="display: none;">
											<div class="form-group" style="margin-left: 0px;">
												<label class="control-label col-md-2"><p>If YES,
														What Job Function?</p></label>
												<div class="col-md-4">
													<input type="text" class="form-control"
														title="Maximum length allowed is 50 characters"
														maxlength="50" name="section1F2ONE" id="Section1F2ONE"
														value="<c:out value="${exemptTMDetails.section1F2ONE}"/>" />
												</div>

												<label class="control-label col-md-2"><p>And/or
														US Facility?</p></label>
												<div class="col-md-4">
													<input type="text" class="form-control" maxlength="50"
														name="Section1F2TWO" id="Section1F2TWO"
														value="<c:out value="${exemptTMDetails.section1F2TWO}" />" />
												</div>
											</div>
										</div>


										<p>I am interested in an International Assignments and/or
											mobility</p>
										<div class="form-group" id="section1ftwo">
											<div class="col-sm-1">

												<label><input type="radio" class="control-label"
													id="section1F3A" name="section1F3A" value="yes"
													${exemptTMDetails.section1F3A=='yes'?'checked':''}
													onclick="onRadioCheck('relocationDiv','noRelocationDiv')" />
													Yes</label>
											</div>
											<div class="col-sm-1">
												<label><input type="radio" class="control-label"
													id="section1F3A" name="section1F3A" value="no"
													${exemptTMDetails.section1F3A=='no'?'checked':''}
													onclick="onRadioCheck('noRelocationDiv','relocationDiv')" />
													No</label>
											</div>
										</div>
										<div id="noRelocationDiv" style="display: none;">
											<p>a. If NO, continue to next page.</p>
										</div>
										<div id="relocationDiv" style="display: none;">
											<p>If YES, what region would you consider exploring as
												an International ?</p>
											<div class="form-group" id="country">
												<div class="col-sm-2">
													<input type="checkbox" name="section1F3B"
														class="control-label" value="Canada"
														${exemptTMDetails.countryOne=='Canada'?'checked':''} />
													Canada
												</div>
												<div class="col-sm-2">
													<input type="checkbox" class="control-label"
														name="section1F3B" value="USA"
														${exemptTMDetails.countryTwo=='USA'?'checked':''} /> USA
												</div>
												<div class="col-sm-2">
													<input type="checkbox" class="control-label"
														name="section1F3B" value="France"
														${exemptTMDetails.countryThree=='France'?'checked':''} />
													France
												</div>
												<div class="col-sm-2">
													<input type="checkbox" class="control-label"
														name="section1F3B" value="UK"
														${exemptTMDetails.countryFour=='UK'?'checked':''} /> UK
												</div>
												<div class="col-sm-2">
													<input type="checkbox" class="control-label"
														name="section1F3B" value="Turkey"
														${exemptTMDetails.countryFive=='Turkey'?'checked':''} />
													Turkey
												</div>
												<div class="col-sm-2">
													<input type="checkbox" class="control-label"
														name="section1F3B" value="India"
														${exemptTMDetails.countrySix=='India'?'checked':''} />
													India
												</div>
												<div class="col-sm-2">
													<input type="checkbox" class="control-label"
														name="section1F3B" value="Morocco"
														${exemptTMDetails.countrySeven=='Morocco'?'checked':''} />
													Morocco
												</div>
												<div class="col-sm-1">
													<label class="control-label"><h5>Other</h5></label>
												</div>
												<div class="col-sm-2">
													<input type="text" class="form-control"
														style="font-family: calibri; font-size: 12pt; margin-top: 5px;"
														title="Maximum length allowed is 20 characters"
														maxlength="20" name="other" id="other"
														value="<c:out value="${exemptTMDetails.other}"/>" />

												</div>
											</div>
											<p>(i) What length of assignment would you consider?</p>
											<div class="form-group" id="selectyear">
												<div class="col-sm-2">
													<input type="radio" class="control-label"
														name="section1F3B1" id="section1F3B1"
														value="1 year or less"
														${exemptTMDetails.section1F3B1=='1 year or less'?'checked':''} />1
													year or less
												</div>
												<div class="col-sm-2">
													<input type="radio" class="control-label"
														name="section1F3B1" id="section1F3B1" value="1 to 2 years"
														${exemptTMDetails.section1F3B1=='1 to 2 years'?'checked':''} />1
													to 2 years
												</div>
												<div class="col-sm-3">
													<input type="radio" class="control-label"
														name="section1F3B1" id="section1F3B1"
														value="More than 2 years"
														${exemptTMDetails.section1F3B1 =='More than 2 years'?'checked':''} />More
													than 2 years
												</div>
											</div>
											<p>(ii) I am currently unable to consider any relocation
												or mobility in the next 12 months?</p>
											<div class="form-group" id="relocation">
												<div class="col-sm-1">

													<input type="radio" id="section1F3B2" name="section1F3B2"
														id="section1F3B2" value="yes" class="control-label"
														${exemptTMDetails.section1F3B2=='yes'?'checked':''} /> Yes


												</div>
												<div class="col-sm-1">
													<input type="radio" class="control-label" id="section1F3B2"
														name="section1F3B2" value="no"
														${exemptTMDetails.section1F3B2=='no'?'checked':''} /> No
												</div>
											</div>
										</div>

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
										</div>
										<div class="row" align="right">2 of
											3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
									</div> -->
									<c:set var="disableStatus" value="${status}" scope="request" />
									<c:set var="supervisor" value="${supervisor}" scope="request" />
									<div class="form-actions">
										<div class="row">
											<div class="col-md-12">
												<%
													String status = (String) request.getAttribute("disableStatus");
															String supervisor = (String) session.getAttribute("supervisor");

															if (String.valueOf(supervisor).equalsIgnoreCase("supervisor")
																	|| String.valueOf(status).equalsIgnoreCase("completed")
																	|| String.valueOf(status).equalsIgnoreCase("MANAGER COMPLETED")
																	|| String.valueOf(status).equalsIgnoreCase("HR APPROVED")
																	|| String.valueOf(status).equalsIgnoreCase("CLOSED")) {
												%>
												<a href="<c:url value="SkillsSelfAssessment.do"></c:url>"
													class="btn green">Next</a>
												<%
													} else {
												%>

												<button type="submit" class="btn green" name="backAndSave">Back
													& Save</button>&nbsp;&nbsp;&nbsp;
												<button type="submit" class="btn green" name="save">
													Save</button>
												
													
												&nbsp;&nbsp;&nbsp;
												<button type="submit" class="btn green" name="nextAndSave">Next
													& Save</button>
												<%
													}
												%>

											</div>
										</div>
										<div class="row" align="right">2 of
											3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
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
	<script>
		function onRadioCheck(enableElementId, disableElementId) {

			document.getElementById(enableElementId).style.display = "inline";
			document.getElementById(disableElementId).style.display = "none";

			if ((document.getElementsByName("section1F1")[0].checked == true)
					|| (document.getElementsByName("section1F1")[1].checked == true)) {

				document.getElementById("section1fone").style.border = "";
			}
			if ((document.getElementsByName("section1F1")[0].checked == true)) {

				if (!document.getElementById("Section1F2ONE").value.trim()) {
					//		document.getElementById("Section1F2ONE").style.border = "solid 1px red";
					//alert("please fill the manidatroy fields");

				} else {
					document.getElementById("Section1F2ONE").style.border = "";
				}
			}

			if ((document.getElementsByName("section1F3A")[0].checked == true)
					|| (document.getElementsByName("section1F3A")[1].checked == true)) {

				document.getElementById("section1ftwo").style.border = "";
			}

			if ((document.getElementsByName("section1F3A")[0].checked == true)) {

				if ((document.getElementsByName("section1F3B")[0].checked == false
						&& document.getElementsByName("section1F3B")[1].checked == false
						&& document.getElementsByName("section1F3B")[2].checked == false
						&& document.getElementsByName("section1F3B")[3].checked == false
						&& document.getElementsByName("section1F3B")[4].checked == false
						&& document.getElementsByName("section1F3B")[5].checked == false && document
						.getElementsByName("section1F3B")[6].checked == false)
						&& (!document.getElementById("other").value.trim())) {

					/* 	document.getElementById("country").style.border = "solid 1px red";
						document.getElementById("selectyear").style.border = "solid 1px red";
						document.getElementById("relocation").style.border = "solid 1px red";
					 */
					return false;

				} else {
					document.getElementById("country").style.border = "";

				}

				document.getElementById("section1ftwo").style.border = "";

			}

			if ((document.getElementsByName("section1F1")[0].checked == false)
					&& (document.getElementsByName("section1F1")[1].checked == false)) {

				//		document.getElementById("section1fone").style.border = "solid 1px red";
				return false;
			} else {
				document.getElementById("section1fone").style.border = "";
			}

			if ((document.getElementsByName("section1F3A")[0].checked == false)
					&& (document.getElementsByName("section1F3A")[1].checked == false)) {
				//		document.getElementById("section1F3A").style.border = "solid 1px red";

				return false;
			} else {
				document.getElementById("section1ftwo").style.border = "";
			}

		}

		function verifyChecked() {

		

			if ((document.getElementsByName("section1F1")[0].checked == true)) {
				

				document.getElementById('mobilityDiv').style.display = "inline";
			/* 	if (!document.getElementById("Section1F2ONE").value.trim()) {
					//		document.getElementById("Section1F2ONE").style.border = "solid 1px red";
					
					/* onRadioCheck('mobilityDiv','noMobilityDiv') */
/* 
				} else {
					document.getElementById('mobilityDiv').style.display = "inline";
					
				}  */
			}
			
			if (document
					.getElementsByName("section1F3A")[0].checked == true) {
				
				document.getElementById('relocationDiv').style.display = "inline";
			}
			
			

			var pastyear = document.getElementById('pastyear').value;

			if (document.getElementById('pastyear').value == '') {

				document.getElementById('pastyear').style.border = "solid 1px red";

			} else {

				document.getElementById('pastyear').style.border = "";
			}

			var section1d = document.getElementById('section1d').value;

			if (document.getElementById('section1d').value == '') {

				document.getElementById('section1d').style.border = "solid 1px red";

				//		return false;
			} else {

				document.getElementById('section1d').style.border = "";
			}

			var section1D2 = document.getElementById('section1D2').value;

			if (document.getElementById('section1D2').value == '') {

				document.getElementById('section1D2').style.border = "solid 1px red";

				//	return false;
			} else {

				document.getElementById('section1D2').style.border = "";
			}

			//	var element=document.getElementById("effectivenessOfB3").value;

			if (document.getElementById("Section1F1").checked) {

				document.getElementById('mobilityDiv').style.display = "inline";

			} else {

				document.getElementById('noMobilityDiv').style.display = "none";
			}

			if (document.getElementById("section1F3A").checked) {

				document.getElementById('relocationDiv').style.display = "inline";

			} else {

				document.getElementById('noRelocationDiv').style.display = "none";

			}

			if (document.getElementById('EffectivenessOfB1').value == '') {

				document.getElementById('EffectivenessOfB1').disabled = true;
				document.getElementById('EffectivenessOfB2').disabled = true;
				document.getElementById('EffectivenessOfB3').disabled = true;
				document.getElementById('EffectivenessOfB4').disabled = true;
				document.getElementById('listoftrainingtwo').disabled = true;
				document.getElementById('listoftrainingthree').disabled = true;
				document.getElementById('listoftrainingfour').disabled = true;

			}
			if (document.getElementById('EffectivenessOfB2').value == '') {

				document.getElementById('EffectivenessOfB2').disabled = true;
				document.getElementById('EffectivenessOfB3').disabled = true;
				document.getElementById('EffectivenessOfB4').disabled = true;

				document.getElementById('listoftrainingthree').disabled = true;
				document.getElementById('listoftrainingfour').disabled = true;

			}
			if (document.getElementById('EffectivenessOfB3').value == '') {

				document.getElementById('EffectivenessOfB3').disabled = true;
				document.getElementById('EffectivenessOfB4').disabled = true;

				document.getElementById('listoftrainingfour').disabled = true;

			}
			if (document.getElementById('EffectivenessOfB4').value == '') {

				document.getElementById('EffectivenessOfB4').disabled = true;

			}

			if ((document.getElementsByName("section1F1")[0].checked == false)
					&& (document.getElementsByName("section1F1")[1].checked == false)) {
				//			document.getElementById("section1fone").style.border = "solid 1px red";
			}

			if ((document.getElementsByName("section1F3A")[0].checked == false)
					&& (document.getElementsByName("section1F3A")[1].checked == false)) {
				//		document.getElementById("section1ftwo").style.border = "solid 1px red";
			}

		}

		function reviewOfyear(i) {

			var section1d = document.getElementById('section1d').value;
			var section1D2 = document.getElementById('section1D2').value;

			if (document.getElementById('listoftrainingone').value.trim()) {

				document.getElementById('EffectivenessOfB1').disabled = false;
				document.getElementById('listoftrainingtwo').disabled = false;

			}

			if (!document.getElementById('listoftrainingone').value.trim()) {

				document.getElementById('EffectivenessOfB1').disabled = true;
				document.getElementById('EffectivenessOfB1').value = "";
				document.getElementById('listoftrainingtwo').disabled = true;
			}

			if (document.getElementById('listoftrainingtwo').value.trim()) {

				document.getElementById('EffectivenessOfB2').disabled = false;
				document.getElementById('listoftrainingthree').disabled = false;
				//	document.getElementById('EffectivenessOfB2').style.border = "solid 1px red";;

			}

			if (!document.getElementById('listoftrainingtwo').value.trim()) {

				document.getElementById('EffectivenessOfB2').disabled = true;
				document.getElementById('EffectivenessOfB2').value = "";
				document.getElementById('listoftrainingthree').disabled = true;
			}

			if (document.getElementById('listoftrainingthree').value.trim()) {

				document.getElementById('EffectivenessOfB3').disabled = false;
				document.getElementById('listoftrainingfour').disabled = false;
				document.getElementById('EffectivenessOfB3').style.border = "solid 1px red";

			}

			if (!document.getElementById('listoftrainingthree').value.trim()) {

				document.getElementById('EffectivenessOfB3').disabled = true;
				document.getElementById('EffectivenessOfB3').value = "";
				document.getElementById('listoftrainingfour').disabled = true;
			}

			if (document.getElementById('listoftrainingfour').value.trim()) {

				document.getElementById('EffectivenessOfB4').disabled = false;
				document.getElementById('EffectivenessOfB4').style.border = "solid 1px red";

			}
			if (!document.getElementById('listoftrainingfour').value.trim()) {

				document.getElementById('EffectivenessOfB4').disabled = true;
				document.getElementById('EffectivenessOfB4').value = "";

			}

			if ((document.getElementsByName("section1F1")[0].checked == true)) {

				if (!document.getElementById("Section1F2ONE").value.trim()) {
					//			document.getElementById("Section1F2ONE").style.border = "solid 1px red";

					//		return false;
				}
				document.getElementById("Section1F2ONE").style.border = "";
			}

			if ((document.getElementsByName("section1F3A")[0].checked == true)) {

				if ((document.getElementsByName("section1F3B")[0].checked == false
						&& document.getElementsByName("section1F3B")[1].checked == false
						&& document.getElementsByName("section1F3B")[2].checked == false
						&& document.getElementsByName("section1F3B")[3].checked == false
						&& document.getElementsByName("section1F3B")[4].checked == false
						&& document.getElementsByName("section1F3B")[5].checked == false && document
						.getElementsByName("section1F3B")[6].checked == false)
						&& (!document.getElementById("other").value.trim())) {

					//			document.getElementById("country").style.border = "solid 1px red";

					//		return false;

				} else {
					document.getElementById("country").style.border = "";
				}

				if (document.getElementsByName("section1F3B1")[0].checked == false
						&& document.getElementsByName("section1F3B1")[1].checked == false
						&& document.getElementsByName("section1F3B1")[2].checked == false) {
					//alert("plase  length of assignment ");
					//	document.getElementById("section1F3B1").style.border = "solid 1px red";

					//			document.getElementById("selectyear").style.border = "solid 1px red";
					//		return false;

				} else {
					document.getElementById("selectyear").style.border = "";
					//	document.getElementById("section1F3B1").style.border = "";
				}

				if (document.getElementsByName("section1F3B2")[0].checked == false
						&& document.getElementsByName("section1F3B2")[1].checked == false) {
					//	document.getElementById("section1F3B2").style.border = "solid 1px red";

					//		document.getElementById("relocation").style.border = "solid 1px red";
					//			return false;

				} else {
					//	document.getElementById("section1F3B2").style.border = "";
					document.getElementById("relocation").style.border = "";
				}

			}

			if (document.getElementById('listoftrainingone').value.trim()) {

				document.getElementById('EffectivenessOfB1').disabled = false;
				document.getElementById('listoftrainingtwo').disabled = false;
				//		document.getElementById('EffectivenessOfB1').style.border = "solid 1px red";;

				if (!document.getElementById('EffectivenessOfB1').value.trim()) {
					//alert("please fill the TrainingOne");
					//		document.getElementById('EffectivenessOfB1').style.border = "solid 1px red";
					//		return false;
				}
				document.getElementById('EffectivenessOfB1').style.border = "";

			}

			if (!document.getElementById('listoftrainingone').value.trim()) {

				document.getElementById('EffectivenessOfB1').disabled = true;
				document.getElementById('EffectivenessOfB1').value = "";
				document.getElementById('listoftrainingtwo').disabled = true;
			}

			if (document.getElementById('listoftrainingtwo').value.trim()) {

				document.getElementById('EffectivenessOfB2').disabled = false;
				document.getElementById('listoftrainingthree').disabled = false;
				//	document.getElementById('EffectivenessOfB2').style.border = "solid 1px red";;

				if (!document.getElementById('EffectivenessOfB2').value.trim()) {
					//alert("please fill the TrainingTwo");
					//			document.getElementById('EffectivenessOfB2').style.border = "solid 1px red";
					//		return false;
				}
				document.getElementById('EffectivenessOfB2').style.border = "";

			}

			if (!document.getElementById('listoftrainingtwo').value.trim()) {

				document.getElementById('EffectivenessOfB2').disabled = true;
				document.getElementById('EffectivenessOfB2').value = "";
				document.getElementById('listoftrainingthree').disabled = true;
			}

			if (document.getElementById('listoftrainingthree').value.trim()) {

				document.getElementById('EffectivenessOfB3').disabled = false;
				document.getElementById('listoftrainingfour').disabled = false;
				//	document.getElementById('EffectivenessOfB3').style.border = "solid 1px red";

				if (!document.getElementById('EffectivenessOfB3').value.trim()) {
					//alert("please fill the TrainingThree")
					//		document.getElementById('EffectivenessOfB3').style.border = "solid 1px red";
					//		return false;
				}
				document.getElementById('EffectivenessOfB3').style.border = "";

			}

			if (!document.getElementById('listoftrainingthree').value.trim()) {

				document.getElementById('EffectivenessOfB3').disabled = true;
				document.getElementById('EffectivenessOfB3').value = "";
				document.getElementById('listoftrainingfour').disabled = true;
			}

			if (document.getElementById('listoftrainingfour').value.trim()) {

				document.getElementById('EffectivenessOfB4').disabled = false;
				//	document.getElementById('EffectivenessOfB4').style.border = "solid 1px red";

				if (!document.getElementById('EffectivenessOfB4').value.trim()) {

					//	alert("please fill the Trainingfour")
					//		document.getElementById('EffectivenessOfB4').style.border = "solid 1px red";
					//	return false;
				}
				document.getElementById('EffectivenessOfB4').style.border = "";

			}
			if (!document.getElementById('listoftrainingfour').value.trim()) {

				document.getElementById('EffectivenessOfB4').disabled = true;
				document.getElementById('EffectivenessOfB4').value = "";

			}

			var section1c = document.getElementById('section1c').value;

			if (document.getElementById('section1c').value == '') {

				//	document.getElementById('section1c').style.border = "solid 1px red";

				//	return false;
			} else {

				document.getElementById('section1c').style.border = "";
			}
			var section1d = document.getElementById('section1d').value;

			if (document.getElementById('section1d').value == '') {

				document.getElementById('section1d').style.border = "solid 1px red";

				//		return false;
			} else {

				document.getElementById('section1d').style.border = "";
			}

			var section1D2 = document.getElementById('section1D2').value;

			if (document.getElementById('section1D2').value == '') {

				document.getElementById('section1D2').style.border = "solid 1px red";

				//	return false;
			} else {

				document.getElementById('section1D2').style.border = "";
			}

			if (i == 20) {

				if ((document.getElementsByName("section1F1")[0].checked == false)
						&& (document.getElementsByName("section1F1")[1].checked == false)) {

					//		document.getElementById("section1fone").style.border = "solid 1px red";
					//	return false;
				} else {
					document.getElementById("section1fone").style.border = "";
				}

				if ((document.getElementsByName("section1F1")[0].checked == true)) {

					if (!document.getElementById("Section1F2ONE").value.trim()) {
						//		document.getElementById("Section1F2ONE").style.border = "solid 1px red";
						//alert("please fill the manidatroy fields");

						//		return false;
					}
					document.getElementById("Section1F2ONE").style.border = "";
				}

				if ((document.getElementsByName("section1F3A")[0].checked == false)
						&& (document.getElementsByName("section1F3A")[1].checked == false)) {
					//	document.getElementById("section1F3A").style.border = "solid 1px red";
					//alert("Please choose your International Assignments");
					//	return false;
				} else {
					document.getElementById("section1F3A").style.border = "";
				}

				if (document.getElementsByName("section1F3A")[0].checked == true) {

					if ((document.getElementsByName("section1F3B")[0].checked == false
							&& document.getElementsByName("section1F3B")[1].checked == false
							&& document.getElementsByName("section1F3B")[2].checked == false
							&& document.getElementsByName("section1F3B")[3].checked == false
							&& document.getElementsByName("section1F3B")[4].checked == false
							&& document.getElementsByName("section1F3B")[5].checked == false && document
							.getElementsByName("section1F3B")[6].checked == false)
							&& (!document.getElementById("other").value.trim())) {

						//		document.getElementById("country").style.border = "solid 1px red";

						//	return false;

					} else {
						document.getElementById("country").style.border = "";
					}

					if (document.getElementsByName("section1F3B1")[0].checked == false
							&& document.getElementsByName("section1F3B1")[1].checked == false
							&& document.getElementsByName("section1F3B1")[2].checked == false) {
						//alert("plase  length of assignment ");
						//	document.getElementById("section1F3B1").style.border = "solid 1px red";
						//	return false;

					} else {
						document.getElementById("section1F3B1").style.border = "";
					}

					if (document.getElementsByName("section1F3B2")[0].checked == false //true
							&& document.getElementsByName("section1F3B2")[1].checked == false) {
						//	document.getElementById("section1F3B2").style.border = "solid 1px red";
						//alert("plase any relocation or mobility in the next 12 months ");
						//	return false;

					} else {
						document.getElementById("section1F3B2").style.border = "";
					}

				}// if close section1f3A.

			}

		}

		window.onload = verifyChecked();
		window.onload = reviewOfyear();
	</script>


</body>


