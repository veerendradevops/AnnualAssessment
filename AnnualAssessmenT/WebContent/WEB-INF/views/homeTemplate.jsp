<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
 <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>
	<tiles:insertAttribute name="title" ignore="true"></tiles:insertAttribute>
</title>
</head>
<body>
<table border="0" width="100%" cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="2" align="center">
        	<tiles:insertAttribute name="body"></tiles:insertAttribute>
        </td>
    </tr>
    
</table>
</body>
</html>