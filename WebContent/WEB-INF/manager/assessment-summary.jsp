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
                                    <h4 class="page-title">2016 Payroll</h4>
                                    <ol class="breadcrumb p-0">
                                        <li><a href="#">2016 Payroll</a></li>
                                        <li class="active">Overall Rating Per Manager</li>
                                    </ol>
                                    <div class="clearfix"></div>
                                </div>
							</div>
						</div>
                        <!-- end row -->
                        <div class="row">                        
                            <div class="col-xs-12">
                                <div class="card-box">
							                                  
                                            <form:form action="/AnnaulAssessmenT/assessmentsummary.do" method="GET" modelAttribute="exemptSection2Data">
                                            <c:if test="${!empty assessmentsummary }">
                                            <c:forEach var="objData" items="${assessmentsummary}">
                                            <h5>Manager’s Assessment Summary</h5>
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-6">
                                                    <label>Summary Strengths</label>
                                                            <textarea class="form-control" id="Comments" maxlength="300" rows="2" name="section2C1">${objData.section2CSummeryStrength}</textarea>
                                                    </div>
                                                    <div class="col-sm-6">
		                                            <label>Summary of Areas of Improvement</label>
                                                            <textarea class="form-control" id="Comments" maxlength="300" rows="2" name="section2C2">${objData.section2CSummeryImprovement}</textarea>
                                                    </div>
                                                        
                                                </div>
                                                
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-12">
                                                    <h4 class="header-title">Summary of Accomplishment and Development Areas for Improvement</h4>
                                                    
                                                    <label>General comments about the Team Member overall performance and key accomplishments and needed development for the coming year.</label>
                                                    <textarea class="form-control" id="Comments" maxlength="300" rows="3" name="Section2D1">${objData.section2DSummeryOfAccomplishmentAndAreasImprovement}</textarea>
                                                    </div>   
                                                </div>
                                                <h4 class="header-title">Overall Rating Per Manager</h4>  
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-6"><p>Assessment Summary 2015</p>
														<select class="form-control" id="exampleSelect1" name="section2E1">
														<option>${section2EAssessmentSummary}</option>
                                                        <option>New in the position</option>
                                                        <option>too early to decide (seniority < 1 year)</option>
                                                    </select>
                                                        
                                                    </div>
                                                    
                                                    
                                                    <div class="col-sm-6"><p>2015 Assessment compared to 2014</p>
														<select class="form-control" id="exampleSelect1" name="section2E2">
                                                       <option>${section2EAssessmentcompared}</option>
                                                        <option>Not applicable</option>
                                                        <option>new in the position</option>
                                                    </select>
                                                                                               
                                                
                                                    </div>
                                                </div>
                                                
                                     <div class="form-group row col-sm-12 col-xs-12">
                                     
          									<button type="submit" class="btn btn-secondary m-l-5">6 of 10</button>
                                  		</div>
                                  		</c:forEach>
                                  		</c:if>
                                  		<!--for inserting data -->
                                  		<c:if test="${empty assessmentsummary }">
                                           
                                            <h5>Manager’s Assessment Summary</h5>
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-6">
                                                    <label>Summary Strengths</label>
                                                            <textarea class="form-control" id="Comments" maxlength="300" rows="2" name="section2C1"></textarea>
                                                    </div>
                                                    <div class="col-sm-6">
		                                            <label>Summary of Areas of Improvement</label>
                                                            <textarea class="form-control" id="Comments" maxlength="300" rows="2" name="section2C2"></textarea>
                                                    </div>
                                                        
                                                </div>
                                                
                                                
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-12">
                                                    <h4 class="header-title">Summary of Accomplishment and Development Areas for Improvement</h4>
                                                    
                                                    <label>General comments about the Team Member overall performance and key accomplishments and needed development for the coming year.</label>
                                                    <textarea class="form-control" id="Comments" maxlength="300" rows="3" name="section2D1"></textarea>
                                                    </div>   
                                                </div>
                                                <h4 class="header-title">Overall Rating Per Manager</h4>  
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-6"><p>Assessment Summary 2015</p>
														<select class="form-control" id="exampleSelect1" name="section2E1">
                                                        <option>New in the position</option>
                                                        <option>too early to decide (seniority < 1 year)</option>
                                                    </select>
                                                        
                                                    </div>
                                                    
                                                    
                                                    <div class="col-sm-6"><p>2015 Assessment compared to 2014</p>
														<select class="form-control" id="exampleSelect1" name="section2E2">
                                                        <option>Not applicable</option>
                                                        <option>new in the position</option>
                                                    </select>
                                                                                               
                                                
                                                    </div>
                                                </div>
                                                
                                     <div class="form-group row col-sm-12 col-xs-12">
                                     
          									<input  type="submit" class="btn btn-secondary m-l-5 waves-light" value="6 of 10">
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