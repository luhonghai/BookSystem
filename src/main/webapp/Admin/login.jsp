<%@page import="ac.gre.aircraft.object.Account"%>
<%
	Account acc = (Account)session.getAttribute("account");
	if(acc != null){
		response.sendRedirect("index.jsp");
	}
%>
<html class="bg-black">
    <head>
        <meta charset="UTF-8">
        <title>Log in</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="bg-black">
		<div class="box-body">
			<div id="resultAlert" class="alert alert-danger alert-dismissable" style="margin-top:20px">
				<i class = "fa fa-ban"></i>
				<button type="button" class="close">x</button>
				<b>Please try again! Your username or password is wrong!!!</b>
			</div>
			<div id="warningAlert" class="alert alert-warning alert-dismissable" style="margin-top:20px">
				<i class = "fa fa-warning"></i>
				<button type="button" class="close">x</button>
				<b>Please input your username or password!!!</b>
			</div>
		</div>
        <div class="form-box" id="login-box">
            <div class="header">Sign In</div>
            
                <div class="body bg-gray">
                    <div class="form-group">
                        <input id="username" type="text" name="userid" class="form-control" placeholder="User ID"/>
                    </div>
                    <div class="form-group">
                        <input id="password" type="password" name="password" class="form-control" placeholder="Password"/>
                    </div>          
                    <div class="form-group">
                        <input type="checkbox" name="remember_me"/> Remember me
                    </div>
                </div>
                <div class="footer">                                                               
                    <button id="submit" type="submit" class="btn bg-olive btn-block">Sign me in</button>  
                    
                    <p><a href="#">I forgot my password</a></p>
                </div>
        </div>

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="js/login_process.js" type="text/javascript"></script>
		
    </body>
</html>