
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
<!--  Added By Sriramulu.kanithi@verinon.co.in-->
<!-- Start For remove Filter Lable  -->
<style>
.dataTables_filter {
	display: none;
}

.dataTables_wrapper .dataTables_length {
	float: left !important;
}
</style>
<!-- End  For remove Filter Lable  -->
<!-- Start  code  Filter href  -->
<script type="text/javascript">
	function filterSearch() {

		var filter_var = document.getElementById("txtFactoryLocation").value;
		if (filter_var.length >= 3) {
			window.location.href = '/AnnualAssessmenT/hrDashboardSearch.do?filter='
					+ filter_var;
		}
		if (filter_var.length == 0) {
			window.location.href = '/AnnualAssessmenT/hrDashboardSearch.do?filter='
					+ filter_var;
		}

	}
</script>
<!-- End  code  Filter href  -->
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js"></script>

<!-- <script>
	$(document).ready(function() {

		/* //if(document.getElementById("txtFactoryLocation").value!=''){
		
		var table = $('#sample_1').DataTable();
		table.column(12).search($(this).val(), true, false).draw();
		$('#txtFactoryLocation').keyup(function() {
			table.column(12).search($(this).val(), true, false).draw();

		});
		//} */
		// DataTable
		var table = $('#sample_1').DataTable();
		//alert("alert1");
		// Apply the search
		table.columns().every(function() {
			var that = this;
			//alert("alert2");
			$('input', this.footer()).on('keyup change', function() {
				//alert("alert3");
				if (that.search() !== this.value) {
					//alert("alert4");
					that.search(this.value).draw();
				}
			});
		});
	});
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
					<li><span>HR Dashboard</span></li>

				</ul>
			</div>

			<!-- END PAGE BAR -->
			<!-- BEGIN PAGE TITLE-->
			<h3 class="page-title">
				HR Dashboard &nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${!empty hrGeneralist }">

					<%-- href="/AnnualAssessmenT/
teamMemberPersonalInfo.do?clockNum=${empDetail.empClockNumber}&year=${empDetail.annaulYear}&status=${empDetail.status}" --%>

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
							<table width="50%" border="0"
								style="font-size: 14px; float: right; margin-bottom: -50px; z-index: 999px;">

								<!-- <td style="position: relative; right: 6em;"> -->
								<label style="position: relative; right: -30em;">year :</label>

								<select name="year" id="dropdownId" onchange="dropdownYear();"
									style="position: relative; right: -31em;">
									<c:if test="${!empty AllYears}">
										<c:forEach items="${AllYears}" var="dbYears">



											<c:choose>
												<c:when test="${dbYears.annaulYear==selectedYear}">
													<option value="${dbYears.annaulYear}" selected>${dbYears.annaulYear}</option>
												</c:when>
												<c:otherwise>
													<option value="${dbYears.annaulYear}">${dbYears.annaulYear}</option>
												</c:otherwise>
											</c:choose>


										</c:forEach>
									</c:if>
								</select>
								<!-- </td>
 -->

								<tr>
									<td style="position: relative; left: 4em">Filter :</td>
									<td style="position: relative; left: 3em;"><input
										type="text" id="txtFactoryLocation"
										placeholder="Search ClockNumber" onkeyup="filterSearch()"
										value="${filterContent}" /></td>
								</tr>
								<tr>
									<td>&nbsp;&nbsp;</td>

								</tr>



							</table>

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
										<th><a href="#"></a></th>
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
												<c:set var="dropId" value="${selectedYear}" scope="request"></c:set>
												<c:set var="loginYear" value="${empDetail.annaulYear}"
													scope="request"></c:set>

												<c:choose>
													<c:when
														test="${empty selectedYear||selectedYear=='null'|| selectedYear==''}">
														<c:set var="dropDownYear" value="${empDetail.annaulYear}" scope="session"></c:set>

													</c:when>
													<c:otherwise>
														<c:set var="dropDownYear" value="${selectedYear}" scope="session"></c:set>

													</c:otherwise>
												</c:choose>

											

											<c:choose>
													
													<c:when test="${empDetail.exemptOrNonExempt=='exempt' }">

														<c:if
															test="${(empDetail.status=='Not Started') || (empDetail.status=='STARTED') ||(empDetail.status=='COMPLETED')||(empDetail.status=='HR APPROVED')||(empDetail.status=='CLOSED')}">


															<td><a id="exempt"
																href="/AnnualAssessmenT/getSupervisorDashboard.do?clockNum=${empDetail.empClockNumber}&year=${dropDownYear}&status=${empDetail.status}"
																style="margin-left: 9px;">+</a></td>

															<td><c:out value="${empDetail.emplastName}"></c:out>
																<c:out value=", "></c:out> <c:out
																	value="${empDetail.empfirstName}"></c:out></td>


															<td><c:out value="${empDetail.empClockNumber}"></c:out></td>
														</c:if>

														<c:if test="${empDetail.status=='MANAGER COMPLETED'}">
															<td><a id="exempt"
																href="/AnnualAssessmenT/getSupervisorDashboard.do?clockNum=${empDetail.empClockNumber}&year=${dropDownYear}&status=${empDetail.status}"
																style="margin-left: 9px;">+</a></td>


															<td><a id="exempt"
																href="/AnnualAssessmenT/teamMemberPersonalInfo.do?clockNum=${empDetail.empClockNumber}&year=${dropDownYear}&status=${empDetail.status}"
																style="margin-left: 9px;"><c:out
																		value="${empDetail.emplastName}"></c:out> <c:out
																		value=", "></c:out> <c:out
																		value="${empDetail.empfirstName}"></c:out></a>

																<div id="${empDetail.empClockNumber}"
																	class="page-break portlet light portlet-fit portlet-form bordered"
																	style="display: none"></div></td>


															<td><c:out value="${empDetail.empClockNumber}"></c:out></td>
														</c:if>
													</c:when>

												<c:when test="${empDetail.exemptOrNonExempt=='non-Exempt'}">

														<c:choose>
															<c:when test="${not empty loginUser.clockNumber }">


																<c:if test="${empDetail.status=='MANAGER COMPLETED'}">


																	<td><a id="exempt"
																		href="/AnnualAssessmenT/getSupervisorDashboard.do?clockNum=${empDetail.empClockNumber}&year=${dropDownYear}&status=${empDetail.status}"
																		style="margin-left: 9px;">+</a></td>
																	<td><a
																		href="/AnnualAssessmenT/teamMemberPersonalInformation.do?clockNum=${empDetail.empClockNumber}&annualYear=${dropDownYear}"
																		style="margin-left: 9px;"><c:out
																				value="${empDetail.emplastName}"></c:out> <c:out
																				value=", "></c:out> <c:out
																				value="${empDetail.empfirstName}"></c:out></a>

																		<div id="${empDetail.empClockNumber}"
																			class="page-break portlet light portlet-fit portlet-form bordered"
																			style="display: none"></div></td>
																	<td><c:out value="${empDetail.empClockNumber}"></c:out></td>
																</c:if>
																<c:if
																	test="${(empDetail.status=='Not Started') || (empDetail.status=='STARTED') ||(empDetail.status=='COMPLETED')||(empDetail.status=='HR APPROVED')||(empDetail.status=='CLOSED')}">


																	<td><a id="exempt"
																		href="/AnnualAssessmenT/getSupervisorDashboard.do?clockNum=${empDetail.empClockNumber}&year=${dropDownYear}&status=${empDetail.status}"
																		style="margin-left: 9px;">+</a></td>
																	<td><c:out value="${ empDetail.emplastName}"></c:out>
																		<c:out value=", "></c:out> <c:out
																			value="${empDetail.empfirstName}"></c:out></td>


																	<td><c:out value="${empDetail.empClockNumber}"></c:out></td>

																</c:if>
															</c:when>


															<c:otherwise>


																<td><a id="exempt"
																	href="/AnnualAssessmenT/getSupervisorDashboard.do?clockNum=${empDetail.empClockNumber}&year=${dropDownYear}&status=${empDetail.status}"
																	style="margin-left: 9px;">+</a></td>
																<td><a
																	href="/AnnualAssessmenT/teamMemberPersonalInformation.do?clockNum=${empDetail.empClockNumber}&annualYear=${dropDownYear}"
																	style="margin-left: 9px;"><c:out
																			value="${empDetail.emplastName}"></c:out> <c:out
																			value=", "></c:out> <c:out
																			value="${empDetail.empfirstName}"></c:out></a></td>

																<td><c:out value="${empDetail.empClockNumber}"></c:out></td>
															</c:otherwise>
														</c:choose>
													</c:when>
												</c:choose>

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
											<td></td>
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

	<!-- END CONTENT -->


	<!-- END CONTAINER -->
<html>
<script>
	function dropdownYear() {

		var year = document.getElementById("dropdownId").value;

		window.location.href = '/AnnualAssessmenT/yearOnHrDashboard.do?dropdownYear='
				+ year;

	}
</script>
</html>
