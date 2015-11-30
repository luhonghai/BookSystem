<%@page import="ac.gre.aircraft.object.*"%>
<%@page import="java.util.*"%>
<%@page import="ac.gre.aircraft.dao.*"%>
<%@page import="ac.gre.aircraft.dao.imp.*"%>
<%
	Account acc = (Account)session.getAttribute("account");
	List<Qualification_Detail> listQua = new ArrayList<Qualification_Detail>();
	List<Job_Detail> listJob = new ArrayList<Job_Detail>();
	AccountDao accDao = new AccountDaoImp();
	QualificationDao quaDao = new QualificationDaoImp();
	JobDao jobDao = new JobDaoImp();
	Account account = new Account();
	if(acc == null){
		response.sendRedirect("login.jsp");
	}else{
		int engineer_id = 1;
		if(request.getParameter("en_id") != null){
			engineer_id = Integer.parseInt(request.getParameter("en_id"));
		}
		listQua = quaDao.getQualificationByUserId(engineer_id);
		listJob = jobDao.getJobByUser(engineer_id);
		account = accDao.getAccountById(engineer_id);
	}
	String accAndRole = "";
%>
<%if(acc != null && acc.getUser_id() == 1){%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Administrator | Dashboard</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="http://code.ionicframework.com/ionicons/1.5.2/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <link href="css/morris/morris.css" rel="stylesheet" type="text/css" />
        <link href="css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="css/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
        <link href="css/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
        <link href="css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <link href="css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />
        <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
        <style>
        	.btn-social{color:white !important;width:175px;float:right;margin-top:10px;margin-right:10px;}
        	#addPopup{display:none;position:absolute;width:400px;top:150px;left:600px;z-index:3000;}
        	.btn-flickr{background-color:#CD1F1F;}
        	.modal-backdrop{position: fixed;top: 0;right: 0;bottom: 0;left: 0;z-index: 2000;background-color: rgba(0, 0, 0, 0.5);}
        	#tblEngineer td{vertical-align:middle;}
        </style>
        
    </head>
    <body class="skin-black fixed">
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="index.jsp" class="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
                Aircraft System
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="navbar-right">
                    <ul class="nav navbar-nav">
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="glyphicon glyphicon-user"></i>
                                <%if(acc != null) {%>
                                <span><%=acc.getFirstname() +" "+ acc.getLastname() %><i class="caret"></i></span>
                                <%}%>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header bg-light-blue">
                                    <img src="img/profile.jpg" class="img-circle" alt="User Image" />
                                    <%if(acc != null) {%>
                                    <p>
                                    	<%if(acc.getUser_id() == 1){
                                    		accAndRole = acc.getFirstname() + acc.getLastname() + " - Administrator"; 
                                    	}else{ 
                                    		accAndRole = acc.getFirstname() + acc.getLastname() + " - Engineer";
                                    	}%>
                                    	
                                        <%=accAndRole %>
                                        <small>Member since Nov. 2012</small>
                                    </p>
                                    <%} %>
                                </li>
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="#" class="btn btn-default btn-flat">Profile</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="logout.jsp" class="btn btn-default btn-flat">Sign out</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="img/profile.jpg" class="img-circle" alt="User Image" />
                        </div>
                        <div class="pull-left info">
                        	<%if(acc != null) {%>
                            	<p>Hello, <%=acc.getFirstname() + acc.getLastname() %></p>
                            <%} %>

                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>
                    <!-- search form -->
                    <form action="#" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search..."/>
                            <span class="input-group-btn">
                                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </form>
                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li>
                            <a href="index.jsp">
                                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                            </a>
                        </li>
                        <li class="active">
                            <a href="engineer.jsp">
                                <i class="fa fa-users"></i> <span>Engineer</span>
                            </a>
                        </li>
                        <li>
                            <a href="job.jsp">
                                <i class="fa fa-plane"></i> <span>Job</span>
                            </a>
                        </li>
                        <li>
                            <a href="job_allocate.jsp">
                                <i class="fa fa-fighter-jet"></i> <span>Job Allocate</span>
                            </a>
                        </li>
                        <li>
                            <a href="qualification.jsp">
                                <i class="fa fa-puzzle-piece"></i> <span>Qualification</span>
                            </a>
                        </li>
                        <li>
                            <a href="qualification_allocate.jsp">
                                <i class="fa fa-trophy"></i> <span>Qualification Allocate</span>
                            </a>
                        </li>
                        <li>
                            <a href="log.jsp">
                                <i class="fa fa-cogs"></i> <span>System Log</span>
                            </a>
                        </li>
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Engineer Infomation - <%=account.getFirstname() + " " +account.getLastname()%>
                        <small>Control panel</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="engineer.jsp">Engineer</a></li>
                        <li class="active">Engineer Info</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
					<div class="row">
                        <div class="col-xs-6">
                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">List of qualifications</h3>
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                    <table class="table table-bordered table-hover">
                                        <tbody>
                                            <%for(Qualification_Detail q:listQua) {%>
                                            	<tr>
                                            		<td><%=quaDao.getQualificationById(q.getQualification_id()).getTitle() %></td>
                                            	</tr>
                                            <%} %>
                                        </tbody>
                                    </table>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                        </div>
                        <div class="col-xs-6">
                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">List of jobs</h3>
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                    <table class="table table-bordered table-hover">
                                        <tbody>
                                            <%for(Job_Detail j:listJob) {%>
                                            	<tr>
                                            		<td><%=jobDao.getJobById(j.getJob_id()).getTitle() %></td>
                                            	</tr>
                                            <%} %>
                                        </tbody>
                                    </table>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                        </div>
                    </div>
                </section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="http://code.jquery.com/ui/1.11.1/jquery-ui.min.js" type="text/javascript"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <script src="js/plugins/morris/morris.min.js" type="text/javascript"></script>
        <script src="js/plugins/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
        <script src="js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
        <script src="js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
        <script src="js/plugins/jqueryKnob/jquery.knob.js" type="text/javascript"></script>
        <script src="js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
        <script src="js/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
        <script src="js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>
        <script src="js/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
        
        <!-- DATA TABES SCRIPT -->
        <script src="js/plugins/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>

        <!-- AdminLTE App -->
        <script src="js/AdminLTE/app.js" type="text/javascript"></script>
    </body>
</html>
<%}else{
	if(!response.isCommitted())
	response.sendRedirect("role_warning.jsp");
}%>