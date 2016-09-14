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
                                        <li class="active">Objective Achievement</li>
                                    </ol>
                                    <div class="clearfix"></div>
                                </div>
							</div>
						</div>
                        <!-- end row -->
                        <div class="row">                        
                            <div class="col-xs-12">
                                <div class="card-box">
								<h4 class="header-title">Objective Achievement</h4>                                    
                                             <form:form action="/AnnaulAssessmenT/objectiveAchievementOperation.do" method="post" modelAttribute="exemptSection2Pojo">
                                               
                                               <c:if test="${!empty objectiveAchievement }">
                                               <c:forEach var="objData" items="${objectiveAchievement}">
                                               <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-10"><br>2015 Agreed Upon Objectives</div>
                                                        <div class="col-xs-2">Achievement Level For 2015</div>
                                                    </div>
                                                </fieldset>
                                                
                                                <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-10">
                                                    	<textarea class="form-control" rows="2" cols="75" maxlength="150" placeholder="1" name="section2A1Objective">${objData.section2A1Objective}</textarea>
                                                        </div>
                                                        <div class="col-xs-2">
                                                    		<input type="text" class="form-control" id="1" placeholder="0 to 100%" name="Section2A1Level" value="${objData.section2A1Level}">
                                                        </div>
                                                    </div>
                                                </fieldset>
                                               <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-10">
                                                    	<textarea class="form-control" rows="1" maxlength="150" placeholder="2" name="section2A2Objective">${objData.section2A2Objective}</textarea>
                                                        </div>
                                                        <div class="col-xs-2">
                                                   		<input type="text" class="form-control" id="1" placeholder="0 to 100%" name="Section2A2Level" value="${objData.section2A2Level}">
                                                        </div>
                                                    </div>
                                                </fieldset>
                                               
                                               <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-10">
                                                    	<textarea class="form-control" rows="1" maxlength="150" placeholder="3" name="section2A3Objective">${objData.section2A3Objective}</textarea>
                                                        </div>
                                                        <div class="col-xs-2">
                                                    		<input type="text" class="form-control" id="1" placeholder="0 to 100%" name="Section2A3Level" value="${objData.section2A3Level}">
                                                        </div>
                                                    </div>
                                                </fieldset>
                                               
                                               <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-10">
                                                    	<textarea class="form-control" rows="1" maxlength="150" placeholder="4" name="section2A4Objective">${objData.section2A4Objective}</textarea>
                                                        </div>
                                                        <div class="col-xs-2">
                                                    		<input type="text" class="form-control" id="1" placeholder="0 to 100%"name="Section2A4Level" value="${objData.section2A4Level}">
                                                        </div>
                                                    </div>
                                                </fieldset>
                                               
                                               <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-10">
                                                    	<textarea class="form-control" rows="1" maxlength="150" placeholder="5" name="section2A5Objective">${objData.section2A5Objective}</textarea>
                                                        </div>
                                                        <div class="col-xs-2">
                                                    		<input type="text" class="form-control" id="1" placeholder="0 to 100%"name="Section2A5Level"value="${objData.section2A5Level}">
                                                        </div>
                                                    </div>
                                                </fieldset>
                                               
                                              
                                               
                                               <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-10">Total</div>
                                                        <div class="col-xs-2">0.00</div>
                                                    </div>
                                                </fieldset>
                                                          
                                                  
                                                <div class="form-group row">
                                                    <div class="col-sm-12">
                                                    <label>Additional Comments:</label>
                                                    <textarea class="form-control" id="Comments" maxlength="200" rows="3" name="Section2AdditionalComments">${objData.section2AdditionalComments}</textarea>
                                                    </div>   
                                                </div>
                                                
                                     <div class="form-group row col-sm-12 col-xs-12">
                                     <button type="submit"  class="btn btn-primary  waves-light">4 of 10</button>
          									
                                  		</div>
                                  		</c:forEach>
                                  		</c:if>
                                  		
                                  		<!-- for inserting data -->
                                  		<c:if test="${empty objectiveAchievement}">
                                  		
                                  		<fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-10"><br>2015 Agreed Upon Objectives</div>
                                                        <div class="col-xs-2">Achievement Level For 2015</div>
                                                    </div>
                                                </fieldset>
                                                
                                                <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-10">
                                                    	<textarea class="form-control" rows="2" cols="75" maxlength="150" placeholder="1" name="section2A1Objective">${objData.section2A1Objective}</textarea>
                                                        </div>
                                                        <div class="col-xs-2">
                                                    		<input type="text" class="form-control" id="1" placeholder="0 to 100%" name="Section2A1Level">
                                                        </div>
                                                    </div>
                                                </fieldset>
                                               <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-10">
                                                    	<textarea class="form-control" rows="1" maxlength="150" placeholder="2" name="section2A2Objective"></textarea>
                                                        </div>
                                                        <div class="col-xs-2">
                                                   		<input type="text" class="form-control" id="1" placeholder="0 to 100%" name="Section2A2Level">
                                                        </div>
                                                    </div>
                                                </fieldset>
                                               
                                               <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-10">
                                                    	<textarea class="form-control" rows="1" maxlength="150" placeholder="3" name="section2A3Objective"></textarea>
                                                        </div>
                                                        <div class="col-xs-2">
                                                    		<input type="text" class="form-control" id="1" placeholder="0 to 100%" name="Section2A3Level">
                                                        </div>
                                                    </div>
                                                </fieldset>
                                               
                                               <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-10">
                                                    	<textarea class="form-control" rows="1" maxlength="150" placeholder="4" name="section2A4Objective"></textarea>
                                                        </div>
                                                        <div class="col-xs-2">
                                                    		<input type="text" class="form-control" id="1" placeholder="0 to 100%"name="Section2A4Level">
                                                        </div>
                                                    </div>
                                                </fieldset>
                                               
                                               <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-10">
                                                    	<textarea class="form-control" rows="1" maxlength="150" placeholder="5" name="section2A5Objective"></textarea>
                                                        </div>
                                                        <div class="col-xs-2">
                                                    		<input type="text" class="form-control" id="1" placeholder="0 to 100%"name="Section2A5Level">
                                                        </div>
                                                    </div>
                                                </fieldset>
                                               
                                               <!-- <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-10">
                                                    	<textarea class="form-control" rows="1" maxlength="150" placeholder="6" ></textarea>
                                                        </div>
                                                        <div class="col-xs-2">
                                                    		<input type="text" class="form-control" id="1" placeholder="0 to 100%">
                                                        </div>
                                                    </div>
                                                </fieldset>
                                               
                                               <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-10">
                                                    	<textarea class="form-control" rows="1" maxlength="150" placeholder="7"></textarea>
                                                        </div>
                                                        <div class="col-xs-2">
                                                    		<input type="txt" class="form-control" id="1" placeholder="0 to 100%">
                                                        </div>
                                                    </div>
                                                </fieldset> -->
                                               
                                               <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-10">Total</div>
                                                        <div class="col-xs-2">0.00</div>
                                                    </div>
                                                </fieldset>
                                                          
                                                  
                                                <div class="form-group row">
                                                    <div class="col-sm-12">
                                                    <label>Additional Comments:</label>
                                                    <textarea class="form-control" id="Comments" maxlength="200" rows="3" name="Section2AdditionalComments"></textarea>
                                                    </div>   
                                                </div>
                                                
                                     <div class="form-group row col-sm-12 col-xs-12">
                                     <button type="submit"  class="btn btn-primary  waves-light">4 of 10</button>
          									
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
