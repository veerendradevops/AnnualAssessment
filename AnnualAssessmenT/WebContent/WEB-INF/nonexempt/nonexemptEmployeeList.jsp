<%System.out.println("This is Non exempt List Page"); %>

<%@page import="com.lisi.annualassessment.util.Converters"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body class="fixed-left">

	<%!String year;%>
	<%
		year = Converters.getCurrentYear();
		pageContext.setAttribute("year", year);
		System.out.println("*******************************************************************************");
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
								<h4 class="page-title">${year}Payrolland${year+1} Payroll</h4>
								<ol class="breadcrumb p-0">
									<li><a href="#">${year} Payroll and ${year+1} Payroll</a></li>
									<li class="active">Manager/Supervisor</li>
								</ol>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<!-- end row -->


					<div class="row">

						<div class="col-xs-12">
							<div class="card-box table-responsive">

								<h2>Manager/Supervisor</h2>
								<div class="row">

									<div class="col-sm-6 col-xs-12 m-t-20">
										<div id="horizontal-bar-chart1"
											class="ct-chart ct-golden-section"
											style="max-width: 400px; height: 250px;"></div>
									</div>

									<div class="col-sm-6 col-xs-12 m-t-20">
										<div id="pie-chart-container1" class="flot-chart"
											style="height: 200px; max-width: 400px;"></div>

									</div>
									<!-- end row -->
									<table id="datatable"
										class="table table-striped table-bordered">
										<thead>
											<tr bgcolor="#eee">
												<td colspan="6">&nbsp;</td>
												<td colspan="2" align="center"><strong>Current</strong></td>
												<td>&nbsp;</td>
												<td colspan="2" align="center"><strong>${year+1}</strong></td>
											</tr>
												<tr bgcolor="#F5F5F5">
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
													<!--  <th><a href="#">EmpPSID</a>
    <th><a href="#">FactoryLocation</a>
    <th><a href="#">EmpShift</a> -->
													<th><a href="#">Annual Rate</a></th>
												</tr>
										</thead>


										<tbody>

											<c:if test="${!empty employee}">
												<c:forEach var="empDetail" items="${employee}">
												
														<%!String clockid;
	String hashingValue;%>

														<c:set var="clockId" value="${ empDetail.empClockNumber}"
															scope="request" />



														<%
															Integer clocknum = (Integer) request.getAttribute("clockId");

																	hashingValue = Converters.encrypt(String.valueOf(clocknum));
																	application.setAttribute("hashing", hashingValue);
														%>
													<tr>
														<td><a href="/AnnualAssessmenT/teamMemberPersonalInformation.do?clockNum=${hashing}&annualYear=${empDetail.annaulYear}" style="margin-left: 9px;"><c:out
																	value="${ empDetail.emplastName} ${ empDetail.empfirstName}"></c:out></a></td>
														<!-- <td>&nbsp;</td> -->




<td>&nbsp;</td>
														<td><a
															href="/AnnualAssessmenT/teamMemberPersonalInformation.do?clockNum=${hashing}&annualYear=${empDetail.annaulYear}"><c:out
																	value="${empDetail.empClockNumber}"></c:out></a></td>
														<%!String empStatusDate;  %>
															
															<c:set var="employeeStatus" value="${empDetail.status}" scope="request"/>
															<c:set var="completedDate" value="${empDetail.completedDate}" scope="request"/>
															<%
																/*     bussiness logic for days difference... */
																
																 empStatusDate=(String)request.getAttribute("completedDate");
																
																	//	System.out.println(empStatusDate);
																		String diffDays=Converters.differenceDays(empStatusDate);
																		
															%>
															<td><c:out value="${empDetail.status}"></c:out></td>
															<td><c:out value="${empDetail.completedDate}"></c:out></td>
															<td><%= diffDays  %></td>
													<td bgcolor="ffeb9c">${empDetail.currentHrlyRate}</td>
															<td bgcolor="ffeb9c">${empDetail.annaulRate}</td>
															<td bgcolor="b8cce4">0.00%</td>
															<td bgcolor="c6efce">${empDetail.currentHrlyRate}</td>
															<%-- <td><c:out value="${empDetail.companyPsid}"></c:out></td>
     <td><c:out value="${empDetail.factoryLocation}"></c:out></td>
     <td><c:out value="${empDetail.shift}"></c:out></td> --%>
															<td bgcolor="c6efce">${empDetail.annaulRate}</td>
														
														<!-- <td bgcolor="c6efce">$28,317.90 </td> -->
													</tr>
												</c:forEach>
											</c:if>




										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- end col-->
					</div>
					<!-- end row -->
				</div>
				<!-- container -->
			</div>
			<!-- content -->

		</div>
		<!-- End content-page -->


		<!-- ============================================================== -->
		<!-- End Right content here -->
		<!-- ============================================================== -->




		<footer class="footer text-right"> 2016 © Lisi Aerospace. </footer>


	</div>
	<!-- END wrapper -->
</body>