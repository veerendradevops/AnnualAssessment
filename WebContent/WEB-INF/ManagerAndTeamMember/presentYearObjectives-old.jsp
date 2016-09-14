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
                                        <li class="active">2015 Objectives</li>
                                    </ol>
                                    <div class="clearfix"></div>
                                </div>
							</div>
						</div>
                        <!-- end row -->
                        <div class="row">                        
                            <div class="col-xs-12">
                                <div class="card-box">
								<h4 class="header-title">2015 Objectives</h4>   
                                <h6>Agreed Upon Objectives (Specific, Measurable, Achievable, Results Based, and Time Bound)</h6>
                                            <form:form action="/AnnaulAssessmenT/presentYearObjectivesAction.do" modelAttribute="presentYearObjectives" method="post">
                                                <div class="form-group row">                                                
                                                    <div class="col-sm-10"><p>2016 Agreed Upon Performance Objectives/Results</p>
                                                   <div class="form-group">
                                                    <input type="text" name="objectivesOne" class="form-control"  maxlength="150" id="1" placeholder="1">
                                                </div>
                                                
                                                <div class="form-group">
                                                    <input type="txt" name="objectivesTwo" class="form-control" maxlength="150" id="2" placeholder="2">
                                                </div>
                                                
                                                <div class="form-group">
                                                    <input type="txt" name="objectivesThree" class="form-control" maxlength="150" id="3" placeholder="3">
                                                </div>
                                                <div class="form-group">
                                                    <input type="txt" name="objectivesFour" class="form-control" maxlength="150" id="4" placeholder="4">
                                                </div>
                                                <div class="form-group">
                                                    <input type="txt" name="objectivesFive" class="form-control" maxlength="150" id="5" placeholder="5">
                                                </div>
                                                    </div>
                                                    
                                                    
                                                    <div class="col-sm-2"><p>Weight in %</p>
                                                    
                                                	<div class="form-group">
                                                    <input type="txt" name="objectivesOneWeight" class="form-control" id="1" placeholder="0 to 100%">
                                                </div>
                                                
                                                <div class="form-group">
                                                    <input type="txt" name="objectivesTwoWeight" class="form-control" id="2" placeholder="0 to 100%">
                                                </div>
                                                
                                                <div class="form-group">
                                                    <input type="txt" name="objectivesThreeWeight" class="form-control" id="3" placeholder="0 to 100%">
                                                </div>
                                                <div class="form-group">
                                                    <input type="txt" name="objectivesFourWeight" class="form-control" id="4" placeholder="0 to 100%">
                                                </div>
                                                <div class="form-group">
                                                    <input type="txt" name="objectivesFiveWeight" class="form-control" id="5" placeholder="0 to 100%">
                                                </div>
                                                    </div>
                                                </div>      
                                                <div class="form-group row">
                                                <div class="col-sm-10"><label>Total</label></div>                                            <div class="col-sm-2"><label>0.00</label></div>
                                                </div>
                                                
                                     <div class="form-group row col-sm-12 col-xs-12">
          									
          								<!-- 	<a href="development-goals-for-next-year.html" class="btn btn-secondary m-l-5">7 of 10</a> -->
          								<input type="submit" value="7 of 10" class="btn btn-secondary m-l-5">
                                  		</div>
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
