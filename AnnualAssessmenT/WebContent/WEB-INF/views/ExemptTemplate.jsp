<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>
<meta charset="utf-8" http-equiv="X-UA-Compatible"
	content="IE=Edge,chrome=1" />
<title>Welcome to Lisi Aerospace</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<!-- BEGIN GLOBAL MANDATORY STYLES -->

<link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />

<link href="assets/layouts/layout/css/themes/darkblue.min.css" rel="stylesheet" type="text/css" id="style_color" />
        <link

href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&amp;subset=all

" rel="stylesheet" type="text/css" />

        <link href="assets/global/plugins/font-awesome/css/font-awesome.min.css"

rel="stylesheet" type="text/css" />

        <link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet"

type="text/css" />

        <!-- END GLOBAL MANDATORY STYLES -->

<!-- BEGIN THEME GLOBAL STYLES -->

        <link href="assets/global/css/plugins.min.css" rel="stylesheet" type="text/css" />

        <!-- END THEME GLOBAL STYLES -->

        <!-- BEGIN PAGE LEVEL PLUGINS -->

<link href="assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css"

rel="stylesheet" type="text/css" />

        <link href="assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css"

rel="stylesheet" type="text/css" />

       

        <!-- END PAGE LEVEL PLUGINS -->

        <!-- BEGIN THEME GLOBAL STYLES -->

        <link href="assets/global/css/components.min.css" rel="stylesheet"

id="style_components" type="text/css" />

        <!-- END THEME GLOBAL STYLES -->

        <!-- BEGIN THEME LAYOUT STYLES -->

        <link href="assets/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css" />

       

        <!-- END THEME LAYOUT STYLES -->
        
        <script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>

 

 <!--[if lt IE 9]>

<script src="assets/global/plugins/respond.min.js"></script>

<script src="assets/global/plugins/excanvas.min.js"></script>

<![endif]-->

        <!-- BEGIN CORE PLUGINS -->

        <script src="assets/global/plugins/bootstrap/js/bootstrap.min.js"

type="text/javascript"></script>

        <!-- END CORE PLUGINS -->

        <!-- BEGIN PAGE LEVEL PLUGINS -->

        <script src="assets/global/plugins/jquery-validation/js/jquery.validate.min.js"

type="text/javascript"></script>

        <script src="assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"

type="text/javascript"></script>

        <!-- END PAGE LEVEL PLUGINS -->

        <!-- BEGIN THEME GLOBAL SCRIPTS -->

        <script src="assets/global/scripts/app.min.js" type="text/javascript"></script>

        <!-- END THEME GLOBAL SCRIPTS -->

        <!-- BEGIN PAGE LEVEL SCRIPTS -->

        <script src="assets/pages/scripts/form-validation.min.js"

type="text/javascript"></script>
<script src="assets/js/nonExempt.js" type="text/javascript"></script>
<!-- <script src="assets/js/validation.js" type="text/javascript"></script> -->
<link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />

<link href="assets/layouts/layout/css/themes/darkblue.min.css" rel="stylesheet" type="text/css" id="style_color" />
        <!-- END PAGE LEVEL SCRIPTS -->
        
        
        <!-- ----------------------- -->
       <SCRIPT type="text/javascript">
        
        <!-- ----------------------- -->
       <SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
</SCRIPT> 
        
</head>
<!-- END HEAD -->
<style>
a.disabled {
	pointer-events: none;
	cursor: default;
}

</style>


<body onload="noBack();" 
	onpageshow="if (event.persisted) noBack();" onunload="">
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
</html>
