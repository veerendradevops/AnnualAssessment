<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="com.lisi.annaulAssessment.util.Converters"%>

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
                                    <h4 class="page-title">Team Member Personal Information</h4>
                                    <div class="clearfix"></div>
                                </div>
							</div>
						</div>
                        <!-- end row -->
                        <div class="row">                        
                            <div class="col-xs-12">
                                <div class="card-box">
								<h4 class="header-title">Team Member Personal Information</h4>                                    
                                           
                                               <form:form id="CensusForm"
									name="CensusForm"
									action="/AnnaulAssessmenT/reviewOfPastYear.do" 
									method="GET" modelAttribute="exemptTeamMember">
                                           
                                                  
                                                 <c:if test="${!empty employeeDetails}">

										<c:forEach items="${employeeDetails}" var="empDetail">       
                                                        
                                                <div class="form-group row">                                                   
                                                    
                                                    <div class="col-sm-6">
                                                    <label>Name:</label>
                                                     <input type="text" id="pass1" maxlength="200" class="form-control" value=" <c:out value="${empDetail.emplastName}"/> <c:out value=", "/><c:out value="${empDetail.empfirstName}"/>" readonly/>
                                                    </div>
                                                    <div class="col-sm-6">
		                                            <label>Date of Review:</label>
                                                    <div class="input-group">
                                                    <input type="text" class="form-control" placeholder="mm/dd/yyyy" id="datepicker-autoclose" readonly>
                                                                        <span class="input-group-addon bg-custom b-0"><i class="icon-calender"></i></span>
                                                                    </div><!-- input-group -->
                                                    </div>
                                                    <div class="col-sm-12">
                                                    <label>Job Title:</label>
                                                    <input type="text" id="pass1" class="form-control" value=" <c:out value="${empDetail.jobTitle}" />" readonly/>
                                                    </div>
                                                    
                                                    <div class="col-sm-6">
                                                    <label>Date of Hire:</label>
                                                    <c:set var="date" value="${empDetail.DOH}" scope="request"></c:set>
													<%
														Date date = (Date) request.getAttribute("date");
																	String formatedDate = Converters.getDateInString(date);
																	System.out.println("formatedDate jsp" + formatedDate );
													%>
                                                    
                                                    <div class="input-group">
                                                    <input type="text" class="form-control" placeholder="mm/dd/yyyy" id="datepicker-autoclose" value="<%=formatedDate%>" readonly/>
                                                                        <span class="input-group-addon bg-custom b-0"><i class="icon-calender"></i></span>
                                                                    </div><!-- input-group -->
                                                    </div>
                                                    <div class="col-sm-6">
                                                    <label>Department:</label>
                                                    <input type="text" id="pass2" maxlength="200" class="form-control" readonly/>
                                                    </div>  
                                                    
                                                    <div class="col-sm-6">
                                                    <label>Factory/ Division:</label>
                                                    <input type="text" id="pass2" maxlength="200" class="form-control" readonly/>
                                                    
                                                    </div>
                                                    <div class="col-sm-6">
                                                    <label>Clock Number:</label>
                                                    <input type="text" class="form-control" value="<c:out value="${empDetail.empClockNumber}"/>" readonly>
                                                                        
                                                    </div> 
                                                     <div class="col-sm-6">
                                                    <label>Department Manager:</label>
                                                    <input type="text" id="pass2" maxlength="200" class="form-control" readonly value="${empDetail.hrManagerLastName}"/>
                                                    
                                                    </div>
                                                    <div class="col-sm-6">
                                                    <label>MoR (Manager-once-Removed):</label>
                                                    <input type="text" id="pass2" maxlength="200" class="form-control" value="<c:out value="${empDetail.mor}" />" readonly/>
                                                    </div> 
                                                        
                                                </div>
                                                
                                    <!--  <div class="form-group row col-sm-12 col-xs-12">
						<a href="review-of-2015-year.html" class="btn btn-secondary m-l-5">1 of 10</a>
          									
                                  		</div> -->
                                  		
                                  			<div class="form-group row col-sm-12 col-xs-12">
                                     <button type="submit" class="btn btn-primary  waves-light">1 of 3</button>
                                     
          									
                                  		</div>
                                  		
                                  		</c:forEach>
									</c:if>
                                  		
                                     <%-- <c:if test="${empty employeeDetails}">
                                  		
                                  		 <div class="form-group row">                                                   
                                                    
                                                    <div class="col-sm-6">
                                                    <label>Name:</label>
                                                    <input type="text" id="pass1" maxlength="200" class="form-control" value=" <c:out value="${empDetail.empfirstName}"/>" readonly/>
                                                    </div>
                                                    <div class="col-sm-6">
		                                            <label>Date of Review:</label>
                                                    <div class="input-group">
                                                    <input type="text" class="form-control" placeholder="mm/dd/yyyy" id="datepicker-autoclose" readonly>
                                                                        <span class="input-group-addon bg-custom b-0"><i class="icon-calender"></i></span>
                                                                    </div><!-- input-group -->
                                                    </div>
                                                    <div class="col-sm-12">
                                                    <label>Job Title:</label>
                                                    <input type="text" id="pass1" class="form-control" value=" <c:out value="${empDetail.jobTitle}" />" readonly/>
                                                    </div>
                                                    
                                                    <div class="col-sm-6">
                                                    <label>Date of Hire:</label>
                                                    <div class="input-group">
                                                    <input type="text" class="form-control" placeholder="mm/dd/yyyy" id="datepicker-autoclose" value="<c:out value="${empDetail.DOH}"/>" readonly>
                                                                        <span class="input-group-addon bg-custom b-0"><i class="icon-calender"></i></span>
                                                                    </div><!-- input-group -->
                                                    </div>
                                                    <div class="col-sm-6">
                                                    <label>Department:</label>
                                                    <input type="text" id="pass2" maxlength="200" class="form-control" readonly/>
                                                    </div>  
                                                    
                                                    <div class="col-sm-6">
                                                    <label>Factory/ Division:</label>
                                                    <input type="text" id="pass2" maxlength="200" class="form-control" readonly/>
                                                    
                                                    </div>
                                                    <div class="col-sm-6">
                                                    <label>Clock Number:</label>
                                                    <input type="text" class="form-control" value="<c:out value="${empDetail.empClockNumber}"/>" readonly>
                                                                        
                                                    </div> 
                                                     <div class="col-sm-6">
                                                    <label>Department Manager:</label>
                                                    <input type="text" id="pass2" maxlength="200" class="form-control" readonly/>
                                                    
                                                    </div>
                                                    <div class="col-sm-6">
                                                    <label>MoR (Manager-once-Removed):</label>
                                                    <input type="text" id="pass2" maxlength="200" class="form-control" value="<c:out value="${empDetail.mor}" />" readonly/>
                                                    </div> 
                                                        
                                                </div>
                                                
                                    <!--  <div class="form-group row col-sm-12 col-xs-12">
						<a href="review-of-2015-year.html" class="btn btn-secondary m-l-5">1 of 10</a>
          									
                                  		</div> -->
                                  		
                                  			<div class="form-group row col-sm-12 col-xs-12">
                                     <button type="submit" class="btn btn-primary  waves-light">1 of 10</button>
          									
                                  		</div>
                                  		
                                 
                                  		
									</c:if> --%>
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
