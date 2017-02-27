<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.lisi.annualassessment.util.Converters"%>

<!--  <style>
 input:invalid,
textarea:invalid,
select:invalid {
  color: #b94a48;
  border-color: #ee5f5b;
  &:focus {
    border-color: darken(#ee5f5b, 10%);
    .box-shadow(0 0 6px lighten(#ee5f5b, 20%));    
  }
} 

</style> -->



<head>

<script type="text/javascript">

$(function(){
	  $('form').on('keypress', function(event){
	    if(event.which === 13 && $(event.target).is(':input')){
	        event.preventDefault();
	        $('#save').trigger('click');
	    }
	  });
	});
	
$(document).ready(function() {
   
	  <c:if test="${!empty idetails && empty imessage}">
	   
	   
	  if($("#rscore").val()==""){
	   $("#rscore").css('border-color', 'red');
	  }
	  if($("#rscoretextarea").val()==""){
		  
		  $("#rscoretextarea").css('border-color', 'red');
	  }
	  
	  if($("#ascore").val()==""){
	   $("#ascore").css('border-color', 'red');
	  }
	  if($("#ascoretextarea").val()==""){
		  
		  $("#ascoretextarea").css('border-color', 'red');
	  }
	  
	  if($("#iscore").val()==""){
	   $("#iscore").css('border-color', 'red');
	  }
	  //iscoretextarea   
 	if($("#iscoretextarea").val()==""){
		  
		  $("#iscoretextarea").css('border-color', 'red');
	  }
	  
	  if($("#jscore").val()==""){
	   $("#jscore").css('border-color', 'red');
	  }
	  
	  //jscoretextarea
	  if($("#jscoretextarea").val()==""){
		  
		  $("#jscoretextarea").css('border-color', 'red');
	  }
	  
	  if($("#wscore").val()==""){
	   $("#wscore").css('border-color', 'red');
	  }
	  //wscoretextarea
	  if($("#wscoretextarea").val()==""){
		   $("#wscoretextarea").css('border-color', 'red');
		  }
	  
	  
	  if($("#pscore").val()==""){
	   $("#pscore").css('border-color', 'red');
	  }
	  //pscoretextarea
	  if($("#pscoretextarea").val()==""){
		   $("#pscoretextarea").css('border-color', 'red');
		  }
	   </c:if>
	   
	
    <c:if test="${status=='COMPLETED' || status=='MANAGER COMPLETED' || status=='HR APPROVED' || status=='CLOSED'}">
     
   $("#testDiv").find("input,textarea,select,radio").attr("disabled", "disabled");
   
   </c:if> 
   
 
});
</script>
</head>
<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white"
	onload="sum1();">




	<script type="text/javascript">
	
function minmax(value, min, max) 
{

/* 	var rscore = document.getElementById('rscore').value;
	
	if(rscore==""){
	
	 document.getElementById('rscore').style.borderColor = "red";
	}else{
		
		document.getElementById('rscore').style.borderColor = "black";
	}
	  */
    if(parseFloat(value) < min || isNaN(value)) {
    
    	return 0; 
    }
 else if(parseFloat(value) > max || isNaN(value) ){
    	
        return 3;
    }
    

    else 
    	
    	return value;
}
</script>




	<%!String year;%>
	<%
		year = Converters.getCurrentYear();
	%>
	<!-- BEGIN CONTENT -->

	<div class="page-content-wrapper" id="testDiv">
		<!-- BEGIN CONTENT BODY -->
		<div class="page-content">
			<!-- BEGIN PAGE HEADER-->

			<!-- BEGIN PAGE BAR -->
			<div class="page-bar">
				<ul class="page-breadcrumb">
					<li><a href="#">Home</a> <i class="fa fa-circle"></i></li>
					<li><span>Interpersonal Skills</span></li>
				</ul>
			</div>
			<!-- END PAGE BAR -->
			<!-- BEGIN PAGE TITLE-->
			<h3 class="page-title">Interpersonal Skills</h3>
			<!-- END PAGE TITLE-->
			<!-- END PAGE HEADER-->

			<h6>
				Please note, <font color="red">ALL FIELDS MARKED IN RED </font> have
				to be completed before being allowed to the next screen
			</h6>

			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN VALIDATION STATES-->
					<div class="portlet light portlet-fit portlet-form bordered">

						<div class="portlet-body">
							<!-- BEGIN FORM-->


							<form:form action="interpersonalForm.do" method="post"
								modelAttribute="interpersonal" id="interpersonalSkillsForm"
								class="form-horizontal">

								<c:if test="${!empty idetails && empty imessage}">


									<script>
									function validate(){
										
										
										var rscore = document.getElementById('rscore').value;
									
										if(rscore==""){
										
										 document.getElementById('rscore').style.borderColor = "red";
										}else{
											
											document.getElementById('rscore').style.borderColor = "black";
										}
										var ascore = document.getElementById('ascore').value;
										
										if(ascore==""){
										
										 document.getElementById('ascore').style.borderColor = "red";
										}else{
											
											document.getElementById('ascore').style.borderColor = "black";
										}
										var iscore = document.getElementById('iscore').value;
										
										if(iscore==""){
										
										 document.getElementById('iscore').style.borderColor = "red";
										}else{
											
											document.getElementById('iscore').style.borderColor = "black";
										}
								var jscore = document.getElementById('jscore').value;
										
										if(jscore==""){
										
										 document.getElementById('jscore').style.borderColor = "red";
										}else{
											
											document.getElementById('jscore').style.borderColor = "black";
										}
	var wscore = document.getElementById('wscore').value;
										
										if(wscore==""){
										
										 document.getElementById('wscore').style.borderColor = "red";
										}else{
											
											document.getElementById('wscore').style.borderColor = "black";
										}
										var pscore = document.getElementById('pscore').value;
										
										if(pscore==""){
										
										 document.getElementById('pscore').style.borderColor = "red";
										}else{
											
											document.getElementById('pscore').style.borderColor = "black";
										}
										
										//alert("rs");
										var rscoretextarea = document.getElementById('rscoretextarea').value;
										//alert(rscoretextarea);
										  if(rscoretextarea==""){
											  
											  document.getElementById('rscoretextarea').style.borderColor = "red";
										  }else{
											  
											  document.getElementById('rscoretextarea').style.borderColor = "black";
										  }
										  
											var ascoretextarea = document.getElementById('ascoretextarea').value;
											
											  if(ascoretextarea==""){
												  
												  document.getElementById('ascoretextarea').style.borderColor = "red";
											  }else{
												  
												  document.getElementById('ascoretextarea').style.borderColor = "black";
											  }
											 
												var iscoretextarea = document.getElementById('iscoretextarea').value;
												
												  if(iscoretextarea==""){
													  
													  document.getElementById('iscoretextarea').style.borderColor = "red";
												  }else{
													  
													  document.getElementById('iscoretextarea').style.borderColor = "black";
												  }
												  
													var jscoretextarea = document.getElementById('jscoretextarea').value;
													
													  if(jscoretextarea==""){
														  
														  document.getElementById('jscoretextarea').style.borderColor = "red";
													  }else{
														  
														  document.getElementById('jscoretextarea').style.borderColor = "black";
													  }
													  
													  var wscoretextarea = document.getElementById('wscoretextarea').value;
														
													  if(wscoretextarea==""){
														  
														  document.getElementById('wscoretextarea').style.borderColor = "red";
													  }else{
														  
														  document.getElementById('wscoretextarea').style.borderColor = "black";
													  }
													  
													  var pscoretextarea = document.getElementById('pscoretextarea').value;
														
													  if(pscoretextarea==""){
														  
														  document.getElementById('pscoretextarea').style.borderColor = "red";
													  }else{
														  
														  document.getElementById('pscoretextarea').style.borderColor = "black";
													  }			  
										
										/*    
										  
										  
										 
										  
										   if($("#wscoretextarea").val()==""){
											   $("#wscoretextarea").css('border-color', 'red');
											  }
										  
										   if($("#pscoretextarea").val()==""){
											   $("#pscoretextarea").css('border-color', 'red');
											  }
										 */
										
										
									} 
									
									</script>





									<%-- 		<c:forEach items="${interpersonalData}" var="idetails"> --%>

									<div class="form-body">
										<p>SCORE: Rate each performance factor. Unacceptable = 0
											&#45 0.75; Needs Improvement = 1 &#45 1.75 Meets Expectations
											= 2 &#45 2.75; Exceeds Expectations 3. COMMENTS: A "Needs
											Improvement" rating must have an Explanation with Action and
											Follow Up. An "Exceeds Expectations" rating must have a
											justification. All sections MUST have a comment.</p>

										<div class="form-group">
											<label class="control-label col-md-10"><strong>Responsibility:</strong><br>Makes
												sound decisions with factual data and can present objective
												arguments for those decisions. Minimal decision making by
												subjectivity.</label>
											<div class="col-md-2">
												Score:<br> <input type="text" class="form-control"
													id="rscore" placeholder="score" name="responsibilityScore"
													maxlength="4"
													value="<c:out value="${idetails.responsibilityScore}"/>"
													onkeyup="this.value = minmax(this.value, 0.00, 3.00);sum1();validate();"
													tabindex="2">
												<p id="r1"></p>
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-12">
												Supervisor&#39s Comments:<br>
												<textarea rows="2" cols="75" maxlength="150"
													class="form-control" id="rscoretextarea"
													title="Maximum length allowed is 150 characters"
													name="responsibilitySupervisorsComments" tabindex="1"
													onkeypress="validate();"><c:out
														value="${idetails.responsibilitySupervisorsComments}" /></textarea>
											</div>
										</div>


										<div class="form-group">
											<label class="control-label col-md-10"><strong>Adaptability:</strong><br>Team
												Member is able to adjust to a variety of situations.
												Flexible to company needs. Carries out assignments, jobs,
												tasks, and projects consistently and completely. Overcomes
												obstacles and accepts challenges with enthusiasm.</label>
											<div class="col-md-2">
												Score:<br> <input type="text" class="form-control"
													id="ascore" placeholder="score" name="adaptabilityScore"
													value="<c:out value="${idetails.adaptabilityScore}"/>"
													maxlength="4"
													onkeyup="this.value = minmax(this.value, 0.00, 3.00);sum1();validate();"
													tabindex="4">
												<p id="a1"></p>
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-12">
												Supervisor&#39s Comments:<br>
												<textarea maxlength="150" rows="2" cols="75"
													class="form-control" id="ascoretextarea"
													title="Maximum length allowed is 150 characters"
													name="adaptabilitySupervisorsComments"
													onkeyup="secondEnable();validate();" tabindex="3"><c:out
														value="${idetails.adaptabilitySupervisorsComments}" /></textarea>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-10"><strong>Initiative:</strong><br>Team
												Member consistently demonstrates self-motivation by
												maintaining a solid work rhythm. Moves on to the next
												assignment without reminders. Seeks additional projects
												and/or offers to assist other team members.</label>
											<div class="col-md-2">
												Score:<br> <input type="text" class="form-control"
													id="iscore" placeholder="score" name="initiativeScore"
													value="<c:out value="${idetails.initiativeScore}"/>"
													maxlength="4"
													onkeyup="this.value = minmax(this.value, 0.00, 3.00);sum1();validate();"
													tabindex="6">
												<p id="j1"></p>
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-12">
												Supervisor&#39s Comments:<br>
												<textarea class="form-control" id="iscoretextarea"
													maxlength="150" rows="2" cols="75"
													title="Maximum length allowed is 150 characters"
													name="initiativeSupervisorsComments"
													onkeyup="thirdEnable();validate();" tabindex="5"><c:out
														value="${idetails.initiativeSupervisorsComments}" /></textarea>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-10"><strong>Judgement:</strong><br>Uses
												logical and sound judgment organizes and prioritizes work
												even when encountered with conflicting priorities, seeks
												guidance if necessary.</label>
											<div class="col-md-2">
												Score:<br> <input type="text" class="form-control"
													id="jscore" placeholder="score" name="judgementScore"
													value="<c:out value="${idetails.judgementScore}"/>"
													maxlength="4"
													onkeyup="this.value = minmax(this.value, 0.00, 3.00);sum1();validate();"
													tabindex="8">
												<p id="w1"></p>
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-12">
												Supervisor&#39s Comments:<br>
												<textarea class="form-control" id="jscoretextarea"
													maxlength="150" rows="2" cols="75"
													title="Maximum length allowed is 150 characters"
													name="judgementSupervisorsComments" tabindex="7"
													onkeypress="validate();"><c:out
														value="${idetails.judgementSupervisorsComments}" /></textarea>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-10"><strong>Written
													and Oral Communication:</strong><br>Communicates in a logical
												and clear manner with others. Effectively listens, suggests
												and interacts with other team members and supervisors on all
												job related items. Welcomes and seeks constructive feedback
												on own performance for improvement. Elevates and Informs
												supervisors on job related matters, seeking advice and
												assistance to obtain a positive department/ Company image.</label>
											<div class="col-md-2">
												Score:<br> <input type="text" class="form-control"
													id="wscore" placeholder="score"
													name="writtenAndOralCommunicationScore"
													value="<c:out value="${idetails.writtenAndOralCommunicationScore}"/>"
													onkeyup="this.value = minmax(this.value, 0.00, 3.00);sum1();validate();"
													tabindex="10">
												<p id="p1"></p>
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-12">
												Supervisor&#39s Comments:<br>
												<textarea class="form-control" id="wscoretextarea"
													maxlength="150" rows="2" cols="75"
													name="writtenAndOralCommunicationSupervisorsComments"
													title="Maximum length allowed is 150 characters"
													tabindex="9" onkeypress="validate();"><c:out
														value="${idetails.writtenAndOralCommunicationSupervisorsComments}" /></textarea>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-10"><strong>Attendance,
													Punctuality and Commitment:</strong><br>Punctual and regular
												attendance. Meets deadlines without close supervision.
												Reliable in completing assigned tasks.</label>
											<div class="col-md-2">
												Score:<br> <input type="text" class="form-control"
													id="pscore" placeholder="score"
													name="punctualityAndCommitmentScore"
													value="<c:out value="${idetails.punctualityAndCommitmentScore}" />"
													maxlength="4"
													onkeyup="this.value = minmax(this.value, 0.00, 3.00);sum1();validate();"
													tabindex="12">
												<p id="p1"></p>
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-12">
												Supervisor&#39s Comments:<br>
												<textarea class="form-control" id="pscoretextarea"
													maxlength="150" rows="2" cols="75"
													name="punctualityAndCommitmentSupervisorsComments"
													title="Maximum length allowed is 150 characters"
													tabindex="11" onkeypress="validate();"><c:out
														value="${idetails.punctualityAndCommitmentSupervisorsComments}" /></textarea>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-9"></div>
											<div class="col-md-3">
												Average Score :&nbsp;<span id="tscore">${idetails.avgScore}</span>
												<%-- <p id="tscore">${idetails.avgScore}</p> --%>
											</div>

											<input type="hidden" name="avgScore" id="totalscore"
												value="${idetails.avgScore}">
										</div>


									</div>
									<%-- 	</c:forEach> --%>
								</c:if>


								<c:if
									test="${ (empty idetails && !empty imessage) || (!empty idetails && !empty imessage)}">



									<div class="form-body">
										<p>SCORE: Rate each performance factor. Unacceptable =
											0&#45 0.75; Needs Improvement = 1 &#45 1.75 Meets
											Expectations = 2 &#45 2.75; Exceeds Expectations 3. COMMENTS:
											A "Needs Improvement" rating must have an Explanation with
											Action and Follow Up. An "Exceeds Expectations" rating must
											have a justification. All sections MUST have a comment.</p>

										<div class="form-group">
											<label class="control-label col-md-10"><strong>Responsibility:</strong><br>Makes
												sound decisions with factual data and can present objective
												arguments for those decisions. Minimal decision making by
												subjectivity.</label>
											<div class="col-md-2">
												Score:<br> <input type="text" class="form-control"
													id="rscore" placeholder="score" name="responsibilityScore"
													value="<c:out value="${idetails.responsibilityScore}"/>"
													maxlength="4"
													onkeyup="this.value = minmax(this.value, 0, 3.00);sum1();"
													tabindex="2">

											</div>
										</div>
										<div class="form-group">
											<div class="col-md-12">
												Supervisor&#39s Comments:<br>
												<textarea class="form-control" rows="2" cols="75"
													maxlength="150" id="exampleTextarea"
													title="Maximum length allowed is 150 characters"
													name="responsibilitySupervisorsComments"
													onkeyup="firstEnable();" tabindex="1"><c:out
														value="${idetails.responsibilitySupervisorsComments}" /></textarea>
											</div>
										</div>


										<div class="form-group">
											<label class="control-label col-md-10"><strong>Adaptability:</strong><br>Team
												Member is able to adjust to a variety of situations.
												Flexible to company needs. Carries out assignments, jobs,
												tasks, and projects consistently and completely. Overcomes
												obstacles and accepts challenges with enthusiasm.</label>
											<div class="col-md-2">
												Score:<br> <input type="text" class="form-control"
													id="ascore" placeholder="score" name="adaptabilityScore"
													value="<c:out value="${idetails.adaptabilityScore}"/>"
													maxlength="4"
													onkeyup="this.value = minmax(this.value, 0, 3.00);sum1();"
													tabindex="4">
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-12">
												Supervisor&#39s Comments:<br>
												<textarea maxlength="150" rows="2" cols="75"
													class="form-control" id="exampleTextarea"
													title="Maximum length allowed is 150 characters"
													name="adaptabilitySupervisorsComments"
													onkeyup="secondEnable();" tabindex="3"><c:out
														value="${idetails.adaptabilitySupervisorsComments}" /></textarea>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-10"><strong>Initiative:</strong><br>Team
												Member consistently demonstrates self-motivation by
												maintaining a solid work rhythm. Moves on to the next
												assignment without reminders. Seeks additional projects
												and/or offers to assist other team members.</label>
											<div class="col-md-2">
												Score:<br> <input type="text" class="form-control"
													id="iscore" placeholder="score" name="initiativeScore"
													value="<c:out value="${idetails.initiativeScore}"/>"
													maxlength="4"
													onkeyup="this.value = minmax(this.value, 0.00, 3.00);sum1();"
													tabindex="6">
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-12">
												Supervisor&#39s Comments:<br>
												<textarea class="form-control" id="exampleTextarea"
													maxlength="150" rows="2" cols="75"
													title="Maximum length allowed is 150 characters"
													name="initiativeSupervisorsComments"
													onkeyup="thirdEnable();" tabindex="5"><c:out
														value="${idetails.initiativeSupervisorsComments}" /></textarea>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-10"><strong>Judgement:</strong><br>Uses
												logical and sound judgment organizes and prioritizes work
												even when encountered with conflicting priorities, seeks
												guidance if necessary.</label>
											<div class="col-md-2">
												Score:<br> <input type="text" class="form-control"
													id="jscore" placeholder="score" name="judgementScore"
													value="<c:out value="${idetails.judgementScore}"/>"
													maxlength="4"
													onkeyup="this.value = minmax(this.value, 0.00, 3.00);sum1();"
													tabindex="8">
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-12">
												Supervisor&#39s Comments:<br>
												<textarea class="form-control" id="exampleTextarea"
													maxlength="150" rows="2" cols="75"
													title="Maximum length allowed is 150 characters"
													name="judgementSupervisorsComments"
													onkeyup="fourthEnable();" tabindex="7"><c:out
														value="${idetails.judgementSupervisorsComments}" /></textarea>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-10"><strong>Written
													and Oral Communication:</strong><br>Communicates in a logical
												and clear manner with others. Effectively listens, suggests
												and interacts with other team members and supervisors on all
												job related items. Welcomes and seeks constructive feedback
												on own performance for improvement. Elevates and Informs
												supervisors on job related matters, seeking advice and
												assistance to obtain a positive department/ Company image.</label>
											<div class="col-md-2">
												Score:<br> <input type="text" class="form-control"
													id="wscore" placeholder="score"
													name="writtenAndOralCommunicationScore"
													value="<c:out value="${idetails.writtenAndOralCommunicationScore}"/>"
													maxlength="4"
													onkeyup="this.value = minmax(this.value, 0.00, 3.00);sum1();"
													tabindex="10">
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-12">
												Supervisor&#39s Comments:<br>
												<textarea class="form-control" id="exampleTextarea"
													maxlength="150" rows="2" cols="75"
													title="Maximum length allowed is 150 characters"
													name="writtenAndOralCommunicationSupervisorsComments"
													onkeyup="fifthEnable();" tabindex="9"><c:out
														value="${idetails.writtenAndOralCommunicationSupervisorsComments}" /></textarea>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-10"><strong>Attendance,
													Punctuality and Commitment:</strong><br>Punctual and regular
												attendance. Meets deadlines without close supervision.
												Reliable in completing assigned tasks.</label>
											<div class="col-md-2">
												Score:<br> <input type="text" class="form-control"
													id="pscore" placeholder="score"
													name="punctualityAndCommitmentScore"
													value="<c:out value="${idetails.punctualityAndCommitmentScore}" />"
													maxlength="4"
													onkeyup="this.value = minmax(this.value, 0.00,3.00);sum1();"
													tabindex="12">
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-12">
												Supervisor&#39s Comments:<br>
												<textarea class="form-control" id="exampleTextarea"
													maxlength="150" rows="2" cols="75"
													title="Maximum length allowed is 150 characters"
													name="punctualityAndCommitmentSupervisorsComments"
													onkeyup="sixthEnable();" tabindex="11"><c:out
														value="${idetails.punctualityAndCommitmentSupervisorsComments}" /></textarea>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-9"></div>
											<div class="col-md-3">
												Average Score :<span id="tscore">${idetails.avgScore}</span>
												<%-- <p id="tscore">${idetails.avgScore}</p> --%>
											</div>

											<input type="hidden" name="avgScore" id="totalscore"
												value="${idetails.avgScore}">
										</div>


									</div>

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
												if (disableStatus.equalsIgnoreCase("COMPLETED") || disableStatus.equals("MANAGER COMPLETED")
															|| disableStatus.equalsIgnoreCase("HR APPROVED") || disableStatus.equalsIgnoreCase("CLOSED")) {
											%>
											<a href="<c:url value="nonExemptPersonalInfo.do"></c:url>"
												class="btn green">Back</a>&nbsp;&nbsp;&nbsp; <a
												href="<c:url value="job-knowledge-skills.do"></c:url>"
												class="btn green">Next</a>

											<%
												} else {
											%>

											<button type="submit" class="btn green"
												name="btnSubmitBackSave">Back & Save</button>
											&nbsp;&nbsp;&nbsp;
											<button type="submit" class="btn green" name="btnSave">Save</button>
											&nbsp;&nbsp;&nbsp;
											<button type="submit" class="btn green"
												name="btnSubmitNextSave">Next & Save</button>

											<%
												}
											%>

										</div>
									</div>
									<div class="row" align="right">2 of
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
	<!-- <script>
	function firstEnable(){
		document.getElementById("rscore").disabled = false;
		
	}
	function secondEnable(){
		
		
		document.getElementById("ascore").disabled = false;
		var ascorefield =document.getElementById("ascoretextarea").value;
		
		var rscoreValidation=document.getElementById("rscore").value;
		
		if(!rscoreValidation.trim()){
			
			
			document.getElementById("r1").innerHTML="enter text field";
			document.getElementById("r1").style.color="red";
		}else{
			document.getElementById("r1").innerHTML="";
			document.getElementById("r1").style.color="black";
			
		}
		
		
		 if(!ascorefield){
			document.getElementById("r1").innerHTML="";
			document.getElementById("r1").style.color="black";
		}
	
		
	}
	function thirdEnable(){
		document.getElementById("iscore").disabled = false;
		
		var iscorefield =document.getElementById("iscoretextarea").value;
		
		var ascoreValidation=document.getElementById("ascore").value;
		
		if(!ascoreValidation.trim()){
			
			
			document.getElementById("a1").innerHTML="enter text field";
			document.getElementById("a1").style.color="red";
		}else{
			document.getElementById("a1").innerHTML="";
			document.getElementById("a1").style.color="black";
			
		}
		
		
		 if(!iscorefield){
			document.getElementById("a1").innerHTML="";
			document.getElementById("a1").style.color="black";
		}		
		
		
	}
	function fourthEnable(){
		document.getElementById("wscore").disabled = false;
	var iscorefield =document.getElementById("iscoretextarea").value;
		
		var ascoreValidation=document.getElementById("jscore").value;
		
		if(!ascoreValidation.trim()){
			
			
			document.getElementById("j1").innerHTML="enter text field";
			document.getElementById("j1").style.color="red";
		}else{
			document.getElementById("j1").innerHTML="";
			document.getElementById("j1").style.color="black";
			
		}
		
		
		 if(!iscorefield){
			document.getElementById("j1").innerHTML="";
			document.getElementById("j1").style.color="black";
		}		
		
	}
	function fifthEnable(){
		document.getElementById("pscore").disabled = false;
var iscorefield =document.getElementById("iscoretextarea").value;
		
		var ascoreValidation=document.getElementById("wscore").value;
		
		if(!ascoreValidation.trim()){
			
			
			document.getElementById("w1").innerHTML="enter text field";
			document.getElementById("w1").style.color="red";
		}else{
			document.getElementById("w1").innerHTML="";
			document.getElementById("w1").style.color="black";
			
		}
		
		
		 if(!iscorefield){
			document.getElementById("w1").innerHTML="";
			document.getElementById("w1").style.color="black";
		}		
	}
	function sixthEnable(){
		document.getElementById("pscore").disabled = false;
var iscorefield =document.getElementById("iscoretextarea").value;
		
		var ascoreValidation=document.getElementById("pscore").value;
		
		if(!ascoreValidation.trim()){
			
			
			document.getElementById("p1").innerHTML="enter text field";
			document.getElementById("p1").style.color="red";
		}else{
			document.getElementById("p1").innerHTML="";
			document.getElementById("p1").style.color="black";
			
		}
		
		
		 if(!iscorefield){
			document.getElementById("p1").innerHTML="";
			document.getElementById("p1").style.color="black";
		}		
	}
	
	</script> -->



	<script>
	  function sum1() {

		
		var result;
		var responsibilityScore;
		var adaptabilityScore;
		var initiativeScore;
		var judgementScore;
		var writtenAndOralCommunicationScore;
		var punctualityAndCommitmentScore;

		responsibilityScore = document.getElementById('rscore').value;
		adaptabilityScore = document.getElementById('ascore').value;
		
		
		initiativeScore = document.getElementById('iscore').value;
		judgementScore = document.getElementById('jscore').value;
		writtenAndOralCommunicationScore = document.getElementById('wscore').value;
		punctualityAndCommitmentScore = document.getElementById('pscore').value;

		if (responsibilityScore > 3) {
			document.getElementById('rscore').style.color = "red";
			document.getElementById('rscore').style.fontWeight = "bold";
		} else {
			document.getElementById('rscore').style.color = "black";
			document.getElementById('rscore').style.fontWeight = "normal";
		}
		if (adaptabilityScore > 3) {
			document.getElementById('ascore').style.color = "red";
			document.getElementById('ascore').style.fontWeight = "bold";
		} else {
			document.getElementById('ascore').style.color = "black";
			document.getElementById('ascore').style.fontWeight = "normal";
		}
		if (initiativeScore > 3) {
			document.getElementById('iscore').style.color = "red";
			document.getElementById('iscore').style.fontWeight = "bold";
		} else {
			document.getElementById('iscore').style.color = "black";
			document.getElementById('iscore').style.fontWeight = "normal";
		}
		if (judgementScore > 3) {
			document.getElementById('jscore').style.color = "red";
			document.getElementById('jscore').style.fontWeight = "bold";
		} else {
			document.getElementById('jscore').style.color = "black";
			document.getElementById('jscore').style.fontWeight = "normal";
		}
		if (writtenAndOralCommunicationScore > 3) {
			document.getElementById('wscore').style.color = "red";
			document.getElementById('wscore').style.fontWeight = "bold";
		} else {
			document.getElementById('wscore').style.color = "black";
			document.getElementById('wscore').style.fontWeight = "normal";
		}
		if (punctualityAndCommitmentScore > 3) {
			document.getElementById('pscore').style.color = "red";
			document.getElementById('pscore').style.fontWeight = "bold";
		} else {
			document.getElementById('pscore').style.color = "black";
			document.getElementById('pscore').style.fontWeight = "normal";
		}

		if (responsibilityScore == null || responsibilityScore.length == 0) {

			responsibilityScore = 0;
		}
		if (adaptabilityScore == null || adaptabilityScore.length == 0) {

			adaptabilityScore = 0;
		}
		if (initiativeScore == null || initiativeScore.length == 0) {

			initiativeScore = 0;
		}
		if (judgementScore == null || judgementScore.length == 0) {

			judgementScore = 0;
		}
		if (writtenAndOralCommunicationScore == null
				|| writtenAndOralCommunicationScore.length == 0) {

			writtenAndOralCommunicationScore = 0;
		}
		if (punctualityAndCommitmentScore == null
				|| punctualityAndCommitmentScore.length == 0) {

			punctualityAndCommitmentScore = 0;
		}

		
	
		
		result = (parseFloat(responsibilityScore) + parseFloat(adaptabilityScore)
				+ parseFloat(initiativeScore) + parseFloat(judgementScore)
				+ parseFloat(writtenAndOralCommunicationScore) + parseFloat(punctualityAndCommitmentScore)) / 6;
				var roundavg = result.toFixed(2)

		var avg = roundedTwoTwo(roundavg);

		if (!isNaN(avg)) {

			document.getElementById('tscore').innerHTML = avg;
			if (avg > 100) {
				document.getElementById('tscore').style.color = "red";
				document.getElementById('tscore').style.fontWeight = "bold";
			} else {
				document.getElementById('tscore').style.color = "black";
				document.getElementById('tscore').style.fontWeight = "normal";
			}
			document.getElementById('totalscore').value = avg;
			if (avg > 100) {
				document.getElementById('totalscore').style.color = "red";
				document.getElementById('totalscore').style.fontWeight = "bold";
			} else {
				document.getElementById('totalscore').style.color = "black";
				document.getElementById('totalscore').style.fontWeight = "normal";
			}

		}

	} 
	 
	</script>
</body>