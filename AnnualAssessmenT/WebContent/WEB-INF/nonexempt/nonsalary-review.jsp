<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
					<li><span>Salary Review</span></li>
				</ul>
			</div>
			<!-- END PAGE BAR -->
			<!-- BEGIN PAGE TITLE-->
			<h3 class="page-title">Salary Review</h3>
			<!-- END PAGE TITLE-->
			<!-- END PAGE HEADER-->



			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN VALIDATION STATES-->
					<div class="portlet light portlet-fit portlet-form bordered">

						<div class="portlet-body">
							<!-- BEGIN FORM-->
							<form action="/AnnualAssessmenT/nonsalaryreview.do"
								id="form_sample_3" class="form-horizontal" method="POST">

								<c:if test="${!empty empDetail}">


									<div class="form-group">
										<label class="control-label col-md-2">Name</label>
										<div class="col-md-4">
											<input type="text" class="form-control" id="inputEmail3"
												readonly
												value=" <c:out value="${empDetail.emplastName}"/> <c:out value=", "/><c:out value="${empDetail.empfirstName}"/>"
												placeholder="Joro Ayenew">
										</div>
										<label class="control-label col-md-2">Last Increase</label>
										<div class="col-md-4">
											<input type="text" class="form-control" id="inputEmail3"
												readonly placeholder="29-Sep-15">
										</div>


									</div>
									<div class="form-group">
										<label class="control-label col-md-2">Eligible for
											Increase</label>
										<div class="col-md-4">
											<input type="text" class="form-control" id="inputPassword3"
												readonly placeholder="No">
										</div>
										<div class="col-md-6">&nbsp;</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-2">Type of counsel</label>
										<div class="col-md-10">
											<input type="text" class="form-control" id="inputPassword3"
												readonly
												placeholder="Major-First Occurrence : MAJOR OFFENCE 1st - Insubordination">
										</div>
									</div>



									<div class="form-group">

										<label class="control-label col-md-2">Paygrade</label>
										<div class="col-md-4">
											<input type="text" class="form-control" id="inputPassword3"
												readonly placeholder="S10"
												value="<c:out value="${empDetail.payGradeId}"/>">
										</div>
										<label class="control-label col-md-2">Min
											<p style="height: 0px;"></p>Mid
											<p style="height: 0px;"></p>Max
										</label>
										<div class="col-md-4">
											<table class="table" style="background: #eef1f5;">
												<tbody>
													<tr align="right">
														<td style="padding: 4px;">$<c:out
																value="${empDetail.minValue}" /></td>
													</tr>
													<tr align="right">
														<td style="padding: 4px;">$<c:out
																value="${empDetail.midValue}" /></td>
													</tr>
													<tr align="right">
														<td style="padding: 4px;">$<c:out
																value="${empDetail.maxValue}" /></td>
													</tr>
												</tbody>
											</table>
										</div>

									</div>

									<div class="form-group">
										<div class="col-md-2">&nbsp;</div>
										<label class="control-label col-md-2"><div
												align="right">Current</div></label> <label
											class="control-label col-md-2"><div align="right">Next
												year&nbsp;&nbsp;</div></label>
									</div>

									<div class="form-group">
										<label class="control-label col-md-2">Hourly Rate
											<p style="height: 2px;"></p>Annual Rate
										</label>
										<div class="col-sm-4">
											<table class="table" style="background: #eef1f5;">
												<tbody>
													<tr align="right">
														<td id="currenthrlyrate" style="padding: 4px;"><c:out
																value="${empDetail.currentHrlyRate}" /></td>
														<c:if test="${nextYearHourlyRate == 'null'}">
															<td id="hrlyresult" style="padding: 4px;"><c:out
																	value="${empDetail.currentHrlyRate}" /></td>
														</c:if>
														<c:if test="${nextYearHourlyRate != 'null'}">
															<td id="hrlyresult" style="padding: 4px;"><c:out
																	value="${empDetail.nextYearHourlyRate}" /></td>
														</c:if>
													</tr>
													<tr align="right">
														<td id="currentannaulrate" style="padding: 4px;"><c:out
																value="${empDetail.annaulRate}" /></td>
														<c:if test="${nextYearAnnualRate=='null'}">
															<td id="annualresult" style="padding: 4px;"><c:out
																	value="${empDetail.annaulRate}" /></td>
														</c:if>
														<c:if test="${nextYearAnnualRate!='null'}">
															<td id="annualresult" style="padding: 4px;"><c:out
																	value="${empDetail.nextYearAnnualRate}" /></td>
														</c:if>
													</tr>
												</tbody>
											</table>
											<input type="hidden" name="nextYearHourlyRate" id="hrlyfield">
											<input type="hidden" name="nextYearAnnualRate"
												id="annualfield">

										</div>

										<div class="col-md-6">&nbsp;</div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-2">Percent Increase</label>
										<div class="col-md-4">
											<input type="text" class="form-control" id="inputPassword31" name="percentageOfIncrease"
											onkeyup="percent();"
												value="${empDetail.percentageOfIncrease}" onkeypress='return event.charCode >= 48 && event.charCode <= 57' title='Please enter percent Increase' required>
										</div>


										<div class="col-md-6">&nbsp;</div>
									</div>
								</c:if>
						</div>
						<div class="form-actions">
							<div class="row">
								<div class="col-md-12">
									<button type="submit" name="submit"
										class="btn btn-primary waves-effect waves-light">Submit</button>
									<button type="reset"
										class="btn btn-secondary waves-effect m-l-5">Cancel</button>
								</div>
							</div>

							</form>
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
		function percent() {

		
			//Fetching percentage textfield data
			var percentage = document.getElementById("inputPassword31").value;
		
			//Getting currenthourlyrate textfield data
			var currenthourlyrate = document.getElementById("currenthrlyrate").innerHTML;

			//getting currentannualrate textfield data
			var currentannualrate = document.getElementById("currentannaulrate").innerHTML;
			
			var hrlyfinal=0.0;
			
			hrlyfinal=hrlyfinal+parseFloat((percentage/100) * currenthourlyrate).toFixed(2);
			
			var hrlyres = parseFloat(currenthourlyrate).toFixed(2);
			
			var hrlfinalYears=(parseFloat(hrlyfinal)+parseFloat(hrlyres)).toFixed(2);
			
			var annualfinal=0.0;
			annualfinal = parseFloat((percentage/100) * currentannualrate).toFixed(2);
            
			var annualres=parseFloat(currentannualrate).toFixed(2);
			
			var annualfinalYears=(parseFloat(annualfinal)+parseFloat(annualres));
			document.getElementById("hrlyresult").innerHTML = hrlfinalYears;

			document.getElementById("annualresult").innerHTML = annualfinalYears;

			document.getElementById("hrlyfield").value = hrlfinalYears;
			document.getElementById("annualfield").value = annualfinalYears;

		}
		window.onload = percent();
	</script>

</body>




</html>