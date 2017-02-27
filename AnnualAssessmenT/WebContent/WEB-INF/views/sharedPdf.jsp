
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"
	prefix="function"%>
<body>
	<div align="center">
		<p>&nbsp;</p>


		<!-- Form Code Start -->
		<form:form action="selectPdf.do" method="post"
			enctype="multipart/form-data" modelAttribute="sharedfile">

			<fieldset>
				<!-- <legend>Please Pic a File</legend> -->

				<div>
					<span class='error'>&nbsp;</span>
					<P>
						<c:if test="${!empty errorMsg}">
							<c:choose>
								<c:when
									test="${function:containsIgnoreCase(errorMsg, 'Sucessfully')}">

									<h3>
										<font color="green"><center>${errorMsg}</center></font>
									</h3>
								</c:when>
								<c:otherwise>
									<h3>
										<font color="red"><center>${errorMsg}</center></font>
									</h3>
								</c:otherwise>
							</c:choose>
						</c:if>

					</P>
				</div>


				<div class='container'
					style="width: 400px; height: 200px; border: 1px solid #000;">
					<p>&nbsp;</p>
					<label>Please Pic a File</label><br /> <input type="file"
						name='file' /><br /> <span id='contactus_photo_errorloc'
						class='error'></span> <input type='submit' name='Submit'
						value='Upload' class="btn btn-primary waves-effect waves-light" />
				</div>
				<!-- <p>&nbsp;</p>

				<div class='container'>
					<input type='submit' name='Submit' value='Upload'
						class="btn btn-primary waves-effect waves-light" />
				</div> -->

			</fieldset>
		</form:form>
	</div>
</body>

