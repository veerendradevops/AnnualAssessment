<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.lisi.annaulAssessment.util.Converters"%>
<html>

    <body class="fixed-left">
    <%!String year;%>
	<%
		year = Converters.getCurrentYear();
		pageContext.setAttribute("year", year);
	%>

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
                                    <h4 class="page-title">${year} Payroll</h4>
                                    <ol class="breadcrumb p-0">
                                        <li><a href="#">${year} Payroll</a></li>
                                        <li class="active">Training & Development</li>
                                    </ol>
                                    <div class="clearfix"></div>
                                </div>
							</div>
						</div>
                        <!-- end row -->


                        <div class="row">
                        	<div class="col-sm-12">
                        		<div class="card-box">

                        			<h4 class="header-title m-t-0 m-b-30">Training & Development</h4>
									<p>Indicate training area or focus need</p>
                        			<div class="row">                                  
                                    
                        				<div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
                                            <form:form action="training-developmentForm.do" method="post" modelAttribute="trainingAndDevelopment">
                                            <c:if test="${!empty trainingAndDevelopement}">
<h2>hii</h2>
												<c:forEach items="${trainingAndDevelopement}" var="jdetails">
                                                <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-12">
                                                            <label for="exampleInputPassword1">1. Area/Focus:</label>
                                                    		<input type="text" class="form-control" id="score" placeholder="Area/Focus" name="firstAreaorFocus" value="<c:out value="${jdetails.firstAreaorFocus }"/>">
                                                        </div>
                                                        
                                                    </div>
                                                </fieldset>

<fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-6">
                                                            <label>Training Topic</label>
                                                    	<select class="form-control" name="firstTrainingTopic">
                                                    	<option>${jdetails.firstTrainingTopic}</option>
                                                    	
                                                        	<option>HSE</option>
                                                        	<option>Quality</option>
				<option>Work Instruction</option>
                                                        	<option>On The Job (OJT)</option>
				<option>Management</option>
                                                        	<option>Personal Development</option>
				<option>Policy</option>
                                                        	<option>Regulatory</option>
				<option>Technical</option>
                                                    	</select>
                                                        </div>
                                                        <div class="col-xs-6">
                                                            <label for="exampleInputPassword1">Training Description</label>
                                                    		<textarea class="form-control" id="Comments" maxlength="60" rows="2" name="firstTrainingDescription" ><c:out value="${jdetails.firstTrainingDescription}"/></textarea>
                                                        </div>
                                                    </div>
                                                </fieldset>

                                                
                                                <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-6">
                                                            &nbsp;
                                                        </div>
                                                        <div class="col-xs-6">
                                                            <label>Date Due:</label>
                                                                <div>
                                                                    <div class="input-group">
                                                                        <input type="text" class="form-control" placeholder="mm/dd/yyyy" id="datepicker-autoclose" name="firstDateDue" value= "<c:out value="${jdetails.firstDateDue }"/>">
                                                                        <span class="input-group-addon bg-custom b-0"><i class="icon-calender"></i></span>                                                                    </div><!-- input-group -->
                                                                </div>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                                
                                                
                                                <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-12">
                                                            <label for="exampleInputPassword1">2. Area/Focus:</label>
                                                    		<input type="text" class="form-control" id="score" placeholder="Area/Focus" name="secondAreaorFocus" value="<c:out value="${jdetails.secondAreaorFocus }"/>">
                                                        </div>
                                                        
                                                    </div>
                                                </fieldset>

<fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-6">
                                                            <label>Training Topic</label>
                                                    	<select class="form-control" name="secondTrainingTopic">
                                                    	<option>${jdetails.secondTrainingTopic}</option>
                                                    	
                                                        	<option>HSE</option>
                                                        	<option>Quality</option>
				<option>Work Instruction</option>
                                                        	<option>On The Job (OJT)</option>
				<option>Management</option>
                                                        	<option>Personal Development</option>
				<option>Policy</option>
                                                        	<option>Regulatory</option>
				<option>Technical</option>
                                                    	</select>
                                                        </div>
                                                        <div class="col-xs-6">
                                                            <label for="exampleInputPassword1">Training Description</label>
                                                    		<textarea class="form-control" id="Comments" maxlength="60" rows="2" name="secondTrainingDescription" ><c:out value="${jdetails.secondTrainingDescription}"/></textarea>
                                                        </div>
                                                    </div>
                                                </fieldset>

                                                
                                                <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-6">
                                                            &nbsp;
                                                        </div>
                                                        <div class="col-xs-6">
                                                            <label>Date Due:</label>
                                                                <div>
                                                                    <div class="input-group">
                                                                        <input type="text" class="form-control" placeholder="mm/dd/yyyy" id="datepicker-autoclose" name="secondfDateDue" value="<c:out value="${jdetails.secondfDateDue }"/>">
                                                                        <span class="input-group-addon bg-custom b-0"><i class="icon-calender"></i></span>                                                                    </div><!-- input-group -->
                                                                </div>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                                
                                                
                                                <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-12">
                                                            <label for="exampleInputPassword1">3. Area/Focus:</label>
                                                    		<input type="text" class="form-control" id="score" placeholder="Area/Focus" name="thirdAreaorFocus" value="<c:out value="${jdetails.thirdAreaorFocus }"/>">
                                                        </div>
                                                        
                                                    </div>
                                                </fieldset>

<fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-6">
                                                            <label>Training Topic</label>
                                                    	<select class="form-control" name="thirdTrainingTopic">
                                                    	<option>${jdetails.thirdTrainingTopic}</option>
                                                        	<option>HSE</option>
                                                        	<option>Quality</option>
				<option>Work Instruction</option>
                                                        	<option>On The Job (OJT)</option>
				<option>Management</option>
                                                        	<option>Personal Development</option>
				<option>Policy</option>
                                                        	<option>Regulatory</option>
				<option>Technical</option>
                                                    	</select>
                                                        </div>
                                                        <div class="col-xs-6">
                                                            <label for="exampleInputPassword1">Training Description</label>
                                                    		<textarea class="form-control" id="Comments" maxlength="60" rows="2" name="thirdTrainingDescription"><c:out value="${jdetails.thirdTrainingDescription }"/></textarea>
                                                        </div>
                                                    </div>
                                                </fieldset>

                                                
                                                <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-6">
                                                            &nbsp;
                                                        </div>
                                                        <div class="col-xs-6">
                                                            <label>Date Due:</label>
                                                                <div>
                                                                    <div class="input-group">
                                                                        <input type="text" class="form-control" placeholder="mm/dd/yyyy" id="datepicker-autoclose" name="thirdDateDue" value="<c:out value="${jdetails.thirdDateDue }"/>">
                                                                        <span class="input-group-addon bg-custom b-0"><i class="icon-calender"></i></span>                                                                    </div><!-- input-group -->
                                                                </div>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                                
                                                
                                                
                                                
                                              <div class="form-group row col-sm-12 col-xs-12"><a href="acknowledgment-section.html" class="btn btn-secondary m-l-5">4 of 5</a>
                                  		</div>
                                  		</c:forEach>
                                  		</c:if>
                                  		<!-- -second page -->
                                  		  <c:if test="${empty trainingAndDevelopement}">
                               
                                  		 <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-12">
                                                            <label for="exampleInputPassword1">1. Area/Focus:</label>
                                                    		<input type="text" class="form-control" id="score" placeholder="Area/Focus" name="firstAreaorFocus">
                                                        </div>
                                                        
                                                    </div>
                                                </fieldset>

<fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-6">
                                                            <label>Training Topic</label>
                                                    	<select class="form-control" name="firstTrainingTopic">
                                                    	
                                                        	<option>HSE</option>
                                                        	<option>Quality</option>
				<option>Work Instruction</option>
                                                        	<option>On The Job (OJT)</option>
				<option>Management</option>
                                                        	<option>Personal Development</option>
				<option>Policy</option>
                                                        	<option>Regulatory</option>
				<option>Technical</option>
                                                    	</select>
                                                        </div>
                                                        <div class="col-xs-6">
                                                            <label for="exampleInputPassword1">Training Description</label>
                                                    		<textarea class="form-control" id="Comments" maxlength="60" rows="2" name="firstTrainingDescription"></textarea>
                                                        </div>
                                                    </div>
                                                </fieldset>

                                                
                                                <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-6">
                                                            &nbsp;
                                                        </div>
                                                        <div class="col-xs-6">
                                                            <label>Date Due:</label>
                                                                <div>
                                                                    <div class="input-group">
                                                                        <input type="text" class="form-control" placeholder="mm/dd/yyyy" id="datepicker-autoclose" name="firstDateDue">
                                                                        <span class="input-group-addon bg-custom b-0"><i class="icon-calender"></i></span>                                                                    </div><!-- input-group -->
                                                                </div>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                                
                                                
                                                <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-12">
                                                            <label for="exampleInputPassword1">2. Area/Focus:</label>
                                                    		<input type="text" class="form-control" id="score" placeholder="Area/Focus" name="secondAreaorFocus">
                                                        </div>
                                                        
                                                    </div>
                                                </fieldset>

<fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-6">
                                                            <label>Training Topic</label>
                                                    	<select class="form-control" name="secondTrainingTopic">
                                                        	<option>HSE</option>
                                                        	<option>Quality</option>
				<option>Work Instruction</option>
                                                        	<option>On The Job (OJT)</option>
				<option>Management</option>
                                                        	<option>Personal Development</option>
				<option>Policy</option>
                                                        	<option>Regulatory</option>
				<option>Technical</option>
                                                    	</select>
                                                        </div>
                                                        <div class="col-xs-6">
                                                            <label for="exampleInputPassword1">Training Description</label>
                                                    		<textarea class="form-control" id="Comments" maxlength="60" rows="2" name="secondTrainingDescription"></textarea>
                                                        </div>
                                                    </div>
                                                </fieldset>

                                                
                                                <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-6">
                                                            &nbsp;
                                                        </div>
                                                        <div class="col-xs-6">
                                                            <label>Date Due:</label>
                                                                <div>
                                                                    <div class="input-group">
                                                                        <input type="text" class="form-control" placeholder="mm/dd/yyyy" id="datepicker-autoclose" name="secondfDateDue">
                                                                        <span class="input-group-addon bg-custom b-0"><i class="icon-calender"></i></span>                                                                    </div><!-- input-group -->
                                                                </div>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                                
                                                
                                                <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-12">
                                                            <label for="exampleInputPassword1">3. Area/Focus:</label>
                                                    		<input type="text" class="form-control" id="score" placeholder="Area/Focus" name="thirdAreaorFocus">
                                                        </div>
                                                        
                                                    </div>
                                                </fieldset>

<fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-6">
                                                            <label>Training Topic</label>
                                                    	<select class="form-control" name="thirdTrainingTopic">
                                                        	<option>HSE</option>
                                                        	<option>Quality</option>
				<option>Work Instruction</option>
                                                        	<option>On The Job (OJT)</option>
				<option>Management</option>
                                                        	<option>Personal Development</option>
				<option>Policy</option>
                                                        	<option>Regulatory</option>
				<option>Technical</option>
                                                    	</select>
                                                        </div>
                                                        <div class="col-xs-6">
                                                            <label for="exampleInputPassword1">Training Description</label>
                                                    		<textarea class="form-control" id="Comments" maxlength="60" rows="2" name="thirdTrainingDescription"></textarea>
                                                        </div>
                                                    </div>
                                                </fieldset>

                                                
                                                <fieldset class="form-group">
                                                   <div class="row">
                                                        <div class="col-xs-6">
                                                            &nbsp;
                                                        </div>
                                                        <div class="col-xs-6">
                                                            <label>Date Due:</label>
                                                                <div>
                                                                    <div class="input-group">
                                                                        <input type="text" class="form-control" placeholder="mm/dd/yyyy" id="datepicker-autoclose" name="thirdDateDue">
                                                                        <span class="input-group-addon bg-custom b-0"><i class="icon-calender"></i></span>                                                                    </div><!-- input-group -->
                                                                </div>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                                
                                                
                                                
                                                
                                              <div class="form-group row col-sm-12 col-xs-12"><input type="submit" class="btn btn-secondary m-l-5" value="4 of 5">
                                  		</div>
                                  		</c:if>
                                            </form:form>
                        				</div><!-- end col -->

                        			</div><!-- end row -->
                        		</div>
                        	</div><!-- end col -->
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