<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html> <!--<![endif]-->
<%@tag description="Main screen" pageEncoding="UTF-8" %>
<%@taglib prefix="include" tagdir="/WEB-INF/tags/include" %>
<%@taglib prefix="content" tagdir="/WEB-INF/tags/content/example" %>
<%@attribute name="pageTitle" required="true" %>
<%@attribute name="index"%>
<head>
    <include:head pageTitle="<%=pageTitle%>"/>
</head>
<body>
<include:header index="<%=index%>"/>
<jsp:doBody/>
<include:footer/>
</body>
</html>