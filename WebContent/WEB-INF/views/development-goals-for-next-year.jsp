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
                                        <li class="active">2016 Development Goals</li>
                                    </ol>
                                    <div class="clearfix"></div>
                                </div>
							</div>
						</div>
                        <!-- end row -->
                        <div class="row">                        
                            <div class="col-xs-12">
                                <div class="card-box">
								<h4 class="header-title">2016 Development Goals</h4>
                                            <form:form action="/AnnaulAssessmenT/developmentGoals.do" modelAttribute="devlopmentGoals" method="post">
                                                <c:if test="${! empty devgoals}">
                                         <c:forEach var="presentYearObj" items="${devgoals}">
                                               
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-12">
                                                   <div class="form-group">
                                                    <textarea class="form-control" name="developmentGoalsOne" rows="2" maxlength="150" placeholder="1">${presentYearObj.developmentGoalsOne}</textarea>
                                                </div>
                                                
                                                <div class="form-group">
                                                    <textarea class="form-control" name="developmentGoalsTwo" rows="2" maxlength="150" placeholder="2">${presentYearObj.developmentGoalsTwo}</textarea>
                                                </div>
                                                
                                                <div class="form-group">
                                                    <textarea class="form-control" name="developmentGoalsThree" rows="2" maxlength="150" placeholder="3">${presentYearObj.developmentGoalsThree}</textarea>
                                                </div>
                                                <div class="form-group">
                                                    <textarea class="form-control" name="developmentGoalsFour" rows="2" maxlength="150" placeholder="4">${presentYearObj.developmentGoalsFour}</textarea>
                                                </div>
                                                <div class="form-group">
                                                    <textarea class="form-control" name="developmentGoalsFive" rows="2" maxlength="150" placeholder="5">${presentYearObj.developmentGoalsFive}</textarea>
                                                </div>
                                                    </div>
                                                    
                                                    
                                                    
                                                </div>      
                                                
                                     <div class="form-group row col-sm-12 col-xs-12">
          									<!-- <a href="meeting-summary.html" class="btn btn-secondary m-l-5">8 of 10</a> -->
          									<input type="submit" value="8 of 10" class="btn btn-secondary m-l-5">
                                  		</div>
                                  		</c:forEach>
                                  		</c:if>
                                  		<c:if test="${ empty devgoals}">
                                        
                                               
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-12">
                                                   <div class="form-group">
                                                    <textarea class="form-control" name="developmentGoalsOne" rows="2" maxlength="150" placeholder="1">${presentYearObj.developmentGoalsOne}</textarea>
                                                </div>
                                                
                                                <div class="form-group">
                                                    <textarea class="form-control" name="developmentGoalsTwo" rows="2" maxlength="150" placeholder="2">${presentYearObj.developmentGoalsTwo}</textarea>
                                                </div>
                                                
                                                <div class="form-group">
                                                    <textarea class="form-control" name="developmentGoalsThree" rows="2" maxlength="150" placeholder="3">${presentYearObj.developmentGoalsThree}</textarea>
                                                </div>
                                                <div class="form-group">
                                                    <textarea class="form-control" name="developmentGoalsFour" rows="2" maxlength="150" placeholder="4">${presentYearObj.developmentGoalsFour}</textarea>
                                                </div>
                                                <div class="form-group">
                                                    <textarea class="form-control" name="developmentGoalsFive" rows="2" maxlength="150" placeholder="5">${presentYearObj.developmentGoalsFive}</textarea>
                                                </div>
                                                    </div>
                                                    
                                                    
                                                    
                                                </div>      
                                                
                                     <div class="form-group row col-sm-12 col-xs-12">
          									<!-- <a href="meeting-summary.html" class="btn btn-secondary m-l-5">8 of 10</a> -->
          									<input type="submit" value="8 of 10" class="btn btn-secondary m-l-5">
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


       
    </body>
