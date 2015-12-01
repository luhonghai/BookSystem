<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html> <!--<![endif]-->
<%@tag description="Main screen" pageEncoding="UTF-8" %>
<%@taglib prefix="include" tagdir="/WEB-INF/tags/admin/include" %>
<%@attribute name="pageTitle" required="true" %>
<%@attribute name="index"%>
<head>
    <include:head pageTitle="<%=pageTitle%>"/>
</head>
<body>
<include:header/>
<div class="wrapper row-offcanvas row-offcanvas-left">
    <aside class="left-side sidebar-offcanvas">
    </aside>
    <aside class="right-side">
        <jsp:doBody/>
    </aside>
</div>
<include:footer/>
</body>
</html>