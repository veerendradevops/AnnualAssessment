
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
<%@ page import="com.lisi.annualassessment.util.Converters"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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



<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js"></script>

<script>
	$(document).ready(function() {

		//if(document.getElementById("txtFactoryLocation").value!=''){

		var table = $('#sample_1').DataTable();
		table.column(12).search($(this).val(), true, false).draw();
		$('#txtFactoryLocation').keyup(function() {
			table.column(12).search($(this).val(), true, false).draw();
			//table.search($(this).val()).draw() ;
		});
		//}

	});
</script>
<!-- For remove search box. -->
<style>
.dataTables_filter, .dataTables_info {
	display: none;
}

.dataTables_wrapper .dataTables_length {
	float: left !important;
}
</style>

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
					<li><span>HR Dashboard</span></li>
				</ul>
			</div>
			<!-- END PAGE BAR -->
			<!-- BEGIN PAGE TITLE-->
			<h3 class="page-title">
				HR Dashboard &nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${!empty hrGeneralist }">

					<a
						href="/AnnualAssessmenT/hrEmployeesView.do?clockNumber=${hrGeneralist}">
						Employee View </a>||
								<a
						href="/AnnualAssessmenT/hrGeneralistEmployees.do?clockNumber=${hrGeneralist}">
						Supervisor View </a>

				</c:if>
				<c:if test="${!empty hrManager }">

					<a
						href="/AnnualAssessmenT/hrEmployeesView.do?clockNumber=${hrManager}">
						Employee View </a>||
								 <a
						href="/AnnualAssessmenT/hrManagerDashboard.do?clockNumber=${hrManager}">
						Supervisor View </a>


				</c:if>
				<c:if test="${!empty hrAdmin }">

					<a
						href="/AnnualAssessmenT/hrEmployeesView.do?clockNumber=${hrAdmin}">
						Employee View </a>||
								 <a href="/AnnualAssessmenT/hrAdmin.do?clockNumber=${hrAdmin}">
						Supervisor View </a>


				</c:if>
			</h3>
			<!-- END PAGE TITLE-->
			<!-- END PAGE HEADER-->




			<div class="row">
				<div class="col-md-12">

					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<div class="portlet light bordered">
						<div class="portlet-body">


							<table class="table table-bordered " id="sample_1">

								<thead>
									<!-- <tr bgcolor="#eee">
										<td colspan="6">&nbsp;</td>
										<td colspan="2" align="center"><strong></strong></td>
										<td>&nbsp;</td>
										<td colspan="2" align="center"><strong></strong></td>
									</tr> -->
									<tr bgcolor="#F5F5F5">
										<!-- 	<th>&nbsp;</th> -->

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
										<th style="display: none;"></th>
									</tr>
								</thead>
							

								<tbody>
									<c:if test="${!empty empDetails}">
										<c:forEach var="empDetail" items="${empDetails}">
											<tr>

												<c:set var="exemptOrNonExempt"
													value="${empDetail.exemptOrNonExempt}" scope="request"></c:set>
												<c:set var="clockId" value="${empDetail.empClockNumber}"
													scope="request" />
												<c:set var="jobAttribute"
													value="${empDetail.classification2 }" scope="request" />
												<c:set var="salaryIncreaseOrNot"
													value="${empDetail.salaryIncreaseOrNot }" scope="request" />

												<c:set var="employeestatus" value="${empDetail.status}"
													scope="request" />



												<c:if test="${empDetail.exemptOrNonExempt=='exempt'}">

													<c:if test="${empDetail.status=='MANAGER COMPLETED'}">

														<td><a id="exempt"
															href="/AnnualAssessmenT/teamMemberPersonalInfo.do?clockNum=${empDetail.empClockNumber}&year=${empDetail.annaulYear}&status=${empDetail.status}"
															style="margin-left: 9px;"><c:out
																	value="${empDetail.emplastName}"></c:out> <c:out
																	value=", "></c:out> <c:out
																	value="${empDetail.empfirstName}"></c:out></a>

															<div id="${empDetail.empClockNumber}"
																class="page-break portlet light portlet-fit portlet-form bordered"
																style="display: none"></div></td>


														<td><c:out value="${empDetail.empClockNumber}"></c:out></td>
													</c:if>
												</c:if>

												<c:if test="${empDetail.exemptOrNonExempt=='non-Exempt'}">
													<c:if test="${empDetail.status=='MANAGER COMPLETED'}">


														<td><a
															href="/AnnualAssessmenT/teamMemberPersonalInformation.do?clockNum=${empDetail.empClockNumber}&annualYear=${empDetail.annaulYear}"
															style="margin-left: 9px;"><c:out
																	value="${empDetail.emplastName}"></c:out> <c:out
																	value=", "></c:out> <c:out
																	value="${empDetail.empfirstName}"></c:out></a>

															<div id="${empDetail.empClockNumber}"
																class="page-break portlet light portlet-fit portlet-form bordered"
																style="display: none"></div></td>
														<td><c:out value="${empDetail.empClockNumber}"></c:out></td>


													</c:if>
												</c:if>
												<td><c:out value="${empDetail.jobTitle}"></c:out></td>
												<td><c:out value="${empDetail.shift}"></c:out></td>
												<td><c:out value="${empDetail.eStatus}"></c:out></td>

											<c:choose>
													<c:when
														test="${fn:contains(empDetail.classification2 ,'Executive')}">

														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>

													</c:when>

													<c:when test="${empDetail.status=='Not Started'}">

														<td>
															<%
																notStartedCount++;
															%><font size="5"><center>&#x25C6;</center></font>
														</td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
													</c:when>
													<c:when test="${empDetail.status=='STARTED'}">

														<td></td>
														<td>
															<%
																stratedCount++;
															%><font size="5"><center>&#x25C6;</center></font>
														</td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>

													</c:when>
													<c:when test="${empDetail.status=='COMPLETED'}">

														<td></td>
														<td></td>
														<td>
															<%
																completedCount++;
															%><font size="5"><center>&#x25C6;</center></font>
														</td>
														<td></td>
														<td></td>
														<td></td>

													</c:when>
													<c:when test="${empDetail.status=='MANAGER COMPLETED'}">

														<td></td>
														<td></td>
														<td></td>
														<td>
															<%
																managerCompletedCount++;
															%><font size="5"><center>&#x25C6;</center></font>
														</td>
														<td></td>
														<td></td>
													</c:when>
													<c:when test="${empDetail.status=='HR APPROVED'}">

														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td>
															<%
																hrApprovedCount++;
															%><font size="5"><center>&#x25C6;</center></font>
														</td>
														<td></td>
													</c:when>

													<c:when test="${empDetail.status=='CLOSED'}">

														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td>
															<%
																closedCount++;
															%><font size="5"><center>&#x25C6;</center></font>
														</td>
													</c:when>
												</c:choose>

												<td style="display: none;"><c:out
														value="${ empDetail.factoryLocation}"></c:out></td>
											</tr>
										</c:forEach>

										<tfoot>

											<td><b>TOTAL</b></td>
											<td><b><a href="#">${numberofemployees}</a></b></td>
											<td>&nbsp;</td>
											<td></td>
											<td>&nbsp;</td>
											<td><b><center><%=notStartedCount%></center></b></td>
											<td bgcolor=""><b><center><%=stratedCount%></center></b></td>
											<td bgcolor=""><b><center><%=completedCount%><center></b></td>
											<td bgcolor=""><b><center><%=managerCompletedCount%><center></b></td>
											<td bgcolor=""><b><center><%=hrApprovedCount%><center></b></td>
											<td bgcolor=""><b><center><%=closedCount%><center></b></td>
											<td style="display: none;"></td>


										</tfoot>

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
	</div>
	<!-- END CONTENT -->

	</div>
	<!-- END CONTAINER -->
	<script>
		</body>
	