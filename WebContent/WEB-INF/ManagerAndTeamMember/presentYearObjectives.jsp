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
                                         <c:if test="${! empty presentYearObjectives}">
                                         <c:forEach var="presentYearObj" items="${presentYearObjectives}">
                                                 <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-10">2016 Agreed Upon Performance Objectives/Results</div>
                                                        <div class="col-xs-2">Weight in %</div>
                                                    </div>
                                                </fieldset>
                                                
                                                <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-10">
                                                    	<textarea class="form-control" name="objectivesOne" rows="2" maxlength="150" placeholder="1">${presentYearObj.objectivesOne}</textarea>
                                                        </div>
                                                        <div class="col-xs-2">
                                                    		<input type="text" name="objectivesOneWeight" class="form-control" id="first" onkeyup="total();" placeholder="0 to 100%" value="${presentYearObj.objectivesOneWeight}">
                                                        </div>
                                                    </div>
                                                </fieldset>
                                               <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-10">
                                                    	<textarea class="form-control" name="objectivesTwo" rows="2" maxlength="150" placeholder="2">${presentYearObj.objectivesTwo}</textarea>
                                                        </div>
                                                        <div class="col-xs-2">
                                                    		<input type="text" name="objectivesTwoWeight" class="form-control" id="second" onkeyup="total();" placeholder="0 to 100%" value="${presentYearObj.objectivesTwoWeight}">
                                                        </div>
                                                    </div>
                                                </fieldset>
                                               
                                               <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-10">
                                                    	<textarea class="form-control" name="objectivesThree" rows="2" maxlength="150" placeholder="3">${presentYearObj.objectivesThree}</textarea>
                                                        </div>
                                                        <div class="col-xs-2">
                                                    		<input type="text" name="objectivesThreeWeight" class="form-control" id="third"  onkeyup="total();" placeholder="0 to 100%" value="${presentYearObj.objectivesThreeWeight}">
                                                        </div>
                                                    </div>
                                                </fieldset>
                                               
                                               <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-10">
                                                    	<textarea class="form-control" name="objectivesFour" rows="2" maxlength="150" placeholder="4">${presentYearObj.objectivesFour}</textarea>
                                                        </div>
                                                        <div class="col-xs-2">
                                                    		<input type="text" name="objectivesFourWeight" class="form-control" id="four" onkeyup="total();" placeholder="0 to 100%" value="${presentYearObj.objectivesFourWeight}">
                                                        </div>
                                                    </div>
                                                </fieldset>
                                               
                                               <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-10">
                                                    	<textarea class="form-control" name="objectivesFive" rows="2" maxlength="150" placeholder="5">${presentYearObj.objectivesFive}</textarea>
                                                        </div>
                                                        <div class="col-xs-2">
                                                    		<input type="text" name="objectivesFiveWeight" class="form-control" id="five" onkeyup="total();" placeholder="0 to 100%" value="${presentYearObj.objectivesFiveWeight}">
                                                        </div>
                                                    </div>
                                                </fieldset>
                                               
                                               <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-10">Total</div>
                                                        <div class="col-xs-2"><p id="tscore"/></div>
                                                        <input type="hidden" name="" id="totalScore">
                                                    </div>
                                                </fieldset>

                                                
                                     <div class="form-group row col-sm-12 col-xs-12">
          									
          									<input type="submit" value="7 of 10" class="btn btn-secondary m-l-5">
                                  		</div>
                                  		</c:forEach>
                                  		</c:if>
                                  		 <c:if test="${ empty presentYearObjectives}">
                                        
                                                 <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-10">2016 Agreed Upon Performance Objectives/Results</div>
                                                        <div class="col-xs-2">Weight in %</div>
                                                    </div>
                                                </fieldset>
                                                
                                                <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-10">
                                                    	<textarea class="form-control" name="objectivesOne" rows="2" maxlength="150" placeholder="1"></textarea>
                                                        </div>
                                                        <div class="col-xs-2">
                                                    		<input type="text" name="objectivesOneWeight" class="form-control" id="first" onkeyup="total();" placeholder="0 to 100%">
                                                        </div>
                                                    </div>
                                                </fieldset>
                                               <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-10">
                                                    	<textarea class="form-control" name="objectivesTwo" rows="2" maxlength="150" placeholder="2"></textarea>
                                                        </div>
                                                        <div class="col-xs-2">
                                                    		<input type="text" name="objectivesTwoWeight" class="form-control" id="second"  onkeyup="total();" placeholder="0 to 100%">
                                                        </div>
                                                    </div>
                                                </fieldset>
                                               
                                               <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-10">
                                                    	<textarea class="form-control" name="objectivesThree" rows="2" maxlength="150" placeholder="3"></textarea>
                                                        </div>
                                                        <div class="col-xs-2">
                                                    		<input type="text" name="objectivesThreeWeight" class="form-control" id="third" onkeyup="total();" placeholder="0 to 100%">
                                                        </div>
                                                    </div>
                                                </fieldset>
                                               
                                               <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-10">
                                                    	<textarea class="form-control" name="objectivesFour" rows="2" maxlength="150" placeholder="4"></textarea>
                                                        </div>
                                                        <div class="col-xs-2">
                                                    		<input type="text" name="objectivesFourWeight" class="form-control" id="four" onkeyup="total();" placeholder="0 to 100%">
                                                        </div>
                                                    </div>
                                                </fieldset>
                                               
                                               <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-10">
                                                    	<textarea class="form-control" name="objectivesFive" rows="2" maxlength="150" placeholder="5"></textarea>
                                                        </div>
                                                        <div class="col-xs-2">
                                                    		<input type="text" name="objectivesFiveWeight" class="form-control" id="five" onkeyup="total();" placeholder="0 to 100%">
                                                        </div>
                                                    </div>
                                                </fieldset>
                                               
                                               <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-10">Total</div>
                                                        <div class="col-xs-2"><p id="tScore"/></div>
                                                        <input type="hidden" name="" id="totalScore" >
                                                        
                                                    </div>
                                                </fieldset>

                                                
                                     <div class="form-group row col-sm-12 col-xs-12">
          									
          									<input type="submit" value="7 of 10" class="btn btn-secondary m-l-5">
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
    <script>
    function total(){
    	var first=document.getElementById('first').value;
    	var second=document.getElementById('second').value;
    	var third=document.getElementById('third').value;
    	var four=document.getElementById('four').value;
    	var five=document.getElementById('five').value;
    	
    	var result=parseInt(first)+parseInt(second)+parseInt(third)+parseInt(four)+parseInt(five);
    	
    	if (!isNaN(result)) {
    		
    		document.getElementById('tscore').innerHTML = result;
    		document.getElementById('totalScore').value = result;
    	}
    }
    </script>