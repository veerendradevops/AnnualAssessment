<%@page import="com.itextpdf.text.log.SysoCounter"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.lisi.annualassessment.util.Converters"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />


<script type="text/javascript">

$(document).ready(function() {
	   
	var validate="no";
	  <c:if test="${!empty skillsSelfAssessmentDetails && empty imessage}">
	  
	    //Skills
	  if($("#skills1").val()==""){
	   $("#skills1").css('border-color', 'red');
	   validate="yes";
	  }
	  if($("#skills2").val()==""){
		  
		  $("#skills2").css('border-color', 'red');
		  validate="yes";
	  }
	  
	  if($("#skills3").val()==""){
	   $("#skills3").css('border-color', 'red');
	   validate="yes";
	  }
	  if($("#skills4").val()==""){
		  
		  $("#skills4").css('border-color', 'red');
		  validate="yes";
	  }
	  
	  if($("#skills5").val()==""){
	   $("#skills5").css('border-color', 'red');
	   validate="yes";
	  }
	if($("#skills6").val()==""){
		  
		  $("#skills6").css('border-color', 'red');
		  validate="yes";
	  }
	  
	  if($("#skills7").val()==""){
	   $("#skills7").css('border-color', 'red');
	   validate="yes";
	  }
	  
	  if($("#skills8").val()==""){
		  
		  $("#skills8").css('border-color', 'red');
		  validate="yes";
	  }
	  
	  if($("#skills9").val()==""){
	   $("#skills9").css('border-color', 'red');
	   validate="yes";
	  }
	  if($("#skills10").val()==""){
		   $("#skills10").css('border-color', 'red');
		   validate="yes";
		  }
	  
	  //waysOfWorking
	  if($("#waysOfWorking1").val()==""){
	   $("#waysOfWorking1").css('border-color', 'red');
	   validate="yes";
	  }
	  
	  if($("#waysOfWorking2").val()==""){
		   $("#waysOfWorking2").css('border-color', 'red');
		   validate="yes";
		  }
	  
	  if($("#waysOfWorking3").val()==""){
		   $("#waysOfWorking3").css('border-color', 'red');
		   validate="yes";
		  }
	  
	  if($("#waysOfWorking4").val()==""){
		   $("#waysOfWorking4").css('border-color', 'red');
		   validate="yes";
		  }
	  
	  if($("#waysOfWorking5").val()==""){
		   $("#waysOfWorking5").css('border-color', 'red');
		   validate="yes";
		  }
	  
	  if($("#waysOfWorking6").val()==""){
		   $("#waysOfWorking6").css('border-color', 'red');
		   validate="yes";
		  }
	  
	  if($("#waysOfWorking7").val()==""){
		   $("#waysOfWorking7").css('border-color', 'red');
		   validate="yes";
		  }
	  
	  //Self-Management and Leadership
	  if($("#selfManagementandLeadership1").val()==""){
		   $("#selfManagementandLeadership1").css('border-color', 'red');
		   validate="yes";
		  }
	  
	  if($("#selfManagementandLeadership2").val()==""){
		   $("#selfManagementandLeadership2").css('border-color', 'red');
		   validate="yes";
		  }
	  
	  if($("#selfManagementandLeadership3").val()==""){
		   $("#selfManagementandLeadership3").css('border-color', 'red');
		   validate="yes";
		  }
	  if($("#selfManagementandLeadership4").val()==""){
		   $("#selfManagementandLeadership4").css('border-color', 'red');
		   validate="yes";
		  }
	  if($("#selfManagementandLeadership5").val()==""){
		   $("#selfManagementandLeadership5").css('border-color', 'red');
		   validate="yes";
		  }
	  
	  if($("#selfManagementandLeadership6").val()==""){
		   $("#selfManagementandLeadership6").css('border-color', 'red');
		   validate="yes";
		  }
	  
	  if($("#selfManagementandLeadership7").val()==""){
		   $("#selfManagementandLeadership7").css('border-color', 'red');
		   validate="yes";
		  }
	  
	  //Self Assessment Summary
	  if($("#Section1G4").val()==""){
		   $("#Section1G4").css('border-color', 'red');
		   validate="yes";
		  }
	  
	  if($("#Section1G5").val()==""){
		   $("#Section1G5").css('border-color', 'red');
		   validate="yes";
		  }
	  

	   </c:if>
	   
	   if(validate=="yes"){
			
			
			document.getElementById("headermessage").innerHTML="Please note, <font color='red'>All required fields have not been completed.</font> Please verify the required fields have been completed for each page"
		}
});

	$(document)
			.ready(
					function() {
						//alert('<c:out value="${status}"/>');
						<c:if test="${status=='COMPLETED' || status=='MANAGER COMPLETED' || status=='HR APPROVED' || status== 'CLOSED'}">

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

function formSubmission(control) {
		

		var message="valid";
		var buttonName = control.name;
		var Section1G5 = document.getElementById("Section1G5");
		var Section1G4 = document.getElementById("Section1G4");
		var selfManagementandLeadership7 = document
				.getElementById("selfManagementandLeadership7");
		var selfManagementandLeadership6 = document
				.getElementById("selfManagementandLeadership6");
		var selfManagementandLeadership5 = document
				.getElementById("selfManagementandLeadership5");
		var selfManagementandLeadership4 = document
				.getElementById("selfManagementandLeadership4");
		var selfManagementandLeadership3 = document
				.getElementById("selfManagementandLeadership3");
		var selfManagementandLeadership2 = document
				.getElementById("selfManagementandLeadership2");
		var selfManagementandLeadership1 = document
				.getElementById("selfManagementandLeadership1");
		var waysOfWorking7 = document.getElementById("waysOfWorking7");
		var waysOfWorking6 = document.getElementById("waysOfWorking6");
		var waysOfWorking5 = document.getElementById("waysOfWorking5");
		var waysOfWorking4 = document.getElementById("waysOfWorking4");
		var waysOfWorking3 = document.getElementById("waysOfWorking3");
		var waysOfWorking2 = document.getElementById("waysOfWorking2");
		var waysOfWorking1 = document.getElementById("waysOfWorking1");
		var skills10 = document.getElementById("skills10");
		var skills9 = document.getElementById("skills9");
		var skills8 = document.getElementById("skills8");
		var skills7 = document.getElementById("skills7");
		var skills6 = document.getElementById("skills6");
		var skills5 = document.getElementById("skills5");
		var skills4 = document.getElementById("skills4");
		var skills3 = document.getElementById("skills3");
		var skills2 = document.getElementById("skills2");
		var skills1 = document.getElementById("skills1");

		if (skills1.value.length < 1) {
			document.getElementById("skills1").style.borderColor = "red";
			message="not valid";
		}else{
			
			document.getElementById("skills1").style.borderColor = "black";
		} 
		
		if (skills2.value.length < 1) {
			document.getElementById("skills2").style.borderColor = "red";
			message="not valid";
		
		}else{
			
			document.getElementById("skills2").style.borderColor = "black";
		}   
		if (skills3.value.length < 1) {
			document.getElementById("skills3").style.borderColor = "red";
			message="not valid";
		} 
		else{
			
			document.getElementById("skills3").style.borderColor = "black";
		} if (skills4.value.length < 1) {
			document.getElementById("skills4").style.borderColor = "red";
			message="not valid";
		}else{
			
			document.getElementById("skills4").style.borderColor = "black";
		}   
		if (skills5.value.length < 1) {
			document.getElementById("skills5").style.borderColor = "red";
			message="not valid";
		}else{
			
			document.getElementById("skills5").style.borderColor = "black";
		}   
		if (skills6.value.length < 1) {
			document.getElementById("skills6").style.borderColor = "red";
			message="not valid";
		}  
		else{
			
			document.getElementById("skills6").style.borderColor = "black";
		} 
		if (skills7.value.length < 1) {
			document.getElementById("skills7").style.borderColor = "red";
			message="not valid";
		}
		else{
			
			document.getElementById("skills7").style.borderColor = "black";
		} 
		if (skills8.value.length < 1) {
			document.getElementById("skills8").style.borderColor = "red";
			message="not valid";
		}else{
			
			document.getElementById("skills8").style.borderColor = "black";
		} 
		
		if (skills9.value.length < 1) {
			document.getElementById("skills9").style.borderColor = "red";
			message="not valid";
		}else{
			
			document.getElementById("skills9").style.borderColor = "black";
		}   
		if (skills10.value.length < 1) {
			document.getElementById("skills10").style.borderColor = "red";
					message="not valid";
		}else{
			
			document.getElementById("skills10").style.borderColor = "black";
		}  
		if (waysOfWorking1.value.length < 1) {
			document.getElementById("waysOfWorking1").style.borderColor = "red";
			message="not valid";
		}else{
			
			document.getElementById("waysOfWorking1").style.borderColor = "black";
		}  
		if (waysOfWorking2.value.length < 1) {
			document.getElementById("waysOfWorking2").style.borderColor = "red";
			message="not valid";
		}  else{
			
			document.getElementById("waysOfWorking2").style.borderColor = "black";
		}  
		if (waysOfWorking3.value.length < 1) {
			document.getElementById("waysOfWorking3").style.borderColor = "red";
			message="not valid";
		}else{
			
			document.getElementById("waysOfWorking3").style.borderColor = "black";
		}    
		if (waysOfWorking4.value.length < 1) {
			document.getElementById("waysOfWorking4").style.borderColor = "red";
			message="not valid";
		}else{
			
			document.getElementById("waysOfWorking4").style.borderColor = "black";
		}   
		
		if (waysOfWorking5.value.length < 1) {
			document.getElementById("waysOfWorking5").style.borderColor = "red";
			message="not valid";
		}else{
			
			document.getElementById("waysOfWorking5").style.borderColor = "black";
		}     
		if (waysOfWorking6.value.length < 1) {
			document.getElementById("waysOfWorking6").style.borderColor = "red";
			message="not valid";
		}else{
			
			document.getElementById("waysOfWorking6").style.borderColor = "black";
		}    
		if (waysOfWorking7.value.length < 1) {
			document.getElementById("waysOfWorking7").style.borderColor = "red";
			message="not valid";
		}else{
			
			document.getElementById("waysOfWorking7").style.borderColor = "black";
		}     
		if (selfManagementandLeadership1.value.length < 1) {
			document.getElementById("selfManagementandLeadership1").style.borderColor = "red";
			message="not valid";
		}else{
			
			document.getElementById("selfManagementandLeadership1").style.borderColor = "black";
		}    
		
		if (selfManagementandLeadership2.value.length < 1) {
			document.getElementById("selfManagementandLeadership2").style.borderColor = "red";
			message="not valid";
		} else{
			
			document.getElementById("selfManagementandLeadership2").style.borderColor = "black";
		}   
		
		  if (selfManagementandLeadership3.value.length < 1) {
			document.getElementById("selfManagementandLeadership3").style.borderColor = "red";
			message="not valid";
		} else{
			
			document.getElementById("selfManagementandLeadership3").style.borderColor = "black";
		}   
		  if (selfManagementandLeadership4.value.length < 1) {
			document.getElementById("selfManagementandLeadership4").style.borderColor = "red";
			message="not valid";
		} else{
			
			document.getElementById("selfManagementandLeadership4").style.borderColor = "black";
		}   
		  if (selfManagementandLeadership5.value.length < 1) {
			document.getElementById("selfManagementandLeadership5").style.borderColor = "red";
			message="not valid";
		} else{
			
			document.getElementById("selfManagementandLeadership5").style.borderColor = "black";
		}    
		  if (selfManagementandLeadership6.value.length < 1) {
			document.getElementById("selfManagementandLeadership6").style.borderColor = "red";
			message="not valid";
		} else{
			
			document.getElementById("selfManagementandLeadership6").style.borderColor = "black";
		}   
		  if (selfManagementandLeadership7.value.length < 1) {
			document.getElementById("selfManagementandLeadership7").style.borderColor = "red";
			message="not valid";
		} else{
			
			document.getElementById("selfManagementandLeadership7").style.borderColor = "black";
		}    
		  if (Section1G4.value.length < 1) {
			document.getElementById("Section1G4").style.borderColor = "red";
			message="not valid";
		} else{
			
			document.getElementById("Section1G4").style.borderColor = "black";
		}   
		  if (Section1G5.value.length < 1) {
			document.getElementById("Section1G5").style.borderColor = "red";
			message="not valid";
		}  else{
			
			document.getElementById("Section1G5").style.borderColor = "black";
		}   
	//	alert("message " + message);
			if(message=="valid"){
			if (buttonName.trim() == 'saveSubmit') {

				if (confirm("Thank you for completing the EMPLOYEE section of the appraisal process."
						+ " "
						+ "Your completed  form has been forwarded to the designated SUPERVISOR.  You will now be logged off.")) {
					yourformelement.submit();
				} else {
					return false;
				}

				/* 	
				alert("Thank you for completing the EMPLOYEE section of the appraisal process."+" "+ 
				"Your completed  form has been forwarded to the designate SUPERVISOR.  You will now be logged off.");
				 */
			}
			//	return true;
		}else{
			
			 document.getElementById("skillselfassessment").innerHTML="<h6 style=color:red>All required fields have not been completed. Please verify the required fields have been completed for each page</h6>"; 
			return false;
		}

	};
</script>

<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
	<!-- <div class="loader"></div> -->

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
					<li><span>F. Skills Self Assessment </span></li>
				</ul>
			</div>
			<!-- END PAGE BAR -->
			<!-- BEGIN PAGE TITLE-->
			<h3 class="page-title">F. Skills Self Assessment</h3>
			<center>
				<h3 id="skillselfassessment">
					<c:if test="${!empty reviewOfPastYear}">
			
			${reviewOfPastYear }
			
			</c:if>
				</h3>
			</center>
			<h6 id="headermessage">
				<!-- Please note, <font color="red">ALL FIELDS MARKED IN RED </font> have
				to be completed before you save or submit -->
			</h6>
			<!-- END PAGE TITLE-->
			<!-- END PAGE HEADER-->



			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN VALIDATION STATES-->
					<div class="portlet light portlet-fit portlet-form bordered">

						<div class="portlet-body">
							<!-- BEGIN FORM-->


							<form:form name="skillsSelfAssessmentdetails"
								action="/AnnualAssessmenT/getSkillsSelfAssessment.do"
								method="post" modelAttribute="SkillsSelfAssesmentVariables"
								class="form-horizontal">

								<c:if
									test="${!empty skillsSelfAssessmentDetails && empty imessage}">

									<script type="text/javascript">
									
									
									function validate(){
							
										
							
										//Skills
										var skills1 = document.getElementById('skills1').value;
										
									
										if(skills1==""){
										
										 document.getElementById('skills1').style.borderColor = "red";
										}else{
											
											document.getElementById('skills1').style.borderColor = "black";
										}
										var skills2 = document.getElementById('skills2').value;
									
										if(skills2==""){
										
										
										 document.getElementById('skills2').style.borderColor = "red";
										}else{
											
											
											document.getElementById('skills2').style.borderColor = "black";
										}
										var skills3 = document.getElementById('skills3').value;
										
										if(skills3==""){
										
										 document.getElementById('skills3').style.borderColor = "red";
										}else{
											
											document.getElementById('skills3').style.borderColor = "black";
										}
								var skills4 = document.getElementById('skills4').value;
										
										if(skills4==""){
										
										 document.getElementById('skills4').style.borderColor = "red";
										}else{
											
											document.getElementById('skills4').style.borderColor = "black";
										}
								var skills5 = document.getElementById('skills5').value;
										
										if(skills5==""){
										
										 document.getElementById('skills5').style.borderColor = "red";
										}else{
											
											document.getElementById('skills5').style.borderColor = "black";
										}
										var skills6 = document.getElementById('skills6').value;
										
										if(skills6==""){
										
										 document.getElementById('skills6').style.borderColor = "red";
										}else{
											
											document.getElementById('skills6').style.borderColor = "black";
										}
										
										var skills7 = document.getElementById('skills7').value;
										  if(skills7==""){
											  
											  document.getElementById('skills7').style.borderColor = "red";
										  }else{
											  
											  document.getElementById('skills7').style.borderColor = "black";
										  }
										  
											var skills8 = document.getElementById('skills8').value;
											
											  if(skills8==""){
												  
												  document.getElementById('skills8').style.borderColor = "red";
											  }else{
												  
												  document.getElementById('skills8').style.borderColor = "black";
											  }
											 
												var skills9 = document.getElementById('skills9').value;
												
												  if(skills9==""){
													  
													  document.getElementById('skills9').style.borderColor = "red";
												  }else{
													  
													  document.getElementById('skills9').style.borderColor = "black";
												  }
												  
													var skills10 = document.getElementById('skills10').value;
													
													  if(skills10==""){
														  
														  document.getElementById('skills10').style.borderColor = "red";
													  }else{
														  
														  document.getElementById('skills10').style.borderColor = "black";
													  }
													  
													  

													  //waysOfWorking
													  var waysOfWorking1 = document.getElementById('waysOfWorking1').value;
													  
														
													  if(waysOfWorking1==""){
														  
														  document.getElementById('waysOfWorking1').style.borderColor = "red";
													  }else{
														  
														  document.getElementById('waysOfWorking1').style.borderColor = "black";
													  }
													  
													  var waysOfWorking2 = document.getElementById('waysOfWorking2').value;
														
													  if(waysOfWorking2==""){
														  
														  document.getElementById('waysOfWorking2').style.borderColor = "red";
													  }else{
														  
														  document.getElementById('waysOfWorking2').style.borderColor = "black";
													  }		
													  
													
													  var waysOfWorking3 = document.getElementById('waysOfWorking3').value;
														
													  if(waysOfWorking3==""){
														  
														  document.getElementById('waysOfWorking3').style.borderColor = "red";
													  }else{
														  
														  document.getElementById('waysOfWorking3').style.borderColor = "black";
													  }
													  
													  var waysOfWorking4 = document.getElementById('waysOfWorking4').value;
														
													  if(waysOfWorking4==""){
														  
														  document.getElementById('waysOfWorking4').style.borderColor = "red";
													  }else{
														  
														  document.getElementById('waysOfWorking4').style.borderColor = "black";
													  }		
													  
													  
													  
														
													  var waysOfWorking5 = document.getElementById('waysOfWorking5').value;
														
													  if(waysOfWorking5==""){
														  
														  document.getElementById('waysOfWorking5').style.borderColor = "red";
													  }else{
														  
														  document.getElementById('waysOfWorking5').style.borderColor = "black";
													  }
													  
													  var waysOfWorking6 = document.getElementById('waysOfWorking6').value;
														
													  if(waysOfWorking6==""){
														  
														  document.getElementById('waysOfWorking6').style.borderColor = "red";
													  }else{
														  
														  document.getElementById('waysOfWorking6').style.borderColor = "black";
													  }		
													  
													  
													  var waysOfWorking7 = document.getElementById('waysOfWorking7').value;
														
													  if(waysOfWorking7==""){
														  
														  document.getElementById('waysOfWorking7').style.borderColor = "red";
													  }else{
														  
														  document.getElementById('waysOfWorking7').style.borderColor = "black";
													  }		
													  
													  
													  //selfManagementandLeadership
													  
													  var selfManagementandLeadership1 = document.getElementById('selfManagementandLeadership1').value;
														
													  if(selfManagementandLeadership1==""){
														  
														  document.getElementById('selfManagementandLeadership1').style.borderColor = "red";
													  }else{
														  
														  document.getElementById('selfManagementandLeadership1').style.borderColor = "black";
													  }
													  
													  var selfManagementandLeadership2 = document.getElementById('selfManagementandLeadership2').value;
														
													  if(selfManagementandLeadership2==""){
														  
														  document.getElementById('selfManagementandLeadership2').style.borderColor = "red";
													  }else{
														  
														  document.getElementById('selfManagementandLeadership2').style.borderColor = "black";
													  }		
													  
													
													  var selfManagementandLeadership3 = document.getElementById('selfManagementandLeadership3').value;
														
													  if(selfManagementandLeadership3==""){
														  
														  document.getElementById('selfManagementandLeadership3').style.borderColor = "red";
													  }else{
														  
														  document.getElementById('selfManagementandLeadership3').style.borderColor = "black";
													  }
													  
													  var selfManagementandLeadership4 = document.getElementById('selfManagementandLeadership4').value;
														
													  if(selfManagementandLeadership4==""){
														  
														  document.getElementById('selfManagementandLeadership4').style.borderColor = "red";
													  }else{
														  
														  document.getElementById('selfManagementandLeadership4').style.borderColor = "black";
													  }		
													  
													  
													  
														
													  var selfManagementandLeadership5 = document.getElementById('selfManagementandLeadership5').value;
														
													  if(selfManagementandLeadership5==""){
														  
														  document.getElementById('selfManagementandLeadership5').style.borderColor = "red";
													  }else{
														  
														  document.getElementById('selfManagementandLeadership5').style.borderColor = "black";
													  }
													  
													  var selfManagementandLeadership6 = document.getElementById('selfManagementandLeadership6').value;
														
													  if(selfManagementandLeadership6==""){
														  
														  document.getElementById('selfManagementandLeadership6').style.borderColor = "red";
													  }else{
														  
														  document.getElementById('selfManagementandLeadership6').style.borderColor = "black";
													  }		
													  
													  
													  var selfManagementandLeadership7 = document.getElementById('selfManagementandLeadership7').value;
														
													  if(selfManagementandLeadership7==""){
														  
														  document.getElementById('selfManagementandLeadership7').style.borderColor = "red";
													  }else{
														  
														  document.getElementById('selfManagementandLeadership7').style.borderColor = "black";
													  }		
													  
													  
													  
													  
													  //summary
													  
						  
													  var Section1G4 = document.getElementById('Section1G4').value;
														
													  if(Section1G4==""){
														  
														  document.getElementById('Section1G4').style.borderColor = "red";
													  }else{
														  
														  document.getElementById('Section1G4').style.borderColor = "black";
													  }		
													  
													  
													  var Section1G5 = document.getElementById('Section1G5').value;
														
													  if(Section1G5==""){
														  
														  document.getElementById('Section1G5').style.borderColor = "red";
													  }else{
														  
														  document.getElementById('Section1G5').style.borderColor = "black";
													  }		
												  
									}
								
									</script>

									<div class="form-body">

										<p>Complete assessment and provide specific examples in
											attached sheets if necessary..</p>
										<h4>Skills</h4>
										<div class="form-group">

											<label class="control-label col-md-3"><strong>
											</strong></label>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Makes sound
												decisions with factual data and can present objective
												arguments for those decisions. Minimal decision making by
												subjectivity.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills1" class="skill1"
													id="skills1" onchange="validate()">
													<option value=""
														${skillsSelfAssessmentDetails.skills1==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.skills1=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills1=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills1=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.skills1=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>

												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Initiates and
												implement new ideas/processes.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills2" class="skill1"
													id="skills2" onchange="validate()">
													<option value=""
														${skillsSelfAssessmentDetails.skills2==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.skills2=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills2=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills2=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.skills2=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">Organizes and
												prioritizes work even when encountered with conflicting
												priorities, seeks guidance if necessary.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills3" id="skills3"
													onchange="validate()">
													<option value=""
														${skillsSelfAssessmentDetails.skills3==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.skills3=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills3=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills3=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.skills3=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Displays a
												positive approach towards work assignments and people.
												Overcomes obstacles and accepts challenges with enthusiasm.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills4" class="skill1"
													id="skills4" onchange="validate()">
													<option value=""
														${skillsSelfAssessmentDetails.skills4==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.skills4=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills4=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills4=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.skills4=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Able to work
												well with internal and external customers and build
												relationships/partnerships with other departments and team
												members.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills5" class="skill1"
													id="skills5" onchange="validate()">
													<option value=""
														${skillsSelfAssessmentDetails.skills5==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.skills5=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills5=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills5=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.skills5=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Possesses and
												applies technical knowledge required for positions.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills6" class="skill1"
													id="skills6" onchange="validate()">
													<option value=""
														${skillsSelfAssessmentDetails.skills6==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.skills6=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills6=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills6=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.skills6=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Able to analyze
												situations and tasks accurately.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills7" class="skill1"
													id="skills7" onchange="validate()">
													<option value=""
														${skillsSelfAssessmentDetails.skills7==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.skills7=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills7=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills7=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.skills7=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Takes required
												risk as needed by position.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills8" class="skill1"
													id="skills8" onchange="validate()">
													<option value=""
														${skillsSelfAssessmentDetails.skills8==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.skills8=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills8=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills8=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.skills8=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Ability to
												resolve conflicts at all levels of the Company.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills9" class="skill1"
													id="skills9" onchange="validate()">
													<option value=""
														${skillsSelfAssessmentDetails.skills9==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.skills9=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills9=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills9=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.skills9=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">Able to work
												independently on agreed upon tasks.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills10" class="skill1"
													id="skills10" onchange="validate()">
													<option value=""
														${skillsSelfAssessmentDetails.skills10==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.skills10=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills10=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills10=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.skills10=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<h4>Ways of Working</h4>
										<div class="form-group">
											<label class="control-label col-md-9"><p>
													<font size="3"> </font>
												</p></label> <label class="control-label col-md-3"><strong>
											</strong></label>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Consistently
												adheres to all rules and regulations.</label>
											<div class="col-md-3">
												<select class="form-control" name="waysOfWorking1"
													id="waysOfWorking1" onchange="validate()">

													<option value=""
														${skillsSelfAssessmentDetails.waysOfWorking1==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking1=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking1=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking1=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.waysOfWorking1=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Has commitment
												to meet agreed upon goals displaying positive behaviors.
												Attends meetings and does what he/she says is going to do.
												Communicates and/or re-negotiates agreed upon expectations
												if not able to meet deadlines.</label>
											<div class="col-md-3">
												<select class="form-control" name="waysOfWorking2"
													id="waysOfWorking2" onchange="validate()">
													<option value=""
														${skillsSelfAssessmentDetails.waysOfWorking2==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking2=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking2=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking2=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.waysOfWorking2=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Organization of
												duties, work, and tasks (method, delegation, control).</label>
											<div class="col-md-3">
												<select class="form-control" name="waysOfWorking3"
													id="waysOfWorking3" onchange="validate()">
													<option value=""
														${skillsSelfAssessmentDetails.waysOfWorking3==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking3=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking3=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking3=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.waysOfWorking3=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">Able to
												articulate thoughts, ideas, and events in writing and
												orally.</label>
											<div class="col-md-3">
												<select class="form-control" name="waysOfWorking4"
													id="waysOfWorking4" onchange="validate()">
													<option value=""
														${skillsSelfAssessmentDetails.waysOfWorking4==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking4=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking4=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking4=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.waysOfWorking4=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">Displays
												commitment to the Company's continuous improvement efforts
												and implements/supports continuous improvement in area(s) of
												responsibility.</label>
											<div class="col-md-3">
												<select class="form-control" name="waysOfWorking5"
													id="waysOfWorking5" onchange="validate()">
													<option value=""
														${skillsSelfAssessmentDetails.waysOfWorking5==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking5=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking5=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking5=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.waysOfWorking5=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Establishes
												high standards and goals, works diligently on meeting set
												standards and goals overcoming obstacles.</label>
											<div class="col-md-3">
												<select class="form-control" name="waysOfWorking6"
													id="waysOfWorking6" onchange="validate()">
													<option value=""
														${skillsSelfAssessmentDetails.waysOfWorking6==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking6=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking6=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking6=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.waysOfWorking6=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">Handles
												multiple projects and tasks concurrently and is able to
												prioritize and re-prioritize with minimal guidance.</label>
											<div class="col-md-3">
												<select class="form-control" name="waysOfWorking7"
													id="waysOfWorking7" onchange="validate()">
													<option value=""
														${skillsSelfAssessmentDetails.waysOfWorking7==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking7=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking7=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking7=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.waysOfWorking7=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<h4>Self-Management and Leadership</h4>
										<div class="form-group">
											<label class="control-label col-md-9"><p>
													<font size="3"><strong></strong></font>
												</p></label> <label class="control-label col-md-3"><strong>
											</strong></label>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Manages tasks
												and projects with minimal guidance (Plan, Do, Check, Act).
												When assigned leadership role, is able to lead and achieve
												results with collaboration from other team members.</label>
											<div class="col-md-3">
												<select class="form-control"
													name="selfManagementandLeadership1"
													id="selfManagementandLeadership1" onchange="validate()">

													<option value=""
														${skillsSelfAssessmentDetails.selfManagementandLeadership1==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership1=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership1=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership1=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.selfManagementandLeadership1=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">Adheres to
												Company policies, practices and legal requirements.
												Implements agreed upon direction even if personal point of
												view may be in conflict.</label>
											<div class="col-md-3">
												<select class="form-control"
													name="selfManagementandLeadership2"
													id="selfManagementandLeadership2" onchange="validate()">
													<option value=""
														${skillsSelfAssessmentDetails.selfManagementandLeadership2==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership2=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership2=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership2=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.selfManagementandLeadership2=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Recognizes
												his/her mistakes and implements corrective action/preventive
												actions.</label>
											<div class="col-md-3">
												<select class="form-control"
													name="selfManagementandLeadership3"
													id="selfManagementandLeadership3" onchange="validate()">
													<option value=""
														${skillsSelfAssessmentDetails.selfManagementandLeadership3==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership3=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership3=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership3=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.selfManagementandLeadership3=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Exemplifies the
												Company guiding principle of integrity in his/her decision
												making and dealing with supervisors, peers, and external
												customers.</label>
											<div class="col-md-3">
												<select class="form-control"
													name="selfManagementandLeadership4"
													id="selfManagementandLeadership4" onchange="validate()">
													<option value=""
														${skillsSelfAssessmentDetails.selfManagementandLeadership4==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership4=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership4=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership4=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.selfManagementandLeadership4=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Listens
												attentively to others and responds with respect. Accepts
												differences of opinions, style, and approach.</label>
											<div class="col-md-3">
												<select class="form-control"
													name="selfManagementandLeadership5"
													id="selfManagementandLeadership5" onchange="validate()">
													<option value=""
														${skillsSelfAssessmentDetails.selfManagementandLeadership5==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership5=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership5=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership5=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.selfManagementandLeadership5=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Anticipates
												departmental needs and understands his/her role in achieving
												Company objectives.</label>
											<div class="col-md-3">
												<select class="form-control"
													name="selfManagementandLeadership6"
													id="selfManagementandLeadership6" onchange="validate()">
													<option value=""
														${skillsSelfAssessmentDetails.selfManagementandLeadership6==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership6=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership6=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership6=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.selfManagementandLeadership6=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Participates
												and works well in a team environment. Is flexible as a team
												member and supports team consensus.</label>
											<div class="col-md-3">
												<select class="form-control"
													name="selfManagementandLeadership7"
													id="selfManagementandLeadership7" onchange="validate()">
													<option value=""
														${skillsSelfAssessmentDetails.selfManagementandLeadership7==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership7=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership7=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership7=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.selfManagementandLeadership7=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<!-- <p><font size="4">Self Assessment Summary</font></p> -->


										<h4>Self Assessment Summary</h4>

										<div class="form-group">

											<div class="col-md-6">
												Summary Strengths
												<textarea class="form-control"
													title="Maximum length allowed is 300 characters"
													id="Section1G4" maxlength="300" onchange="validate()"
													rows="2" name="Section1G4">${skillsSelfAssessmentDetails.section1G4}</textarea>
											</div>
											<div class="col-md-6">
												Summary of Areas of Improvement
												<textarea class="form-control"
													title="Maximum length allowed is 300 characters"
													id="Section1G5" maxlength="300" onchange="validate()"
													rows="2" name="Section1G5">${skillsSelfAssessmentDetails.section1G5}</textarea>
											</div>
										</div>



									</div>
									<%-- 	<div class="form-actions">
										<div class="row">
											<div class="col-md-12">

												<c:set var="disableStatus" value="${status}" scope="request" />

												<%!String status;%>
												<%
													status = (String) request.getAttribute("disableStatus");
															status = status.toUpperCase();
															String supervisor = (String) session.getAttribute("supervisor");
												%>

												<%
													if (String.valueOf(supervisor).equalsIgnoreCase("supervisor") || status.equals("COMPLETED")
																	|| status.equals("MANAGER COMPLETED")
																	|| String.valueOf(status).equalsIgnoreCase("HR APPROVED")
																	|| String.valueOf(status).equalsIgnoreCase("CLOSED")) {
												%>
												<a href="<c:url value="reviewOfPastYear.do"></c:url>"
													class="btn green">Back</a>
												<%
													} else {
												%>
												<button type="submit" class="btn green" name="backAndSave"
													onclick="return formSubmission(this);">Back & Save</button>
												&nbsp;&nbsp;&nbsp;
												<button type="submit" class="btn green" name="save"
													onclick="return formSubmission(this);">Save</button>
												&nbsp;&nbsp;&nbsp;
												<button type="submit" class="btn green" name="saveSubmit"
													onclick="return formSubmission(this);">Submit</button>
												<%
													}
												%>
												
												<%
													String exemptEmpClock = (String) session.getAttribute("exemptEmp");

												System.out.println("exemptEmpclock====================================");
												System.out.println(exemptEmpClock);
												
															if (!String.valueOf(exemptEmpClock).equalsIgnoreCase("null")) {
												%>

													<a href="<c:url value="objectiveAchievemtnScreen.do"></c:url>"
													class="btn green">Next</a>
												<%
													}else{
												%>
												
												
												<%
													}
												%>

											</div>

										</div>
										<div class="row" align="right">3 of
											3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
									</div> --%>



								</c:if>
								<c:if
									test="${(empty skillsSelfAssessmentDetails && !empty imessage) || (!empty skillsSelfAssessmentDetails && !empty imessage)}">
									<div class="form-body">
										<p>Complete assessment and provide specific examples in
											attached sheets if necessary.</p>

										<h4>Skills</h4>
										<div class="form-group">

											<label class="control-label col-md-3"><strong>
											</strong></label>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">Makes sound
												decisions with factual data and can present objective
												arguments for those decisions. Minimal decision making by
												subjectivity.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills1" class="skill1"
													id="skills1" onchange="formSubmission(this)">


													<option value=""
														${skillsSelfAssessmentDetails.skills1==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.skills1=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills1=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills1=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.skills1=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>


												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Initiates and
												implement new ideas/processes.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills2" class="skill1"
													id="skills2" onchange="formSubmission(this)">
													<option value=""
														${skillsSelfAssessmentDetails.skills2==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.skills2=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills2=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills2=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.skills2=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">Organizes and
												prioritizes work even when encountered with conflicting
												priorities, seeks guidance if necessary.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills3" class="skill1"
													id="skills3" onchange="formSubmission(this)">
													<option value=""
														${skillsSelfAssessmentDetails.skills3==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.skills3=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills3=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills3=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.skills3=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Displays a
												positive approach towards work assignments and people.
												Overcomes obstacles and accepts challenges with enthusiasm.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills4" class="skill1"
													id="skills4" onchange="formSubmission(this)">
													<option value=""
														${skillsSelfAssessmentDetails.skills4==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.skills4=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills4=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills4=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.skills4=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Able to work
												well with internal and external customers and build
												relationships/partnerships with other departments and team
												members.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills5" class="skill1"
													id="skills5" onchange="formSubmission(this)">
													<option value=""
														${skillsSelfAssessmentDetails.skills5==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.skills5=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills5=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills5=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.skills5=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Possesses and
												applies technical knowledge required for positions.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills6" class="skill1"
													id="skills6" onchange="formSubmission(this)">
													<option value=""
														${skillsSelfAssessmentDetails.skills6==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.skills6=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills6=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills6=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.skills6=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Able to analyze
												situations and tasks accurately.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills7" class="skill1"
													id="skills7" onchange="formSubmission(this)">
													<option value=""
														${skillsSelfAssessmentDetails.skills7==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.skills7=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills7=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills7=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.skills7=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Takes required
												risk as needed by position.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills8" class="skill1"
													id="skills8" onchange="formSubmission(this)">
													<option value=""
														${skillsSelfAssessmentDetails.skills8==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.skills8=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills8=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills8=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.skills8=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Ability to
												resolve conflicts at all levels of the Company.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills9" class="skill1"
													id="skills9" onchange="formSubmission(this)">
													<option value=""
														${skillsSelfAssessmentDetails.skills9==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.skills9=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills9=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills9=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.skills9=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">Able to work
												independently on agreed upon tasks.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills10" class="skill1"
													id="skills10" onchange="formSubmission(this)">
													<option value=""
														${skillsSelfAssessmentDetails.skills10==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.skills10=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills10=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.skills10=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.skills10=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<h4>Ways of Working</h4>
										<div class="form-group">
											<label class="control-label col-md-9">

												<p>
													<font size="3"><strong></strong></font>
												</p>
											</label> <label class="control-label col-md-3"><strong>
											</strong></label>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Consistently
												adheres to all rules and regulations.</label>
											<div class="col-md-3">
												<select class="form-control" name="waysOfWorking1"
													id="waysOfWorking1" onchange="formSubmission(this)">
													<option value=""
														${skillsSelfAssessmentDetails.waysOfWorking1==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking1=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking1=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking1=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.waysOfWorking1=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Has commitment
												to meet agreed upon goals displaying positive behaviors.
												Attends meetings and does what he/she says is going to do.
												Communicates and/or re-negotiates agreed upon expectations
												if not able to meet deadlines.</label>
											<div class="col-md-3">
												<select class="form-control" name="waysOfWorking2"
													id="waysOfWorking2" onchange="formSubmission(this)">
													<option value=""
														${skillsSelfAssessmentDetails.waysOfWorking2==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking2=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking2=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking2=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.waysOfWorking2=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Organization of
												duties, work, and tasks (method, delegation, control).</label>
											<div class="col-md-3">
												<select class="form-control" name="waysOfWorking3"
													id="waysOfWorking3" onchange="formSubmission(this)">
													<option value=""
														${skillsSelfAssessmentDetails.waysOfWorking3==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking3=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking3=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking3=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.waysOfWorking3=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">Able to
												articulate thoughts, ideas, and events in writing and
												orally.</label>
											<div class="col-md-3">
												<select class="form-control" name="waysOfWorking4"
													id="waysOfWorking4" onchange="formSubmission(this)">
													<option value=""
														${skillsSelfAssessmentDetails.waysOfWorking4==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking4=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking4=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking4=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.waysOfWorking4=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">Displays
												commitment to the Company's continuous improvement efforts
												and implements/supports continuous improvement in area(s) of
												responsibility.</label>
											<div class="col-md-3">
												<select class="form-control" name="waysOfWorking5"
													id="waysOfWorking5" onchange="formSubmission(this)">
													<option value=""
														${skillsSelfAssessmentDetails.waysOfWorking5==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking5=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking5=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking5=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.waysOfWorking5=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Establishes
												high standards and goals, works diligently on meeting set
												standards and goals overcoming obstacles.</label>
											<div class="col-md-3">
												<select class="form-control" name="waysOfWorking6"
													id="waysOfWorking6" onchange="formSubmission(this)">
													<option value=""
														${skillsSelfAssessmentDetails.waysOfWorking6==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking6=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking6=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking6=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.waysOfWorking6=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">Handles
												multiple projects and tasks concurrently and is able to
												prioritize and re-prioritize with minimal guidance.</label>
											<div class="col-md-3">
												<select class="form-control" name="waysOfWorking7"
													id="waysOfWorking7" onchange="formSubmission(this)">
													<option value=""
														${skillsSelfAssessmentDetails.waysOfWorking7==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking7=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking7=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.waysOfWorking7=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.waysOfWorking7=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<h4>Self-Management and Leadership</h4>
										<div class="form-group">
											<label class="control-label col-md-3"><strong>
											</strong></label>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Manages tasks
												and projects with minimal guidance (Plan, Do, Check, Act).
												When assigned leadership role, is able to lead and achieve
												results with collaboration from other team members.</label>
											<div class="col-md-3">
												<select class="form-control"
													name="selfManagementandLeadership1"
													id="selfManagementandLeadership1"
													onchange="formSubmission(this)">
													<option value=""
														${skillsSelfAssessmentDetails.selfManagementandLeadership1==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership1=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership1=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership1=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.selfManagementandLeadership1=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">Adheres to
												Company policies, practices and legal requirements.
												Implements agreed upon direction even if personal point of
												view may be in conflict.</label>
											<div class="col-md-3">
												<select class="form-control"
													name="selfManagementandLeadership2"
													id="selfManagementandLeadership2"
													onchange="formSubmission(this)">
													<option value=""
														${skillsSelfAssessmentDetails.selfManagementandLeadership2==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership2=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership2=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership2=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.selfManagementandLeadership2=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Recognizes
												his/her mistakes and implements corrective action/preventive
												actions.</label>
											<div class="col-md-3">
												<select class="form-control"
													name="selfManagementandLeadership3"
													id="selfManagementandLeadership3"
													onchange="formSubmission(this)">
													<option value=""
														${skillsSelfAssessmentDetails.selfManagementandLeadership3==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership3=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership3=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership3=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.selfManagementandLeadership3=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Exemplifies the
												Company guiding principle of integrity in his/her decision
												making and dealing with supervisors, peers, and external
												customers.</label>
											<div class="col-md-3">
												<select class="form-control"
													name="selfManagementandLeadership4"
													id="selfManagementandLeadership4"
													onchange="formSubmission(this)">
													<option value=""
														${skillsSelfAssessmentDetails.selfManagementandLeadership4==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership4=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership4=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership4=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.selfManagementandLeadership4=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Listens
												attentively to others and responds with respect. Accepts
												differences of opinions, style, and approach.</label>
											<div class="col-md-3">
												<select class="form-control"
													name="selfManagementandLeadership5"
													id="selfManagementandLeadership5"
													onchange="formSubmission(this)">
													<option value=""
														${skillsSelfAssessmentDetails.selfManagementandLeadership5==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership5=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership5=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership5=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.selfManagementandLeadership5=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Anticipates
												departmental needs and understands his/her role in achieving
												Company objectives.</label>
											<div class="col-md-3">
												<select class="form-control"
													name="selfManagementandLeadership6"
													id="selfManagementandLeadership6"
													onchange="formSubmission(this)">
													<option value=""
														${skillsSelfAssessmentDetails.selfManagementandLeadership6==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership6=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership6=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership6=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.selfManagementandLeadership6=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Participates
												and works well in a team environment. Is flexible as a team
												member and supports team consensus.</label>
											<div class="col-md-3">
												<select class="form-control"
													name="selfManagementandLeadership7"
													id="selfManagementandLeadership7"
													onchange="formSubmission(this)">
													<option value=""
														${skillsSelfAssessmentDetails.selfManagementandLeadership7==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership7=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership7=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skillsSelfAssessmentDetails.selfManagementandLeadership7=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skillsSelfAssessmentDetails.selfManagementandLeadership7=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<p>
											<font size="4">Self Assessment Summary</font>
										</p>
										<div class="form-group">
											<div class="col-md-6">
												Summary Strengths
												<textarea class="form-control"
													title="Maximum length allowed is 300 characters"
													id="Section1G4" maxlength="300" rows="2" name="Section1G4"
													onkeyup="formSubmission(this)">${skillsSelfAssessmentDetails.section1G4}</textarea>
											</div>
											<div class="col-md-6">
												Summary of Areas of Improvement
												<textarea class="form-control"
													title="Maximum length allowed is 300 characters"
													id="Section1G5" maxlength="300" rows="2" name="Section1G5"
													onkeyup="formSubmission(this)">${skillsSelfAssessmentDetails.section1G5}</textarea>
											</div>
										</div>



									</div>
									<!-- <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <button type="submit" class="btn green" name="backAndSave" >Back & Save</button>
                                                &nbsp;&nbsp;&nbsp;
                                                <button type="submit" class="btn green" name="save">Save</button>
                                                &nbsp;&nbsp;&nbsp;
                                             <button type="submit" class="btn green" name="saveSubmit">Submit</button>
                                            
                                            </div>
                                            
                                        </div>
                                        <div class="row" align="right">3 of
                                            3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                                    </div> -->

								</c:if>
								<div class="form-actions">
									<div class="row">
										<c:set var="disableStatus" value="${statusMssg}"
											scope="request" />
										<c:set var="supervisor" value="${supervisor}" scope="request" />
										<div class="col-md-12">

											<%
												String supervisor = (String) session.getAttribute("supervisor");
													String statusMssg = (String) request.getAttribute("disableStatus");
													if (String.valueOf(supervisor).equalsIgnoreCase("supervisor")
															|| String.valueOf(statusMssg).equalsIgnoreCase("completed")
															|| String.valueOf(statusMssg).equalsIgnoreCase("MANAGER COMPLETED")
															|| String.valueOf(statusMssg).equalsIgnoreCase("HR APPROVED")
															|| String.valueOf(statusMssg).equalsIgnoreCase("CLOSED")) {
											%>
											<a href="<c:url value="reviewOfPastYear.do"></c:url>"
												class="btn green">Back</a>

											<%
												} else {
											%>
											<button type="submit" class="btn green" name="backAndSave">Back
												& Save</button>
											&nbsp;&nbsp;&nbsp;
											<button type="submit" class="btn green" name="save">Save</button>
											<!-- onclick="return formSubmission(this);" -->
											&nbsp;&nbsp;&nbsp;

											<c:if test="${status == 'STARTED' }">


												<button type="submit" class="btn green" name="saveSubmit"
													onclick="return formSubmission(this);">Submit</button>

												<script type="text/javascript">
														formSubmission('saveSubmit');
														</script>
											</c:if>

											<c:if test="${status != 'STARTED' }">


												<button type="submit" class="btn green" name="partialSubmit">Submit</button>
											</c:if>



											<%
												}
											%>

											<%-- 	<c:if test="${fn:contains(loginUser.roles, 'Supervisor,HrManager,HRGeneralist,HRAdmin')}"> --%>

											<%-- <c:if test="${(status !='Not Started' || status !='STARTED') && loginUser.exemptEmployeeClock ne 'null'}">
												<a href="<c:url value="objectiveAchievemtnScreen.do"></c:url>"
													class="btn green">Next</a>
												</c:if>  --%>

											<%-- 	</c:if> --%>
											<%
												String exemptEmpClock = (String) session.getAttribute("exemptEmp");
													if (!String.valueOf(exemptEmpClock).equalsIgnoreCase("null")) {
											%>

											<a
												href="<c:url value="objectiveAchievemtnScreen.do"></c:url>"
												class="btn green">Next</a>
											<%
												}
											%>



										</div>

									</div>
									<div class="row" align="right">3 of
										3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
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

</body>