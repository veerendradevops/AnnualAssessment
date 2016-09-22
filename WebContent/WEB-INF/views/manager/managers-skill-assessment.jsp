
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
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
					<li><span>Manager's Skill Assessment</span></li>
				</ul>
			</div>
			<!-- END PAGE BAR -->
			<!-- BEGIN PAGE TITLE-->
			<h3 class="page-title">Manager's Skill Assessment</h3>
			<!-- END PAGE TITLE-->
			<!-- END PAGE HEADER-->



			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN VALIDATION STATES-->
					<div class="portlet light portlet-fit portlet-form bordered">

						<div class="portlet-body">
							<!-- BEGIN FORM-->
							<form:form
								action="/AnnaulAssessmenT/managerSkillAssessmentAction.do"
								method="GET" modelAttribute="exemptSection2Pojo"
								id="form_sample_3" class="form-horizontal">
								<c:if test="${!empty skill1}">
									
										
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
													<select class="form-control" id="exampleSelect1"
														name="Section2B1">
														 <option value="" ${skill1.skills1==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skill1.skills1=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skill1.skills1=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skill1.skills1=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skill1.skills1=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
														 
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
													<select class="form-control" id="exampleSelect1"
														name="Section2B1">
														<option value="" ${skill1.skills2==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skill1.skills2=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skill1.skills2=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skill1.skills2=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skill1.skills2=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
														 
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
													<select class="form-control" id="exampleSelect1"
														name="Section2B1">
														 <option value="" ${skill1.skills3==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skill1.skills3=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skill1.skills3=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skill1.skills3=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skill1.skills3=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
														 
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
													<select class="form-control" id="exampleSelect1"
														name="Section2B1">
														 <option value="" ${skill1.skills4==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skill1.skills4=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skill1.skills4=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skill1.skills4=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skill1.skills4=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
														 
														
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
													<select class="form-control" id="exampleSelect1"
														name="Section2B1">
														 <option value="" ${skill1.skills5==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skill1.skills5=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skill1.skills5=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skill1.skills5=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skill1.skills5=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
														 
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
													<select class="form-control" id="exampleSelect1"
														name="Section2B1">
														<option value="" ${skill1.skills6==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skill1.skills6=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skill1.skills6=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skill1.skills6=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skill1.skills6=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
														
														
														<%-- <option>${skill1.skills6}</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option> --%>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-9">Able to
													analyze situations and tasks accurately.</label>
												<div class="col-md-3">
													<select class="form-control" id="exampleSelect1"
														name="Section2B1">
														<option value="" ${skill1.skills7==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skill1.skills7=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skill1.skills7=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skill1.skills7=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skill1.skills7=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
														
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
													<select class="form-control" id="exampleSelect1"
														name="Section2B1">
														<option value="" ${skill1.skills8==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skill1.skills8=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skill1.skills8=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skill1.skills8=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skill1.skills8=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
														 
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
													<select class="form-control" id="exampleSelect1"
														name="Section2B1">
														<option value="" ${skill1.skills9==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skill1.skills9=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skill1.skills9=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skill1.skills9=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skill1.skills9=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
														
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
													<select class="form-control" id="exampleSelect1"
														name="Section2B1">
														<option value="" ${skill1.skills10==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skill1.skills10=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skill1.skills10=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skill1.skills10=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skill1.skills10=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
														
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
													<select class="form-control" id="exampleSelect1"
														name="Section2B2">
														<option value="" ${skill1.waysOfWorking1==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skill1.waysOfWorking1=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skill1.waysOfWorking1=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skill1.waysOfWorking1=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skill1.waysOfWorking1=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
														
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
													<select class="form-control" id="exampleSelect1"
														name="Section2B2">
														<option value="" ${skill1.waysOfWorking2==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skill1.waysOfWorking2=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skill1.waysOfWorking2=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skill1.waysOfWorking2=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skill1.waysOfWorking2=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
														
														<%-- <option>${skill1.waysOfWorking2}</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option> --%>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-9">Organization
													of duties, work, and tasks (method, delegation, control).</label>
												<div class="col-md-3">
													<select class="form-control" id="exampleSelect1"
														name="Section2B2">
														<option value="" ${skill1.waysOfWorking3==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skill1.waysOfWorking3=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skill1.waysOfWorking3=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skill1.waysOfWorking3=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skill1.waysOfWorking3=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
														
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
													<select class="form-control" id="exampleSelect1"
														name="Section2B2">
														<option value="" ${skill1.waysOfWorking4==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skill1.waysOfWorking4=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skill1.waysOfWorking4=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skill1.waysOfWorking4=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skill1.waysOfWorking4=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
														
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
													commitment to the Companys continuous improvement efforts
													and implements/supports continuous improvement in area(s)
													of responsibility.</label>
												<div class="col-md-3">
													<select class="form-control" id="exampleSelect1"
														name="Section2B2">
														<option value="" ${skill1.waysOfWorking5==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skill1.waysOfWorking5=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skill1.waysOfWorking5=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skill1.waysOfWorking5=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skill1.waysOfWorking5=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
														
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
													<select class="form-control" id="exampleSelect1"
														name="Section2B2">
														<option value="" ${skill1.waysOfWorking6==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skill1.waysOfWorking6=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skill1.waysOfWorking6=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skill1.waysOfWorking6=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skill1.waysOfWorking6=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
														
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
													<select class="form-control" id="exampleSelect1"
														name="Section2B2">
														<option value="" ${skill1.waysOfWorking4==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skill1.waysOfWorking7=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skill1.waysOfWorking7=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skill1.waysOfWorking7=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skill1.waysOfWorking7=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
														
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
													<select class="form-control" id="exampleSelect1" name="Section2B3">
													<option value="" ${skill1.selfManagementandLeadership1==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skill1.selfManagementandLeadership1=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skill1.selfManagementandLeadership1=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skill1.selfManagementandLeadership1=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skill1.selfManagementandLeadership1=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
														
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
													<select class="form-control" id="exampleSelect1" name="Section2B3">
													<option value="" ${skill1.selfManagementandLeadership2==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skill1.selfManagementandLeadership2=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skill1.selfManagementandLeadership2=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skill1.selfManagementandLeadership2=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skill1.selfManagementandLeadership2=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
														
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
													his/her mistakes and implements corrective
													action/preventive actions.</label>
												<div class="col-md-3">
													<select class="form-control" id="exampleSelect1" name="Section2B3">
													<option value="" ${skill1.selfManagementandLeadership3==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skill1.selfManagementandLeadership3=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skill1.selfManagementandLeadership3=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skill1.selfManagementandLeadership3=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skill1.selfManagementandLeadership3=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
														
														<%-- <option>${skill1.selfManagementandLeadership3}</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option> --%>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-9">Exemplifies
													the Company guiding principle of integrity in his/her
													decision making and dealing with supervisors, peers, and
													external customers.</label>
												<div class="col-md-3">
													<select class="form-control" id="exampleSelect1" name="Section2B3">
													<option value="" ${skill1.selfManagementandLeadership4==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skill1.selfManagementandLeadership4=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skill1.selfManagementandLeadership4=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skill1.selfManagementandLeadership4=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skill1.selfManagementandLeadership4=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
														
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
													<select class="form-control" id="exampleSelect1" name="Section2B3">
													<option value="" ${skill1.selfManagementandLeadership5==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skill1.selfManagementandLeadership5=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skill1.selfManagementandLeadership5=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skill1.selfManagementandLeadership5=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skill1.selfManagementandLeadership5=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
														
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
													departmental needs and understands his/her role in
													achieving Company objectives.</label>
												<div class="col-md-3">
													<select class="form-control" id="exampleSelect1" name="Section2B3">
													<option value="" ${skill1.selfManagementandLeadership6==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skill1.selfManagementandLeadership6=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skill1.selfManagementandLeadership6=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skill1.selfManagementandLeadership6=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skill1.selfManagementandLeadership6=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
														
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
													<select class="form-control" id="exampleSelect1" name="Section2B3">
													<option value="" ${skill1.selfManagementandLeadership7==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skill1.selfManagementandLeadership7=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skill1.selfManagementandLeadership7=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skill1.selfManagementandLeadership7=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skill1.selfManagementandLeadership7=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
														
														<%-- <option>${skill1.selfManagementandLeadership7}</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option> --%>
													</select>
												</div>
											</div>

										</div>
										<div class="form-actions">
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
                                            3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
									
								</div>
									
								</c:if>
								
								
								<c:if test="${empty skill1}">
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
													<select class="form-control" id="exampleSelect1"
														name="Section2B1">
														<option selected="selected" value="">Pick a value</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-9">Initiates and
													implement new ideas/processes.</label>
												<div class="col-md-3">
													<select class="form-control" id="exampleSelect1"
														name="Section2B1">
														<option selected="selected" value="">Pick a value</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option>
													</select>
												</div>
											</div>

											<div class="form-group">
												<label class="control-label col-md-9">Organizes and
													prioritizes work even when encountered with conflicting
													priorities, seeks guidance if necessary.</label>
												<div class="col-md-3">
													<select class="form-control" id="exampleSelect1"
														name="Section2B1">
														<option selected="selected" value="">Pick a value</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-9">Displays a
													positive approach towards work assignments and people.
													Overcomes obstacles and accepts challenges with enthusiasm.</label>
												<div class="col-md-3">
													<select class="form-control" id="exampleSelect1"
														name="Section2B1">
														<option selected="selected" value="">Pick a value</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-9">Able to work
													well with internal and external customers and build
													relationships/partnerships with other departments and team
													members.</label>
												<div class="col-md-3">
													<select class="form-control" id="exampleSelect1"
														name="Section2B1">
														<option selected="selected" value="">Pick a value</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-9">Possesses and
													applies technical knowledge required for positions.</label>
												<div class="col-md-3">
													<select class="form-control" id="exampleSelect1"
														name="Section2B1">
														<option selected="selected" value="">Pick a value</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-9">Able to
													analyze situations and tasks accurately.</label>
												<div class="col-md-3">
													<select class="form-control" id="exampleSelect1"
														name="Section2B1">
														<option selected="selected" value="">Pick a value</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-9">Takes required
													risk as needed by position.</label>
												<div class="col-md-3">
													<select class="form-control" id="exampleSelect1"
														name="Section2B1">
														<option selected="selected" value="">Pick a value</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-9">Ability to
													resolve conflicts at all levels of the Company.</label>
												<div class="col-md-3">
													<select class="form-control" id="exampleSelect1"
														name="Section2B1">
														<option selected="selected" value="">Pick a value</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option>
													</select>
												</div>
											</div>

											<div class="form-group">
												<label class="control-label col-md-9">Able to work
													independently on agreed upon tasks.</label>
												<div class="col-md-3">
													<select class="form-control" id="exampleSelect1"
														name="Section2B1">
														<option selected="selected" value="">Pick a value</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option>
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
													<select class="form-control" id="exampleSelect1"
														name="Section2B2">
														<option selected="selected" value="">Pick a value</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option>
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
													<select class="form-control" id="exampleSelect1"
														name="Section2B2">
														<option selected="selected" value="">Pick a value</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-9">Organization
													of duties, work, and tasks (method, delegation, control).</label>
												<div class="col-md-3">
													<select class="form-control" id="exampleSelect1"
														name="Section2B2">
														<option selected="selected" value="">Pick a value</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option>
													</select>
												</div>
											</div>

											<div class="form-group">
												<label class="control-label col-md-9">Able to
													articulate thoughts, ideas, and events in writing and
													orally.</label>
												<div class="col-md-3">
													<select class="form-control" id="exampleSelect1"
														name="Section2B2">
														<option selected="selected" value="">Pick a value</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option>
													</select>
												</div>
											</div>

											<div class="form-group">
												<label class="control-label col-md-9">Displays
													commitment to the Companys continuous improvement efforts
													and implements/supports continuous improvement in area(s)
													of responsibility.</label>
												<div class="col-md-3">
													<select class="form-control" id="exampleSelect1"
														name="Section2B2">
														<option selected="selected" value="">Pick a value</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-9">Establishes
													high standards and goals, works diligently on meeting set
													standards and goals overcoming obstacles.</label>
												<div class="col-md-3">
													<select class="form-control" id="exampleSelect1"
														name="Section2B2">
														<option selected="selected" value="">Pick a value</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option>
													</select>
												</div>
											</div>

											<div class="form-group">
												<label class="control-label col-md-9">Handles
													multiple projects and tasks concurrently and is able to
													prioritize and re-prioritize with minimal guidance.</label>
												<div class="col-md-3">
													<select class="form-control" id="exampleSelect1"
														name="Section2B2">
														<option selected="selected" value="">Pick a value</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option>
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
													<select class="form-control" id="exampleSelect1" name="Section2B3">
													<option selected="selected" value="">Pick a value</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option>
													</select>
												</div>
											</div>

											<div class="form-group">
												<label class="control-label col-md-9">Adheres to
													Company policies, practices and legal requirements.
													Implements agreed upon direction even if personal point of
													view may be in conflict.</label>
												<div class="col-md-3">
													<select class="form-control" id="exampleSelect1" name="Section2B3">
													<option selected="selected" value="">Pick a value</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-9">Recognizes
													his/her mistakes and implements corrective
													action/preventive actions.</label>
												<div class="col-md-3">
													<select class="form-control" id="exampleSelect1" name="Section2B3">
													<option selected="selected" value="">Pick a value</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-9">Exemplifies
													the Company guiding principle of integrity in his/her
													decision making and dealing with supervisors, peers, and
													external customers.</label>
												<div class="col-md-3">
													<select class="form-control" id="exampleSelect1" name="Section2B3">
													<option selected="selected" value="">Pick a value</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-9">Listens
													attentively to others and responds with respect. Accepts
													differences of opinions, style, and approach.</label>
												<div class="col-md-3">
													<select class="form-control" id="exampleSelect1" name="Section2B3">
													<option selected="selected" value="">Pick a value</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-9">Anticipates
													departmental needs and understands his/her role in
													achieving Company objectives.</label>
												<div class="col-md-3">
													<select class="form-control" id="exampleSelect1" name="Section2B3">
													<option selected="selected" value="">Pick a value</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-9">Participates
													and works well in a team environment. Is flexible as a team
													member and supports team consensus.</label>
												<div class="col-md-3">
													<select class="form-control" id="exampleSelect1" name="Section2B3">
													<option selected="selected" value="">Pick a value</option>
														<option>Exceeds Job Requirements</option>
														<option>Meets Job Requirements</option>
														<option>Partially Meets Job Requirements</option>
														<option>Does Not Meet Job Requirement</option>
													</select>
												</div>
											</div>

										</div>
										<div class="form-actions">
									<div class="row">
                                                <div class="col-sm-12">
                                                 
                                                 <button type="submit" name="backandsave" class="btn green">Back & Save</button>
                                                &nbsp;&nbsp;&nbsp;
                                                <button type="submit" name="nextandsave" class="btn green">Next & Save</button>
                                                    
                                                </div>
                                            </div>
                                            <div class="row" align="right">2 of
                                            3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
									
								</div>
								<%-- 	 </c:forEach>  --%>
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