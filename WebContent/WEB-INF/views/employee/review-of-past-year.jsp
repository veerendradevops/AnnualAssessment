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
                                    <h4 class="page-title">Review of 2015 Year</h4>
                                    
                               
                                <div style="color:green" align="center">
                    							 <c:if test="${!empty successorerror}"> 
                    							 <c:out value="${successorerror}"></c:out>
                                                </c:if> 
                   								 </div>
                   								 
                                    
                                    <div class="clearfix"></div>
                                </div>
							</div>
						</div>
                        <!-- end row -->
                        <div class="row">                        
                            <div class="col-xs-12">
                                <div class="card-box">
                                    
                                            
                                            
                                            <form:form id="exemptTeamMemberDetails"
									name="exemptTeamMemberDetails"
									action="/AnnaulAssessmenT/saveReviewOfPastYearDetails.do"
									method="POST" modelAttribute="exemptTeamMember">
									<c:if test= "${!empty exemptTeamMemberDetails}">
												<c:forEach items="${ exemptTeamMemberDetails}" var="exemptTMDetails">
									
                                            
                                            
                                          
									<div class="form-group row">

										<div class="col-sm-12">
											<h4 class="header-title">A. Describe past year’s key
												events and assess your results/ achievement:</h4>
											<label>Include your contribution to business goals
												(Safety, Financial Results, Productivity, Improvements):</label>
												
												
												
												
											<textarea class="form-control" id="Comments" rows="2"
												name="Section1A" id="Section1A" > ${ exemptTMDetails.section1A}</textarea>
												
												
										</div>
									</div>
									<div class="form-group row">
										<div class="col-sm-12">
											<h4 class="header-title">B. List of training completed
												in 2015:</h4>
											<input type="text" class="form-control" maxlength="150" id="2"
												placeholder="1" name="Section1B1" id="Section1B1"  value=" <c:out value="${exemptTMDetails.section1B1}" />"/>
										</div>
										<div class="col-sm-7">&nbsp;</div>
										<div class="col-sm-5">
											<label>Effectiveness of training</label> <select
												class="form-control" id="exampleSelect1" name="EffectivenessOfB1" id="EffectivenessOfB1">
												<option value="${exemptTMDetails.section1B1}">${exemptTMDetails.effectivenessOfB1}</option>
												<option value="Very satisfactory">Very satisfactory</option>
												<option value="Quite satisfactory">Quite satisfactory</option>
												<option value="Partially satisfactory">Partially satisfactory</option>
												<option value="Unsatisfactory">Unsatisfactory</option>
											</select>
										</div>

										<div class="col-sm-12">
											<label>&nbsp;</label> <input type="text" class="form-control"
												maxlength="150" id="2" placeholder="2" name="Section1B2"
												id="Section1B2"  value=" <c:out value="${exemptTMDetails.section1B2}" />"/>
										</div>
										<div class="col-sm-7">&nbsp;</div>
										<div class="col-sm-5">
											<label>Effectiveness of training</label> <select
												class="form-control" id="exampleSelect1" name="EffectivenessOfB2" id="EffectivenessOfB2">
												<option value="${exemptTMDetails.section1B2}">${exemptTMDetails.effectivenessOfB2}</option>
												<option value="Very satisfactory">Very satisfactory</option>
												<option value="Quite satisfactory">Quite satisfactory</option>
												<option value="Partially satisfactory">Partially satisfactory</option>
												<option value="Unsatisfactory">Unsatisfactory</option>
											</select>
										</div>

										<div class="col-sm-12">
											<label>&nbsp;</label> <input type="text" class="form-control"
												maxlength="150" id="2" placeholder="3" name="Section1B3"
												id="Section1B3"  value=" <c:out value="${exemptTMDetails.section1B3}" />"/>
										</div>
										<div class="col-sm-7">&nbsp;</div>
										<div class="col-sm-5">
											<label>Effectiveness of training</label> <select
												class="form-control" id="exampleSelect1" name="EffectivenessOfB3" id="EffectivenessOfB3">
												<option value="${exemptTMDetails.section1B3}">${exemptTMDetails.effectivenessOfB3}</option>
												<option value="Very satisfactory">Very satisfactory</option>
												<option value="Quite satisfactory">Quite satisfactory</option>
												<option value="Partially satisfactory">Partially satisfactory</option>
												<option value="Unsatisfactory">Unsatisfactory</option>
											</select>
										</div>

										<div class="col-sm-12">
											<label>&nbsp;</label> <input type="text" class="form-control"
												maxlength="150" id="2" placeholder="4" name="Section1B4"
												id="Section1B4"  value=" <c:out value="${exemptTMDetails.section1B4}" />"/>
										</div>
										<div class="col-sm-7">&nbsp;</div>
										<div class="col-sm-5">
											<label>Effectiveness of training</label> <select
												class="form-control" id="exampleSelect1" name="EffectivenessOfB4" id="EffectivenessOfB4">
												<option value="${exemptTMDetails.section1B4}">${exemptTMDetails.effectivenessOfB4}</option>
												<option value="Very satisfactory">Very satisfactory</option>
												<option value="Quite satisfactory">Quite satisfactory</option>
												<option value="Partially satisfactory">Partially satisfactory</option>
												<option value="Unsatisfactory">Unsatisfactory</option>
												
												<c:if test="${!empty exemptTeamMemberDetails}"> 
												 <c:forEach items="${exemptTeamMemberDetails}" var="exemptTeamMemberDetails">
												   <option value="<c:out value="${exemptTeamMemberDetails.effectivenessOfB4}"/>">
												   <c:out value="${internalClaimNumber.effectivenessOfB4}"/></option>
												 </c:forEach>
							 					</c:if>
												
												
											</select>
										</div>
									</div>
									<h4 class="header-title">C. Improvements, suggestions, or
										comments on training:</h4>
									<div class="form-group row">
										<div class="col-sm-12">
											<textarea class="form-control" id="Comments" rows="2"
												name="Section1C" id="Section1C"> ${ exemptTMDetails.section1C}</textarea>
										</div>
									</div>

									<h4 class="header-title">D. TEAM MEMBER'S DEVELOPMENT
										RESULTS AND OBJECTIVES</h4>
									<div class="form-group row">
										<div class="col-sm-12">
											<label>2015 Personal and Professional Development
												Achieved</label>
											<textarea class="form-control" id="Comments" rows="2"
												name="Section1D1" id="Section1D1">${ exemptTMDetails.section1D1}</textarea>
										</div>
									</div>

									<div class="form-group row">
										<div class="col-sm-12">
											<label>2016 Development Objectives (List any other
												development goals you have set yourself in 2015)</label>
											<textarea class="form-control" id="Comments" rows="2"
												name="Section1D2" id="Section1D2">${ exemptTMDetails.section1D2}</textarea>
										</div>
									</div>

									<h4 class="header-title">F. Career Mobility</h4>

									<div class="form-group row">
										<div class="col-sm-12">
											<p>I am interested in exploring different career
												opportunities in a different functional area within the
												company?</p>
											<div class="col-sm-3 radio-inline">
												<input type="radio" name="section1F1" id="Section1F1"
													value="yes" ${exemptTMDetails.section1F1=='yes'?'checked':''}/>yes
													
													
													
											</div>
											<div class="col-sm-3 radio-inline">
												<input type="radio" name="section1F1" id="Section1F1"
													value="no" ${exemptTMDetails.section1F1=='no'?'checked':''}/>no
											</div>
											<p>a. If NO, continue with question number three.</p>
										</div>
										<div class="col-sm-6">
											<label>b. If YES, What Job Function?</label> <input
												type="text" class="form-control" maxlength="150"
												name="section1F2ONE" id="Section1F2ONE" value=" <c:out value="${exemptTMDetails.section1F2ONE}" />"/>
										</div>
										<div class="col-sm-6">
											<label>And/or US Facility?</label> <input type="text"
												class="form-control" maxlength="150" name="Section1F2TWO"
												id="Section1F2TWO"  value=" <c:out value="${exemptTMDetails.section1F2TWO}" />"/>
										</div>




										<div class="col-sm-12">
											<label></label>
											<p>I am interested in an International Assignments and/or
												mobility?</p>
											<div class="col-sm-2 radio-inline">
												<%-- <input type="radio" name="Section1F3A" id="Section1F3A"
													value="Yes" ${exemptTMDetails.section1F3A=='yes'?'checked':''}/>yes --%>
													
													<input type="radio" id="section1F3A" name="section1F3A" value="yes" 
												${exemptTMDetails.section1F3A=='yes'?'checked':''}/>yes
													
													
											</div>
											<div class="col-sm-2 radio-inline">
												<%-- <input type="radio" name="Section1F3A" id="Section1F3A"
													value="No" ${exemptTMDetails.section1F3A=='No'?'checked':''}/>No --%>
													
														<label><input type="radio" id="section1F3A" name="section1F3A" value="no" 
												${exemptTMDetails.section1F3A=='no'?'checked':''}/>no</label>
												
											</div>
											<p>a. If NO, continue to next page.</p>
										</div>
									</div>

									<p>If YES, what region would you consider exploring as an
										International Assignment?</p>
									<div class="row">
										<div class="col-sm-2">
											<input type="radio" name="section1F3B" id="section1F3B"
												value="Canada" ${exemptTMDetails.section1F3B=='Canada'?'checked':''}/>Canada
										</div>
										<div class="col-sm-2">
											<input type="radio" name="section1F3B" id="section1F3B"
												value="USA" ${exemptTMDetails.section1F3B=='USA'?'checked':''}/>USA
												
										</div>

										<div class="col-sm-2">
											<input type="radio" name="section1F3B" id="section1F3B"
													value="France" ${exemptTMDetails.section1F3B=='France'?'checked':''}/>France
										</div>
										<div class="col-sm-2">
											<input type="radio" name="section1F3B" id="section1F3B"
											value="UK" ${exemptTMDetails.section1F3B=='UK'?'checked':''}/>UK
										</div>

										<div class="col-sm-2">
											<input type="radio" name="section1F3B" id="section1F3B"
												value="Turkey" ${exemptTMDetails.section1F3B=='Turkey'?'checked':''}/>Turkey
												
										</div>
										<div class="col-sm-2">
											<input type="radio" name="section1F3B" id="section1F3B"
												
												value="India" ${exemptTMDetails.section1F3B=='India'?'checked':''}/>India
										</div>

										<div class="col-sm-2">
											<input type="radio" name="section1F3B" id="section1F3B"
												
												value="Morocco" ${exemptTMDetails.section1F3B=='Morocco'?'checked':''}/>Morocco
												
										</div>
										<div class="col-sm-1">
											<label>Other:</label>
										</div>
										<div class="col-sm-2">
											<input type="text" class="form-control">
										</div>

									</div>

									<p>(i) What length of assignment would you consider?</p>
									<div class="row">
										<div class="col-sm-3">
											<input type="radio" name="section1F3B1" id="section1F3B1"
												value="1 year or less" ${exemptTMDetails.section1F3B1=='1yearorless'?'checked':''}/>1 year or less 
												
										</div>
										<div class="col-sm-2">
											<input type="radio" name="section1F3B1" id="section1F3B1"
												value="1 to 2 years" ${exemptTMDetails.section1F3B1==' 1 to 2 years'?'checked':''}/>1 to 2 years 
										</div>
										<div class="col-sm-3">
											<input type="radio" name="section1F3B1" id="section1F3B1"
												value="More than 2 years" ${exemptTMDetails.section1F3B1 =='More than 2 years'?'checked':''}/>More than 2 years
										</div>
									</div>

									<p>(ii) I am currently unable to consider any relocation or
										mobility in the next 12 months?</p>
									<div class="row">
										<div class="col-sm-2">
										
										<label><input type="radio" id="section1F3B2" name="section1F3B2" value="yes" 
												${exemptTMDetails.section1F3B2=='yes'?'checked':''}/>yes
												</label>
										
											<!-- <input type="radio" name="Section1F3B2" id="Section1F3B2"
												value="yes"> Yes -->
										</div>
										<div class="col-sm-1">
											<%-- <input type="radio" name="Section1F3B2" id="Section1F3B2"
												value="No" value=" <c:out value="${exemptTMDetails.section1F3B2}" check />"> No --%>
												
												<label><input type="radio" id="section1F3B2" name="section1F3B2" value="no" 
												${exemptTMDetails.section1F3B2=='no'?'checked':''}/> no</label>
												
												
                                  
                                  </div>
                                  </div>
                                  
                                  
                                   <p></p>     
                                              
                                                
                                             <!--    <div class="form-group row col-sm-12 col-xs-12">
          									 <a href="/AnnaulAssessmenT/SkillsSelfAssessment.do"  class="btn btn-secondary m-l-5">2 of 10</a> 
          									 
          									 
          									 
          									<input type="submit" value="Submit" class="btn btn-secondary m-l-5">2 of 10</a>
                                  		</div> -->
                                  		
                                  		<div class="form-group row col-sm-12 col-xs-12">
                                     <button type="submit" class="btn btn-primary  waves-light">2 of 10</button>
          									
                                  		</div>
                                  		
                                  		
                                  		
                                  		</c:forEach>
									</c:if>
									<c:if test= "${empty exemptTeamMemberDetails}">
									<div class="form-group row">

										<div class="col-sm-12">
											<h4 class="header-title">A. Describe past year’s key
												events and assess your results/ achievement:</h4>
											<label>Include your contribution to business goals
												(Safety, Financial Results, Productivity, Improvements):</label>
												
												
												
												
											<textarea class="form-control" id="Comments" rows="2"
												name="section1A" id="section1A" > ${exemptTMDetails.section1A}</textarea>
												
												
										</div>
									</div>
									<div class="form-group row">
										<div class="col-sm-12">
											<h4 class="header-title">B. List of training completed
												in 2015:</h4>
											<input type="text" class="form-control" maxlength="150" id="2"
												placeholder="1" name="section1B1" id="section1B1">
										</div>
										<div class="col-sm-7">&nbsp;</div>
										<div class="col-sm-5">
											<label>Effectiveness of training</label> <select
												class="form-control" id="exampleSelect1" name="effectivenessOfB1" id="EffectivenessOfB1">
												<option value="Very satisfactory">Very satisfactory</option>
												<option value="Quite satisfactory">Quite satisfactory</option>
												<option value="Partially satisfactory">Partially satisfactory</option>
												<option value="Unsatisfactory">Unsatisfactory</option>
											</select>
										</div>

										<div class="col-sm-12">
											<label>&nbsp;</label> <input type="text" class="form-control"
												maxlength="150" id="2" placeholder="2" name="section1B2"
												id="Section1B2">
										</div>
										<div class="col-sm-7">&nbsp;</div>
										<div class="col-sm-5">
											<label>Effectiveness of training</label> <select
												class="form-control" id="exampleSelect1" name="effectivenessOfB2" id="EffectivenessOfB2">
												<option value="Very satisfactory">Very satisfactory</option>
												<option value="Quite satisfactory">Quite satisfactory</option>
												<option value="Partially satisfactory">Partially satisfactory</option>
												<option value="Unsatisfactory">Unsatisfactory</option>
											</select>
										</div>

										<div class="col-sm-12">
											<label>&nbsp;</label> <input type="text" class="form-control"
												maxlength="150" id="2" placeholder="3" name="section1B3"
												id="Section1B3">
										</div>
										<div class="col-sm-7">&nbsp;</div>
										<div class="col-sm-5">
											<label>Effectiveness of training</label> <select
												class="form-control" id="exampleSelect1" name="effectivenessOfB3" id="EffectivenessOfB3">
												<option value="Very satisfactory">Very satisfactory</option>
												<option value="Quite satisfactory">Quite satisfactory</option>
												<option value="Partially satisfactory">Partially satisfactory</option>
												<option value="Unsatisfactory">Unsatisfactory</option>
											</select>
										</div>

										<div class="col-sm-12">
											<label>&nbsp;</label> <input type="text" class="form-control"
												maxlength="150" id="2" placeholder="4" name="Section1B4"
												id="Section1B4">
										</div>
										<div class="col-sm-7">&nbsp;</div>
										<div class="col-sm-5">
											<label>Effectiveness of training</label> <select
												class="form-control" id="exampleSelect1" name="effectivenessOfB4" id="EffectivenessOfB4">
												<option value="Very satisfactory">Very satisfactory</option>
												<option value="Quite satisfactory">Quite satisfactory</option>
												<option value="Partially satisfactory">Partially satisfactory</option>
												<option value="Unsatisfactory">Unsatisfactory</option>
											</select>
										</div>
									</div>
									<h4 class="header-title">C. Improvements, suggestions, or
										comments on training:</h4>
									<div class="form-group row">
										<div class="col-sm-12">
											<textarea class="form-control" id="Comments" rows="2"
												name="section1C" id="section1C"></textarea>
										</div>
									</div>

									<h4 class="header-title">D. TEAM MEMBER'S DEVELOPMENT
										RESULTS AND OBJECTIVES</h4>
									<div class="form-group row">
										<div class="col-sm-12">
											<label>2015 Personal and Professional Development
												Achieved</label>
											<textarea class="form-control" id="Comments" rows="2"
												name="section1D1" id="section1D1"></textarea>
										</div>
									</div>

									<div class="form-group row">
										<div class="col-sm-12">
											<label>2016 Development Objectives (List any other
												development goals you have set yourself in 2015)</label>
											<textarea class="form-control" id="Comments" rows="2"
												name="section1D2" id="section1D2"></textarea>
										</div>
									</div>

									<h4 class="header-title">F. Career Mobility</h4>

									<div class="form-group row">
										<div class="col-sm-12">
											<p>I am interested in exploring different career
												opportunities in a different functional area within the
												company?</p>
											<div class="col-sm-3 radio-inline">
												<input type="radio" name="Section1F1" id="Section1F1"
													value="yes">yes
											</div>
											<div class="col-sm-3 radio-inline">
												<input type="radio" name="section1F1" id="section1F1"
													value="no">no
											</div>
											<p>a. If NO, continue with question number three.</p>
										</div>
										<div class="col-sm-6">
											<label>b. If YES, What Job Function?</label> <input
												type="text" class="form-control" maxlength="150"
												name="section1F2ONE" id="Section1F2ONE">
										</div>
										<div class="col-sm-6">
											<label>And/or US Facility?</label> <input type="text"
												class="form-control" maxlength="150" name="section1F2TWO"
												id="Section1F2TWO">
										</div>




										<div class="col-sm-12">
											<label></label>
											<p>I am interested in an International Assignments and/or
												mobility?</p>
											<div class="col-sm-2 radio-inline">
												<input type="radio" name="section1F3A" id="Section1F3A"
													value="yes">yes
											</div>
											<div class="col-sm-2 radio-inline">
												<input type="radio" name="section1F3A" id="Section1F3A"
													value="no">no
											</div>
											<p>a. If NO, continue to next page.</p>
										</div>
									</div>

									<p>If YES, what region would you consider exploring as an
										International Assignment?</p>
									<div class="row">
										<div class="col-sm-2">
											<input type="radio" name="Section1F3B" id="Section1F3B"
												value="Canada"> Canada
										</div>
										<div class="col-sm-2">
											<input type="radio" name="Section1F3B" id="Section1F3B"
												value="USA"> USA
										</div>

										<div class="col-sm-2">
											<input type="radio" name="Section1F3B" id="Section1F3B"
												value="France"> France
										</div>
										<div class="col-sm-2">
											<input type="radio" name="Section1F3B" id="Section1F3B"
												value="UK"> UK
										</div>

										<div class="col-sm-2">
											<input type="radio" name="Section1F3B" id="Section1F3B"
												value="Turkey"> Turkey
										</div>
										<div class="col-sm-2">
											<input type="radio" name="Section1F3B" id="Section1F3B"
												value="India"> India
										</div>

										<div class="col-sm-2">
											<input type="radio" name="Section1F3B" id="Section1F3B"
												value="Morocco"> Morocco
										</div>
										<div class="col-sm-1">
											<label>Other:</label>
										</div>
										<div class="col-sm-2">
											<input type="text" class="form-control">
										</div>

									</div>

									<p>(i) What length of assignment would you consider?</p>
									<div class="row">
										<div class="col-sm-3">
											<input type="radio" name="Section1F3B1" id="Section1F3B1"
												value=" 1 year or less"> 1 year or less
										</div>
										<div class="col-sm-2">
											<input type="radio" name="Section1F3B1" id="Section1F3B1"
												value=" 1 to 2 years"> 1 to 2 years
										</div>
										<div class="col-sm-3">
											<input type="radio" name="Section1F3B1" id="Section1F3B1"
												value="More than 2 years"> More than 2 years
										</div>
									</div>

									<p>(ii) I am currently unable to consider any relocation or
										mobility in the next 12 months?</p>
									<div class="row">
										<div class="col-sm-2">
											<input type="radio" name="Section1F3B2" id="Section1F3B2"
												value="yes">yes
										</div>
										<div class="col-sm-1">
											<input type="radio" name="Section1F3B2" id="Section1F3B2"
												value="no" >no
										</div>
									</div>
									<p></p>
									
									
									
									
									<!-- <div class="form-group row col-sm-12 col-xs-12">
          									<a href="/AnnaulAssessmenT/SkillsSelfAssessment.do" class="btn btn-secondary m-l-5">2 of 10</a>
          									 -->
          									<div class="form-group row col-sm-12 col-xs-12">
                                     <button type="submit" class="btn btn-primary  waves-light">2 of 10</button>
          									
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
</html>

