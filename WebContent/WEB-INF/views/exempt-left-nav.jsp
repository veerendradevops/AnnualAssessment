
<%@ page import="com.lisi.annaulAssessment.util.Converters"%>


<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">

	<!-- BEGIN SIDEBAR -->
	<div class="page-sidebar-wrapper">
		<!-- BEGIN SIDEBAR -->
		<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
		<!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
		<div class="page-sidebar navbar-collapse collapse">
			<!-- BEGIN SIDEBAR MENU -->
			<!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
			<!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
			<!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
			<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
			<!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
			<!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
			<ul class="page-sidebar-menu  page-header-fixed "
				data-keep-expanded="false" data-auto-scroll="true"
				data-slide-speed="200" style="padding-top: 20px">
				<!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
				<li class="sidebar-toggler-wrapper hide">
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
					<div class="sidebar-toggler"></div> <!-- END SIDEBAR TOGGLER BUTTON -->
				</li>



				<li class="active"><a href="#"><strong>To Be
							Completed By Team Member</strong></a></li>
				<li><a href="/AnnaulAssessmenT/censusFormDetails.do"><span>Team
							Member Personal Information</span></a></li>
				<li><a href="/AnnaulAssessmenT/reviewOfPastYear.do"><span>Review
							of <%=Converters.getCurrentYear() %> Year</span></a></li>

				<li><a href="/AnnaulAssessmenT/SkillsSelfAssessment.do"><span>Skills
							Self Assessment</span></a></li>
							
							 <%
							String role = (String) session.getAttribute("onlyEmployee");

							if (!"Employee".equals(role)) {
						//		if ("Supervisor".contains(role)) {
						%>  

				<li class="active"><a href="#" class="active"><strong>To
							Be Completed By Manager</strong></a></li>
				<li><a href="/AnnaulAssessmenT/objectiveAchievemtnScreen.do"><span>Objective
							Achievement</span></a></li>
				<li><a href="/AnnaulAssessmenT/managerSkillAssessment.do"><span>Manager's
							Skill Assessment</span></a></li>
				<li><a
					href="/AnnaulAssessmenT/assessmentSummaryOperation.do"><span>Summary
							of Accomplishment and Development Areas for Improvement</span></a></li>
							
							
				<li class="active"><a href="#"><span><strong>To
								Be Completed By Manager and Team Member</strong></span></a></li>
				<li><a href="/AnnaulAssessmenT/presentYearObjectives.do"><span><%= Converters.getCurrentYear() %>
							Objectives</span></a></li>
				<li><a href="/AnnaulAssessmenT/developmentGoalsScreen.do"><span>Development
							Goals for Next Year</span></a></li>
				<li><a href="/AnnaulAssessmenT/meetingsummaryscreen.do"><span>Meeting
							Summary</span></a></li>
							<li><a href="/AnnaulAssessmenT/acknowledgmentScreen.do"><span>Acknowledgment Section</span></a></li>
							
<%
							}
						%>
			</ul>
			<!-- END SIDEBAR MENU -->
			<!-- END SIDEBAR MENU -->
		</div>
		<!-- END SIDEBAR -->
	</div>
	<!-- END SIDEBAR -->
</body>
 
