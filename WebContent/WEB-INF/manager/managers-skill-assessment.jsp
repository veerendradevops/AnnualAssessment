<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                                    <h4 class="page-title">Manager's Skill Assessment</h4>
                                    <ol class="breadcrumb p-0">
                                        <li><a href="#">2016 Payroll</a></li>
                                        <li class="active">Manager's Skill Assessment</li>
                                    </ol>
                                    <div class="clearfix"></div>
                                </div>
							</div>
						</div>
                        <!-- end row -->
                        <div class="row">                        
                            <div class="col-xs-12">
                                <div class="card-box">
								<h4 class="header-title ">Manager's Skill Assessment</h4>
									<p>Complete assessment and provide specific examples in attach sheets if necessary</p>
                                    
                                           <form:form action="/AnnaulAssessmenT/managerSkillAssessmentAction.do" method="GET" modelAttribute="exemptSection2Pojo">
                                            
                                                 <c:if test="${!empty skill1}">
                                              <%--    <c:forEach var="managersskillassessmentt" items="${managersskillassessment}"> --%>
                                                <div class="form-group row">  
                                                <div class="col-sm-8"><h6>Skills</h6></div><div class="col-sm-4"><h6>Competency Level</h6></div>
                                                    <div class="col-sm-8">
                                                     <p>Makes sound decisions with factual data and can present objective arguments for those decisions. Minimal decision making by subjectivity.</p>
                                                     </div>
                                                        
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B1">
														<option>${skill1}</option>
                                                         <option>Exceeds Job Requirements</option>
                                                         <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                     <p>Initiates and implement new ideas/processes.</p>
                                                     </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B1">
														<option>${skill2}</option>
                                                         <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option> 
                                                    </select>
                                                        </div>
                                                </div>
                                               
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                     <p>Organizes and prioritizes work even when encountered with conflicting priorities, seeks guidance if necessary.</p>
                                                     </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B1">
														 <option>${skill3}</option>
                                                         <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option> 
                                                    </select>
                                                        </div>
                                                </div>
                                               
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                      <p>Displays a positive approach towards work assignments and people. Overcomes obstacles and accepts challenges with enthusiasm.</p>
                                                     </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B1">
														<option>${skill4}</option>
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option> 
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                     <p>Able to work well with internal and external customers and build relationships/partnerships with other departments and team members.</p>
                                                     </div>
                                                         <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B1">
														<option>${skill5}</option>
                                                         <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option> 
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                       <p>Possesses and applies technical knowledge required for positions.</p>
                                                       </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B1">
														<option>${skill6}</option>
                                                         <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option> 
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                       <p>Able to analyze situations and tasks accurately.</p>
                                                       </div>
                                                       <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B1">
														<option>${skill7}</option>
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option> 
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                       <p>Takes required risk as needed by position.</p>
                                                       </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B1">
														<option>${skill8}</option>
                                                         <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option> 
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                        <p>Ability to resolve conflicts at all levels of the Company.</p>
                                                        </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B1">
														<option>${skill9}</option>
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option> 
                                                    </select>
                                                        </div>
                                                </div>
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                       <p>Able to work independently on agreed upon tasks.</p>
                                                       </div>
                                                      <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B1">
														<option>${skill10}</option>
                                                         <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option> 
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                
                                                <div class="form-group row">  
                                                <div class="col-sm-8"><h6>Ways Of Working</h6></div>                                              <div class="col-sm-4"><h6>Competency Level</h6></div>
                                                    <div class="col-sm-8">
                                                     <p>Consistently adheres to all rules and regulations.</p>
                                                     </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B2">
														<option>${waysOfWorking1}</option>
                                                         <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option> 
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                    <p>Has commitment to meet agreed upon goals displaying positive behaviors. Attends meetings and does what he/she says is going to do. Communicates and/or re-negotiates agreed upon expectations if not able to meet deadlines.</p>
                                                    </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B2" >
														<option>${waysOfWorking2}</option>
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option> 
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                      <p>Organization of duties, work, and tasks (method, delegation, control).</p>
                                                      </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B2">
														<option>${waysOfWorking3}</option>
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                     <p>Able to articulate thoughts, ideas, and events in writing and orally.</p>
                                                     </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B2">
														<option>${waysOfWorking4}</option>
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                     <p>Displays commitment to the Company’s continuous improvement efforts and
implements/supports continuous improvement in area(s) of responsibility.</p>
                                                     </div>
                                                         <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B2">
														<option>${waysOfWorking5}</option>
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                    <p>Establishes high standards and goals, works diligently on meeting set
standards and goals overcoming obstacles.</p>
                                                    </div>
                                                         <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B2">
														<option>${waysOfWorking6}</option>
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                 
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                      <p>Handles multiple projects and tasks concurrently and is able to prioritize and re-prioritize with minimal guidance.</p>  
                                                        </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B2">
														<option>${waysOfWorking7}</option>
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row"> 
                                                <div class="col-sm-8"><h6>Self-Management and Leadership</h6></div>                                               <div class="col-sm-4"><h6>Competency Level</h6></div>
                                                    <div class="col-sm-8">
                                                        <p>Manages tasks and projects with minimal guidance (Plan, Do, Check, Act). When assigned leadership role, is able to lead and achieve results with collaboration from other team members.</p>
                                                        
                                                        </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B3">
														<option>${selfManagementandLeadership1}</option>
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                    <p>Adheres to Company policies, practices and legal requirements. Implements agreed upon direction even if personal point of view may be in conflict.</p>
                                                     </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B3">
														<option>${selfManagementandLeadership2}</option>
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                               
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                     <p>Recognizes his/her mistakes and implements corrective action/preventive actions.</p>
                                                    </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B3">
														<option>${selfManagementandLeadership3}</option>
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                        <p>Exemplifies the Company guiding principle of integrity in his/her decision making and dealing with supervisors, peers, and external customers.</p>
                                                        </div>
                                                         <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B3">
														<option>${selfManagementandLeadership4}</option>
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                       <p>Listens attentively to others and responds with respect. Accepts differences of opinions, style, and approach.</p>
                                                       </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B3">
														<option>${selfManagementandLeadership5}</option>
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                        <p>Anticipates departmental needs and understands his/her role in achieving Company objectives.</p>
                                                        </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B3">
														<option>${selfManagementandLeadership6}</option>
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                       <p>Participates and works well in a team environment. Is flexible as a team member and supports team consensus.</p>
                                                       </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B3">
														<option>${selfManagementandLeadership7}</option>
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                               
                                                <div class="form-group row col-sm-12 col-xs-12">
          								
          								 <button type="submit"  class="btn btn-primary  waves-light">5 of 10</button>
          									<!-- <a href="summary-of-accomplishment-and-development-areas-for-improvement.jsp" class="btn btn-secondary m-l-5">5 of 10</a> -->
                                  		</div>
                                  		<%-- </c:forEach> --%>
                                  		</c:if>
                                  		
                                  		<c:if test="${empty skill1 }">
                                                 
                                                <div class="form-group row">  
                                                <div class="col-sm-8"><h6>Skills</h6></div>                                              <div class="col-sm-4"><h6>Competency Level</h6></div>
                                                    <div class="col-sm-8">
                                                     <p>Makes sound decisions with factual data and can present objective arguments for those decisions. Minimal decision making by subjectivity.</p>
                                                     </div>
                                                        
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B1">
														
                                                        <option>Exceeds Job Requirements</option> 
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                     <p>Initiates and implement new ideas/processes.</p>
                                                     </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B1">
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                               
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                     <p>Organizes and prioritizes work even when encountered with conflicting priorities, seeks guidance if necessary.</p>
                                                     </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B1">
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                               
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                      <p>Displays a positive approach towards work assignments and people. Overcomes obstacles and accepts challenges with enthusiasm.</p>
                                                     </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B1">
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                     <p>Able to work well with internal and external customers and build relationships/partnerships with other departments and team members.</p>
                                                     </div>
                                                         <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B1">
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                       <p>Possesses and applies technical knowledge required for positions.</p>
                                                       </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B1">
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                       <p>Able to analyze situations and tasks accurately.</p>
                                                       </div>
                                                       <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B1">
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                       <p>Takes required risk as needed by position.</p>
                                                       </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B1">
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                        <p>Ability to resolve conflicts at all levels of the Company.</p>
                                                        </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B1">
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                       <p>Able to work independently on agreed upon tasks.</p>
                                                       </div>
                                                      <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B1">
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                
                                                <div class="form-group row">  
                                                <div class="col-sm-8"><h6>Ways Of Working</h6></div>                                              <div class="col-sm-4"><h6>Competency Level</h6></div>
                                                    <div class="col-sm-8">
                                                     <p>Consistently adheres to all rules and regulations.</p>
                                                     </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B2">
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                    <p>Has commitment to meet agreed upon goals displaying positive behaviors. Attends meetings and does what he/she says is going to do. Communicates and/or re-negotiates agreed upon expectations if not able to meet deadlines.</p>
                                                    </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B2" >
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                      <p>Organization of duties, work, and tasks (method, delegation, control).</p>
                                                      </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B2">
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                     <p>Able to articulate thoughts, ideas, and events in writing and orally.</p>
                                                     </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B2">
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                     <p>Displays commitment to the Company’s continuous improvement efforts and
implements/supports continuous improvement in area(s) of responsibility.</p>
                                                     </div>
                                                         <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B2">
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                    <p>Establishes high standards and goals, works diligently on meeting set
standards and goals overcoming obstacles.</p>
                                                    </div>
                                                         <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B2">
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                 
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                      <p>Handles multiple projects and tasks concurrently and is able to prioritize and re-prioritize with minimal guidance.</p>  
                                                        </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B2">
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row"> 
                                                <div class="col-sm-8"><h6>Self-Management and Leadership</h6></div>                                               <div class="col-sm-4"><h6>Competency Level</h6></div>
                                                    <div class="col-sm-8">
                                                        <p>Manages tasks and projects with minimal guidance (Plan, Do, Check, Act). When assigned leadership role, is able to lead and achieve results with collaboration from other team members.</p>
                                                        
                                                        </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B3">
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                    <p>Adheres to Company policies, practices and legal requirements. Implements agreed upon direction even if personal point of view may be in conflict.</p>
                                                     </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B3">
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                               
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                     <p>Recognizes his/her mistakes and implements corrective action/preventive actions.</p>
                                                    </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B3">
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                        <p>Exemplifies the Company guiding principle of integrity in his/her decision making and dealing with supervisors, peers, and external customers.</p>
                                                        </div>
                                                         <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B3">
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                       <p>Listens attentively to others and responds with respect. Accepts differences of opinions, style, and approach.</p>
                                                       </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B3">
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                        <p>Anticipates departmental needs and understands his/her role in achieving Company objectives.</p>
                                                        </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B3">
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-8">
                                                       <p>Participates and works well in a team environment. Is flexible as a team member and supports team consensus.</p>
                                                       </div>
                                                        <div class="col-sm-4">
														<select class="form-control" id="exampleSelect1" name="Section2B3">
                                                        <option>Exceeds Job Requirements</option>
                                                        <option>Meets Job Requirements</option>
                                                        <option>Partially Meets Job Requirements</option>
                                                        <option>Does Not Meet Job Requirement</option>
                                                    </select>
                                                        </div>
                                                </div>
                                               
                                                <div class="form-group row col-sm-12 col-xs-12">
          								
          								 <button type="submit"  class="btn btn-primary  waves-light">5 of 10</button>
          									<!-- <a href="summary-of-accomplishment-and-development-areas-for-improvement.jsp" class="btn btn-secondary m-l-5">5 of 10</a> -->
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

       
    </body>
