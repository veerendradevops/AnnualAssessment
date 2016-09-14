<%@ page import="com.lisi.annaulAssessment.controller.LoginController" %>
<body class="fixed-left">
	<!-- Begin page -->
	<div id="wrapper">
		<!-- ========== EXEMPT Left Sidebar Start ========== -->
		<div class="left side-menu">
			<div class="sidebar-inner slimscrollleft">

				<!--- Sidemenu -->
				<div id="sidebar-menu">
					<p>&nbsp;</p>
					<ul>
						<%
							String role = (String) session.getAttribute("employeeRole");

							if (role.contains("Supervisor")) {
						%>


						<li class="has_sub"><a href="javascript:void(0);"
							class="waves-effect active"><span>Dashboard for
									Managers</span> <span class="menu-arrow"></span></a>
							<ul class="list-unstyled">
								<li class="has_sub"><a
									href="/AnnaulAssessmenT/exemptEmployee.do?clockNum=<%=LoginController.getLoginClockNumber()%>"
									class="waves-effect "><span>Exempt Employees</span></a></li>
								<li class="has_sub"><a href="/AnnaulAssessmenT/team-members-information.do?clockNum=<%=LoginController.getLoginClockNumber()%>"
									class="waves-effect "><span>Non-Exempt Employees</span></a></li>
							</ul></li>

						<%
							}
						%>
						<%
							if (role.contains("Manager")) {
						%>



						<li><a href="dashboard-hr.html" class="waves-effect"><span>Dashboard
									for HR</span></a></li>

						<%
							}
						%>

						<li><a href="salary-review.html" class="waves-effect"><span>Salary
									Review</span></a></li>

						<%
							if (role.contains("Employee")) {
						%>


						<li><a href="/AnnaulAssessmenT/employeeForm.do" class="waves-effect"><span>Employee
									form</span></a></li>

						<%
							}
						%>



					</ul>
					<div class="clearfix"></div>
				</div>
				<!-- Sidebar -->
				<div class="clearfix"></div>
			</div>
		</div>
		<!-- EXEMPT Left Sidebar End -->

	</div>
</body>
