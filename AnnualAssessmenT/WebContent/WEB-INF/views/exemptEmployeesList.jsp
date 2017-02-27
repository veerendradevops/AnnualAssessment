
<%@page import="com.itextpdf.text.log.SysoCounter"%>
<%
	int notStartedCount = 0;
	int stratedCount = 0;
	int completedCount = 0;
	int managerCompletedCount = 0;
	int hrApprovedCount = 0;
	int closedCount = 0;
	String employeestatus = "";
%>

<%@page import="java.util.Date"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page
	import="com.lisi.annualassessment.util.Converters,com.lisi.annualassessment.controller.LoginController"%>
<p></p>
<p></p>
<p></p>
<p></p>
<p></p>
<style>
a.disabled {
	pointer-events: none;
	cursor: default;
}
</style>
<!-- For remove search box. -->
<style>
.dataTables_filter, .dataTables_info {
	display: none;
}
</style>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js"></script>
<!-- 	<script>
function estatus(){
	
	alert("estatus")

	var tagvalue=document.getElementById("status").val;	

	alert(tagvalue);
	
		}
	</script> -->


<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">



	<!-- BEGIN CONTENT -->
	<div class="page-content-wrapper">
		<!-- BEGIN CONTENT BODY -->
		<div class="page-content">
			<!-- BEGIN PAGE HEADER-->

			<!-- BEGIN PAGE BAR -->
			<div class="page-bar">
				<ul class="page-breadcrumb">
					<li><a href="#" class="disabled">Home</a> <i
						class="fa fa-circle"></i></li>
					<li><span> Supervisor Dashboard </span></li>
				</ul>
			</div>
			<!-- END PAGE BAR -->
			<!-- BEGIN PAGE TITLE-->
			<h3 class="page-title">Supervisor Dashboard</h3>
			<!-- END PAGE TITLE-->
			<!-- END PAGE HEADER-->

			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<div class="portlet light bordered">
						<div class="portlet-body">

							<table class="table table-bordered" id="sample_1">
								<thead>
									<!-- <tr bgcolor="#eee">
										<td colspan="6">&nbsp;</td>
										<td colspan="2" align="center"><strong></strong></td>
										<td>&nbsp;</td>
										<td colspan="2" align="center"><strong></strong></td>
									</tr> -->
									<c:if test="${!empty employeeDetails}">
										<tr bgcolor="#F5F5F5">
											<!-- <th>&nbsp;</th> -->


											<c:if
												test="${!empty hrManagerclock || !empty hrGeneralistclock || !empty hrAdmin}">

												<th><a href="#"></a></th>
											</c:if>


											<th><a href="#">Name(Supervisor/Employee)</a></th>
											<th><a href="#">Clock</a></th>
											<th><a href="#">Job Title</a></th>
											<th><a href="#">Shift</a></th>
											<th><a href="#">Status</a></th>
											<th><a href="#">Not Started</a></th>
											<th><a href="#">Started</a></th>
											<th><a href="#">Completed</a></th>
											<th><a href="#">Mgr Completed</a></th>
											<th><a href="#">HR Approved</a></th>
											<th><a href="#">Closed</a></th>
										</tr>
									</c:if>
								</thead>

								<c:set var="hrGeneralistClock" value="${hrManagerclock}"
									scope="request"></c:set>
								<%-- <c:set var="hrmanager" value="${hrManager}" scope="request"></c:set>
									<c:set var="hrgeneralist" value="${hrGeneralist}" scope="request"></c:set> --%>
								<c:set var="hrManagerClock" value="${hrGeneralistclock}"
									scope="request"></c:set>
								<c:set var="hrAdmin" value="${hrAdmin}" scope="request"></c:set>

								<c:set var="supervisorClock" value="${supervisor}" />


								<tbody>
									<c:if test="${!empty employeeDetails}">
										<c:forEach var="empDetail" items="${employeeDetails}">
											<!-- empDetails -->
											<tr>

												<c:set var="exemptOrNonExempt"
													value="${empDetail.exemptOrNonExempt}" scope="request"></c:set>
												<c:set var="clockId" value="${ empDetail.empClockNumber}"
													scope="request" />
												<c:set var="jobAttribute"
													value="${empDetail.classification2 }" scope="request" />
												<c:set var="salaryIncreaseOrNot"
													value="${empDetail.salaryIncreaseOrNot }" scope="request" />

												<c:set var="employeestatus" value="${empDetail.status}"
													scope="request" />
												<c:set var="employeeSupervisorClockNo"
													value="${empDetail.supervisorClockNumber}" scope="request" />
												<%-- 	<c:set var="supervisorrole" value="${empDetail.role}"
													scope="request" />
 --%>
												<c:set var="supervisorrole" value="${empDetail.role}"
													scope="request" />

												<!--  validating exempt employees. -->
												<c:if test="${empDetail.exemptOrNonExempt=='exempt'}">

													<c:if
														test="${empDetail.status=='Not Started' || empDetail.status=='STARTED'}">
														<c:if
															test="${not empty hrManagerclock || not empty hrGeneralistclock || not empty hrAdmin}">

															<c:if
																test="${fn:contains(supervisorClock, empDetail.empClockNumber)}">
																<td><a id="exempt"
																	href="/AnnualAssessmenT/getSupervisorDashboard.do?clockNum=${empDetail.empClockNumber}&year=${empDetail.annaulYear}&status=${empDetail.status}"
																	style="margin-left: 9px;">+</a></td>
															</c:if>
															<c:if
																test="${!fn:contains(supervisor, empDetail.empClockNumber)}">
																<td></td>
															</c:if>

														</c:if>


														<td><c:out value="${ empDetail.emplastName}"></c:out>
															<c:out value=", "></c:out> <c:out
																value="${ empDetail.empfirstName}"></c:out></td>


														<td><c:out value="${empDetail.empClockNumber}"></c:out></td>

													</c:if>
													<!-- Not Started -->



													<c:if
														test="${(not empty hrGeneralistclock && hrGeneralistclock !='null') || 
																				(not empty hrManagerclock && hrManagerclock !='null') ||
																										(not empty hrAdmin && hrAdmin !='null') }">

														<c:if test="${empDetail.status == 'MANAGER COMPLETED'}">


															<c:if
																test="${!empty hrManagerclock || !empty hrGeneralistclock || !empty hrAdmin}">

																<c:if
																	test="${fn:contains(supervisorClock, empDetail.empClockNumber)}">
																	<td><a id="exempt"
																		href="/AnnualAssessmenT/getSupervisorDashboard.do?clockNum=${empDetail.empClockNumber}&year=${empDetail.annaulYear}&status=${empDetail.status}"
																		style="margin-left: 9px;">+</a></td>
																</c:if>
																<c:if
																	test="${!fn:contains(supervisorClock, empDetail.empClockNumber)}">
																	<td></td>
																</c:if>

															</c:if>


															<td>
																<%-- 	<a id="${empDetail.empClockNumber}" href="javascript:showhide(${empDetail.empClockNumber},this);">+</a> --%>

																<a id="exempt"
																href="/AnnualAssessmenT/teamMemberPersonalInfo.do?clockNum=${empDetail.empClockNumber}&year=${empDetail.annaulYear}&status=${empDetail.status}"
																style="margin-left: 9px;"><c:out
																		value="${ empDetail.emplastName}"></c:out> <c:out
																		value=", "></c:out> <c:out
																		value="${ empDetail.empfirstName}"></c:out></a>

																<div id="${empDetail.empClockNumber}"
																	class="page-break portlet light portlet-fit portlet-form bordered"
																	style="display: none"></div>

															</td>


															<%-- <td><a id="exemptEmp"
													href="/AnnualAssessmenT/teamMemberPersonalInfo.do?clockNum=${empDetail.empClockNumber}&year=${empDetail.annaulYear}&status=${empDetail.status}"><c:out
															value="${empDetail.empClockNumber}"></c:out></a></td> --%>
															<td><c:out value="${empDetail.empClockNumber}"></c:out></td>



														</c:if>
														<!-- MANAGER COMPLETED -->

														<c:if test="${empDetail.status == 'COMPLETED' || empDetail.status=='HR APPROVED' || empDetail.status=='CLOSED'}">

															<c:if
																test="${!empty hrManagerclock || !empty hrGeneralistclock || !empty hrAdmin}">

																<c:if
																	test="${fn:contains(supervisorClock, empDetail.empClockNumber)}">
																	<td><a id="exempt"
																		href="/AnnualAssessmenT/getSupervisorDashboard.do?clockNum=${empDetail.empClockNumber}&year=${empDetail.annaulYear}&status=${empDetail.status}"
																		style="margin-left: 9px;">+</a></td>
																</c:if>
																<c:if
																	test="${!fn:contains(supervisorClock, empDetail.empClockNumber)}">
																	<td></td>
																</c:if>

															</c:if>



															<td>
																<%-- 	<a id="${empDetail.empClockNumber}" href="javascript:showhide(${empDetail.empClockNumber},this);">+</a> --%>

																<c:out value="${ empDetail.emplastName}"></c:out> <c:out
																	value=", "></c:out> <c:out
																	value="${ empDetail.empfirstName}"></c:out>

																<div id="${empDetail.empClockNumber}"
																	class="page-break portlet light portlet-fit portlet-form bordered"
																	style="display: none"></div>

															</td>


															<%-- <td><a id="exemptEmp"
													href="/AnnualAssessmenT/teamMemberPersonalInfo.do?clockNum=${empDetail.empClockNumber}&year=${empDetail.annaulYear}&status=${empDetail.status}"><c:out
															value="${empDetail.empClockNumber}"></c:out></a></td> --%>
															<td><c:out value="${empDetail.empClockNumber}"></c:out></td>

														</c:if>
														<!-- COMPLETED -->



													</c:if>
													<!-- validating all HR People -->

													<c:if
														test="${( empty hrGeneralistclock || hrGeneralistclock =='null') && 
																			( empty hrManagerclock || hrManagerclock =='null') &&
																									( empty hrAdmin || hrAdmin =='null') }">

														<c:if
															test="${empDetail.status=='COMPLETED' || empDetail.status=='MANAGER COMPLETED'
																					|| empDetail.status=='HR APPROVED' || empDetail.status=='CLOSED'}">

															<%-- <c:if
																test="${!empty hrManagerclock || !empty hrGeneralistclock || !empty hrAdmin }">

																<c:if
																	test="${fn:contains(supervisorClock, empDetail.empClockNumber)}">
																	<td><a id="exempt"
																		href="/AnnualAssessmenT/getSupervisorDashboard.do?clockNum=${empDetail.empClockNumber}&year=${empDetail.annaulYear}&status=${empDetail.status}"
																		style="margin-left: 9px;">+</a></td>
																</c:if>
																<c:if
																	test="${!fn:contains(supervisorClock, empDetail.empClockNumber)}">
																	<td></td>
																</c:if>

															</c:if> --%>



															<td>
																<%-- 	<a id="${empDetail.empClockNumber}" href="javascript:showhide(${empDetail.empClockNumber},this);">+</a> --%>

																<a id="exempt"
																href="/AnnualAssessmenT/teamMemberPersonalInfo.do?clockNum=${empDetail.empClockNumber}&year=${empDetail.annaulYear}&status=${empDetail.status}"
																style="margin-left: 9px;"><c:out
																		value="${ empDetail.emplastName}"></c:out> <c:out
																		value=", "></c:out> <c:out
																		value="${ empDetail.empfirstName}"></c:out></a>

																<div id="${empDetail.empClockNumber}"
																	class="page-break portlet light portlet-fit portlet-form bordered"
																	style="display: none"></div>

															</td>


															<%-- <td><a id="exemptEmp"
													href="/AnnualAssessmenT/teamMemberPersonalInfo.do?clockNum=${empDetail.empClockNumber}&year=${empDetail.annaulYear}&status=${empDetail.status}"><c:out
															value="${empDetail.empClockNumber}"></c:out></a></td> --%>
															<td><c:out value="${empDetail.empClockNumber}"></c:out></td>

														</c:if>
														<!-- COMPLETED ---- CLOSED STATUS -->
													</c:if>



												</c:if>
												<!-- exempt -->

												<c:if test="${empDetail.exemptOrNonExempt=='non-Exempt'}">

													<c:if
														test="${(not empty hrGeneralistclock && hrGeneralistclock !='null') || 
																					(not empty hrManagerclock && hrManagerclock !='null') ||
																													(not empty hrAdmin && hrAdmin !='null') }">

														<c:if test="${empDetail.status == 'MANAGER COMPLETED'}">

															<c:if
																test="${!empty hrManagerclock || !empty hrGeneralistclock || !empty hrAdmin}">

																<c:if
																	test="${fn:contains(supervisorClock, empDetail.empClockNumber)}">
																	<td><a id="exempt"
																		href="/AnnualAssessmenT/getSupervisorDashboard.do?clockNum=${empDetail.empClockNumber}&year=${empDetail.annaulYear}&status=${empDetail.status}"
																		style="margin-left: 9px;">+</a></td>
																</c:if>
																<c:if
																	test="${!fn:contains(supervisorClock, empDetail.empClockNumber)}">
																	<td></td>
																</c:if>

															</c:if>



															<td><a
																href="/AnnualAssessmenT/teamMemberPersonalInformation.do?clockNum=${empDetail.empClockNumber}&annualYear=${empDetail.annaulYear}"
																style="margin-left: 9px;"><c:out
																		value="${ empDetail.emplastName}"></c:out> <c:out
																		value=", "></c:out> <c:out
																		value="${ empDetail.empfirstName}"></c:out></a>

																<div id="${empDetail.empClockNumber}"
																	class="page-break portlet light portlet-fit portlet-form bordered"
																	style="display: none"></div></td>
															<%-- <td><a
																href="/AnnualAssessmenT/teamMemberPersonalInformation.do?clockNum=${hashing}&annualYear=${empDetail.annaulYear}"><c:out
																		value="${empDetail.empClockNumber}"></c:out></a></td> --%>
															<td><c:out value="${empDetail.empClockNumber}"></c:out></td>


														</c:if>
														<!-- Manager Completed -->
														<c:if test="${empDetail.status != 'MANAGER COMPLETED'}">

															<c:if
																test="${!empty hrManagerclock || !empty hrGeneralistclock || !empty hrAdmin }">

																<c:if
																	test="${fn:contains(supervisorClock, empDetail.empClockNumber)}">
																	<td><a id="exempt"
																		href="/AnnualAssessmenT/getSupervisorDashboard.do?clockNum=${empDetail.empClockNumber}&year=${empDetail.annaulYear}&status=${empDetail.status}"
																		style="margin-left: 9px;">+</a></td>
																</c:if>
																<c:if
																	test="${!fn:contains(supervisorClock, empDetail.empClockNumber)}">
																	<td></td>
																</c:if>

															</c:if>



															<td><c:out value="${ empDetail.emplastName}"></c:out>
																<c:out value=", "></c:out> <c:out
																	value="${ empDetail.empfirstName}"></c:out></td>


															<td><c:out value="${empDetail.empClockNumber}"></c:out></td>


														</c:if>
														<!--  -->


													</c:if>
													<c:if
														test="${empty hrManagerclock && empty hrGeneralistclock && empty hrAdmin}">

														<td><a
															href="/AnnualAssessmenT/teamMemberPersonalInformation.do?clockNum=${empDetail.empClockNumber}&annualYear=${empDetail.annaulYear}"
															style="margin-left: 9px;"><c:out
																	value="${ empDetail.emplastName}"></c:out> <c:out
																	value=", "></c:out> <c:out
																	value="${ empDetail.empfirstName}"></c:out></a>

															<div id="${empDetail.empClockNumber}"
																class="page-break portlet light portlet-fit portlet-form bordered"
																style="display: none"></div></td>
														<%-- <td><a
													href="/AnnualAssessmenT/teamMemberPersonalInformation.do?clockNum=${hashing}&annualYear=${empDetail.annaulYear}"><c:out
															value="${empDetail.empClockNumber}"></c:out></a></td> --%>
														<td><c:out value="${empDetail.empClockNumber}"></c:out></td>
													</c:if>


												</c:if>
												<!-- Non Exempt -->
												<td><c:out value="${empDetail.jobTitle}"></c:out></td>
												<td><c:out value="${empDetail.shift}"></c:out></td>
												<td><c:out value="${empDetail.eStatus}"></c:out></td>


												<td><c:if test="${empDetail.status=='Not Started'}">
														<%
															notStartedCount++;
														%>

														<font size="5"><center>&#x25C6;</center></font>
													</c:if></td>
												<td><c:if test="${empDetail.status=='STARTED'}">
														<%
															stratedCount++;
														%>
														<font size="5"><center>&#x25C6;</center></font>
													</c:if></td>
												<td><c:if test="${empDetail.status=='COMPLETED'}">
														<%
															completedCount++;
														%>
														<font size="5"><center>&#x25C6;</center></font>
													</c:if></td>
												<td><c:if
														test="${empDetail.status=='MANAGER COMPLETED'}">
														<%
															managerCompletedCount++;
														%>
														<font size="5"><center>&#x25C6;</center></font>
													</c:if></td>
												<td><c:if test="${empDetail.status=='HR APPROVED'}">
														<%
															hrApprovedCount++;
														%>
														<font size="5"><center>&#x25C6;</center></font>
													</c:if></td>
												<td><c:if test="${empDetail.status=='CLOSED'}">
														<%
															closedCount++;
														%>
														<font size="5"><center>&#x25C6;</center></font>
													</c:if></td>
										</c:forEach>

										<tfoot>

											<c:if
												test="${!empty hrManagerclock || !empty hrGeneralistclock || !empty hrAdmin }">

												<td></td>

											</c:if>


											<td><b>TOTAL</b></td>
											<td><b><a href="#">${numberofemployees}</a></b></td>
											<td></td>
											<td></td>
											<td></td>
											<td><b><center><%=notStartedCount%></center></b></td>
											<td bgcolor=""><b><center><%=stratedCount%></center></b></td>
											<td bgcolor=""><b><center><%=completedCount%><center></b></td>
											<td bgcolor=""><b><center><%=managerCompletedCount%><center></b></td>
											<td bgcolor=""><b><center><%=hrApprovedCount%><center></b></td>
											<td bgcolor=""><b><center><%=closedCount%><center></b></td>

										</tfoot>

									</c:if>

									<c:if test="${empty employeeDetails}">
										<h1>No employees found.</h1>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
					<!-- END EXAMPLE TABLE PORTLET-->
				</div>
			</div>


		</div>
	</div>
	<!-- END CONTENT BODY -->

	<!-- END CONTAINER -->
</body>
