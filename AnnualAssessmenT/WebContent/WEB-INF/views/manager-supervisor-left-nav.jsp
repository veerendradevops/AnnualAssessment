<%@page import="com.itextpdf.text.log.SysoCounter"%>
<%@ page import="com.lisi.annualassessment.controller.LoginController"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">


	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>


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
				<li class="active"><a href="#"><strong>Dashboard
							for Managers</strong></a></li>

				<c:set var="executive" value="Executive" />
				<c:set var="exemptOrNonexempt" value="${exemptOrNonExempt}"></c:set>

				<c:choose>

					<c:when test="${fn:contains(loginUser.classification,executive)|| exemptOrNonExempt=='non-Exempt'}">

					</c:when>
					<c:otherwise>

						<li class="active"><a
							href="/AnnualAssessmenT/employeeForm.do">Employee Form</a></li>

					</c:otherwise>

				</c:choose>



				<c:if test="${ empty dashboard }">

					<!-- hrAdmin -->
					<c:if test="${!empty hrAdmin }">
						<li class="active"><a
							href="/AnnualAssessmenT/hrAdmin.do?clockNumber=${hrAdmin}">HR
								DASHBOARD</a></li>

						<li class="active"><a
							href="/AnnualAssessmenT/uploadForm.do?clockNumber=${hrAdmin}">HR
								ADMIN </a></li>



					</c:if>

					<c:if test="${!empty hrGeneralist }">



						<li class="active"><a
							href="/AnnualAssessmenT/hrGeneralistEmployees.do?clockNumber=${hrGeneralist}">HR
								Dashboard </a></li>



					</c:if>


					<c:if test="${!empty hrManager }">
						<li class="active"><a
							href="/AnnualAssessmenT/hrManagerDashboard.do?clockNumber=${hrManager}">HR
								Dashboard </a></li>

					</c:if>


				</c:if>

				<c:if test="${fn:contains(loginUser.roles,'Supervisor')}">

					<li class="active"><a
						href="/AnnualAssessmenT/supervisorDashboard.do"> Supervisor
							Dashboard </a></li>

				</c:if>


				<c:if
					test="${fn:contains(loginUser.roles,'Supervisor') || fn:contains(loginUser.roles,'HRGeneralist')
					 || fn:contains(loginUser.roles,'HrManager')||fn:contains(loginUser.roles,'HRAdmin')}">
					<li class="active"><a
						href="/AnnualAssessmenT/sharedPdf.do?clockNumber=${loginUser.clockNumber}">Scan
							Documents </a></li>
				</c:if>

			</ul>
			<!-- END SIDEBAR MENU -->
			<!-- END SIDEBAR MENU -->
		</div>
		<!-- END SIDEBAR -->
	</div>
	<!-- END SIDEBAR -->