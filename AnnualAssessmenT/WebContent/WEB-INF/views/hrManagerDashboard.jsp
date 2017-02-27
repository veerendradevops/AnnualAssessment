<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        <meta charset="utf-8" />
        <title>Welcome to Lisi Aerospace</title>
        <link href="modal-fullscreen.css" rel="stylesheet" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="" name="author" />
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
        <link href="hrAssets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="hrAssets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <link href="hrAssets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link href="hrAssets/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
        <link href="hrAssets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="hrAssets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="hrAssets/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <link href="hrAssets/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css" />
        <link href="hrAssets/layouts/layout/css/themes/darkblue.min.css" rel="stylesheet" type="text/css" id="style_color" />
        <link href="hrAssets/layouts/layout/css/custom.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME LAYOUT STYLES -->
 </head>



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
