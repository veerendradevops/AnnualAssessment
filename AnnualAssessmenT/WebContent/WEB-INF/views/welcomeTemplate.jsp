<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
<meta charset="utf-8" />
<title>Welcome to Lisi Aerospace</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&amp;subset=all"
	rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css"
	rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/uniform/css/uniform.default.css"
	rel="stylesheet" type="text/css" />
<link
	href="assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css"
	rel="stylesheet" type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<link href="assets/global/plugins/select2/css/select2.min.css"
	rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/select2/css/select2-bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN THEME GLOBAL STYLES -->
<link href="assets/global/css/components.min.css" rel="stylesheet"
	id="style_components" type="text/css" />
<link href="assets/global/css/plugins.min.css" rel="stylesheet"
	type="text/css" />
<!-- END THEME GLOBAL STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link href="assets/pages/css/login.min.css" rel="stylesheet"
	type="text/css" />
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME LAYOUT STYLES -->
<!-- END THEME LAYOUT STYLES -->
<link rel="shortcut icon" href="favicon.ico" />
</head>
<!-- END HEAD -->


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


<script type="text/javascript">
	$('#timepicker1').timepicker();
</script>
<script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>
<script src="assets/global/plugins/js.cookie.min.js"
	type="text/javascript"></script>
<script
	src="assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"
	type="text/javascript"></script>
<script
	src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"
	type="text/javascript"></script>
<script src="assets/global/plugins/jquery.blockui.min.js"
	type="text/javascript"></script>
<script src="assets/global/plugins/uniform/jquery.uniform.min.js"
	type="text/javascript"></script>
<script
	src="assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js"
	type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="assets/global/plugins/moment.min.js" type="text/javascript"></script>
<script
	src="assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.js"
	type="text/javascript"></script>
<script src="assets/global/plugins/morris/morris.min.js"
	type="text/javascript"></script>
<script src="assets/global/plugins/morris/raphael-min.js"
	type="text/javascript"></script>
<script src="assets/global/plugins/counterup/jquery.waypoints.min.js"
	type="text/javascript"></script>
<script src="assets/global/plugins/counterup/jquery.counterup.min.js"
	type="text/javascript"></script>
<script src="assets/global/plugins/amcharts/amcharts/amcharts.js"
	type="text/javascript"></script>
<script src="assets/global/plugins/amcharts/amcharts/serial.js"
	type="text/javascript"></script>
<script src="assets/global/plugins/amcharts/amcharts/pie.js"
	type="text/javascript"></script>
<script src="assets/global/plugins/amcharts/amcharts/radar.js"
	type="text/javascript"></script>
<script src="assets/global/plugins/amcharts/amcharts/themes/light.js"
	type="text/javascript"></script>
<script src="assets/global/plugins/amcharts/amcharts/themes/patterns.js"
	type="text/javascript"></script>
<script src="assets/global/plugins/amcharts/amcharts/themes/chalk.js"
	type="text/javascript"></script>
<script src="assets/global/plugins/amcharts/ammap/ammap.js"
	type="text/javascript"></script>
<script src="assets/global/plugins/amcharts/ammap/maps/js/worldLow.js"
	type="text/javascript"></script>
<script src="assets/global/plugins/amcharts/amstockcharts/amstock.js"
	type="text/javascript"></script>
<script src="assets/global/plugins/fullcalendar/fullcalendar.min.js"
	type="text/javascript"></script>
<script src="assets/global/plugins/flot/jquery.flot.min.js"
	type="text/javascript"></script>
<script src="assets/global/plugins/flot/jquery.flot.resize.min.js"
	type="text/javascript"></script>
<script src="assets/global/plugins/flot/jquery.flot.categories.min.js"
	type="text/javascript"></script>
<script
	src="assets/global/plugins/jquery-easypiechart/jquery.easypiechart.min.js"
	type="text/javascript"></script>
<script src="assets/global/plugins/jquery.sparkline.min.js"
	type="text/javascript"></script>
<script src="assets/global/plugins/jqvmap/jqvmap/jquery.vmap.js"
	type="text/javascript"></script>
<script
	src="assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.russia.js"
	type="text/javascript"></script>
<script
	src="assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.world.js"
	type="text/javascript"></script>
<script
	src="assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.europe.js"
	type="text/javascript"></script>
<script
	src="assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.germany.js"
	type="text/javascript"></script>
<script
	src="assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.usa.js"
	type="text/javascript"></script>
<script
	src="assets/global/plugins/jqvmap/jqvmap/data/jquery.vmap.sampledata.js"
	type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN THEME GLOBAL SCRIPTS -->
<script src="assets/global/scripts/app.min.js" type="text/javascript"></script>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/pages/scripts/dashboard.min.js"
	type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME LAYOUT SCRIPTS -->
<script src="assets/layouts/layout/scripts/layout.min.js"
	type="text/javascript"></script>
<script src="assets/layouts/layout/scripts/demo.min.js"
	type="text/javascript"></script>
<script src="assets/layouts/global/scripts/quick-sidebar.min.js"
	type="text/javascript"></script>
<!-- BEGIN CORE PLUGINS -->
<script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>
<script src="assets/global/plugins/js.cookie.min.js"
	type="text/javascript"></script>
<script
	src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"
	type="text/javascript"></script>
<script src="assets/global/plugins/jquery.blockui.min.js"
	type="text/javascript"></script>
<script
	src="assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js"
	type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="assets/global/scripts/datatable.js" type="text/javascript"></script>
<script src="assets/global/plugins/datatables/datatables.min.js"
	type="text/javascript"></script>
<script
	src="assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js"
	type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN THEME GLOBAL SCRIPTS -->
<script src="assets/global/scripts/app.min.js" type="text/javascript"></script>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/pages/scripts/table-datatables-managed.min.js"
	type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME LAYOUT SCRIPTS -->
<script src="assets/layouts/layout/scripts/layout.min.js"
	type="text/javascript"></script>
<script src="assets/layouts/layout/scripts/demo.min.js"
	type="text/javascript"></script>
<script src="assets/layouts/global/scripts/quick-sidebar.min.js"
	type="text/javascript"></script>
<script src="assets/layouts/global/scripts/quick-nav.min.js"
	type="text/javascript"></script>
</html>