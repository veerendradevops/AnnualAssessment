

<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">


	<!-- BEGIN SIDEBAR -->
	<div class="page-sidebar-wrapper">
		
		<div class="page-sidebar navbar-collapse collapse">
			
			<ul class="page-sidebar-menu  page-header-fixed "
				data-keep-expanded="false" data-auto-scroll="true"
				data-slide-speed="200" style="padding-top: 20px">
				<!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
				<li class="sidebar-toggler-wrapper hide">
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
					<div class="sidebar-toggler"></div> <!-- END SIDEBAR TOGGLER BUTTON -->
				</li>

				<li><a href="/AnnualAssessmenT/nonExemptPersonalInfo.do"><span>Team
							Member's Information</span></a></li>
				<li><a href="/AnnualAssessmenT/interpersonal-skills.do"><span>Interpersonal
							Skills</span></a></li>
				<li><a href="/AnnualAssessmenT/job-knowledge-skills.do"><span>Job
							Knowledge & Skills</span></a></li>
				
				<li><a href="/AnnualAssessmenT/training-development.do"><span>Training
							& Development</span></a></li>
				<!--  <li><a href="/AnnualAssessmenT/acknowledgment-section.do"><span>Acknowledgment
							Section</span></a></li> -->
							<li><a href="/AnnualAssessmenT/acknowledgment-section.do" title="acknowledgment section is available at print time"><span>Acknowledgment
							Section</span></a></li> 
							
							
				<%
					String salary = (String) session.getAttribute("salaryReviewNonExempt");

						if (String.valueOf(salary).equalsIgnoreCase("Activated")) {
				%>
				
							 <li><a href="/AnnualAssessmenT/nonsalaryreviewpage.do"><span>Salary-review</span></a></li>
							 
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