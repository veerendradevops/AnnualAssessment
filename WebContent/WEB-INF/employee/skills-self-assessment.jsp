<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- App title -->
        <title>Annual Performance Review</title>

         <!-- Plugins css -->
        <link href="assets/plugins/timepicker/bootstrap-timepicker.min.css" rel="stylesheet">
		<link href="assets/plugins/mjolnic-bootstrap-colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet">
		<link href="assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">
		<link href="assets/plugins/clockpicker/bootstrap-clockpicker.min.css" rel="stylesheet">
		<link href="assets/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

        <!-- Switchery css -->
        <link href="assets/plugins/switchery/switchery.min.css" rel="stylesheet" />

        <!-- App CSS -->
        <link href="assets/css/style.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shiv and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
        <!-- Modernizr js -->
        <script src="assets/js/modernizr.min.js"></script>
    </head>
    <body class="fixed-left">
        <!-- Begin page -->
        <div id="wrapper">
            
            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->
            <div class="content-page">
                <!-- Start content -->
                <div class="content">
                    <div class="container">
                        <div class="row">
							<div class="col-xs-12">
								<div class="page-title-box">
                                    <h4 class="page-title">2016 Payroll</h4>
                                    
                                    <div style="color:green" align="center">
                    							 <c:if test="${!empty successorerror}"> 
                    							 <c:out value="${successorerror}"></c:out>
                                                </c:if> 
                   								 </div>
                   								 
                   								
                   								 
                                    <ol class="breadcrumb p-0">
                                        <li><a href="#">2016 Payroll</a></li>
                                        <li class="active">Skills Self Assessment</li>
                                    </ol>
                                    <div class="clearfix"></div>
                                </div>
							</div>
						</div>
                        <!-- end row -->
                        <div class="row">                        
                            <div class="col-xs-12">
                                <div class="card-box">
								<h4 class="header-title ">Skills Self Assessment </h4>
									<p>Complete assessment and provide specific examples in attach sheets if necessary</p>
                                    

                                            <form:form id="SkillsSelfAssessment"
									name="skillsSelfAssessmentdetails"
									action="/AnnaulAssessmenT/getSkillsSelfAssessment.do"
									method="post" modelAttribute="skillsSelfAssessment">
                                    
                                           <c:if test="${!empty skillsSelfAssessmentDetails}">
                                           
                                           <c:forEach items="${skillsSelfAssessmentDetails}" var="selfAssessmentDetails">
                                           
                                           
                                                
                                                <div class="form-group row">  
                                                <div class="col-sm-8"><h6>Skills</h6></div>                                              <div class="col-sm-4"><h6>Competency Level</h6></div>
                                                    <div class="col-sm-8">
                                                     <p>Makes sound decisions with factual data and can present objective arguments for those decisions. Minimal decision making by subjectivity.</p>
                                                     </div>
                                                      
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G1">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                      </div>
                                                </div>
                                                
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                     <p>Initiates and implement new ideas/processes.</p>
                                                     </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G1">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                               
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                     <p>Organizes and prioritizes work even when encountered with conflicting priorities, seeks guidance if necessary.</p>
                                                     </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G1">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                               
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                      <p>Displays a positive approach towards work assignments and people. Overcomes obstacles and accepts challenges with enthusiasm.</p>
                                                     </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G1">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                     <p>Able to work well with internal and external customers and build relationships/partnerships with other departments and team members.</p>
                                                     </div>
                                                         <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G1">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                       <p>Possesses and applies technical knowledge required for positions.</p>
                                                       </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G1">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                       <p>Able to analyze situations and tasks accurately.</p>
                                                       </div>
                                                       <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G1">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                       <p>Takes required risk as needed by position.</p>
                                                       </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G1">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                        <p>Ability to resolve conflicts at all levels of the Company.</p>
                                                        </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G1">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                       <p>Able to work independently on agreed upon tasks.</p>
                                                       </div>
                                                      <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G1">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                
                                                <div class="form-group row">  
                                                <div class="col-sm-8"><h6>Ways Of Working</h6></div>                                              <div class="col-sm-4"><h6>Competency Level</h6></div>
                                                    <div class="col-sm-8">
                                                     <p>Consistently adheres to all rules and regulations.</p>
                                                     </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G2">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                    <p>Has commitment to meet agreed upon goals displaying positive behaviors. Attends meetings and does what he/she says is going to do. Communicates and/or re-negotiates agreed upon expectations if not able to meet deadlines.</p>
                                                    </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G2">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                      <p>Organization of duties, work, and tasks (method, delegation, control).</p>
                                                      </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G2">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                     <p>Able to articulate thoughts, ideas, and events in writing and orally.</p>
                                                     </div>
                                                        <div class="col-sm-4">
													<select class="form-control" id="exampleSelect1" name="Section1G2">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                     <p>Displays commitment to the Company’s continuous improvement efforts and
														implements/supports continuous improvement in area(s) of responsibility.</p>
                                                     </div>
                                                         <div class="col-sm-4">
													<select class="form-control" id="exampleSelect1" name="Section1G2">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                    <p>Establishes high standards and goals, works diligently on meeting set
													standards and goals overcoming obstacles.</p>
                                                    </div>
                                                         <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G2">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                 
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                      <p>Handles multiple projects and tasks concurrently and is able to prioritize and re-prioritize with minimal guidance.</p>  
                                                        </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G2">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row"> 
                                                <div class="col-sm-8"><h6>Self-Management and Leadership</h6></div>                                               <div class="col-sm-4"><h6>Competency Level</h6></div>
                                                    <div class="col-sm-8">
                                                        <p>Manages tasks and projects with minimal guidance (Plan, Do, Check, Act). When assigned leadership role, is able to lead and achieve results with collaboration from other team members.</p>
                                                        
                                                        </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G3">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                    <p>Adheres to Company policies, practices and legal requirements. Implements agreed upon direction even if personal point of view may be in conflict.</p>
                                                     </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G3">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                               
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                     <p>Recognizes his/her mistakes and implements corrective action/preventive actions.</p>
                                                    </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G3">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                        <p>Exemplifies the Company guiding principle of integrity in his/her decision making and dealing with supervisors, peers, and external customers.</p>
                                                        </div>
                                                         <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G3">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                       <p>Listens attentively to others and responds with respect. Accepts differences of opinions, style, and approach.</p>
                                                       </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G3">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                        <p>Anticipates departmental needs and understands his/her role in achieving Company objectives.</p>
                                                        </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G3">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                       <p>Participates and works well in a team environment. Is flexible as a team member and supports team consensus.</p>
                                                       </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G3">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                               <h5>Self Assessment Summary</h5>
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-6">
                                                    <label>Summary Strengths</label>
                                                            <textarea class="form-control" id="Comments" maxlength="300" rows="2" name="Section1G4">${selfAssessmentDetails.section1G4}</textarea>
                                                    </div>
                                                    <div class="col-sm-6">
		                                            <label>Summary of Areas of Improvement</label>
                                                            <textarea class="form-control" id="Comments" maxlength="300" rows="2" name="Section1G5">${selfAssessmentDetails.section1G5}</textarea>
                                                    </div>
                                                        
                                                </div>
                                                
                                                
                                                
                                                <!-- <div class="form-group row col-sm-12 col-xs-12">
          									
          									<a href="objective-achievement.html" class="btn btn-secondary m-l-5">3 of 10</a>
                                  		</div> -->
                                  		
                                  		<div class="form-group row col-sm-12 col-xs-12">
                                     <button type="submit" class="btn btn-primary  waves-light">3 of 10</button>
          									
                                  		</div>
                                  		
                                  		
                                  		</c:forEach>
                                  		</c:if>
                               
                               
                                <c:if test="${empty skillsSelfAssessmentDetails}">
                                          			 
                                          			 
                                          			 
                                          			  <div class="form-group row">  
                                                
                                                <div class="col-sm-8"><h6>Skills</h6></div><div class="col-sm-4"><h6>Competency Level</h6></div>
                                                    <div class="col-sm-8">
                                                     <p>Makes sound decisions with factual data and can present objective arguments for those decisions. Minimal decision making by subjectivity.</p>
                                                     </div>
                                                        
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G1">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                     <p>Initiates and implement new ideas/processes.</p>
                                                     </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G1">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                               
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                     <p>Organizes and prioritizes work even when encountered with conflicting priorities, seeks guidance if necessary.</p>
                                                     </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G1">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                               
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                      <p>Displays a positive approach towards work assignments and people. Overcomes obstacles and accepts challenges with enthusiasm.</p>
                                                     </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G1">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                     <p>Able to work well with internal and external customers and build relationships/partnerships with other departments and team members.</p>
                                                     </div>
                                                         <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G1">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                       <p>Possesses and applies technical knowledge required for positions.</p>
                                                       </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G1">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                       <p>Able to analyze situations and tasks accurately.</p>
                                                       </div>
                                                       <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G1">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                       <p>Takes required risk as needed by position.</p>
                                                       </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G1">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                        <p>Ability to resolve conflicts at all levels of the Company.</p>
                                                        </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G1">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                       <p>Able to work independently on agreed upon tasks.</p>
                                                       </div>
                                                      <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G1">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                
                                                <div class="form-group row">  
                                                <div class="col-sm-8"><h6>Ways Of Working</h6></div>                                              <div class="col-sm-4"><h6>Competency Level</h6></div>
                                                    <div class="col-sm-8">
                                                     <p>Consistently adheres to all rules and regulations.</p>
                                                     </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G2">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                    <p>Has commitment to meet agreed upon goals displaying positive behaviors. Attends meetings and does what he/she says is going to do. Communicates and/or re-negotiates agreed upon expectations if not able to meet deadlines.</p>
                                                    </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G2">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                      <p>Organization of duties, work, and tasks (method, delegation, control).</p>
                                                      </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G2">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                     <p>Able to articulate thoughts, ideas, and events in writing and orally.</p>
                                                     </div>
                                                        <div class="col-sm-4">
													<select class="form-control" id="exampleSelect1" name="Section1G2">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                     <p>Displays commitment to the Company’s continuous improvement efforts and
														implements/supports continuous improvement in area(s) of responsibility.</p>
                                                     </div>
                                                         <div class="col-sm-4">
													<select class="form-control" id="exampleSelect1" name="Section1G2">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                    <p>Establishes high standards and goals, works diligently on meeting set
													standards and goals overcoming obstacles.</p>
                                                    </div>
                                                         <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G2">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                 
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                      <p>Handles multiple projects and tasks concurrently and is able to prioritize and re-prioritize with minimal guidance.</p>  
                                                        </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G2">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row"> 
                                                <div class="col-sm-8"><h6>Self-Management and Leadership</h6></div>                                               <div class="col-sm-4"><h6>Competency Level</h6></div>
                                                    <div class="col-sm-8">
                                                        <p>Manages tasks and projects with minimal guidance (Plan, Do, Check, Act). When assigned leadership role, is able to lead and achieve results with collaboration from other team members.</p>
                                                        
                                                        </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G3">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                    <p>Adheres to Company policies, practices and legal requirements. Implements agreed upon direction even if personal point of view may be in conflict.</p>
                                                     </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G3">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                               
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                     <p>Recognizes his/her mistakes and implements corrective action/preventive actions.</p>
                                                    </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G3">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                        <p>Exemplifies the Company guiding principle of integrity in his/her decision making and dealing with supervisors, peers, and external customers.</p>
                                                        </div>
                                                         <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G3">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                       <p>Listens attentively to others and responds with respect. Accepts differences of opinions, style, and approach.</p>
                                                       </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G3">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                        <p>Anticipates departmental needs and understands his/her role in achieving Company objectives.</p>
                                                        </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G3">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                       <p>Participates and works well in a team environment. Is flexible as a team member and supports team consensus.</p>
                                                       </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section1G3">
                                                        <option value="Exceeds Job Requirements">Exceeds Job Requirements</option>
                                                        <option value="Meets Job Requirements">Meets Job Requirements</option>
                                                        <option value="Partially Meets Job Requirements">Partially Meets Job Requirements</option>
                                                        <option value="Does Not Meet Job Requirement">Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                               <h5>Self Assessment Summary</h5>
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-6">
                                                    <label>Summary Strengths</label>
                                                            <textarea class="form-control" id="Comments" maxlength="300" rows="2" name="Section1G4"></textarea>
                                                    </div>
                                                    <div class="col-sm-6">
		                                            <label>Summary of Areas of Improvement</label>
                                                            <textarea class="form-control" id="Comments" maxlength="300" rows="2" name="Section1G5"></textarea>
                                                    </div>
                                                        
                                                </div>
                                  		
                                  		<!-- 
                                  		 <div class="form-group row col-sm-12 col-xs-12">
          									
          									<a href="objective-achievement.html" class="btn btn-secondary m-l-5">3 of 10</a>
                                  		</div>
                                  		 -->
                                  		<div class="form-group row col-sm-12 col-xs-12">
                                     <button type="submit" class="btn btn-primary  waves-light">3 of 10</button>
          									
                                  		</div>
                                  		
                                  		
                                  		</c:if>
                                  		</form:form>
                                  		
                                  		
                                             
                                            
                        		</div>
                            </div><!-- end col-->
                        </div>
                        <!-- end row -->
                    </div> <!-- container -->
                </div> <!-- content -->

            </div>
            <!-- End content-page -->


            <!-- ============================================================== -->
            <!-- End Right content here -->
            <!-- ============================================================== -->


           

            <footer class="footer text-right">
                2016 © Lisi Aerospace.            </footer>


        </div>
        <!-- END wrapper -->


        <script>
            var resizefunc = [];
        </script>

        <!-- jQuery  -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/tether.min.js"></script><!-- Tether for Bootstrap -->
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/detect.js"></script>
        <script src="assets/js/fastclick.js"></script>
        <script src="assets/js/jquery.blockUI.js"></script>
        <script src="assets/js/waves.js"></script>
        <script src="assets/js/jquery.nicescroll.js"></script>
        <script src="assets/js/jquery.scrollTo.min.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/plugins/switchery/switchery.min.js"></script>

        <script src="assets/plugins/moment/moment.js"></script>
     	<script src="assets/plugins/timepicker/bootstrap-timepicker.min.js"></script>
     	<script src="assets/plugins/mjolnic-bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
     	<script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
     	<script src="assets/plugins/clockpicker/bootstrap-clockpicker.js"></script>
     	<script src="assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>

        <script src="assets/pages/jquery.form-pickers.init.js"></script>

        <!-- App js -->
        <script src="assets/js/jquery.core.js"></script>
        <script src="assets/js/jquery.app.js"></script>
    </body>
</html>