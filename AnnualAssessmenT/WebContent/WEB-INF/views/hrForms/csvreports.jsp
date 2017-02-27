
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<!-- <script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js'></script> -->
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
</head>
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
					<li><span>Location</span></li>
				</ul>
			</div>
			<!-- END PAGE BAR -->
			<!-- BEGIN PAGE TITLE-->
			<h3 class="page-title">Location</h3>
			<!-- END PAGE TITLE-->
			<!-- END PAGE HEADER-->
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN VALIDATION STATES-->
					<div class="portlet light portlet-fit portlet-form bordered">

						

							<form:form action="/AnnualAssessmenT/generateCSVReports.do"
								method="POST" id="submitForm" modelAttribute="csvreport"
								class="form-horizontal">
								<div class="portlet-body"
									style="margin-left: 20px; margin-top: 10px;">
									<!-- BEGIN FORM-->

									<div class="form-group">
										<!-- <label class="control-label col-md-2">Factory / Location</label>
                               <div class="col-md-4"> -->
										<%-- <select class="form-control" id="exampleSelect1" name="factoryLocation">
                                                        <option value="Exceeds Job Requirements" ${csvreport.factoryLocation=='New in the position'?'selected':''}>New in the position</option>
                                                       
                                                        <option>ALL</option>
                                                    </select>  --%>
										<label class="control-label col-md-2">Factory /
											Location</label>
										<div class="col-md-4">
											<select class="form-control" id="exampleSelect1"
												name="factoryLocation" multiple="multiple" MULTIPLE size="4"
												onclick="selectedFactoryLocation();">
												<option value="all" id="factoryForAll">All</option>
												<%-- <c:out value="${csvReports}"></c:out> --%>
												${csvReports}

											</select>
											
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-2">Shift</label>
										<div class="col-md-4">
											<select class="form-control" id="exampleSelect2" name="shift"
												multiple="multiple" MULTIPLE size="4"
												onclick="selectedShift();">
												<option value="0" id="shiftForAll1">All</option>
												<%-- <c:out value="${csvreportshift}"></c:out> --%>
											${csvreportshift}
											</select>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-2">Year</label>
										<div class="col-md-4">
											<select name="year" id="dropdownId" onchange="dropdownYear();"
										style="position: relative; right: -1em;">
										<c:if test="${!empty AllYears}">
											<c:forEach items="${AllYears}" var="dbYears">

												<option value="${dbYears.annaulYear}">${dbYears.annaulYear}</option>


											</c:forEach>
										</c:if>
									</select>
										</div>
									</div>

									
								</div>
								<div class="form-actions">
									<div class="row">
										<div class="col-md-12">

											<button type="button"
												class="btn btn-primary waves-effect waves-light" onclick="javascript:onSubmitForm();">RUN</button>
										</div>
									</div>
								</div>
								<%--   </c:forEach> --%>

							
						</form:form>
						<!-- END FORM-->
					</div>
					<!-- END VALIDATION STATES-->
				</div>
			</div>
		</div>
	</div>
	<!-- END CONTENT BODY -->
	</div>
	<!-- END CONTENT -->

	</div>
	<!-- END CONTAINER -->

	<script type="text/javascript">
		function selectedFactoryLocation() {
			var selectBox = document.getElementById("exampleSelect1");
			var selectedValue = selectBox.options[selectBox.selectedIndex].text;
			if (selectedValue == 'All') {
				$('#exampleSelect1 option').prop('selected', true);
			}
		}

		function selectedShift() {
			var selectBox = document.getElementById("exampleSelect2");
			var selectedValue = selectBox.options[selectBox.selectedIndex].text;
			if (selectedValue == 'All') {
				$('#exampleSelect2 option').prop('selected', true);
			}
		}
	</script>
	
	<script type="text/javascript">
		
		function onSubmitForm(){
			
			var selectFBox = document.getElementById("exampleSelect1");			
			var selectSBox = document.getElementById("exampleSelect2");			
			
			if(selectFBox.selectedIndex==-1){
				alert("Please select a Factory/Location");
			}
			
			if(selectSBox.selectedIndex==-1){
				alert("Please select a Shift");
			}
						
			if(selectFBox.selectedIndex!=-1 && selectSBox.selectedIndex!=-1){
				$('form#submitForm').submit();
			}
						
		}
		
	</script>
	
</body>
</html>
