<%@page import="ac.gre.aircraft.object.*"%>
<%@page import="java.util.*"%>
<%@page import="ac.gre.aircraft.dao.*"%>
<%@page import="ac.gre.aircraft.dao.imp.*"%>
<%@page import="ac.gre.aircraft.util.*"%>
<%
	Account acc = (Account)session.getAttribute("account");
	if(acc == null){
		response.sendRedirect("login.jsp");
	}else{
		//System.out.println(acc.getUsername());
	}
	JobDao jobDao = new JobDaoImp();
	int job_id = 0;
	if(request.getParameter("job_id") != null){
		job_id = Integer.parseInt(request.getParameter("job_id"));
	}else{
		job_id = jobDao.getFirstJobItem();
	}
	List<Account> listAcc = new ArrayList<Account>();
	AccountDao accDao = new AccountDaoImp();
	listAcc = accDao.getAllAccounts();
	String accAndRole = "";
	
	List<Qualification> listQua = new ArrayList<Qualification>();
	QualificationDao quaDao = new QualificationDaoImp();
	listQua = quaDao.getAllQualifications();
	
	List<Job> listJob = new ArrayList<Job>();
	
	listJob = jobDao.getAllJobs();
	Job j = jobDao.getJobById(job_id);
	
	List<Account> listUnsuitableAcc = new ArrayList<Account>();
	List<Job_Detail> listAccountOfJob = jobDao.getUserByJob(job_id);
	int count = listAccountOfJob.size();
%>
<%if(acc!= null && acc.getUser_id() == 1){%>
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
        <link href="css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="css/iCheck/all.css" rel="stylesheet" type="text/css" />
        <link href="css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <link href="css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />
        <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />
        <!-- fullCalendar -->
        <link href="http://cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.0.2/fullcalendar.css" rel="stylesheet" type="text/css" />
        <link href="http://cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.0.2/fullcalendar.print.css" rel="stylesheet" type="text/css" media='print' />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
        <style>
        	.btn-social{color:white !important;width:150px;float:right;margin-top:10px;margin-right:10px;}
        	#addPopup{display:none;position:absolute;width:400px;top:100px;left:600px;z-index:3000;}
        	.btn-flickr{background-color:#CD1F1F;}
        	.modal-backdrop{position: fixed;top: 0;right: 0;bottom: 0;left: 0;z-index: 2000;background-color: rgba(0, 0, 0, 0.5);}
        	.iCheck-helper{position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);}
        	#tblJ td{vertical-align:middle;}
            .external-event {margin: 10px 0;padding: 3px 5px;border-radius: 10px;cursor: pointer;font-weight: 600;display: inline-block;margin: 0 5px 5px 0;}
            #table2{width:auto !important; min-width: 140px;}
            .information{width:144px; border:2px dashed navy;}
            #table2 td{vertical-align:middle; text-align:center;height:60px;min-width:140px;}
            .drop_zone{border:2px dashed navy; width: auto; padding: 3px;}
        </style>
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
                                <span><%=acc.getFirstname() + acc.getLastname() %><i class="caret"></i></span>
                                <%} %>
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
                                        <small>Member since Nov. 2014</small>
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
                        <li class="active">
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
                                <i class="fa fa-trophy"></i> <span>Allocate Qualification</span>
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
                        Job Allocation
                        <small>Control panel</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Job Allocate</li>
                    </ol>
                </section>
				
                <!-- Main content -->
                <section class="content">
                <div id="drag"> <!-- drag and drop area -->
                    <div class="row">
                    	<div id="warningAlert" class="alert alert-danger alert-dismissable" style="margin-right:15px;">
							<b>This engineer was already allocated in this job!</b>
						</div>
						<div id="infoAlert" class="alert alert-success alert-dismissable" style="margin-right:15px;">
							<b>Please drag username on the left table and drop into the table beside to allocate engineer.</b>
							<b>If you want to unallocate engineer, just need to drag username to the Bin</b>
						</div>
							<!-- left container -->
							<div class="col-md-2">
								<div class="box">
	                                <div class="box-header">
	                                    <h4 class="box-title">Engineers have qualification</h4>
	                                </div>
	                                <div class="box-body">
	                                    <!-- the events -->
	                                    <div id='external-events'>
		                                    <table id="table1" class="active">
												<colgroup>
													<col width="auto"/>
												</colgroup>
												<%for(Account a:listAcc) {%>
													<%if(quaDao.checkQualification(a.getUser_id(), j.getQualification_id())) {%>
														<tr>
															<td>
																<div id="<%=a.getUser_id() %>" class="drag clone external-event bg-blue" user_id="<%=a.getUser_id() %>" job_id="<%=j.getJob_id()%>"><%=a.getFirstname() + " " + a.getLastname()%></div>
															</td>
														</tr>
													<%}else{listUnsuitableAcc.add(a);}%>
												<%} %>
											</table>
	                                    </div>
	                                </div><!-- /.box-body -->
	                            </div><!-- /. box -->
	                        </div><!-- /left .col -->
							
							<!-- middle container -->
							<div class="col-md-8">
	                            <div class="box">
	                                <div class="box-header">
	                                    <h4 class="box-title"><%=j.getTitle() %></h4>
	                                    <div class="trash">
	                                    	<table id="table3" style="float:right;margin-top:3px;margin-right:3px;">
												<tr>
													<td class="trash">
															<a class="btn btn-social-icon btn-github" style="width: 40px;height: 40px;color:white;">
			                                    				<i class="fa fa-trash-o" style="font-size: 30px !important;margin-top: 0px;"></i>
			                                    			</a>
													</td>
												</tr>
											</table>
	                                    </div>
	                                </div>
	                                <div class="box-body">
	                                	<div class="row">
	                                		<div class="col-md-4">
	                                			<div class="information">
				                                    <table id="table2">
			
														<%for(int i=0; i< j.getNo_engineer(); i++) {%>
															<%if(count > 0) {%>
																<tr style="height: 60px;">
				                                            		<td id="<%=i%>">
				                                            			<div id="<%=listAccountOfJob.get(i).getUser_id() %>" class="drag external-event bg-blue" user_id="<%=listAccountOfJob.get(i).getUser_id() %>" job_id="<%=j.getJob_id()%>"><%=accDao.getAccountById((listAccountOfJob.get(i).getUser_id())).getFirstname() + " " + accDao.getAccountById((listAccountOfJob.get(i).getUser_id())).getLastname()%></div>
				                                            		</td>
				                                            	</tr>
															<%count --;}else{ %>
																<tr style="height: 60px;">
				                                            		<td id="<%=i%>"></td>
				                                            	</tr>
															<%} %>
				                                         <%} %>
													</table>
												</div>
											</div>
											<div class="col-md-8">
												<dl class="dl-horizontal">
			                                        <dt>Title</dt>
			                                        <dd><%=j.getTitle() %></dd>
			                                        <dt>Number of Engineer</dt>
			                                        <dd><%=j.getNo_engineer() %></dd>
			                                        <dt>Start date</dt>
			                                        <dd><%=j.getStart_date() %></dd>
			                                        <dt>End date</dt>
			                                        <dd><%=j.getEnd_date() %></dd>
			                                        <dt>Required Qualification</dt>
			                                        <dd><%=quaDao.getQualificationById(j.getQualification_id()).getTitle() %></dd>
			                                        <dt>Status</dt>
			                                        <dd style="margin-top:4px;">
			                                        	<%if(j.getStatus_id() == 1){ %>
                                            				<small class="label label-warning"><i class="fa fa-coffee"></i> Pending</small>
                                            			<%}else if(j.getStatus_id() ==2){ %>
                                            				<small class="label label-danger"><i class="fa fa-smile-o"></i> In Progress</small>
                                            			<%}else{ %>
                                            				<small class="label label-success"><i class="fa fa-check-circle-o"></i> Completed</small>
                                            			<%} %>
													</dd>
			                                    </dl>
											</div>
										</div>
	                                </div><!-- /.box-body -->
	                            </div><!-- /. box -->
	                        </div><!-- / middle .col -->
	                        
	                        <!-- right container -->
							<div class="col-md-2">
								<div class="box">
	                                <div class="box-header">
	                                    <h4 class="box-title">Engineers do not have qualification</h4>
	                                </div>
	                                <div class="box-body">
	                                    <!-- the events -->
	                                    <div id='external-events'>
		                                    <table id="table4" class="inactive">
												<colgroup>
													<col width="auto"/>
												</colgroup>
												<%for(Account a:listUnsuitableAcc) {%>
													<tr>
														<td>
															<div id="<%=a.getUser_id() %>" class="drag clone external-event bg-yellow" user_id="<%=a.getUser_id() %>" job_id="<%=j.getJob_id()%>"><%=a.getFirstname() + " " + a.getLastname()%></div>
														</td>
													</tr>
												<%} %>
											</table>
	                                    </div>
	                                </div><!-- /.box-body -->
	                            </div><!-- /. box -->
	                        </div><!-- /right .col -->
	                        
						
                    	</div><!-- /.row -->
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
        
        <!-- drag and drop -->
        <script src="js/dragadrop/redips-drag-source.js" type="text/javascript"></script>
        
        <!-- fullCalendar -->
        <script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.7.0/moment.min.js" type="text/javascript"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.0.2/fullcalendar.min.js" type="text/javascript"></script>
        
        <!-- InputMask -->
        <script src="js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
        <script src="js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
        
        <!-- DATA TABES SCRIPT -->
        <script src="js/plugins/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>

        <!-- AdminLTE App -->
        <script src="js/AdminLTE/app.js" type="text/javascript"></script>
        <script src="js/job_allocate.js" type="text/javascript"></script>
        <script type="text/javascript">
        	var array_userId = [];
        	<%for(int i =0; i< listAccountOfJob.size(); i++){%>
        		array_userId.push(<%=listAccountOfJob.get(i).getUser_id()%>);
        	<%}%>
        </script>
    </body>
</html>
<%}else{
	if(!response.isCommitted())
	response.sendRedirect("role_warning.jsp");
}%>