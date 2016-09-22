<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.lisi.annaulAssessment.util.Converters"%>






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
					<li><span>F. Skills Self Assessment </span></li>
				</ul>
			</div>
			<!-- END PAGE BAR -->
			<!-- BEGIN PAGE TITLE-->
			<h3 class="page-title">F. Skills Self Assessment</h3>
			<!-- END PAGE TITLE-->
			<!-- END PAGE HEADER-->



			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN VALIDATION STATES-->
					<div class="portlet light portlet-fit portlet-form bordered">

						<div class="portlet-body">
							<!-- BEGIN FORM-->


							<form:form name="skillsSelfAssessmentdetails"
								action="/AnnaulAssessmenT/getSkillsSelfAssessment.do"
								method="post" modelAttribute="skillsSelfAssessment"
								id="form_sample_3" class="form-horizontal">
								<c:if test="${!empty skillsSelfAssessmentDetails}">
									<div class="form-body">
										<p>Complete assessment and provide specific examples in
											attach sheets if necessary.</p>
										<div class="form-group">
											<label class="control-label col-md-9"><p><font size="3"><strong>Skills</strong></font></p></label>
											<label class="control-label col-md-3"><strong>
											</strong></label>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Makes sound
												decisions with factual data and can present objective
												arguments for those decisions. Minimal decision making by
												subjectivity.</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G1">
													<option value="" ${skillsSelfAssessmentDetails.skills1==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skillsSelfAssessmentDetails.skills1=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skillsSelfAssessmentDetails.skills1=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skillsSelfAssessmentDetails.skills1=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skillsSelfAssessmentDetails.skills1=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
													
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Initiates and
												implement new ideas/processes.</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G1">
													<option value="" ${skillsSelfAssessmentDetails.skills2==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skillsSelfAssessmentDetails.skills2=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skillsSelfAssessmentDetails.skills2=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skillsSelfAssessmentDetails.skills2=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skillsSelfAssessmentDetails.skills2=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">Organizes and
												prioritizes work even when encountered with conflicting
												priorities, seeks guidance if necessary.</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G1">
													<option value="" ${skillsSelfAssessmentDetails.skills3==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skillsSelfAssessmentDetails.skills3=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skillsSelfAssessmentDetails.skills3=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skillsSelfAssessmentDetails.skills3=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skillsSelfAssessmentDetails.skills3=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Displays a
												positive approach towards work assignments and people.
												Overcomes obstacles and accepts challenges with enthusiasm.</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G1">
													<option value="" ${skillsSelfAssessmentDetails.skills4==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skillsSelfAssessmentDetails.skills4=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skillsSelfAssessmentDetails.skills4=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skillsSelfAssessmentDetails.skills4=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skillsSelfAssessmentDetails.skills4=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
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
													name="Section1G1">
													<option value="" ${skillsSelfAssessmentDetails.skills5==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skillsSelfAssessmentDetails.skills5=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skillsSelfAssessmentDetails.skills5=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skillsSelfAssessmentDetails.skills5=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skillsSelfAssessmentDetails.skills5=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Possesses and
												applies technical knowledge required for positions.</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G1">
													<option value="" ${skillsSelfAssessmentDetails.skills6==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skillsSelfAssessmentDetails.skills6=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skillsSelfAssessmentDetails.skills6=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skillsSelfAssessmentDetails.skills6=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skillsSelfAssessmentDetails.skills6=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Able to analyze
												situations and tasks accurately.</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G1">
													<option value="" ${skillsSelfAssessmentDetails.skills7==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skillsSelfAssessmentDetails.skills7=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skillsSelfAssessmentDetails.skills7=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skillsSelfAssessmentDetails.skills7=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skillsSelfAssessmentDetails.skills7=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Takes required
												risk as needed by position.</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G1">
													<option value="" ${skillsSelfAssessmentDetails.skills8==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skillsSelfAssessmentDetails.skills8=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skillsSelfAssessmentDetails.skills8=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skillsSelfAssessmentDetails.skills8=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skillsSelfAssessmentDetails.skills8=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Ability to
												resolve conflicts at all levels of the Company.</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G1">
													<option value="" ${skillsSelfAssessmentDetails.skills9==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skillsSelfAssessmentDetails.skills9=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skillsSelfAssessmentDetails.skills9=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skillsSelfAssessmentDetails.skills9=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skillsSelfAssessmentDetails.skills9=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">Able to work
												independently on agreed upon tasks.</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G1">
													<option value="" ${skillsSelfAssessmentDetails.skills10==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skillsSelfAssessmentDetails.skills10=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skillsSelfAssessmentDetails.skills10=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skillsSelfAssessmentDetails.skills10=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skillsSelfAssessmentDetails.skills10=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9"><p><font size="3"><strong>Ways
													Of Working</strong></font></p></label> <label class="control-label col-md-3"><strong>
											</strong></label>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Consistently
												adheres to all rules and regulations.</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G2">
													
													<option value="" ${skillsSelfAssessmentDetails.waysOfWorking1==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skillsSelfAssessmentDetails.waysOfWorking1=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skillsSelfAssessmentDetails.waysOfWorking1=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skillsSelfAssessmentDetails.waysOfWorking1=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skillsSelfAssessmentDetails.waysOfWorking1=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
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
													name="Section1G2">
													<option value="" ${skillsSelfAssessmentDetails.waysOfWorking2==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skillsSelfAssessmentDetails.waysOfWorking2=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skillsSelfAssessmentDetails.waysOfWorking2=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skillsSelfAssessmentDetails.waysOfWorking2=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skillsSelfAssessmentDetails.waysOfWorking2=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Organization of
												duties, work, and tasks (method, delegation, control).</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G2">
													<option value="" ${skillsSelfAssessmentDetails.waysOfWorking3==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skillsSelfAssessmentDetails.waysOfWorking3=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skillsSelfAssessmentDetails.waysOfWorking3=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skillsSelfAssessmentDetails.waysOfWorking3=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skillsSelfAssessmentDetails.waysOfWorking3=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">Able to
												articulate thoughts, ideas, and events in writing and
												orally.</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G2">
													<option value="" ${skillsSelfAssessmentDetails.waysOfWorking4==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skillsSelfAssessmentDetails.waysOfWorking4=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skillsSelfAssessmentDetails.waysOfWorking4=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skillsSelfAssessmentDetails.waysOfWorking4=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skillsSelfAssessmentDetails.waysOfWorking4=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">Displays
												commitment to the Company’s continuous improvement efforts
												and implements/supports continuous improvement in area(s) of
												responsibility.</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G2">
													<option value="" ${skillsSelfAssessmentDetails.waysOfWorking5==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skillsSelfAssessmentDetails.waysOfWorking5=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skillsSelfAssessmentDetails.waysOfWorking5=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skillsSelfAssessmentDetails.waysOfWorking5=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skillsSelfAssessmentDetails.waysOfWorking5=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Establishes
												high standards and goals, works diligently on meeting set
												standards and goals overcoming obstacles.</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G2">
													<option value="" ${skillsSelfAssessmentDetails.waysOfWorking6==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skillsSelfAssessmentDetails.waysOfWorking6=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skillsSelfAssessmentDetails.waysOfWorking6=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skillsSelfAssessmentDetails.waysOfWorking6=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skillsSelfAssessmentDetails.waysOfWorking6=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">Handles
												multiple projects and tasks concurrently and is able to
												prioritize and re-prioritize with minimal guidance.</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G2">
													<option value="" ${skillsSelfAssessmentDetails.waysOfWorking7==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skillsSelfAssessmentDetails.waysOfWorking7=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skillsSelfAssessmentDetails.waysOfWorking7=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skillsSelfAssessmentDetails.waysOfWorking7=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skillsSelfAssessmentDetails.waysOfWorking7=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9"><p><font size="3"><strong>Self-Management
													and Leadership</strong></font></p></label> <label class="control-label col-md-3"><strong>
											</strong></label>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Manages tasks
												and projects with minimal guidance (Plan, Do, Check, Act).
												When assigned leadership role, is able to lead and achieve
												results with collaboration from other team members.</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G3">
													
													<option value="" ${skillsSelfAssessmentDetails.selfManagementandLeadership1==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skillsSelfAssessmentDetails.selfManagementandLeadership1=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skillsSelfAssessmentDetails.selfManagementandLeadership1=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skillsSelfAssessmentDetails.selfManagementandLeadership1=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skillsSelfAssessmentDetails.selfManagementandLeadership1=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">Adheres to
												Company policies, practices and legal requirements.
												Implements agreed upon direction even if personal point of
												view may be in conflict.</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G3">
													<option value="" ${skillsSelfAssessmentDetails.selfManagementandLeadership2==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skillsSelfAssessmentDetails.selfManagementandLeadership2=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skillsSelfAssessmentDetails.selfManagementandLeadership2=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skillsSelfAssessmentDetails.selfManagementandLeadership2=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skillsSelfAssessmentDetails.selfManagementandLeadership2=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Recognizes
												his/her mistakes and implements corrective action/preventive
												actions.</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G3">
													<option value="" ${skillsSelfAssessmentDetails.selfManagementandLeadership3==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skillsSelfAssessmentDetails.selfManagementandLeadership3=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skillsSelfAssessmentDetails.selfManagementandLeadership3=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skillsSelfAssessmentDetails.selfManagementandLeadership3=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skillsSelfAssessmentDetails.selfManagementandLeadership3=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Exemplifies the
												Company guiding principle of integrity in his/her decision
												making and dealing with supervisors, peers, and external
												customers.</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G3">
													<option value="" ${skillsSelfAssessmentDetails.selfManagementandLeadership4==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skillsSelfAssessmentDetails.selfManagementandLeadership4=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skillsSelfAssessmentDetails.selfManagementandLeadership4=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skillsSelfAssessmentDetails.selfManagementandLeadership4=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skillsSelfAssessmentDetails.selfManagementandLeadership4=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Listens
												attentively to others and responds with respect. Accepts
												differences of opinions, style, and approach.</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G3">
													<option value="" ${skillsSelfAssessmentDetails.selfManagementandLeadership5==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skillsSelfAssessmentDetails.selfManagementandLeadership5=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skillsSelfAssessmentDetails.selfManagementandLeadership5=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skillsSelfAssessmentDetails.selfManagementandLeadership5=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skillsSelfAssessmentDetails.selfManagementandLeadership5=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Anticipates
												departmental needs and understands his/her role in achieving
												Company objectives.</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G3">
													<option value="" ${skillsSelfAssessmentDetails.selfManagementandLeadership6==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skillsSelfAssessmentDetails.selfManagementandLeadership6=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skillsSelfAssessmentDetails.selfManagementandLeadership6=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skillsSelfAssessmentDetails.selfManagementandLeadership6=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skillsSelfAssessmentDetails.selfManagementandLeadership6=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Participates
												and works well in a team environment. Is flexible as a team
												member and supports team consensus.</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G3">
													<option value="" ${skillsSelfAssessmentDetails.selfManagementandLeadership7==''?'selected':''}>Pick a value</option>
													<option value="Exceeds Job Requirements" ${skillsSelfAssessmentDetails.selfManagementandLeadership7=='Exceeds Job Requirements'?'selected':''}>Exceeds Job Requirements</option>
													<option value="Meets Job Requirements" ${skillsSelfAssessmentDetails.selfManagementandLeadership7=='Meets Job Requirements'?'selected':''}>Meets Job Requirements</option>
													<option value="Partially Meets Job Requirements" ${skillsSelfAssessmentDetails.selfManagementandLeadership7=='Partially Meets Job Requirements'?'selected':''}>Partially Meets Job Requirements</option>
													<option value="Does Not Meet Job Requirement" ${skillsSelfAssessmentDetails.selfManagementandLeadership7=='Does Not Meet Job Requirement'?'selected':''}>Does Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<!-- <p><font size="4">Self Assessment Summary</font></p> -->
										
										<label class="control-label col-md-9"><p><font size="3"><strong>
													Self Assessment Summary</strong></font></p></label>
										
										<div class="form-group">
											<div class="col-md-6">
												Summary Strengths
												<textarea class="form-control" title="Maximum length allowed is 300 characters" id="Comments" maxlength="300"
													rows="2" name="Section1G4">${skillsSelfAssessmentDetails.section1G4}</textarea>
											</div>
											<div class="col-md-6">
												Summary of Areas of Improvement
												<textarea class="form-control" title="Maximum length allowed is 300 characters"  id="Comments" maxlength="300"
													rows="2" name="Section1G5">${skillsSelfAssessmentDetails.section1G5}</textarea>
											</div>
										</div>



									</div>
									<div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-12">
                                            
                                             <%
												String statusMssg =(String)session.getAttribute("loginEmployeeStatus");

													if (String.valueOf(statusMssg).equalsIgnoreCase("started")) {
											%> 
                                            
                                                <button type="submit" class="btn green" name="backAndSave" >Back & Save</button>
                                                &nbsp;&nbsp;&nbsp;
                                                <button type="submit" class="btn green" name="save">Save</button>
                                                &nbsp;&nbsp;&nbsp;
                                             <button type="submit" class="btn green" name="saveSubmit">Submit</button>
                                            
                                            <%
											}
											
											%> 
                                            
                                            </div>
                                            
                                        </div>
                                        <div class="row" align="right">3 of
                                            3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                                    </div>
									
								
									
								</c:if>
								<c:if test="${empty skillsSelfAssessmentDetails}">
									<div class="form-body">
										<p>Complete assessment and provide specific examples in
											attach sheets if necessary.</p>
										<div class="form-group">
											<label class="control-label col-md-9"><p><font size="3"><strong>Skills</strong></font></p></label>
											<label class="control-label col-md-3"><strong>
											</strong></label>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Makes sound
												decisions with factual data and can present objective
												arguments for those decisions. Minimal decision making by
												subjectivity.</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G1">
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
													name="Section1G1">
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
													name="Section1G1">
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
													name="Section1G1">
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
													name="Section1G1">
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
													name="Section1G1">
													<option selected="selected" value="">Pick a value</option>
													<option>Exceeds Job Requirements</option>
													<option>Meets Job Requirements</option>
													<option>Partially Meets Job Requirements</option>
													<option>Does Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Able to analyze
												situations and tasks accurately.</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G1">
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
													name="Section1G1">
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
													name="Section1G1">
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
													name="Section1G1">
													<option selected="selected" value="">Pick a value</option>
													<option>Exceeds Job Requirements</option>
													<option>Meets Job Requirements</option>
													<option>Partially Meets Job Requirements</option>
													<option>Does Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">
											
											<p><font size="3"><strong>Ways
													Of Working</strong></font></p></label> <label class="control-label col-md-3"><strong>
											</strong></label>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Consistently
												adheres to all rules and regulations.</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G2">
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
													name="Section1G2">
													<option selected="selected" value="">Pick a value</option>
													<option>Exceeds Job Requirements</option>
													<option>Meets Job Requirements</option>
													<option>Partially Meets Job Requirements</option>
													<option>Does Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Organization of
												duties, work, and tasks (method, delegation, control).</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G2">
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
													name="Section1G2">
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
												commitment to the Company’s continuous improvement efforts
												and implements/supports continuous improvement in area(s) of
												responsibility.</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G2">
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
													name="Section1G2">
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
													name="Section1G2">
													<option selected="selected" value="">Pick a value</option>
													<option>Exceeds Job Requirements</option>
													<option>Meets Job Requirements</option>
													<option>Partially Meets Job Requirements</option>
													<option>Does Not Meet Job Requirement</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-9">
											<p><font size="3"><strong>Self-Management
													and Leadership</strong></font></p></label> <label class="control-label col-md-3"><strong>
											</strong></label>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Manages tasks
												and projects with minimal guidance (Plan, Do, Check, Act).
												When assigned leadership role, is able to lead and achieve
												results with collaboration from other team members.</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G3">
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
												<select class="form-control" id="exampleSelect1"
													name="Section1G3">
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
												his/her mistakes and implements corrective action/preventive
												actions.</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G3">
													<option selected="selected" value="">Pick a value</option>
													<option>Exceeds Job Requirements</option>
													<option>Meets Job Requirements</option>
													<option>Partially Meets Job Requirements</option>
													<option>Does Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-9">Exemplifies the
												Company guiding principle of integrity in his/her decision
												making and dealing with supervisors, peers, and external
												customers.</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G3">
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
												<select class="form-control" id="exampleSelect1"
													name="Section1G3">
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
												departmental needs and understands his/her role in achieving
												Company objectives.</label>
											<div class="col-md-3">
												<select class="form-control" id="exampleSelect1"
													name="Section1G3">
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
												<select class="form-control" id="exampleSelect1"
													name="Section1G3">
													<option selected="selected" value="">Pick a value</option>
													<option>Exceeds Job Requirements</option>
													<option>Meets Job Requirements</option>
													<option>Partially Meets Job Requirements</option>
													<option>Does Not Meet Job Requirement</option>
												</select>
											</div>
										</div>
										<p><font size="4">Self Assessment Summary</font></p>
										<div class="form-group">
											<div class="col-md-6">
												Summary Strengths
												<textarea class="form-control" title="Maximum length allowed is 300 characters" id="Comments" maxlength="300"
													rows="4" cols="75" name="Section1G4"></textarea>
											</div>
											<div class="col-md-6">
												Summary of Areas of Improvement
												<textarea class="form-control" title="Maximum length allowed is 300 characters" id="Comments" maxlength="300"
													rows="4" cols="75" name="Section1G5"></textarea>
											</div>
										</div>



									</div>
									<div class="form-actions">
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

</body>
<script>
	function formSubmission() {

		alert(" if you submit, you are going to submit the form to your supervisor.")

	}
</script>