<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.booksystem.service.AdminService" %>
<%@page import="com.booksystem.entity.Admin" %><%
    AdminService adminService = new AdminService(request, response);
    Admin admin = adminService.getCurrentAdmin();
    if (admin != null) {
        response.sendRedirect(request.getContextPath() + "/admin/");
    } else {
%>
<html class="bg-black">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Log in</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="<%=request.getContextPath()%>/admin/css/AdminLTE.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath()%>/admin/css/sweetalert/sweetalert.css" rel="stylesheet" type="text/css" />
        <script>
            var CONTEXT_PATH = "<%=request.getContextPath()%>";
        </script>
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="bg-black">
        <div class="form-box" id="login-box">
            <div class="header">Đăng nhập hệ thống</div>
            
                <div class="body bg-gray">
                    <div class="form-group">
                        <input id="username" type="text" name="userid" class="form-control" placeholder="Tên đăng nhập"/>
                    </div>
                    <div class="form-group">
                        <input id="password" type="password" name="password" class="form-control" placeholder="Mật khẩu"/>
                    </div>          
                    <div class="form-group">
                        <input type="checkbox" name="remember_me"/> Ghi nhớ
                    </div>
                </div>
                <div class="footer">                                                               
                    <button id="submit" type="submit" class="btn bg-olive btn-block">Đăng nhập</button>
                    <p><a href="#">quên mật khẩu</a></p>
                </div>
        </div>

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="<%=request.getContextPath()%>/admin/js/login_process.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath()%>/admin/js/plugins/sweetalert/sweetalert.min.js" type="text/javascript"></script>
    </body>
</html>
<%}%>
