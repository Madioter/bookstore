<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>小小书店</title>
    <meta charset="utf-8">
    <link href="${basePath}resources/other/css/templatemo_style.css" rel="stylesheet" type="text/css"/>
    <script src="${basePath}resources/jquery-ui-bootstrap/assets/js/jquery-1.9.0.min.js" type="text/javascript"></script>
</head>
<body>
<div id="templatemo_container">
    <jsp:include page="navbar.jsp"/>
    <jsp:include page="head.jsp"/>
    <jsp:include page="content.jsp"/>
    <jsp:include page="foot.jsp"/>
</div>
</body>
</html>
