<%@page import="com.lisi.annualassessment.util.Converters"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							//alert('<c:out value="${status}"/>');
							<c:if test="${status=='MANAGER COMPLETED' || status=='HR APPROVED' || status=='CLOSED'}">

							$("#testDiv").find(
									"input,button,textarea,select,radio").attr(
									"disabled", "disabled");

							</c:if>

						});
		
		$(document).ready(function() {
			   
			validate="no";
			
			  <c:if test="${!empty skill1 && empty imessage}">
			   
			   
			  if($("#s1").val()==""){
			   $("#s1").css('border-color', 'red');
			   validate="yes";
			  }
			  
			  if($("#s2").val()==""){
				   $("#s2").css('border-color', 'red');
				   validate="yes";
				  }
			  if($("#s3").val()==""){
				   $("#s3").css('border-color', 'red');
				   validate="yes";
				  }
			  if($("#s4").val()==""){
				   $("#s4").css('border-color', 'red');
				   validate="yes";
				  }
			  if($("#s5").val()==""){
				   $("#s5").css('border-color', 'red');
				   validate="yes";
				  }
			  if($("#s6").val()==""){
				   $("#s6").css('border-color', 'red');
				   validate="yes";
				  }
			  if($("#s7").val()==""){
				   $("#s7").css('border-color', 'red');
				   validate="yes";
				  }
			  if($("#s8").val()==""){
				   $("#s8").css('border-color', 'red');
				   validate="yes";
				  }
			  if($("#s9").val()==""){
				   $("#s9").css('border-color', 'red');
				   validate="yes";
				  }
			  if($("#s10").val()==""){
				   $("#s10").css('border-color', 'red');
				   validate="yes";
				  }
			  if($("#wow1").val()==""){
				   $("#wow1").css('border-color', 'red');
				   validate="yes";
				  }
			  if($("#wow2").val()==""){
				   $("#wow2").css('border-color', 'red');
				   validate="yes";
				  }
			  if($("#wow3").val()==""){
				   $("#wow3").css('border-color', 'red');
				   validate="yes";
				  }
			  if($("#wow4").val()==""){
				   $("#wow4").css('border-color', 'red');
				   validate="yes";
				  }
			  if($("#wow5").val()==""){
				   $("#wow5").css('border-color', 'red');
				   validate="yes";
				  }
			  if($("#wow6").val()==""){
				   $("#wow6").css('border-color', 'red');
				   validate="yes";
				  }
			  if($("#wow7").val()==""){
				   $("#wow7").css('border-color', 'red');
				   validate="yes";
				  }
			  if($("#selfleader1").val()==""){
				   $("#selfleader1").css('border-color', 'red');
				   validate="yes";
				  }
			  if($("#selfleader2").val()==""){
				   $("#selfleader2").css('border-color', 'red');
				   validate="yes";
				  }
			  if($("#selfleader3").val()==""){
				   $("#selfleader3").css('border-color', 'red');
				   validate="yes";
				  }
			  if($("#selfleader4").val()==""){
				   $("#selfleader4").css('border-color', 'red');
				   validate="yes";
				  }
			  if($("#selfleader5").val()==""){
				   $("#selfleader5").css('border-color', 'red');
				   validate="yes";
				  }
			  if($("#selfleader6").val()==""){
				   $("#selfleader6").css('border-color', 'red');
				   validate="yes";
				  }
			  if($("#selfleader7").val()==""){
				   $("#selfleader7").css('border-color', 'red');
				   validate="yes";
				  }
			  
			  if(validate=="yes"){
					
					
					document.getElementById("headermessage").innerHTML="Please note, <font color='red'>ALL FIELDS MARKED IN RED </font> have to be completed before being allowed to the next screen"
				}
				  
			  </c:if>
			   
		});
	</script>

	<!-- BEGIN CONTENT -->
	<div class="page-content-wrapper" id="testDiv">
		<!-- BEGIN CONTENT BODY -->
		<div class="page-content">
			<!-- BEGIN PAGE HEADER-->

			<!-- BEGIN PAGE BAR -->

			<P>
				<c:if test="${!empty errorMsg}">
					<h4>
						<font color="red"><center>${errorMsg}</center></font>
					</h4>
				</c:if>

			</P>
			<div class="page-bar">
				<ul class="page-breadcrumb">
					<li><a href="#" class="disabled">Home</a> <i
						class="fa fa-circle"></i></li>
					<li><span>Manager's Skill Assessment</span></li>
				</ul>
			</div>
			<!-- END PAGE BAR -->
			<!-- BEGIN PAGE TITLE-->
			<h3 class="page-title">Manager's Skill Assessment</h3>
			<center>
				<h3>
					<c:if test="${! empty managerskillassessment }">
					${managerskillassessment }
					</c:if>
				</h3>
			</center>
			<h6  id="headermessage">
				<!-- Please note, <font color="red">ALL FIELDS MARKED IN RED </font> have
				to be completed before being allowed to the next screen -->
			</h6>
			<!-- END PAGE TITLE-->
			<!-- END PAGE HEADER-->



			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN VALIDATION STATES-->
					<div class="portlet light portlet-fit portlet-form bordered">

						<div class="portlet-body">
							<!-- BEGIN FORM-->
							<form:form
								action="/AnnualAssessmenT/managerSkillAssessmentAction.do"
								method="GET" modelAttribute="exemptSection2Pojo"
								class="form-horizontal">
								<c:if test="${!empty skill1 && empty imessage}">

									<script type="text/javascript">
						
						function validate(){
							
							
							var s1 =document.getElementById("s1").value;
							
							if(s1==""){
							
								document.getElementById('s1').style.borderColor ="red";
							}else{
								
								document.getElementById('s1').style.borderColor ="black";
							}
							
                           
							var s2 =document.getElementById("s2").value;
							
							if(s2==""){
							
								document.getElementById('s2').style.borderColor ="red";
							}else{
								
								document.getElementById('s2').style.borderColor ="black";
							}
							
                           var s3 =document.getElementById("s3").value;
							
							if(s3==""){
							
								document.getElementById('s3').style.borderColor ="red";
							}else{
								
								document.getElementById('s3').style.borderColor ="black";
							}
							
                               var s4 =document.getElementById("s4").value;
							
							if(s4==""){
							
								document.getElementById('s4').style.borderColor ="red";
							}else{
								
								document.getElementById('s4').style.borderColor ="black";
							}
							
                               var s5 =document.getElementById("s5").value;
							
							if(s5==""){
							
								document.getElementById('s5').style.borderColor ="red";
							}else{
								
								document.getElementById('s5').style.borderColor ="black";
							}
							
                                  var s6 =document.getElementById("s6").value;
							
							if(s6==""){
							
								document.getElementById('s6').style.borderColor ="red";
							}else{
								
								document.getElementById('s6').style.borderColor ="black";
							}
							
                              var s7 =document.getElementById("s7").value;
							
							if(s7==""){
							
								document.getElementById('s7').style.borderColor ="red";
							}else{
								
								document.getElementById('s7').style.borderColor ="black";
							}
							
                                 var s8 =document.getElementById("s8").value;
							
							if(s8==""){
							
								document.getElementById('s8').style.borderColor ="red";
							}else{
								
								document.getElementById('s8').style.borderColor ="black";
							}
							
                                 var s9 =document.getElementById("s9").value;
							
							if(s9==""){
							
								document.getElementById('s9').style.borderColor ="red";
							}else{
								
								document.getElementById('s9').style.borderColor ="black";
							}
							
var s10 =document.getElementById("s10").value;
							
							if(s10==""){
							
								document.getElementById('s10').style.borderColor ="red";
							}else{
								
								document.getElementById('s10').style.borderColor ="black";
							}
							
                                var wow1 =document.getElementById("wow1").value;
							
							if(wow1==""){
							
								document.getElementById('wow1').style.borderColor ="red";
							}else{
								
								document.getElementById('wow1').style.borderColor ="black";
							}
						
var wow2 =document.getElementById("wow2").value;
							
							if(wow2==""){
							
								document.getElementById('wow2').style.borderColor ="red";
							}else{
								
								document.getElementById('wow2').style.borderColor ="black";
							}
							
var wow3 =document.getElementById("wow3").value;
							
							if(wow3==""){
							
								document.getElementById('wow3').style.borderColor ="red";
							}else{
								
								document.getElementById('wow3').style.borderColor ="black";
							}
							
var wow4 =document.getElementById("wow4").value;
							
							if(wow4==""){
							
								document.getElementById('wow4').style.borderColor ="red";
							}else{
								
								document.getElementById('wow4').style.borderColor ="black";
							}
							
var wow5 =document.getElementById("wow5").value;
							
							if(wow5==""){
							
								document.getElementById('wow5').style.borderColor ="red";
							}else{
								
								document.getElementById('wow5').style.borderColor ="black";
							}
							
var wow6 =document.getElementById("wow6").value;
							
							if(wow6==""){
							
								document.getElementById('wow6').style.borderColor ="red";
							}else{
								
								document.getElementById('wow6').style.borderColor ="black";
							}
						
var wow7 =document.getElementById("wow7").value;
							
							if(wow7==""){
							
								document.getElementById('wow7').style.borderColor ="red";
							}else{
								
								document.getElementById('wow7').style.borderColor ="black";
							}
							
var selfleader1 =document.getElementById("selfleader1").value;
							
							if(selfleader1==""){
							
								document.getElementById('selfleader1').style.borderColor ="red";
							}else{
								
								document.getElementById('selfleader1').style.borderColor ="black";
							}
				
var selfleader2 =document.getElementById("selfleader2").value;
							
							if(selfleader2==""){
							
								document.getElementById('selfleader2').style.borderColor ="red";
							}else{
								
								document.getElementById('selfleader2').style.borderColor ="black";
							}
							
var selfleader3 =document.getElementById("selfleader3").value;
							
							if(selfleader3==""){
							
								document.getElementById('selfleader3').style.borderColor ="red";
							}else{
								
								document.getElementById('selfleader3').style.borderColor ="black";
							}
							
var selfleader4 =document.getElementById("selfleader4").value;
							
							if(selfleader4==""){
							
								document.getElementById('selfleader4').style.borderColor ="red";
							}else{
								
								document.getElementById('selfleader4').style.borderColor ="black";
							}
							
			var selfleader5 =document.getElementById("selfleader5").value;
							
							if(selfleader5==""){
							
								document.getElementById('selfleader5').style.borderColor ="red";
							}else{
								
								document.getElementById('selfleader5').style.borderColor ="black";
							}
							
				var selfleader6 =document.getElementById("selfleader6").value;
							
							if(selfleader6==""){
							
								document.getElementById('selfleader6').style.borderColor ="red";
							}else{
								
								document.getElementById('selfleader6').style.borderColor ="black";
							}	
							
						
						
						var selfleader7 =document.getElementById("selfleader7").value;
						
						if(selfleader7==""){
						
							document.getElementById('selfleader7').style.borderColor ="red";
						}else{
							
							document.getElementById('selfleader7').style.borderColor ="black";
						}	
						
						}
						
						</script>

									<div class="form-body">
										<p>Complete assessment and provide specific examples in
											attach sheets if necessary.</p>
										<div class="form-group">
											<label class="control-label col-md-9"><strong>Skills</strong></label>
											<label class="control-label col-md-3"><strong>Competency
													Level</strong></label>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Makes sound
												decisions with factual data and can present objective
												arguments for those decisions. Minimal decision making by
												subjectivity.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills1" id="s1" onchange="validate()">
													<option value="" ${skill1.skills1==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.skills1=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.skills1=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.skills1=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.skills1=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>

													<%-- <option>${skill1.skills1}</option> 
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option> --%>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Initiates and
												implement new ideas/processes.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills2" id="s2" onchange="validate()">
													<option value="" ${skill1.skills2==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.skills2=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.skills2=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.skills2=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.skills2=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>

													<%-- <option>${skill1.skills2}</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option> --%>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">Organizes and
												prioritizes work even when encountered with conflicting
												priorities, seeks guidance if necessary.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills3" id="s3" onchange="validate()">
													<option value="" ${skill1.skills3==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.skills3=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.skills3=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.skills3=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.skills3=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>

													<%-- <option>${skill1.skills3}</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option> --%>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Displays a
												positive approach towards work assignments and people.
												Overcomes obstacles and accepts challenges with enthusiasm.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills4" id="s4" onchange="validate()">
													<option value="" ${skill1.skills4==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.skills4=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.skills4=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.skills4=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.skills4=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>


													<%-- <option>${skill1.skills4}</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option> --%>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Able to work
												well with internal and external customers and build
												relationships/partnerships with other departments and team
												members.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills5" id="s5" onchange="validate()">
													<option value="" ${skill1.skills5==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.skills5=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.skills5=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.skills5=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.skills5=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>

													<%-- <option>${skill1.skills5}</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option> --%>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Possesses and
												applies technical knowledge required for positions.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills6" id="s6" onchange="validate()">
													<option value="" ${skill1.skills6==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.skills6=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.skills6=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.skills6=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.skills6=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>


													<%-- <option>${skill1.skills6}</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option> --%>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Able to analyze
												situations and tasks accurately.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills7" id="s7" onchange="validate()">
													<option value="" ${skill1.skills7==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.skills7=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.skills7=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.skills7=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.skills7=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>

													<%-- <option>${skill1.skills7}</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option> --%>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Takes required
												risk as needed by position.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills8" id="s8" onchange="validate()">
													<option value="" ${skill1.skills8==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.skills8=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.skills8=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.skills8=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.skills8=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>

													<%-- <option>${skill1.skills8}</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option> --%>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Ability to
												resolve conflicts at all levels of the Company.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills9" id="s9" onchange="validate()">
													<option value="" ${skill1.skills9==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.skills9=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.skills9=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.skills9=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.skills9=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>

													<%-- <option>${skill1.skills9}</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option> --%>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">Able to work
												independently on agreed upon tasks.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills10" id="s10" onchange="validate()">
													<option value="" ${skill1.skills10==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.skills10=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.skills10=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.skills10=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.skills10=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>

													<%-- <option>${skill1.skills10}</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option> --%>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9"><strong>Ways
													Of Working</strong></label> <label class="control-label col-md-3"><strong>Competency
													Level</strong></label>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Consistently
												adheres to all rules and regulations.</label>
											<div class="col-md-3">
												<select class="form-control" name="waysOfWorking1" id="wow1" onchange="validate()">
													<option value="" ${skill1.waysOfWorking1==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.waysOfWorking1=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.waysOfWorking1=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.waysOfWorking1=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.waysOfWorking1=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>

													<%-- <option>${skill1.waysOfWorking1}</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option> --%>
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
												<select class="form-control" name="waysOfWorking2" id="wow2" onchange="validate()">
													<option value="" ${skill1.waysOfWorking2==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.waysOfWorking2=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.waysOfWorking2=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.waysOfWorking2=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.waysOfWorking2=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>

													<%-- <option>${skill1.waysOfWorking2}</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option> --%>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Organization of
												duties, work, and tasks (method, delegation, control).</label>
											<div class="col-md-3">
												<select class="form-control" name="waysOfWorking3" id="wow3" onchange="validate()">
													<option value="" ${skill1.waysOfWorking3==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.waysOfWorking3=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.waysOfWorking3=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.waysOfWorking3=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.waysOfWorking3=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>

													<%-- <option>${skill1.waysOfWorking3}</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option> --%>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">Able to
												articulate thoughts, ideas, and events in writing and
												orally.</label>
											<div class="col-md-3">
												<select class="form-control" name="waysOfWorking4" id="wow4" onchange="validate()">
													<option value="" ${skill1.waysOfWorking4==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.waysOfWorking4=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.waysOfWorking4=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.waysOfWorking4=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.waysOfWorking4=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>

													<%-- <option>${skill1.waysOfWorking4}</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option> --%>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">Displays
												commitment to the Company’s continuous improvement efforts
												and implements/supports continuous improvement in area(s) of
												responsibility.</label>
											<div class="col-md-3">
												<select class="form-control" name="waysOfWorking5" id="wow5" onchange="validate()">
													<option value="" ${skill1.waysOfWorking5==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.waysOfWorking5=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.waysOfWorking5=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.waysOfWorking5=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.waysOfWorking5=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>

													<%-- <option>${skill1.waysOfWorking5}</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option> --%>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Establishes
												high standards and goals, works diligently on meeting set
												standards and goals overcoming obstacles.</label>
											<div class="col-md-3">
												<select class="form-control" name="waysOfWorking6" id="wow6" onchange="validate()">
													<option value="" ${skill1.waysOfWorking6==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.waysOfWorking6=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.waysOfWorking6=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.waysOfWorking6=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.waysOfWorking6=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>

													<%-- <option>${skill1.waysOfWorking6}</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option> --%>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">Handles
												multiple projects and tasks concurrently and is able to
												prioritize and re-prioritize with minimal guidance.</label>
											<div class="col-md-3">
												<select class="form-control" name="waysOfWorking7" id="wow7" onchange="validate()">
													<option value="" ${skill1.waysOfWorking7==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.waysOfWorking7=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.waysOfWorking7=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.waysOfWorking7=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.waysOfWorking7=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>

													<%-- <option>${skill1.waysOfWorking7}</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option> --%>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9"><strong>Self-Management
													and Leadership</strong></label> <label class="control-label col-md-3"><strong>Competency
													Level</strong></label>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Manages tasks
												and projects with minimal guidance (Plan, Do, Check, Act).
												When assigned leadership role, is able to lead and achieve
												results with collaboration from other team members.</label>
											<div class="col-md-3">
												<select class="form-control"
													name="selfManagementandLeadership1" id="selfleader1" onchange="validate()">
													<option value=""
														${skill1.selfManagementandLeadership1==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.selfManagementandLeadership1=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.selfManagementandLeadership1=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.selfManagementandLeadership1=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.selfManagementandLeadership1=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>

													<%-- <option>${skill1.selfManagementandLeadership1}</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option> --%>
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
													name="selfManagementandLeadership2" id="selfleader2" onchange="validate()">
													<option value=""
														${skill1.selfManagementandLeadership2==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.selfManagementandLeadership2=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.selfManagementandLeadership2=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.selfManagementandLeadership2=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.selfManagementandLeadership2=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>

													<%-- <option>${skill1.selfManagementandLeadership2}</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option> --%>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Recognizes
												his/her mistakes and implements corrective action/preventive
												actions.</label>
											<div class="col-md-3">
												<select class="form-control"
													name="selfManagementandLeadership3" id="selfleader3" onchange="validate()">
													<option value=""
														${skill1.selfManagementandLeadership3==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.selfManagementandLeadership3=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.selfManagementandLeadership3=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.selfManagementandLeadership3=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.selfManagementandLeadership3=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>

													<%-- <option>${skill1.selfManagementandLeadership3}</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option> --%>
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
													name="selfManagementandLeadership4" id="selfleader4" onchange="validate()">
													<option value=""
														${skill1.selfManagementandLeadership4==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.selfManagementandLeadership4=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.selfManagementandLeadership4=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.selfManagementandLeadership4=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.selfManagementandLeadership4=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>

													<%-- <option>${skill1.selfManagementandLeadership4}</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option> --%>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Listens
												attentively to others and responds with respect. Accepts
												differences of opinions, style, and approach.</label>
											<div class="col-md-3">
												<select class="form-control"
													name="selfManagementandLeadership5" id="selfleader5" onchange="validate()">
													<option value=""
														${skill1.selfManagementandLeadership5==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.selfManagementandLeadership5=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.selfManagementandLeadership5=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.selfManagementandLeadership5=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.selfManagementandLeadership5=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>

													<%-- <option>${skill1.selfManagementandLeadership5}</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option> --%>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Anticipates
												departmental needs and understands his/her role in achieving
												Company objectives.</label>
											<div class="col-md-3">
												<select class="form-control"
													name="selfManagementandLeadership6" id="selfleader6" onchange="validate()">
													<option value=""
														${skill1.selfManagementandLeadership6==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.selfManagementandLeadership6=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.selfManagementandLeadership6=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.selfManagementandLeadership6=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.selfManagementandLeadership6=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>

													<%-- <option>${skill1.selfManagementandLeadership6}</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option> --%>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Participates
												and works well in a team environment. Is flexible as a team
												member and supports team consensus.</label>
											<div class="col-md-3">
												<select class="form-control"
													name="selfManagementandLeadership7" id="selfleader7" onchange="validate()">
													<option value=""
														${skill1.selfManagementandLeadership7==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.selfManagementandLeadership7=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.selfManagementandLeadership7=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.selfManagementandLeadership7=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.selfManagementandLeadership7=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>

													<%-- <option>${skill1.selfManagementandLeadership7}</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option> --%>
												</select>
											</div>
										</div>

									</div>
									<%-- 	<div class="form-actions">
									<div class="row">
                                                <div class="col-sm-12">
                                                  <%
												String statusMssg =(String)session.getAttribute("supervisorstatus");

													if (String.valueOf(statusMssg).equalsIgnoreCase("MANAGER COMPLETED")) {
											%>
										
											
											
											<%
												}else{
													
												
											%> 
                                                 <button type="submit" name="backandsave" class="btn green">Back & Save</button>
                                                &nbsp;&nbsp;&nbsp;
                                                <button type="submit" name="nextandsave" class="btn green">Next & Save</button>
                                                    <%
                                                    
                                                    }%>
                                                </div>
                                            </div>
                                            <div class="row" align="right">2 of
                                            7&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
									
								</div> --%>

								</c:if>


								<c:if test="${(empty skill1 && !empty imessage) || (!empty skill1 && !empty imessage)}">
									<%-- <c:forEach var="managersskillassessmentt"
										items="${managersskillassessment}">  --%>
									<div class="form-body">
										<p>Complete assessment and provide specific examples in
											attach sheets if necessary</p>
										<div class="form-group">
											<label class="control-label col-md-9"><strong>Skills</strong></label>
											<label class="control-label col-md-3"><strong>Competency
													Level</strong></label>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Makes sound
												decisions with factual data and can present objective
												arguments for those decisions. Minimal decision making by
												subjectivity.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills1">

													<option value="" ${skill1.skills1==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.skills1=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.skills1=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.skills1=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.skills1=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Initiates and
												implement new ideas/processes.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills2">
													<option value="" ${skill1.skills2==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.skills2=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.skills2=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.skills2=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.skills2=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">Organizes and
												prioritizes work even when encountered with conflicting
												priorities, seeks guidance if necessary.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills3">
													<option value="" ${skill1.skills3==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.skills3=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.skills3=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.skills3=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.skills3=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Displays a
												positive approach towards work assignments and people.
												Overcomes obstacles and accepts challenges with enthusiasm.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills4">
													<option value="" ${skill1.skills4==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.skills4=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.skills4=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.skills4=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.skills4=='Does Not Meet Job Requirement'?'selected':''}>Does
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
												<select class="form-control" name="skills5">
													<option value="" ${skill1.skills5==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.skills5=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.skills5=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.skills5=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.skills5=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Possesses and
												applies technical knowledge required for positions.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills6">
													<option value="" ${skill1.skills6==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.skills6=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.skills6=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.skills6=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.skills6=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Able to analyze
												situations and tasks accurately.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills7">
													<option value="" ${skill1.skills7==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.skills7=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.skills7=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.skills7=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.skills7=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Takes required
												risk as needed by position.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills8">
													<option value="" ${skill1.skills8==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.skills8=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.skills8=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.skills8=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.skills8=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Ability to
												resolve conflicts at all levels of the Company.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills9">
													<option value="" ${skill1.skills9==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.skills9=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.skills9=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.skills9=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.skills9=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">Able to work
												independently on agreed upon tasks.</label>
											<div class="col-md-3">
												<select class="form-control" name="skills10">
													<option value="" ${skill1.skills10==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.skills10=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.skills10=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.skills10=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.skills10=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9"><strong>Ways
													Of Working</strong></label> <label class="control-label col-md-3"><strong>Competency
													Level</strong></label>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Consistently
												adheres to all rules and regulations.</label>
											<div class="col-md-3">
												<select class="form-control" name="waysOfWorking1">
													<option value="" ${skill1.waysOfWorking1==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.waysOfWorking1=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.waysOfWorking1=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.waysOfWorking1=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.waysOfWorking1=='Does Not Meet Job Requirement'?'selected':''}>Does
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
												<select class="form-control" name="waysOfWorking2">
													<option value="" ${skill1.waysOfWorking2==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.waysOfWorking2=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.waysOfWorking2=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.waysOfWorking2=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.waysOfWorking2=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Organization of
												duties, work, and tasks (method, delegation, control).</label>
											<div class="col-md-3">
												<select class="form-control" name="waysOfWorking3">
													<option value="" ${skill1.waysOfWorking3==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.waysOfWorking3=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.waysOfWorking3=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.waysOfWorking3=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.waysOfWorking3=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">Able to
												articulate thoughts, ideas, and events in writing and
												orally.</label>
											<div class="col-md-3">
												<select class="form-control" name="waysOfWorking4">
													<option value="" ${skill1.waysOfWorking4==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.waysOfWorking4=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.waysOfWorking4=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.waysOfWorking4=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.waysOfWorking4=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">Displays
												commitment to the Company’s continuous improvement efforts
												and implements/supports continuous improvement in area(s) of
												responsibility.</label>
											<div class="col-md-3">
												<select class="form-control" name="waysOfWorking5">
													<option value="" ${skill1.waysOfWorking5==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.waysOfWorking5=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.waysOfWorking5=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.waysOfWorking5=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.waysOfWorking5=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Establishes
												high standards and goals, works diligently on meeting set
												standards and goals overcoming obstacles.</label>
											<div class="col-md-3">
												<select class="form-control" name="waysOfWorking6">
													<option value="" ${skill1.waysOfWorking6==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.waysOfWorking6=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.waysOfWorking6=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.waysOfWorking6=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.waysOfWorking6=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">Handles
												multiple projects and tasks concurrently and is able to
												prioritize and re-prioritize with minimal guidance.</label>
											<div class="col-md-3">
												<select class="form-control" name="waysOfWorking7">
													<option value="" ${skill1.waysOfWorking7==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.waysOfWorking7=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.waysOfWorking7=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.waysOfWorking7=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.waysOfWorking7=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9"><strong>Self-Management
													and Leadership</strong></label> <label class="control-label col-md-3"><strong>Competency
													Level</strong></label>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Manages tasks
												and projects with minimal guidance (Plan, Do, Check, Act).
												When assigned leadership role, is able to lead and achieve
												results with collaboration from other team members.</label>
											<div class="col-md-3">
												<select class="form-control"
													name="selfManagementandLeadership1">
													<option value=""
														${skill1.selfManagementandLeadership1==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.selfManagementandLeadership1=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.selfManagementandLeadership1=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.selfManagementandLeadership1=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.selfManagementandLeadership1=='Does Not Meet Job Requirement'?'selected':''}>Does
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
													name="selfManagementandLeadership2">
													<option value=""
														${skill1.selfManagementandLeadership2==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.selfManagementandLeadership2=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.selfManagementandLeadership2=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.selfManagementandLeadership2=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.selfManagementandLeadership2=='Does Not Meet Job Requirement'?'selected':''}>Does
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
													name="selfManagementandLeadership3">
													<option value=""
														${skill1.selfManagementandLeadership3==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.selfManagementandLeadership3=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.selfManagementandLeadership3=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.selfManagementandLeadership3=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.selfManagementandLeadership3=='Does Not Meet Job Requirement'?'selected':''}>Does
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
													name="selfManagementandLeadership4">
													<option value=""
														${skill1.selfManagementandLeadership4==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.selfManagementandLeadership4=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.selfManagementandLeadership4=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.selfManagementandLeadership4=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.selfManagementandLeadership4=='Does Not Meet Job Requirement'?'selected':''}>Does
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
													name="selfManagementandLeadership5">
													<option value=""
														${skill1.selfManagementandLeadership5==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.selfManagementandLeadership5=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.selfManagementandLeadership5=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.selfManagementandLeadership5=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.selfManagementandLeadership5=='Does Not Meet Job Requirement'?'selected':''}>Does
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
													name="selfManagementandLeadership6">
													<option value=""
														${skill1.selfManagementandLeadership6==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.selfManagementandLeadership6=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.selfManagementandLeadership6=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.selfManagementandLeadership6=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.selfManagementandLeadership6=='Does Not Meet Job Requirement'?'selected':''}>Does
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
													name="selfManagementandLeadership7">
													<option value=""
														${skill1.selfManagementandLeadership7==''?'selected':''}>Pick
														a value</option>
													<option value="Exceeds Job Requirements"
														${skill1.selfManagementandLeadership7=='Exceeds Job Requirements'?'selected':''}>Exceeds
														Job Requirements</option>
													<option value="Meets Job Requirements"
														${skill1.selfManagementandLeadership7=='Meets Job Requirements'?'selected':''}>Meets
														Job Requirements</option>
													<option value="Partially Meets Job Requirements"
														${skill1.selfManagementandLeadership7=='Partially Meets Job Requirements'?'selected':''}>Partially
														Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement"
														${skill1.selfManagementandLeadership7=='Does Not Meet Job Requirement'?'selected':''}>Does
														Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

									</div>
									<!-- <div class="form-actions">
									<div class="row">
                                                <div class="col-sm-12">
                                                 
                                                 <button type="submit" name="backandsave" class="btn green">Back & Save</button>
                                                &nbsp;&nbsp;&nbsp;
                                                <button type="submit" name="nextandsave" class="btn green">Next & Save</button>
                                                    
                                                </div>
                                            </div>
                                            <div class="row" align="right">2 of
                                            7&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
									
								</div> -->
									<%-- 	 </c:forEach>  --%>
								</c:if>
								<div class="form-actions">
									<div class="row">
										<div class="col-sm-12">
											<%
												String statusMssg = (String) session.getAttribute("supervisorstatus");

													if ((String.valueOf(statusMssg).equalsIgnoreCase("MANAGER COMPLETED"))
															|| (String.valueOf(statusMssg).equalsIgnoreCase("HR APPROVED"))
															|| (String.valueOf(statusMssg).equalsIgnoreCase("CLOSED"))) {
											%>

											<a
												href="<c:url value="assessmentSummaryOperation.do"></c:url>"
												class="btn green">Next</a>

											<%
												} else {
											%>
											<button type="submit" name="backandsave" class="btn green">Back
												& Save</button>
											&nbsp;&nbsp;&nbsp;
											<button type="submit" name="save" class="btn green">Save</button>
											&nbsp;&nbsp;&nbsp;
											<button type="submit" name="nextandsave" class="btn green">Next
												& Save</button>
											<%
												}
											%>
										</div>
									</div>
									<div class="row" align="right">2 of
										7&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>

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