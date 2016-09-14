
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
					
					
					 <li class="has_sub"><a href="javascript:void(0);"
                            class="active"><span>To Be Completed By Team
                                    Member</span> <span class="menu-arrow"></span></a>
                            <ul class="list-unstyled">
                                <li class="has_sub"><a
                                    href="/AnnaulAssessmenT/censusFormDetails.do"
                                    ><span>Team Member Personal
                                            Information</span></a></li>
                                <li class="has_sub"><a href="/AnnaulAssessmenT/reviewOfPastYear.do"
                                     ><span>Review of 2015 Year</span></a></li>

                                <li class="has_sub"><a href="/AnnaulAssessmenT/SkillsSelfAssessment.do"
                                    ><span>Skills Self Assessment</span></a></li>
                            </ul></li>
                            
                          <%
							String role = (String) session.getAttribute("onlyEmployee");

							if (!"Employee".equals(role)) {
						//		if ("Supervisor".contains(role)) {
						%>  

						<li class="has_sub"><a href="javascript:void(0);"
							><span>To Be Completed By
									Manager</span> <span class="menu-arrow"></span></a>
							<ul class="list-unstyled">
								<li class="has_sub"><a href="/AnnaulAssessmenT/objectiveAchievemtnScreen.do"
									><span>Objective Achievement</span></a></li>
								<li class="has_sub"><a
									href="/AnnaulAssessmenT/managerSkillAssessment.do" ><span>Manager
											Skill Assessment</span></a></li>
								<li class="has_sub"><a
									href="/AnnaulAssessmenT/assessmentSummaryOperation.do"
									><span>Summary of Accomplishment
											and Development Areas for Improvement</span></a></li>
							</ul></li>

						<li class="has_sub"><a href="javascript:void(0);"
							class="waves-effect"><span>To Be Completed By Manager
									& Team Member</span> <span class="menu-arrow"></span></a>
							<ul class="list-unstyled">
								<li class="has_sub"><a href="/AnnaulAssessmenT/presentYearObjectives.do"
									class="waves-effect"><span>2015 Objectives</span></a></li>
								<li class="has_sub"><a
									href="/AnnaulAssessmenT/developmentGoalsScreen.do"
									class="waves-effect"><span>Development Goals for
											Next Year</span></a></li>
								<li class="has_sub"><a href="/AnnaulAssessmenT/meetingsummaryscreen.do"
									class="waves-effect"><span>Meeting Summary</span></a></li>
							</ul></li>
							
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
	<!-- END wrapper -->


</body>
