<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.lisi.annaulAssessment.util.Converters"%>


<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white" onload="verifyChecked()">


	<!-- BEGIN CONTENT -->
	<div class="page-content-wrapper">
		<!-- BEGIN CONTENT BODY -->
		<div class="page-content">
			<!-- BEGIN PAGE HEADER-->
<p></p><p></p><p></p>
			<!-- BEGIN PAGE BAR -->
			<div class="page-bar">
				<ul class="page-breadcrumb">
					<li><a href="index.html">Home</a> <i class="fa fa-circle"></i>
					</li>
					<li><span>Review of <%=
						Converters.getCurrentYear()
					%>
							Year
					</span></li>
				</ul>
			</div>
			<!-- END PAGE BAR -->
			<!-- BEGIN PAGE TITLE-->
			<h3 class="page-title">
				Review of
				<%=
				Converters.getCurrentYear()
			%>
				Year
			</h3>
			<!-- END PAGE TITLE-->
			<!-- END PAGE HEADER-->



			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN VALIDATION STATES-->
					<div class="portlet light portlet-fit portlet-form bordered">

						<div class="portlet-body">
							<!-- BEGIN FORM-->

							<form:form id="form_sample_3" class="form-horizontal"
								name="exemptTeamMemberDetails"
								action="/AnnaulAssessmenT/saveReviewOfPastYearDetails.do"
								method="POST" modelAttribute="exemptTeamMember">
								<c:if test="${!empty exemptTMDetails}">
								 <%-- 	<c:forEach items="${ exemptTeamMemberDetails}" --%> 
									<!-- 	var="exemptTMDetails"> -->
										<div class="form-body">
											<h4>A. Describe past year's key events and assess your
												results/achievement:</h4>
											<p>Include your contribution to business goals (Safety,
												Financial Results, Productivity, Improvements):</p>
											<div class="form-group">
												<div class="col-md-12">
													<textarea class="form-control" id="Comments" 
														maxlength="300" title="Maximum length allowed is 300 characters" name="Section1A" id="Section1A"  style="font-family: calibri; font-size: 12pt;">${ exemptTMDetails.section1A}</textarea>
												</div>
											</div>

											<h4>B. List of training completed in
													<%
													out.write(Converters.getCurrentYear());
													%>
													:</h4>
											<div class="form-group">
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
											<td width="3%"><label class="control-label">1</label></td>
											<td><textarea class="form-control" title="Maximum length allowed is 300 characters" name="section1B1"
														id="Section1B1" maxlength="300" rows="3" cols="100" style="font-family: calibri; font-size: 12pt;">${exemptTMDetails.section1B1}</textarea></td>
											<td>&nbsp;&nbsp;</td></tr>
											</table>
											<br/>
												<%-- <label class="control-label col-md-1">1</label>
												<div class="col-md-11">
													<textarea class="form-control" title="Maximum length allowed is 300 characters" name="section1B1"
														id="Section1B1" maxlength="300" rows="3" cols="100">${exemptTMDetails.section1B1}</textarea>
												</div> --%>
											</div>

											<div class="form-group">
												<div class="col-md-5">&nbsp;</div>
									   			<label class="control-label col-md-3">Effectiveness
													of training</label>
												<div class="col-md-4">
													<select class="form-control" id="exampleSelect1"
														name="effectivenessOfB1" id="EffectivenessOfB1">
														 <option value="" ${exemptTMDetails.effectivenessOfB1==''?'selected':''}>Pick a value</option>
													<option value="Very satisfactory" ${exemptTMDetails.effectivenessOfB1=='Very satisfactory'?'selected':''}>Very satisfactory</option>
													<option value="Quite satisfactory" ${exemptTMDetails.effectivenessOfB1=='Quite satisfactory'?'selected':''}>Quite satisfactory</option>
													<option value="Partially satisfactory" ${exemptTMDetails.effectivenessOfB1=='Partially satisfactory'?'selected':''}>Partially satisfactory</option>
													<option value="Unsatisfactory" ${exemptTMDetails.effectivenessOfB1=='Unsatisfactory'?'selected':''}>Unsatisfactory</option> 
														
														
														<%-- <option value="${exemptTMDetails.effectivenessOfB1}">${exemptTMDetails.effectivenessOfB1}</option>
														<option>Very satisfactory</option>
														<option>Quite satisfactory</option>
														<option>Partially satisfactory</option>
														<option>Unsatisfactory</option> --%>
													</select>
												</div>

											</div>

											<div class="form-group">
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
											<td width="3%"><label class="control-label">2</label></td>
											<td><textarea class="form-control" title="Maximum length allowed is 300 characters" name="section1B2"
														id="section1B2" maxlength="300" rows="3" cols="100" style="font-family: calibri; font-size: 12pt;">${exemptTMDetails.section1B2}</textarea></td>
											<td>&nbsp;&nbsp;</td></tr>
											</table>
											<br/>
												<%-- <label class="control-label col-md-1">2</label>
												<div class="col-md-11">
													<textarea class="form-control" title="Maximum length allowed is 300 characters" name="section1B2" 
														id="Section1B2" maxlength="300" rows="3" cols="100">${exemptTMDetails.section1B2}</textarea>
												</div> --%>
											</div>

											<div class="form-group">
												<div class="col-md-5">&nbsp;</div>
												<label class="control-label col-md-3">Effectiveness
													of training</label>
												<div class="col-md-4">
													<select class="form-control" id="exampleSelect1"
														name="effectivenessOfB2" id="EffectivenessOfB2">
														
														<option value="" ${exemptTMDetails.effectivenessOfB2==''?'selected':''}>Pick a value</option>
													<option value="Very satisfactory" ${exemptTMDetails.effectivenessOfB2=='Very satisfactory'?'selected':''}>Very satisfactory</option>
													<option value="Quite satisfactory" ${exemptTMDetails.effectivenessOfB2=='Quite satisfactory'?'selected':''}>Quite satisfactory</option>
													<option value="Partially satisfactory" ${exemptTMDetails.effectivenessOfB2=='Partially satisfactory'?'selected':''}>Partially satisfactory</option>
													<option value="Unsatisfactory" ${exemptTMDetails.effectivenessOfB2=='Unsatisfactory'?'selected':''}>Unsatisfactory</option> 
														
														<%-- <option value="${exemptTMDetails.effectivenessOfB2}">${exemptTMDetails.effectivenessOfB2}</option>
														<option>Very satisfactory</option>
														<option>Quite satisfactory</option>
														<option>Partially satisfactory</option>
														<option>Unsatisfactory</option> --%>
													</select>
												</div>

											</div>


											<div class="form-group">
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
											<td width="3%"><label class="control-label">3</label></td>
											<td><textarea class="form-control" title="Maximum length allowed is 300 characters" name="section1B3"
														id="section1B3" maxlength="300" rows="3" cols="100" style="font-family: calibri; font-size: 12pt;">${exemptTMDetails.section1B3}</textarea></td>
											<td>&nbsp;&nbsp;</td></tr>
											</table>
											<br/>
												<%-- <label class="control-label col-md-1">3</label>
												<div class="col-md-11">
													<textarea class="form-control" title="Maximum length allowed is 300 characters" id="Comments" maxlength="300" rows="3" cols="100"
														name="section1B3" id="Section1B3">"${exemptTMDetails.section1B3}"</textarea>
												</div> --%>
											</div>

											<div class="form-group">
												<div class="col-md-5">&nbsp;</div>
												<label class="control-label col-md-3">Effectiveness
													of training</label>
												<div class="col-md-4">
													<select class="form-control" id="exampleSelect1"
														name="effectivenessOfB3" id="EffectivenessOfB3">
														<option value="" ${exemptTMDetails.effectivenessOfB3==''?'selected':''}>Pick a value</option>
													<option value="Very satisfactory" ${exemptTMDetails.effectivenessOfB3=='Very satisfactory'?'selected':''}>Very satisfactory</option>
													<option value="Quite satisfactory" ${exemptTMDetails.effectivenessOfB3=='Quite satisfactory'?'selected':''}>Quite satisfactory</option>
													<option value="Partially satisfactory" ${exemptTMDetails.effectivenessOfB3=='Partially satisfactory'?'selected':''}>Partially satisfactory</option>
													<option value="Unsatisfactory" ${exemptTMDetails.effectivenessOfB3=='Unsatisfactory'?'selected':''}>Unsatisfactory</option>
													
														<%-- <option value="${exemptTMDetails.effectivenessOfB3}">${exemptTMDetails.effectivenessOfB3}</option>
														<option>Very satisfactory</option>
														<option>Quite satisfactory</option>
														<option>Partially satisfactory</option>
														<option>Unsatisfactory</option> --%>
													</select>
												</div>

											</div>


											<div class="form-group">
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
											<td width="3%"><label class="control-label">4</label></td>
											<td><textarea class="form-control" title="Maximum length allowed is 300 characters" name="section1B4"
														id="section1B4" maxlength="300" rows="3" cols="100" style="font-family: calibri; font-size: 12pt;">${exemptTMDetails.section1B4}</textarea></td>
											<td>&nbsp;&nbsp;</td></tr>
											</table>
											<br/>
												<%-- <label class="control-label col-md-1">4</label>
												<div class="col-md-11">
													<textarea class="form-control" title="Maximum length allowed is 300 characters" id="Comments" maxlength="300" rows="3" cols="100"
														name="section1B4" id="Section1B4">"${exemptTMDetails.section1B4}"</textarea>
												</div> --%>
											</div>

											<div class="form-group">
												<div class="col-md-5">&nbsp;</div>
												<label class="control-label col-md-3">Effectiveness
													of training</label>
												<div class="col-md-4">
													<select class="form-control" id="exampleSelect1"
														name="effectivenessOfB4" id="EffectivenessOfB4">
														<option value="" ${exemptTMDetails.effectivenessOfB4==''?'selected':''}>Pick a value</option>
													<option value="Very satisfactory" ${exemptTMDetails.effectivenessOfB4=='Very satisfactory'?'selected':''}>Very satisfactory</option>
													<option value="Quite satisfactory" ${exemptTMDetails.effectivenessOfB4=='Quite satisfactory'?'selected':''}>Quite satisfactory</option>
													<option value="Partially satisfactory" ${exemptTMDetails.effectivenessOfB4=='Partially satisfactory'?'selected':''}>Partially satisfactory</option>
													<option value="Unsatisfactory" ${exemptTMDetails.effectivenessOfB4=='Unsatisfactory'?'selected':''}>Unsatisfactory</option>
														
														<%-- <option value="${exemptTMDetails.effectivenessOfB4}">${exemptTMDetails.effectivenessOfB4}</option>
														<option>Very satisfactory</option>
														<option>Quite satisfactory</option>
														<option>Partially satisfactory</option>
														<option>Unsatisfactory</option> --%>
													</select>
												</div>

											</div>
											<h4>C. Improvements, suggestions, or comments on
												training :</h4>
											<div class="form-group">
											
												<div class="col-md-12">
													<textarea class="form-control" title="Maximum length allowed is 300 characters" id="Comments" maxlength="300" 
														 name="section1C" id="Section1C" style="font-family: calibri; font-size: 12pt;">${ exemptTMDetails.section1C}</textarea>
												</div>
											</div>
											<h4>D. TEAM MEMBER'S DEVELOPMENT RESULTS AND OBJECTIVES :</h4>
											<p><%
												out.write(Converters.getCurrentYear());
												%> Personal and Professional Development Achieved</p>
											<div class="form-group">
												<div class="col-md-12">
												<textarea class="form-control" title="Maximum length allowed is 300 characters" id="Comments" maxlength="300" 
												name="Section1D1" id="Section1D1" style="font-family: calibri; font-size: 12pt;">${ exemptTMDetails.section1D1}</textarea>
												</div>
											</div>
											<p>2017 Development Objectives (List any other
												development goals you have set yourself in <%
												out.write(Converters.getCurrentYear());
												%>)</p>
											<div class="form-group">
												<div class="col-md-12">
												   <textarea class="form-control" title="Maximum length allowed is 300 characters" id="Comments" maxlength="300" 
												name="Section1D2" id="Section1D2" style="font-family: calibri; font-size: 12pt;">${exemptTMDetails.section1D2}</textarea>
												</div>
											</div>
											
											
											
											
												<h4>E. Career Mobility :</h4>
											<p>I am interested in exploring different career
												opportunities in a different functional area within the
												company</p>
											<div class="form-group">
												<div class="col-sm-1">
													<label><input type="radio" name="section1F1" id="Section1F1"  maxlength="50"
													value="yes" ${exemptTMDetails.section1F1=='yes'?'checked':''} onclick="onRadioCheck('mobilityDiv','noMobilityDiv')"/>Yes</label>
												</div>
												<div class="col-sm-1">
												<label>	<input type="radio" name="section1F1" id="Section1F1" maxlength="50"
													value="no" ${exemptTMDetails.section1F1=='no'?'checked':''} onclick="onRadioCheck('noMobilityDiv','mobilityDiv')"/>No</label>
												</div>
											</div>
											<div id="noMobilityDiv" style="display: none; ">
											<p>a. If NO, continue with question number two.</p>
											</div>
											<div id="mobilityDiv" style="display: none; ">
												<div class="form-group">
													<label class="control-label col-md-2"><p>b. If YES,
														What Job Function?</p></label>
													<div class="col-md-4">
														<input
													type="text" class="form-control" title="Maximum length allowed is 50 characters" maxlength="50"
													name="section1F2ONE" id="Section1F2ONE" style="font-family: calibri; font-size: 12pt;"value="<c:out value="${exemptTMDetails.section1F2ONE}"/>"/>
													</div>
	
													<label class="control-label col-md-2"><p>And/or US
														Facility?</p></label>
													<div class="col-md-4">
														<input type="text"
													class="form-control" maxlength="50" name="Section1F2TWO"
													id="Section1F2TWO" style="font-family: calibri; font-size: 12pt;" value=" <c:out value="${exemptTMDetails.section1F2TWO}" />"/>
													</div>
												</div>
											</div>


											<p>2. I am interested in an International Assignments and/or
												mobility </p>
											<div class="form-group">
												<div class="col-sm-1">
													
														<label><input type="radio" class="control-label" id="section1F3A" name="section1F3A" value="yes" value="yes"${exemptTMDetails.section1F3A=='yes'?'checked':''} onclick="onRadioCheck('relocationDiv','noRelocationDiv')"/>Yes</label>
												</div>
												<div class="col-sm-1">
											<label><input type="radio" class="control-label" id="section1F3A" name="section1F3A" value="no" ${exemptTMDetails.section1F3A=='no'?'checked':''} onclick="onRadioCheck('noRelocationDiv','relocationDiv')"/>No</label>
												</div>
											</div>
											<div id="noRelocationDiv" style="display: none; ">
											<p>a. If NO, continue to next page.</p>
											</div>
											<div id="relocationDiv" style="display: none; ">
											<p>If YES, what region would you consider exploring as an
												International ?</p>
											<div class="form-group">
												<div class="col-sm-2">
													<input type="checkbox" name="section1F3B" class="control-label" id="section1F3B"
												value="Canada" ${exemptTMDetails.countryOne=='Canada'?'checked':''}/>Canada
												</div>
												<div class="col-sm-2">
													<input type="checkbox" class="control-label" name="section1F3B" id="section1F3B"
												value="USA" ${exemptTMDetails.countryTwo=='USA'?'checked':''}/>USA
												</div>
												<div class="col-sm-2">
													<input type="checkbox" class="control-label" name="section1F3B" id="section1F3B"
													value="France" ${exemptTMDetails.countryThree=='France'?'checked':''}/>France
												</div>
												<div class="col-sm-2">
													<input type="checkbox" class="control-label" name="section1F3B" id="section1F3B"
											value="UK" ${exemptTMDetails.countryFour=='UK'?'checked':''}/>UK
												</div>
												<div class="col-sm-2">
													<input type="checkbox" class="control-label" name="section1F3B" id="section1F3B"
												value="Turkey" ${exemptTMDetails.countryFive=='Turkey'?'checked':''}/>Turkey
												</div>
												<div class="col-sm-2">
													<input type="checkbox" class="control-label" name="section1F3B" id="section1F3B"												
												value="India" ${exemptTMDetails.countrySix=='India'?'checked':''}/>India
												</div>
												<div class="col-sm-2">
													<input type="checkbox" class="control-label" name="section1F3B" id="section1F3B"												
												value="Morocco" ${exemptTMDetails.countrySeven=='Morocco'?'checked':''}/>Morocco
												</div>
												<div class="col-sm-1">
													<label class="control-label">Other</label>
												</div>
												<div class="col-sm-2">
													<input type="text" class="form-control" title="Maximum length allowed is 20 characters" maxlength="20"style="font-family: calibri; font-size: 12pt;" name="other" id="other" value="<c:out value="${exemptTMDetails.other}"/>"/>
													
												</div>
											</div>
											<p>(i) What length of assignment would you consider?</p>
											<div class="form-group">
												<div class="col-sm-2">
													<input type="radio" class="control-label" name="section1F3B1" id="section1F3B1"
												value="1 year or less" ${exemptTMDetails.section1F3B1=='1 year or less'?'checked':''}/>1 Year or less 
												</div>
												<div class="col-sm-2">
													<input type="radio" class="control-label" name="section1F3B1" id="section1F3B1"
												value="1 to 2 years" ${exemptTMDetails.section1F3B1=='1 to 2 years'?'checked':''}/>1 to 2 Years
												</div>
												<div class="col-sm-3">
													<input type="radio" class="control-label" name="section1F3B1" id="section1F3B1"
												value="More than 2 years" ${exemptTMDetails.section1F3B1 =='More than 2 years'?'checked':''}/>More than 2 Years
												</div>
											</div>
											<p>(ii) I am currently unable to consider any relocation
												or mobility in the next 12 months?</p>
											
											
											<div class="form-group">
												<div class="col-sm-1">
												
												<input type="radio" id="section1F3B2" name="section1F3B2" value="yes" style="font-family: calibri; font-size: 12pt;" class="control-label" ${exemptTMDetails.section1F3B2=='yes'?'checked':''}/>Yes
												
												
												</div>
												<div class="col-sm-1">
													<input type="radio" class="control-label" id="section1F3B2" style="font-family: calibri; font-size: 12pt;" name="section1F3B2" value="no" ${exemptTMDetails.section1F3B2=='no'?'checked':''}/> No
												
												</div>
											</div>
										</div>
											
									</div>
									<div class="form-actions">
                                       <div class="row">
                                       <div class="col-md-12">
                                       <%
												String statusMssg =(String)session.getAttribute("loginEmployeeStatus");

													if (String.valueOf(statusMssg).equalsIgnoreCase("started")) {
											%> 
                                            <button type="submit" class="btn green" name="backAndSave" >Back & Save</button>                                        
                                            &nbsp;&nbsp;&nbsp;<button type="submit" class="btn green" name="nextAndSave">Next & Save</button>  
                                            <%
											}
											
											%>                                  
                                        </div>                                        
                                    </div>
                                    <div class="row" align="right">2 of 3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                                       </div>
									
									
								</c:if>
											
							
								
								<c:if test="${empty exemptTMDetails}">
									
										<div class="form-body">
											<h4>A. Describe past year's key events and assess your
												results/achievement:</h4>
											<p>Include your contribution to business goals (Safety,
												Financial Results, Productivity, Improvements):</p>
											<div class="form-group">
												<div class="col-md-12">
													<textarea class="form-control" id="Comments"
														maxlength="300"  name="Section1A" id="Section1A"></textarea>
												</div>
											</div>

											<h4>B. List of training completed in <%
													out.write(Converters.getCurrentYear());
													%>:</h4>
											<div class="form-group">
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
											<td width="3%"><label class="control-label">1</label></td>
											<td><textarea class="form-control" title="Maximum length allowed is 300 characters" name="Section1B1"
														id="Section1B1" maxlength="300" rows="3" cols="100"></textarea></td>
											<td>&nbsp;&nbsp;</td></tr>
											</table>
											<br/>
												<!-- <label class="control-label col-md-1">1</label>
												<div class="col-md-11">
													<textarea class="form-control" title="Maximum length allowed is 300 characters" name="section1B1"
														id="Section1B1" maxlength="300" rows="3" cols="100"></textarea>

												</div> -->
											</div>

											<div class="form-group">
												<div class="col-md-5">&nbsp;</div>
												<label class="control-label col-md-3">Effectiveness
													of training</label>
												<div class="col-md-4">
													<select class="form-control" id="exampleSelect1"
														name="effectivenessOfB1" id="EffectivenessOfB1">
														<option selected="selected" value="">Pick a value</option>
														<option>Very satisfactory</option>
														<option>Quite satisfactory</option>
														<option>Partially satisfactory</option>
														<option>Unsatisfactory</option>
													</select>
												</div>

											</div>

											<div class="form-group">
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
											<td width="3%"><label class="control-label">2</label></td>
											<td><textarea class="form-control" title="Maximum length allowed is 300 characters" name="section1B2"
														id="section1B2" maxlength="300" rows="3" cols="100"></textarea></td>
											<td>&nbsp;&nbsp;</td></tr>
											</table>
											<br/>
												<!-- <label class="control-label col-md-1">2</label>
												<div class="col-md-11">
													<textarea class="form-control" title="Maximum length allowed is 300 characters" name="section1B2"
														id="Section1B2" maxlength="300" rows="3" cols="100"></textarea>
												</div> -->
											</div>

											<div class="form-group">
												<div class="col-md-5">&nbsp;</div>
												<label class="control-label col-md-3">Effectiveness
													of training</label>
												<div class="col-md-4">
													<select class="form-control" id="exampleSelect1"
														name="effectivenessOfB2" id="EffectivenessOfB2">
														<option selected="selected" value="">Pick a value</option>
														<option>Very satisfactory</option>
														<option>Quite satisfactory</option>
														<option>Partially satisfactory</option>
														<option>Unsatisfactory</option>
													</select>
												</div>

											</div>


											<div class="form-group">
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
											<td width="3%"><label class="control-label">3</label></td>
											<td><textarea class="form-control" title="Maximum length allowed is 300 characters" name="section1B3"
														id="section1B3" maxlength="300" rows="3" cols="100"></textarea></td>
											<td>&nbsp;&nbsp;</td></tr>
											</table>
											<br/>
												<!-- <label class="control-label col-md-1">3</label>
												<div class="col-md-11">
													<textarea class="form-control" title="Maximum length allowed is 300 characters" id="Comments" maxlength="300" rows="3" cols="100"
														name="section1B3" id="Section1B3"></textarea>
												</div> -->
											</div>

											<div class="form-group">
												<div class="col-md-5">&nbsp;</div>
												<label class="control-label col-md-3">Effectiveness
													of training</label>
												<div class="col-md-4">
													<select class="form-control" id="exampleSelect1"
														name="effectivenessOfB3" id="EffectivenessOfB3">
														<option selected="selected" value="">Pick a value</option>
														<option>Very satisfactory</option>
														<option>Quite satisfactory</option>
														<option>Partially satisfactory</option>
														<option>Unsatisfactory</option>
													</select>
												</div>

											</div>


											<div class="form-group">
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
											<td width="3%"><label class="control-label">4</label></td>
											<td><textarea class="form-control" title="Maximum length allowed is 300 characters" name="Section1B4"
														id="Section1B4" maxlength="300" rows="3" cols="100"></textarea></td>
											<td>&nbsp;&nbsp;</td></tr>
											</table>
											<br/>
												<!-- <label class="control-label col-md-1">4</label>
												<div class="col-md-11">
													<textarea class="form-control" title="Maximum length allowed is 300 characters" id="Comments" maxlength="300" rows="3" cols="100"
														name="section1B4" id="Section1B4"></textarea>
												</div> -->
											</div>

											<div class="form-group">
												<div class="col-md-5">&nbsp;</div>
												<label class="control-label col-md-3">Effectiveness
													of training</label>
												<div class="col-md-4">
													<select class="form-control" id="exampleSelect1"
														name="effectivenessOfB4" id="EffectivenessOfB4">
														<option selected="selected" value="">Pick a value</option>
														<option>Very satisfactory</option>
														<option>Quite satisfactory</option>
														<option>Partially satisfactory</option>
														<option>Unsatisfactory</option>
													</select>
												</div>

											</div>
											<h4>C. Improvements, suggestions, or comments on
												training :</h4>
											<div class="form-group">
												<div class="col-md-12">
													<textarea class="form-control" title="Maximum length allowed is 300 characters" id="Comments" maxlength="300" 
														 name="section1C" id="Section1C"></textarea>
												</div>
											</div>
											<h4>D. TEAM MEMBER'S DEVELOPMENT RESULTS AND OBJECTIVES</h4>
											<p><%
													out.write(Converters.getCurrentYear());
												%> 
												Personal and Professional Development Achieved</p>
											<div class="form-group">
												<div class="col-md-12">
												<textarea class="form-control" title="Maximum length allowed is 300 characters" id="Comments" maxlength="300" 
												name="Section1D1" id="Section1D1"></textarea>
												</div>
											</div>
											<p>2017 Development Objectives (List any other
												development goals you have set yourself in <%
													out.write(Converters.getCurrentYear());
													%>)</p>
											<div class="form-group">
												<div class="col-md-12">
												   <textarea class="form-control" title="Maximum length allowed is 300 characters" id="Comments" maxlength="300" 
												name="Section1D2" id="Section1D2"></textarea>
												</div>
											</div>
											
											
											<h4>E. Career Mobility :</h4>
											<p>I am interested in exploring different career
												opportunities in a different functional area within the
												company</p>
											<div class="form-group">
												<div class="col-sm-1">
													<input type="radio" name="section1F1" id="Section1F1"  maxlength="50"
													value="yes" onclick="onRadioCheck('mobilityDiv','noMobilityDiv')"/>Yes
												</div>
												<div class="col-sm-1">
													<input type="radio" name="section1F1" id="Section1F1" maxlength="50"
													value="no"  onclick="onRadioCheck('noMobilityDiv','mobilityDiv')"/>No
												</div>
											</div>
											<div id="noMobilityDiv" style="display:none; ">
											<p>a. If NO, continue with question number two.</p>
											</div>
											<div id="mobilityDiv" style="display: none; ">
												<div class="form-group">
													<label class="control-label col-md-2"><p>b. If YES,
														What Job Function?</p></label>
													<div class="col-md-4">
														<input
													type="text" class="form-control" title="Maximum length allowed is 50 characters" maxlength="50"
													name="section1F2ONE" id="Section1F2ONE" />
													</div>
	
													<label class="control-label col-md-2"><p>And/or US
														Facility?</p></label>
													<div class="col-md-4">
														<input type="text"
													class="form-control" maxlength="50" name="Section1F2TWO"
													id="Section1F2TWO"/>
													</div>
												</div>
											</div>


											<p>2. I am interested in an International Assignments and/or
												mobility </p>
											<div class="form-group">
												<div class="col-sm-1">
													
														<label><input type="radio" class="control-label" id="section1F3A"  name="section1F3A" id="section1F3A" value="yes" onclick="onRadioCheck('relocationDiv','noRelocationDiv')"/>Yes</label>
												</div>
												<div class="col-sm-1">
											<label><input type="radio" class="control-label" id="section1F3A" name="section1F3A" id="section1F3A" value="no" onclick="onRadioCheck('noRelocationDiv','relocationDiv')"/>No</label>
												</div>
											</div>
											<div id="noRelocationDiv" style="display: none; ">
											<p>a. If NO, continue to next page.</p>
											</div>
											<div id="relocationDiv" style="display: none; ">
											<p>If YES, what region would you consider exploring as an
												International ?</p>
											<div class="form-group">
												<div class="col-sm-2">
													<input type="checkbox" name="section1F3B" class="control-label" id="section1F3B"
												value="Canada"/>Canada
												</div>
												<div class="col-sm-2">
													<input type="checkbox" class="control-label" name="section1F3B" id="section1F3B"
												value="USA"/>USA
												</div>
												<div class="col-sm-2">
													<input type="checkbox" class="control-label" name="section1F3B" id="section1F3B"
													value="France"/>France
												</div>
												<div class="col-sm-2">
													<input type="checkbox" class="control-label" name="section1F3B" id="section1F3B"
											value="UK"/>UK
												</div>
												<div class="col-sm-2">
													<input type="checkbox" class="control-label" name="section1F3B" id="section1F3B"
												value="Turkey"/>Turkey
												</div>
												<div class="col-sm-2">
													<input type="checkbox" class="control-label" name="section1F3B" id="section1F3B"												
												value="India"/>India
												</div>
												<div class="col-sm-2">
													<input type="checkbox" class="control-label" name="section1F3B" id="section1F3B"												
												value="Morocco"/>Morocco
												</div>
												<div class="col-sm-1">
													<label class="control-label">Other</label>
												</div>
												<div class="col-sm-2">
													<input type="text" class="form-control" title="Maximum length allowed is 20 characters" maxlength="20" name="other" id="other"/>
													
												</div>
											</div>
											<p>(i) What length of assignment would you consider?</p>
											<div class="form-group">
												<div class="col-sm-2">
													<input type="radio" class="control-label" name="section1F3B1" id="section1F3B1"
												value="1 year or less"/>1 Year or less 
												</div>
												<div class="col-sm-2">
													<input type="radio" class="control-label" name="section1F3B1" id="section1F3B1"
												value="1 to 2 years"/>1 to 2 Years
												</div>
												<div class="col-sm-3">
													<input type="radio" class="control-label" name="section1F3B1" id="section1F3B1"
												value="More than 2 years"/>More than 2 Years
												</div>
											</div>
											<p>(ii) I am currently unable to consider any relocation
												or mobility in the next 12 months?</p>
											<div class="form-group">
												<div class="col-sm-1">
												
												<input type="radio" id="section1F3B2" name="section1F3B2" value="yes" class="control-label"/>Yes
												
												
												</div>
												<div class="col-sm-1">
													<input type="radio" class="control-label" id="section1F3B2" name="section1F3B2" value="no" 
												/>No
												</div>
											</div>
										</div>

										</div>
										<div class="form-actions">
                                       <div class="row">
                                       <div class="col-md-12">
                                            <button type="submit" class="btn green" name="backAndSave" >Back & Save</button>                                        
                                            &nbsp;&nbsp;&nbsp;<button type="submit" class="btn green" name="nextAndSave">Next & Save</button>                                    
                                        </div>                                        
                                    </div>
                                    <div class="row" align="right">2 of 3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                                       </div>
									
								</c:if>
							</form:form>
							<!-- END FORM-->
						</div>
						<!-- END VALIDATION STATES-->
					</div>
				</div>
			</div>
		</div>
		<!-- END CONTENT BODY -->
	</div>
	<!-- END CONTENT -->
<script>
function onRadioCheck(enableElementId,disableElementId) {
	
	document.getElementById(enableElementId).style.display="inline";
	document.getElementById(disableElementId).style.display="none";	
}


	function verifyChecked() {

		//	var element=document.getElementById("effectivenessOfB3").value;

		if (document.getElementById("Section1F1").checked) {

			document.getElementById('mobilityDiv').style.display = "inline";

		} else {

			document.getElementById('noMobilityDiv').style.display = "none";
		}

		if (document.getElementById("section1F3A").checked) {

			document.getElementById('relocationDiv').style.display = "inline";

		} else {

			document.getElementById('noRelocationDiv').style.display = "none";

		}

	}
</script>
	

</body>


