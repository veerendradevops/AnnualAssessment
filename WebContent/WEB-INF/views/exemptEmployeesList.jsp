
<%@page import="java.util.Date"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.lisi.annaulAssessment.util.Converters"%>
<p></p>
<p></p>
<p></p>
<p></p>
<p></p>
<style>
a.disabled {
   pointer-events: none;
   cursor: default;
}</style>
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
					<li><a href="index.html">Home</a> <i class="fa fa-circle"></i>
					</li>
					<li><span>Dashboard HR</span></li>
				</ul>
			</div>
			<!-- END PAGE BAR -->
			<!-- BEGIN PAGE TITLE-->
			<h3 class="page-title">Dashboard Supervisor</h3>
			<!-- END PAGE TITLE-->
			<!-- END PAGE HEADER-->




			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<div class="portlet light bordered">
						<div class="portlet-body">

							<table class="table table-bordered" id="sample_1">
								<thead>
									<tr bgcolor="#eee">
										<td colspan="6">&nbsp;</td>
										<td colspan="2" align="center"><strong>Current</strong></td>
										<td>&nbsp;</td>
										<td colspan="2" align="center"><strong>2017</strong></td>
									</tr>
									<tr bgcolor="#F5F5F5">
										<!-- <th><a href="#">S.No</a></th> -->
										<th><a href="#">Emp. Name</a></th>
										<th><a href="#">Emp.</a></th>
										<th><a href="#">Emp. ID</a></th>
										<th><a href="#">Status</a></th>
										<th><a href="#">Completed Step</a></th>
										<th><a href="#">Days Since</a></th>
										<th><a href="#">Hourly Rate</a></th>
										<th><a href="#">Annual Rate</a></th>
										<th><a href="#">% Increase</a></th>
										<th><a href="#">Hourly Rate</a></th>
										<th><a href="#">Annual Rate</a></th>
									</tr>
								</thead>


								<tbody>
									<c:if test="${!empty empDetails}">
										<c:forEach var="empDetail" items="${empDetails}">
											<tr>
												<%-- <td><a href="#" style="margin-left: 9px;"><c:out
															value="${ empDetail.emplastName}"></c:out> <c:out
															value=", "></c:out> <c:out
															value="${ empDetail.empfirstName}"></c:out></a></td>
												<td>&nbsp;</td> --%>

												<c:set var="exemptOrNonExempt"
													value="${ empDetail.exemptOrNonExempt}" scope="request"></c:set>
												<c:set var="clockId" value="${ empDetail.empClockNumber}"
													scope="request" />
												<c:set var="jobAttribute"
													value="${empDetail.classification2 }" scope="request" />
													<c:set var="salaryIncreaseOrNot"
													value="${empDetail.salaryIncreaseOrNot }" scope="request" />

												<%
												System.out.println("testone");
													String clockid;
															String hashingValue;
															String exemptOrNonExempt = (String) request.getAttribute("exemptOrNonExempt");
															String jobAttribute = (String) request.getAttribute("jobAttribute");
															System.out.println(jobAttribute);
															String salIncreaseStatus=(String)request.getAttribute("salaryIncreaseOrNot");
															/* System.out.println("salinc" + salIncreaseStatus); */
															if (String.valueOf(jobAttribute).contains("Executive") || String.valueOf(salIncreaseStatus).equalsIgnoreCase("N") ) {
																System.out.println("sal if");
												%>
												<td><a class="disabled"
													href="/AnnaulAssessmenT/teamMemberPersonalInfo.do?clockNum=${empDetail.empClockNumber}&year=${empDetail.annaulYear}&status=${empDetail.status}" style="margin-left: 9px;"><c:out
															value="${ empDetail.emplastName}"></c:out> <c:out
															value=", "></c:out> <c:out
															value="${ empDetail.empfirstName}"></c:out></a></td>
												<td>&nbsp;</td>
												<td><a class="disabled"
													href="/AnnaulAssessmenT/teamMemberPersonalInfo.do?clockNum=${empDetail.empClockNumber}&year=${empDetail.annaulYear}&status=${empDetail.status}"><c:out
															value="${empDetail.empClockNumber}" ></c:out></a></td>
												<%
													}

															else if (exemptOrNonExempt.equalsIgnoreCase("exempt")) {
												%>
												<td><a href="/AnnaulAssessmenT/teamMemberPersonalInfo.do?clockNum=${empDetail.empClockNumber}&year=${empDetail.annaulYear}&status=${empDetail.status}" style="margin-left: 9px;"><c:out
															value="${ empDetail.emplastName}"></c:out> <c:out
															value=", "></c:out> <c:out
															value="${ empDetail.empfirstName}"></c:out></a></td>
												<td>&nbsp;</td>

												<td><a
													href="/AnnaulAssessmenT/teamMemberPersonalInfo.do?clockNum=${empDetail.empClockNumber}&year=${empDetail.annaulYear}&status=${empDetail.status}"><c:out
															value="${empDetail.empClockNumber}"></c:out></a></td>

												<%
													} else if(exemptOrNonExempt.equalsIgnoreCase("non-Exempt")) {
																Integer clocknum = (Integer) request.getAttribute("clockId");

																hashingValue = Converters.encrypt(String.valueOf(clocknum));
																application.setAttribute("hashing", hashingValue);
												%>
												<td><a href="/AnnaulAssessmenT/teamMemberPersonalInformation.do?clockNum=${hashing}&annualYear=${empDetail.annaulYear}" style="margin-left: 9px;"><c:out
															value="${ empDetail.emplastName}"></c:out> <c:out
															value=", "></c:out> <c:out
															value="${ empDetail.empfirstName}"></c:out></a></td>
												<td>&nbsp;</td>
												<td><a
													href="/AnnaulAssessmenT/teamMemberPersonalInformation.do?clockNum=${hashing}&annualYear=${empDetail.annaulYear}"><c:out
															value="${empDetail.empClockNumber}"></c:out></a></td>
												<%
													}
												%>

												<%!String empStatusDate;%>

												<c:set var="employeeStatus" value="${empDetail.status}"
													scope="request" />
												<c:set var="completedDate"
													value="${empDetail.completedDate}" scope="request" />
												<%
													/*     bussiness logic for days difference... */

															empStatusDate = (String) request.getAttribute("completedDate");

															//	System.out.println(empStatusDate);
															String diffDays = Converters.differenceDays(empStatusDate);
												%>
												<%
													String date = (String) request.getAttribute("completedDate");
															String formatedDate = Converters.stringFormatDate(date);
															System.out.println("formatedDate jsp" + formatedDate);
												%>

												<td><c:out value="${empDetail.status}"></c:out></td>
												<%-- 	<td><c:out value="${empDetail.completedDate}"></c:out></td> --%>
												<td><%=formatedDate%></td>
												<td><%=diffDays%></td>
												<td bgcolor="ffeb9c">${empDetail.currentHrlyRate}</td>
												<td bgcolor="ffeb9c">${empDetail.annaulRate}</td>
												<td bgcolor="b8cce4">0.00%</td>
												<td bgcolor="c6efce">${empDetail.currentHrlyRate}</td>
												<%-- <td><c:out value="${empDetail.companyPsid}"></c:out></td>
     <td><c:out value="${empDetail.factoryLocation}"></c:out></td>
     <td><c:out value="${empDetail.shift}"></c:out></td> --%>
												<td bgcolor="c6efce">${empDetail.annaulRate}</td>
											</tr>
										</c:forEach>

									</c:if>
									 <tr>
										<td>TOTAL</td>
										<td><a href="#">${numberofemployees }</a></td>
										<td>&nbsp;</td>
										<td></td>
										<td>&nbsp;</td>
										<td></td>
										<td bgcolor="ffeb9c">${yellowHourlyRate}</td>
										<td bgcolor="ffeb9c">${yellowAnnaulRate }</td>
										<td bgcolor="c0504d">0.00%</td>
										<td bgcolor="c6efce">${yellowHourlyRate}</td>
										<td bgcolor="c6efce">${yellowAnnaulRate }</td>
									</tr>



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
</body>