<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.lisi.annaulAssessment.util.Converters"%>
<html>
<body class="fixed-left">

	<!-- Begin page -->
	<div id="wrapper">

		<!-- Top Bar Start -->
		<div class="topbar">

			<!-- LOGO -->
			<div class="topbar-left">
				<a href="index-2.html" class="logo"><img
					src="assets/images/482449.jpg"></a>
			</div>


			<nav class="navbar navbar-custom">


				<ul class="nav navbar-nav pull-right">



					<li class="nav-item dropdown notification-list"><a
						class="nav-link dropdown-toggle arrow-none waves-effect waves-light nav-user"
						data-toggle="dropdown" href="#" role="button"
						aria-haspopup="false" aria-expanded="false"> <img
							src="assets/images/users/avatar-1.jpg" alt="user"
							class="img-circle">
					</a>
						<div
							class="dropdown-menu dropdown-menu-right dropdown-arrow profile-dropdown "
							aria-labelledby="Preview">
							<!-- item-->
							<div class="dropdown-item noti-title">
								<h5 class="text-overflow">
									<small>Welcome ! John</small>
								</h5>
							</div>

							<!-- item-->
							<a href="javascript:void(0);" class="dropdown-item notify-item">
								<i class="zmdi zmdi-account-circle"></i> <span>Profile</span>
							</a>

							<!-- item-->
							<a href="javascript:void(0);" class="dropdown-item notify-item">
								<i class="zmdi zmdi-settings"></i> <span>Settings</span>
							</a>

							<!-- item-->
							<a href="javascript:void(0);" class="dropdown-item notify-item">
								<i class="zmdi zmdi-lock-open"></i> <span>Lock Screen</span>
							</a>

							<!-- item-->
							<a href="javascript:void(0);" class="dropdown-item notify-item">
								<i class="zmdi zmdi-power"></i> <span>Logout</span>
							</a>
						</div></li>
				</ul>
			</nav>
		</div>
		<!-- Top Bar End -->






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
								<h4 class="page-title">2016 Payroll and 2017 Payroll</h4>
								<ol class="breadcrumb p-0">
									<li><a href="#">2016 Payroll and 2017 Payroll</a></li>
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
									<form>
										<table id="datatable"
											class="table table-striped table-bordered">
											<thead>
												<tr bgcolor="#eee">
													<td colspan="6">&nbsp;</td>
													<td colspan="2" align="center"><strong>Current</strong></td>
													<td>&nbsp;</td>
													<td colspan="2" align="center"><strong>2017</strong></td>
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
												<c:if test="${!empty empDetails}">
													<c:forEach var="empDetail" items="${empDetails}">
														<tr>
														<!-- PREVIOUS CODE
														
														<td><a href="#" style="margin-left: 9px;"><c:out
																		value="${ empDetail.emplastName}"></c:out> <c:out
																		value=", "></c:out> <c:out
																		value="${ empDetail.empfirstName}"></c:out></a></td>
														 -->
															<td><a href="/AnnaulAssessmenT/teamMemberPersonalInfo.do?clockNum=${empDetail.empClockNumber}&year=${empDetail.annaulYear}" style="margin-left: 9px;"><c:out
																		value="${ empDetail.emplastName}"></c:out> <c:out
																		value=", "></c:out> <c:out
																		value="${ empDetail.empfirstName}"></c:out></a></td>
															<td>&nbsp;</td>

															<c:set var="exemptOrNonExempt"
																value="${ empDetail.exemptOrNonExempt}" scope="request"></c:set>
															<c:set var="clockId" value="${ empDetail.empClockNumber}"
																scope="request" />

															<%
															System.out.println("#######################################################################");
																String clockid;
																		String hashingValue;
																		String exemptOrNonExempt = (String) request.getAttribute("exemptOrNonExempt");

																		if (exemptOrNonExempt.equalsIgnoreCase("exempt")) {
															%>

															<td><a
																href="/AnnaulAssessmenT/teamMemberPersonalInfo.do?clockNum=${empDetail.empClockNumber}&year=${empDetail.annaulYear}"><c:out
																		value="${empDetail.empClockNumber}"></c:out></a></td>

															<%
																} else {
																			Integer clocknum = (Integer) request.getAttribute("clockId");

																			hashingValue = Converters.encrypt(String.valueOf(clocknum));
																			application.setAttribute("hashing", hashingValue);
															%>
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
															<td><c:out value="${empDetail.status}"></c:out></td>
															<td><c:out value="${empDetail.completedDate}"></c:out></td>
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
									</form>
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


	</div>
</body>