<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- App title -->
<title>Annual Performance Review</title>

<!-- DataTables -->
<link href="assets/plugins/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet" type="text/css" />
<link href="assets/plugins/datatables/buttons.bootstrap4.min.css"
	rel="stylesheet" type="text/css" />
<!-- Responsive datatable examples -->
<link href="assets/plugins/datatables/responsive.bootstrap4.min.css"
	rel="stylesheet" type="text/css" />


<!--Chartist Chart CSS -->
<link rel="stylesheet"
	href="assets/plugins/chartist/dist/chartist.min.css">

<!-- Switchery css -->
<link href="assets/plugins/switchery/switchery.min.css" rel="stylesheet" />

<!-- App CSS -->
<link href="assets/css/style.css" rel="stylesheet" type="text/css" />

<!-- HTML5 Shiv and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
<!-- Modernizr js -->
<script src="assets/js/modernizr.min.js"></script>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- App title -->
<title>Annual Performance Review</title>

<!-- DataTables -->
<link href="assets/plugins/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet" type="text/css" />
<link href="assets/plugins/datatables/buttons.bootstrap4.min.css"
	rel="stylesheet" type="text/css" />
<!-- Responsive datatable examples -->
<link href="assets/plugins/datatables/responsive.bootstrap4.min.css"
	rel="stylesheet" type="text/css" />


<!--Chartist Chart CSS -->
<link rel="stylesheet"
	href="assets/plugins/chartist/dist/chartist.min.css">

<!-- Switchery css -->
<link href="assets/plugins/switchery/switchery.min.css" rel="stylesheet" />

<!-- App CSS -->
<link href="assets/css/style.css" rel="stylesheet" type="text/css" />

<!-- HTML5 Shiv and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
<!-- Modernizr js -->
<script src="assets/js/modernizr.min.js"></script>
</head>




<body>
	<div style="margin-top: 50px;">
		<tiles:insertAttribute name="topScreen"></tiles:insertAttribute>
	</div>

	<div>
		<tiles:insertAttribute name="leftScreen"></tiles:insertAttribute>
	</div>

	<div>
		<tiles:insertAttribute name="body"></tiles:insertAttribute>
	</div>

	<div>
		<tiles:insertAttribute name="footerScreen"></tiles:insertAttribute>
	</div>

</body>
<script>
	var resizefunc = [];
</script>

<!-- jQuery  -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/tether.min.js"></script>
<!-- Tether for Bootstrap -->
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/detect.js"></script>
<script src="assets/js/fastclick.js"></script>
<script src="assets/js/jquery.blockUI.js"></script>
<script src="assets/js/waves.js"></script>
<script src="assets/js/jquery.nicescroll.js"></script>
<script src="assets/js/jquery.scrollTo.min.js"></script>
<script src="assets/js/jquery.slimscroll.js"></script>
<script src="assets/plugins/switchery/switchery.min.js"></script>

<!--Chartist Chart-->
<script src="assets/plugins/chartist/dist/chartist.min.js"></script>
<script
	src="assets/plugins/chartist/dist/chartist-plugin-tooltip.min.js"></script>
<script src="assets/pages/jquery.chartist.init.js"></script>

<!-- App js -->
<!-- <script src="assets/js/jquery.core.js"></script>
<script src="assets/js/jquery.app.js"></script> -->


<!-- Required datatable js -->
<script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="assets/plugins/datatables/dataTables.bootstrap4.min.js"></script>
<!-- Buttons examples -->
<script src="assets/plugins/datatables/dataTables.buttons.min.js"></script>
<script src="assets/plugins/datatables/buttons.bootstrap4.min.js"></script>
<script src="assets/plugins/datatables/jszip.min.js"></script>
<script src="assets/plugins/datatables/pdfmake.min.js"></script>
<script src="assets/plugins/datatables/vfs_fonts.js"></script>
<script src="assets/plugins/datatables/buttons.html5.min.js"></script>
<script src="assets/plugins/datatables/buttons.print.min.js"></script>
<script src="assets/plugins/datatables/buttons.colVis.min.js"></script>
<!-- Responsive examples -->
<script src="assets/plugins/datatables/dataTables.responsive.min.js"></script>
<script src="assets/plugins/datatables/responsive.bootstrap4.min.js"></script>

<script src="assets/js/jquery.core.js"></script>
<script src="assets/js/jquery.app.js"></script>



<!-- Flot chart js -->
<script src="assets/plugins/flot-chart/jquery.flot.js"></script>
<script src="assets/plugins/flot-chart/jquery.flot.time.js"></script>
<script src="assets/plugins/flot-chart/jquery.flot.pie.js"></script>

<!-- flot init -->
<script src="assets/pages/jquery.flot.init.js"></script>

<script>
	var resizefunc = [];
</script>



<script type="text/javascript">
	$(document).ready(
			function() {
				$('#datatable').DataTable();

				//Buttons examples
				var table = $('#datatable-buttons').DataTable({
					lengthChange : false,
					buttons : [ 'copy', 'excel', 'pdf', 'colvis' ]
				});

				table.buttons().container().appendTo(
						'#datatable-buttons_wrapper .col-md-6:eq(0)');
			});
</script>




</html>