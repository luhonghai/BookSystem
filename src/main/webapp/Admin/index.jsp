<%@ page import="com.booksystem.entity.Admin" %>
<%
	Admin acc = (Admin)session.getAttribute("account");
	if(acc == null){
		response.sendRedirect("login.jsp");
	}
%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Administrator | Dashboard</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="http://code.ionicframework.com/ionicons/1.5.2/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <link href="css/morris/morris.css" rel="stylesheet" type="text/css" />
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
    </head>
    <body class="skin-black fixed">
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="index.html" class="logo">
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
                                	<span><%=acc.getFullname() %><i class="caret"></i></span>
                                <%}%>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header bg-light-blue">
                                    <img src="img/profile.jpg" class="img-circle" alt="User Image" />
                                    <%if(acc != null) {%>
                                    <p>
                                        <%=acc.getFullname() + "- Administrator" %>
                                        <small>Member since Nov. 2015</small>
                                    </p>
                                    <%}%>
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
                            <p>Hello, <%=acc.getFullname() %></p>
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
                        <li class="active">
                            <a href="index.jsp">
                                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                            </a>
                        </li>
                        <li>
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
                        Dashboard
                        <small>Control panel</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Dashboard</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">

                    <!-- Small boxes (Stat box) -->
                    <div class="row">
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-aqua">
                                <div class="inner">
                                    <h3>
                                        10
                                    </h3>
                                    <p>
                                        Engineers
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-android-friends"></i>
                                </div>
                                <a href="engineer.jsp" class="small-box-footer">
                                    More info <i class="fa fa-arrow-circle-right"></i>
                                </a>
                            </div>
                        </div><!-- ./col -->
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-green">
                                <div class="inner">
                                    <h3>
                                        110
                                    </h3>
                                    <p>
                                        Jobs
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-plane"></i>
                                </div>
                                <a href="job.jsp" class="small-box-footer">
                                    More info <i class="fa fa-arrow-circle-right"></i>
                                </a>
                            </div>
                        </div><!-- ./col -->
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-yellow">
                                <div class="inner">
                                    <h3>
                                        12
                                    </h3>
                                    <p>
                                        Qualifications
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-trophy"></i>
                                </div>
                                <a href="qualification.jsp" class="small-box-footer">
                                    More info <i class="fa fa-arrow-circle-right"></i>
                                </a>
                            </div>
                        </div><!-- ./col -->
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-red">
                                <div class="inner">
                                    <h3>
                                        10
                                    </h3>
                                    <p>
                                        Logged Actions
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-clipboard"></i>
                                </div>
                                <a href="log.jsp" class="small-box-footer">
                                    More info <i class="fa fa-arrow-circle-right"></i>
                                </a>
                            </div>
                        </div><!-- ./col -->
                    </div><!-- /.row -->

                    <!-- Main row -->
                    <div class="row">
                        <!-- Left col -->
                        <section class="col-lg-7 connectedSortable">  
                        
                            <div class="nav-tabs-custom">
                                <!-- Tabs within a box -->
                                <ul class="nav nav-tabs pull-right">
                                    <li class="active"><a href="#stat-engineer" data-toggle="tab">Statistic</a></li>
                                    <li class="pull-left header"><i class="fa fa-inbox"></i>Engineers</li>
                                </ul>
                                <div class="tab-content no-padding">
                                    <!-- Morris chart - Sales -->
                                    <div class="chart tab-pane active" id="stat-engineer" style="position: relative; height: 300px;"></div>
                                </div>
                            </div>

                        </section><!-- /.Left col -->
                        <!-- right col (We are only adding the ID to make the widgets sortable)-->
                        <section class="col-lg-5 connectedSortable"> 

                            <div class="nav-tabs-custom">
                                <!-- Tabs within a box -->
                                <ul class="nav nav-tabs pull-right">
                                    <li class="active"><a href="#stat-job" data-toggle="tab">Statistic</a></li>
                                    <li class="pull-left header"><i class="fa fa-inbox"></i>Jobs</li>
                                </ul>
                                <div class="tab-content no-padding">
                                    <!-- Morris chart - Sales -->
                                    <div class="chart tab-pane active" id="stat-job" style="position: relative; height: 300px;"></div>
                                </div>
                            </div>                        

                        </section><!-- right col -->
                    </div><!-- /.row (main row) -->

                </section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->

        <!-- add new calendar event modal -->


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

        <!-- AdminLTE App -->
        <script src="js/AdminLTE/app.js" type="text/javascript"></script>

        <!-- AdminLTE dashboard demo (This is only for demo purposes) 
        <script src="js/AdminLTE/dashboard.js" type="text/javascript"></script>-->
        <script type="text/javascript">
	        $(function() {
	            "use strict";
	
	            //Make the dashboard widgets sortable Using jquery UI
	            $(".connectedSortable").sortable({
	                placeholder: "sort-highlight",
	                connectWith: ".connectedSortable",
	                handle: ".box-header, .nav-tabs",
	                forcePlaceholderSize: true,
	                zIndex: 999999
	            }).disableSelection();
	            $(".connectedSortable .box-header, .connectedSortable .nav-tabs-custom").css("cursor", "move");
	
	            /* jQueryKnob */
	            $(".knob").knob();
	            /* Morris.js Charts */
	            //Donut Chart
	            var donut = new Morris.Donut({
	                element: 'stat-engineer',
	                resize: true,
	                colors: ["#3c8dbc", "#f56954"],
	                data: [
	                    {label: "No Job", value: 0},
	                    {label: "On Progress", value: 1}
	                ],
	                hideHover: 'auto'
	            });
	            
	            var donut1 = new Morris.Donut({
	                element: 'stat-job',
	                resize: true,
	                colors: ["#3c8dbc", "#f56954"],
	                data: [
	                    {label: "On Idle", value: 0},
	                    {label: "On Progress", value: 1}
	                ],
	                hideHover: 'auto'
	            });
	            //Fix for charts under tabs
	            $('.box ul.nav a').on('shown.bs.tab', function(e) {
	                donut.redraw();
	            });
	
	        });
        </script>
    </body>
</html>


