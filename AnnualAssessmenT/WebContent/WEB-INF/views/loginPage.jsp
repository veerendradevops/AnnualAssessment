
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body class=" login">

	<!-- BEGIN LOGIN -->
	<div class="content">
		<!-- BEGIN LOGO -->
		<div class="logo">
			<img src="assets/global/img/482449.jpg">
		</div>
		<!-- END LOGO -->
		<p>
		<c:if test="${!empty wrongUser}">
		
		${wrongUser }
		
		</c:if>
		</p>
		<!-- BEGIN LOGIN FORM -->
		<form:form class="form-horizontal m-t-20"
			action="/AnnualAssessmenT/checkLogin.do" modelAttribute="loginUser"
			method="post">
			<h4 class="form-title font-green" align="center">APPRAISAL SIGN IN</h4>
			<div class="alert alert-danger display-hide">
				<button class="close" data-close="alert"></button>
				<span> Enter any username and password. </span>
			</div>
			<div class="form-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">Username</label>
				<input class="form-control form-control-solid placeholder-no-fix"
					type="text" autocomplete="off" placeholder="Username"
					name="username" required="required"/>
			</div>
			<div class="form-group">
				<label class="control-label visible-ie8 visible-ie9">Password</label>
				<input class="form-control form-control-solid placeholder-no-fix"
					type="password" autocomplete="off" placeholder="Password"
					name="password" required="required"/>
			</div>
			<div class="form-actions">
				<center><button type="submit" class="btn green uppercase">LOGIN</button></center>
				<!-- <a href="forgot-password.html" id="forget-password"
					class="forget-password">Forgot Password?</a> -->
			</div>

		</form:form>
		<!-- END LOGIN FORM -->
	</div>
	<div class="copyright">2016 &copy; Lisi Aerospace.</div>

</body>
