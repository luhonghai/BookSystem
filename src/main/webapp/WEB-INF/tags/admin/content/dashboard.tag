<%@tag pageEncoding="UTF-8" %>
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