

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

 </style>  -->

<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white"
	onload="avg();">

	<script type="text/javascript">


function minmax(value, min, max) 
{

	
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
   //alert('<c:out value="${status}"/>');
   
   
	 <c:if test="${!empty jdetails && empty jmessage}">
	   
	   //sscore
	  if($("#sscore").val()==""){
	   $("#sscore").css('border-color', 'red');
	  }
	   //sscoretextarea
	  if($("#sscoretextarea").val()==""){
		  
		  $("#sscoretextarea").css('border-color', 'red');
	  }
	  //qscore
	  if($("#qscore").val()==""){
	   $("#qscore").css('border-color', 'red');
	  }
	  //qscoretextarea
	  if($("#qscoretextarea").val()==""){
		  
		  $("#qscoretextarea").css('border-color', 'red');
	  }
	  //pscore
	  if($("#pscore").val()==""){
	   $("#pscore").css('border-color', 'red');
	  }
	  //pscoretextarea   
	if($("#pscoretextarea").val()==""){
		  
		  $("#pscoretextarea").css('border-color', 'red');
	  }
	  //jkscore
	  
	  if($("#jkscore").val()==""){
	   $("#jkscore").css('border-color', 'red');
	  }
	  
	  //jkscoretextarea
	  if($("#jkscoretextarea").val()==""){
		  
		  $("#jkscoretextarea").css('border-color', 'red');
	  }
	  
	  
	  //supervisortextarea
	  if($("#supervisortextarea").val()==""){
		   $("#supervisortextarea").css('border-color', 'red');
		  }
	  
	  
	 
	   </c:if>
   
   <c:if test="${status=='COMPLETED' || status=='MANAGER COMPLETED' || status=='HR APPROVED' || status=='CLOSED'}">
     
   $("#testDiv").find("input,button,textarea,select,radio").attr("disabled", "disabled");
   
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
					<li><span>Job Knowledge & Skills</span></li>
				</ul>
			</div>
			<!-- END PAGE BAR -->
			<!-- BEGIN PAGE TITLE-->
			<h3 class="page-title">
				Job Knowledge & Skills

				<c:if test="${!email }"> ${email }</c:if>

			</h3>
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
							<form:form action="jobknowledgeForm.do" method="post"
								modelAttribute="jobknowledge" id="jobKnowledgeSkillsForm"
								class="form-horizontal">
								<c:if test="${!empty jdetails && empty jmessage}">


									<script>
									function validate(){
										//sscore
										var sscore = document.getElementById('sscore').value;
									
										if(sscore==""){
										
										 document.getElementById('sscore').style.borderColor = "red";
										}else{
											
											document.getElementById('sscore').style.borderColor = "black";
										}
										//qscore
										var qscore = document.getElementById('qscore').value;
										
										if(qscore==""){
										
										 document.getElementById('qscore').style.borderColor = "red";
										}else{
											
											document.getElementById('qscore').style.borderColor = "black";
										}
										//pscore
										var pscore = document.getElementById('pscore').value;
										
										if(pscore==""){
										
										 document.getElementById('pscore').style.borderColor = "red";
										}else{
											
											document.getElementById('pscore').style.borderColor = "black";
										}
										//jkscore
							        	var jkscore = document.getElementById('jkscore').value;
										
										if(jkscore==""){
										
										 document.getElementById('jkscore').style.borderColor = "red";
										}else{
											
											document.getElementById('jkscore').style.borderColor = "black";
										}
										
	                                
										//alert("rs");
										
										//sscoretextarea
										var sscoretextarea = document.getElementById('sscoretextarea').value;
									//	alert(sscoretextarea);
										  if(sscoretextarea==""){
											  
											  document.getElementById('sscoretextarea').style.borderColor = "red";
										  }else{
											  
											  document.getElementById('sscoretextarea').style.borderColor = "black";
										  }
										  //qscoretextarea
										  
											var qscoretextarea = document.getElementById('qscoretextarea').value;
											
											  if(qscoretextarea==""){
												  
												  document.getElementById('qscoretextarea').style.borderColor = "red";
											  }else{
												  
												  document.getElementById('qscoretextarea').style.borderColor = "black";
											  }
											 //pscoretextarea
											 
												var pscoretextarea = document.getElementById('pscoretextarea').value;
												
												  if(pscoretextarea==""){
													  
													  document.getElementById('pscoretextarea').style.borderColor = "red";
												  }else{
													  
													  document.getElementById('pscoretextarea').style.borderColor = "black";
												  }
												  //jkscoretextarea
													var jkscoretextarea = document.getElementById('jkscoretextarea').value;
													
													  if(jkscoretextarea==""){
														  
														  document.getElementById('jkscoretextarea').style.borderColor = "red";
													  }else{
														  
														  document.getElementById('jkscoretextarea').style.borderColor = "black";
													  }
													  
													  //supervisortextarea
													  var supervisortextarea = document.getElementById('supervisortextarea').value;
														
													  if(supervisortextarea==""){
														  
														  document.getElementById('supervisortextarea').style.borderColor = "red";
													  }else{
														  
														  document.getElementById('supervisortextarea').style.borderColor = "black";
													  }
													  
													 	
									} 
									
									</script>




									<%-- <c:forEach items="${jobKnowledgeData}" var="jdetails"> --%>

									<div class="form-body">
										<p>SCORE: Rate each performance factor. Unacceptable = 0
											&#45 0.75; Needs Improvement = 1 &#45 1.75 Meets Expectations
											= 2 &#45 2.75; Exceeds Expectations 3. COMMENTS: A &#34Needs
											Improvement" rating must have an Explanation with Action and
											Follow Up. An "Exceeds Expectations" rating must have a
											justification. All sections MUST have a comment.</p>

										<div class="form-group">
											<label class="control-label col-md-10"><strong>Safety:</strong><br>Team
												Member abides with Company HSE and governmental safety
												procedures and environmental and hazardous materials
												regulations. Always wears Personal Protective Equipment
												(PPE) in the required areas. Team Member attends safety
												training regularly. Operates machinery and/or assigned
												equipment following all safety practices. Maintains an
												orderly work area with minimum supervision to promote a safe
												working environment.</label>
											<div class="col-md-2">
												Score:<br> <input type="text" class="form-control"
													id="sscore" placeholder="score" name="safetyScore"
													value="<c:out value="${jdetails.safetyScore}"/>"
													maxlength="4"
													onkeyup="this.value = minmax(this.value, 0.00, 3.00);avg(); validate();"
													tabindex="2">
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-12">
												Supervisor&#39s Comments:<br>
												<textarea class="form-control" id="sscoretextarea"
													maxlength="150" rows="2" cols="75"
													name="safetySupervisorsComments"
													title="Maximum length allowed is 150 characters"
													onkeyup="validate();" tabindex="1"><c:out
														value="${jdetails.safetySupervisorsComments}" /></textarea>
											</div>
										</div>


										<div class="form-group">
											<label class="control-label col-md-10"><strong>Quality:</strong><br>Work
												completed with neat and detailed accuracy that meets
												Company, "right the first time" principals. Team Member has
												the required knowledge, competency, and attitude to
												consistently produce good quality work with low levels of
												errors.</label>
											<div class="col-md-2">
												Score:<br> <input type="text" class="form-control"
													id="qscore" placeholder="score" name="qualityScore"
													onkeyup="this.value = minmax(this.value, 0.00, 3.00);avg(); validate();"
													maxlength="4" tabindex="4"
													value="<c:out value="${jdetails.qualityScore}"/>">
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-12">
												Supervisor&#39s Comments:<br>
												<textarea class="form-control" id="qscoretextarea"
													maxlength="150" rows="2" cols="75"
													name="qualitySupervisiorsComments"
													title="Maximum length allowed is 150 characters"
													onkeyup="validate();" tabindex="3"><c:out
														value="${jdetails.qualitySupervisorsComments}" /></textarea>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-10"><strong>Productivity:</strong><br>Effectively
												uses work time, plans and prioritizes work load to attain,
												"right the first time" results. Accomplishes goals and
												completes job assignments on schedule.</label>
											<div class="col-md-2">
												Score:<br> <input type="text" class="form-control"
													id="pscore" placeholder="score" name="productivityScore"
													maxlength="4" tabindex="6"
													onkeyup="this.value = minmax(this.value, 0.00, 3.00);avg(); validate();"
													value="<c:out value="${jdetails.productivityScore}"/>">
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-12">
												Supervisor&#39s Comments:<br>
												<textarea class="form-control" id="pscoretextarea"
													maxlength="150" rows="2" cols="75"
													name="productivitySupervisorsComments"
													title="Maximum length allowed is 150 characters"
													onkeyup="validate();" tabindex="5"><c:out
														value="${jdetails.productivitySupervisorsComments}" /></textarea>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-10"><strong>Job
													Knowledge & Skills:</strong><br>Team Member understands and
												performs the essential job requirements and duties of the
												position. Is proficient and familiar with the equipment
												needed to perform the job successfully.</label>
											<div class="col-md-2">
												Score:<br> <input type="text" class="form-control"
													id="jkscore" placeholder="score"
													name="jobKnowledgeAndSkillsScore" maxlength="4"
													tabindex="8"
													onkeyup="this.value = minmax(this.value, 0.00, 3.00);avg(); validate();"
													value="<c:out value="${jdetails.jobKnowledgeAndSkillsScore}"/>">
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-12">
												Supervisor&#39s Comments:<br>
												<textarea class="form-control" id="jkscoretextarea"
													maxlength="150" rows="2" cols="75"
													name="jobKnowledgeAndSkillsSupervisorsComments"
													title="Maximum length allowed is 150 characters"
													onkeyup="validate();" tabindex="7"><c:out
														value="${jdetails.jobKnowledgeAndSkillsSupervisorsComments}" /></textarea>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-9"></div>
											<div class="col-md-3">
												Average Score :&nbsp;<span id="ascore">${jdetails.avgScore}</span>
												<%-- <p id="ascore">${jdetails.avgScore}</p> --%>
												<input type="hidden" name="avgScore" id="avgscore"
													value="${jdetails.avgScore}">

											</div>
										</div>
										<h4>Summary of Performance Review</h4>

										<div class="form-group">
											<div class="col-md-12">
												Supervisor&#39s overall comments<br>
												<textarea class="form-control" id="supervisortextarea"
													maxlength="300" rows="4" cols="75"
													name="supervisorsOveralComments"
													title="Maximum length allowed is 300 characters"
													onkeyup="validate();" tabindex="9"><c:out
														value="${jdetails.supervisorsOverallComments}" /></textarea>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-9"></div>
											<div class="col-md-3">
												Average Score :&nbsp;<span id="summaryScore">${avgScore}</span>
												<%-- <p id="summaryScore">${jdetails.summaryAvgScore}</p> --%>

											</div>
											<input type="hidden" name="summaryAvgScore"
												id="summaryPerformanceScore" value="${avgScore}">

										</div>

									</div>
									<!-- <div class="form-actions">
											<div class="row">
												<div class="col-md-12">
													<a href="training-development.html" class="btn green">3
														of 5</a>
												</div>
											</div>
										</div> -->
									<%-- 	</c:forEach> --%>
									<input type="hidden" name="interpersonalScore"
										id="interpersonalScore" value="${avgScore }">
									<input type="hidden" name="summaryAvgScore" id="summaryScore">

								</c:if>



								<c:if
									test="${(empty jdetails && !empty jmessage) || (!empty jdetails && !empty jmessage)}">



									<div class="form-body">
										<p>SCORE: Rate each performance factor. Unacceptable = 0
											&#45 0.75; Needs Improvement = 1 &#45 1.75 Meets Expectations
											= 2 &#45 2.75; Exceeds Expectations 3. COMMENTS: A &#34Needs
											Improvement" rating must have an Explanation with Action and
											Follow Up. An "Exceeds Expectations" rating must have a
											justification. All sections MUST have a comment.</p>

										<div class="form-group">
											<label class="control-label col-md-10"><strong>Safety:</strong><br>Team
												Member abides with Company HSE and governmental safety
												procedures and environmental and hazardous materials
												regulations. Always wears Personal Protective Equipment
												(PPE) in the required areas. Team Member attends safety
												training regularly. Operates machinery and/or assigned
												equipment following all safety practices. Maintains an
												orderly work area with minimum supervision to promote a safe
												working environment.</label>
											<div class="col-md-2">
												Score:<br> <input type="text" class="form-control"
													id="sscore" placeholder="score" name="safetyScore"
													value="<c:out value="${jdetails.safetyScore}"/>"
													maxlength="4"
													onkeyup="this.value = minmax(this.value, 0.00, 3.00);avg();"
													tabindex="2">
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-12">
												Supervisor&#39s Comments:<br>
												<textarea class="form-control" id="exampleTextarea"
													maxlength="150" rows="2" cols="75"
													title="Maximum length allowed is 150 characters"
													name="safetySupervisorsComments" onkeyup="firstEnable();"
													tabindex="1"><c:out
														value="${jdetails.safetySupervisorsComments}" /></textarea>
											</div>
										</div>


										<div class="form-group">
											<label class="control-label col-md-10"><strong>Quality:</strong><br>Work
												completed with neat and detailed accuracy that meets
												Company, "right the first time" principals. Team Member has
												the required knowledge, competency, and attitude to
												consistently produce good quality work with low levels of
												errors.</label>
											<div class="col-md-2">
												Score:<br> <input type="text" class="form-control"
													id="qscore" placeholder="score" name="qualityScore"
													value="<c:out value="${jdetails.qualityScore}"/>"
													maxlength="4"
													onkeyup="this.value = minmax(this.value, 0.00, 3.00);avg();"
													tabindex="4">
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-12">
												Supervisor&#39s Comments:<br>
												<textarea class="form-control" id="exampleTextarea"
													maxlength="150" rows="2" cols="75"
													title="Maximum length allowed is 150 characters"
													name="qualitySupervisiorsComments"
													onkeyup="secondEnable();" tabindex="3"><c:out
														value="${jdetails.qualitySupervisorsComments}" /></textarea>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-10"><strong>Productivity:</strong><br>Effectively
												uses work time, plans and prioritizes work load to attain,
												"right the first time" results. Accomplishes goals and
												completes job assignments on schedule.</label>
											<div class="col-md-2">
												Score:<br> <input type="text" class="form-control"
													id="pscore" placeholder="score" name="productivityScore"
													value="<c:out value="${jdetails.productivityScore}"/>"
													maxlength="4"
													onkeyup="this.value = minmax(this.value, 0.00, 3.00);avg();"
													tabindex="6">
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-12">
												Supervisor&#39s Comments:<br>
												<textarea class="form-control" id="exampleTextarea"
													maxlength="150" rows="2" cols="75"
													title="Maximum length allowed is 150 characters"
													name="productivitySupervisorsComments"
													onkeyup="thirdEnable();" tabindex="5"><c:out
														value="${jdetails.productivitySupervisorsComments}" /></textarea>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-10"><strong>Job
													Knowledge & Skills:</strong><br>Team Member understands and
												performs the essential job requirements and duties of the
												position. Is proficient and familiar with the equipment
												needed to perform the job successfully.</label>
											<div class="col-md-2">
												Score:<br> <input type="text" class="form-control"
													id="jkscore" placeholder="score"
													name="jobKnowledgeAndSkillsScore"
													value="<c:out value="${jdetails.jobKnowledgeAndSkillsScore}"/>"
													maxlength="4"
													onkeyup="this.value = minmax(this.value, 0.00, 3.00);avg();"
													tabindex="8">
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-12">
												Supervisor&#39s Comments:<br>
												<textarea class="form-control" id="exampleTextarea"
													maxlength="150" rows="2" cols="75"
													title="Maximum length allowed is 150 characters"
													name="jobKnowledgeAndSkillsSupervisorsComments"
													onkeyup="fourthEnable();" tabindex="7"><c:out
														value="${jdetails.jobKnowledgeAndSkillsSupervisorsComments}" /></textarea>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-9"></div>
											<div class="col-md-3">
												AverageScore :&nbsp;<span id="ascore">${jdetails.avgScore}</span>
												<%-- <p id="ascore">${jdetails.avgScore}</p> --%>
												<input type="hidden" name="avgScore" id="avgscore"
													value="${jdetails.avgScore}">




											</div>
										</div>
										<h4>Summary of Performance Review</h4>

										<div class="form-group">
											<div class="col-md-12">
												Supervisor&#39s overall comments<br>
												<textarea class="form-control" id="exampleTextarea"
													maxlength="300" rows="4" cols="75"
													title="Maximum length allowed is 300 characters"
													name="supervisorsOveralComments" tabindex="9"><c:out
														value="${jdetails.supervisorsOverallComments}" /></textarea>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-9"></div>
											<div class="col-md-3">
												Average Score :&nbsp;<span id="summaryScore">${avgScore}</span>
												<%-- <p id="summaryScore">${jdetails.summaryAvgScore}</p> --%>

											</div>
											<input type="hidden" name="summaryAvgScore"
												id="summaryPerformanceScore" value="${avgScore}">

										</div>

									</div>


									<input type="hidden" name="interpersonalScore"
										id="interpersonalScore" value="${avgScore}">

									<input type="hidden" name="summaryAvgScore" id="summaryScore">

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
											<a href="<c:url value="interpersonal-skills.do"></c:url>"
												class="btn green">Back</a>&nbsp;&nbsp;&nbsp; <a
												href="<c:url value="training-development.do"></c:url>"
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
									<div class="row" align="right">3 of 5
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
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
	<script>
function avg() {
	var avgresult;
	var safetyScore;
	var qualityScore;
	var productivityScore;
	var jobKnowledgeAndSkillsScore;
	var interpersonalAvgScore;
	var avgScore;

	safetyScore = document.getElementById('sscore').value;
	
	

	qualityScore = document.getElementById('qscore').value;
	
	
	
	productivityScore = document.getElementById('pscore').value;
	
	
	
	jobKnowledgeAndSkillsScore = document.getElementById('jkscore').value;
	
	

	

	if (safetyScore == null || safetyScore.length == 0) {

		safetyScore = 0;

	}
	if (qualityScore == null || qualityScore.length == 0) {

		qualityScore = 0;

	}
	if (productivityScore == null || productivityScore.length == 0) {
		productivityScore = 0;
	}
	if (jobKnowledgeAndSkillsScore == null
			|| jobKnowledgeAndSkillsScore.length == 0) {
		jobKnowledgeAndSkillsScore = 0;
	}

	avgresult = (parseFloat(safetyScore) + parseFloat(qualityScore)
			+ parseFloat(productivityScore) + parseFloat(jobKnowledgeAndSkillsScore)) / 4;
     
	
	if (!isNaN(avgresult)) {

		var roundavg = avgresult.toFixed(2)
	
    
		//var avgScore = roundedTwoTwo(roundavg);
	

		document.getElementById('ascore').innerHTML = roundavg;

		
		document.getElementById('avgscore').value = roundavg;
		interpersonalAvgScore=${avgScoreScript};

		
				if (interpersonalAvgScore == "") {

			
			if (!isNaN(roundavg)) {
				var summaryavgScore = parseFloat(roundavg) / 2;
				var roundavg = summaryavgScore.toFixed(2)

			//	var getScore = roundedTwoTwo(roundavg);

				document.getElementById("summaryScore").innerHTML = roundavg;
				
				alert("of");
				alert(roundavg);
				document.getElementById("summaryPerformanceScore").value = roundavg;

			}
		} else {

			avgScore = (parseFloat(interpersonalAvgScore) + parseFloat(roundavg)) / 2;
			var roundavg = avgScore.toFixed(2);

		//	var summaryAvgScore = roundedTwoTwo(roundavg);

			if (!isNaN(roundavg)) {
				

				document.getElementById('summaryScore').innerHTML = roundavg;
				
				document.getElementById('summaryPerformanceScore').value = roundavg;

			}

		}

	}
}
	</script>
</body>