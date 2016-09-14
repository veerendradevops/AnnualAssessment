<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><-->
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        
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
</html>