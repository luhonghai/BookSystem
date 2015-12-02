<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.11.1/jquery-ui.min.js" type="text/javascript"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="<%=request.getContextPath()%>/admin/js/plugins/morris/morris.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/admin/js/plugins/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/admin/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/admin/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/admin/js/plugins/jqueryKnob/jquery.knob.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/admin/js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/admin/js/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/admin/js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/admin/js/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/admin/js/plugins/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/admin/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/admin/js/plugins/sweetalert/sweetalert.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/admin/js/plugins/bootstrap-fileinput/fileinput.min.js" type="text/javascript"></script>

<!-- AdminLTE App -->
<script src="<%=request.getContextPath()%>/admin/js/AdminLTE/app.js" type="text/javascript"></script>

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