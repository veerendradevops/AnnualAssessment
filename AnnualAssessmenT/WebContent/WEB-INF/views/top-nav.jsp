<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT>
<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">

	<!-- BEGIN HEADER -->
	<div class="page-header navbar navbar-fixed-top">
		<!-- BEGIN HEADER INNER -->
		<div class="page-header-inner ">
			<!-- BEGIN LOGO -->
			<div class="page-logo">
				<a href="#"> <img src="assets/layouts/layout/img/logo.png"
					alt="logo" class="logo-default" />
				</a>

			</div>
			<!-- END LOGO -->
			<!-- BEGIN TOP NAVIGATION MENU -->
			<div class="top-menu">
				<ul class="nav navbar-nav pull-right">
					<!-- Commented for removing Back Buttoon from Top Navigation -->
					<%
						
					%>

					<%
						//	String role = (String) session.getAttribute("onlyEmployee");
						StringBuffer role = (StringBuffer) session.getAttribute("employeeRoles");

						String employeeRole = role.toString();

						String supervisorForm = (String) session.getAttribute("employeeForm");

						System.out.println("jsp :" + role);

						if (String.valueOf(employeeRole).contains("HRGeneralist")) {

						}

						 if (String.valueOf(supervisorForm).equalsIgnoreCase("y")
								|| (String.valueOf(employeeRole).contains("Supervisor"))) {
							//		if ("Supervisor".contains(role)) {
					%>
					<li><a href="/AnnualAssessmenT/supervisorDashboard.do"><i
							aria-hidden="false"></i><b>Supervisor Dashboard</b></a></li>

					<%
						}
					%>
					<!-- 							HR Dash Board top nav  -->
					<%
						String hrGeneralistClock = "";
						String hrManager = "";
						String hradmin = "";

						if (employeeRole.contains("HRGeneralist")) {

							hrGeneralistClock = (String) session.getAttribute("loginClockNumber");
					%>
					<li class="active"><a
						href="/AnnualAssessmenT/hrGeneralistEmployees.do?clockNumber=<%=hrGeneralistClock%>">HR
							Dashboard </a></li>

					<%
						}

						if (employeeRole.contains("HrManager")) {

							hrManager = (String) session.getAttribute("loginClockNumber");
					%>

					<li class="active"><a
						href="/AnnualAssessmenT/hrManagerDashboard.do?clockNumber=<%=hrManager%>">HR
							Dashboard </a></li>

					<li><a href="/AnnualAssessmenT/csvreports.do"><b>REPORTS</b></a></li>

					<%
						}
						//
						if (employeeRole.contains("HRAdmin")) {

							hradmin = (String) session.getAttribute("loginClockNumber");
					%>

					<li class="active"><a
						href="/AnnualAssessmenT/hrAdmin.do?clockNumber=<%=hradmin%>">HR
							DASHBOARD </a></li>
					<li><a href="/AnnualAssessmenT/csvreports.do"><b>REPORTS</b></a></li>

					<%
						}
					%>




					<li><a href="/AnnualAssessmenT/logout.do"><i
							class="icon-logout"></i><b> Logout</b></a></li>
					<!-- END QUICK SIDEBAR TOGGLER -->
				</ul>
			</div>
			<!-- END TOP NAVIGATION MENU -->
		</div>
		<!-- END HEADER INNER -->
	</div>
	<!-- END HEADER -->
</body>