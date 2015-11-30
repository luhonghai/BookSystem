$(document).ready(function () {
	var servletUrl = "JobHandler";
	var qualification_id="";
	var action = "";
	var job_id = "";
	var status_id = "";
	var row_data = "";
	var rowID = "";
	
    $("#txtStartDate").datepicker();
    $("#txtEndDate").datepicker();
    $("#txtStartDate").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
    $("#txtEndDate").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
    //Yellow color scheme for iCheck
    $('input[type="checkbox"].flat-yellow, input[type="radio"].flat-yellow').iCheck({
        checkboxClass: 'icheckbox_flat-yellow',
        radioClass: 'iradio_flat-yellow'
    });
    
    $('input[type="radio"]').on('ifChecked', function(event){
    	status_id = $(this).val();
    });
	
	$('#tblJ').dataTable({
        "bPaginate": true,
        "bLengthChange": false,
        "bFilter": false,
        "bSort": true,
        "bInfo": true,
        "bAutoWidth": false
    });
	
	$("#warningAlert").hide();
	
	$("#btnAdd").click(function(){
		$("#resetJ").trigger("click");
		$("#title_box").text("Add Information");
		action = "add";
		$('<div class="modal-backdrop"></div>').appendTo(document.body);
		$("#addPopup").slideDown();
	});
	
	$("#tblJ").on("click", ".editJ", function(){
		$("#title_box").text("Edit Information");
		action = "edit";
		rowID = $(this).parent().parent().attr("id");
		
		job_id = $("#"+rowID).find('td').eq(0).text();
		$("#txtTitle").val($("#"+rowID).find('td').eq(1).text());
		$("#txtNo").val($("#"+rowID).find('td').eq(2).text());
		$("#txtStartDate").val($("#"+rowID).find('td').eq(3).text());
		$("#txtEndDate").val($("#"+rowID).find('td').eq(4).text());
		$("#txtQualification").val($("#"+rowID).find('td').eq(5).attr("qua_id"));
		var tem_status = $("#"+rowID).find('td').eq(6).attr("status_id");
		$('input[value="'+tem_status+'"]').iCheck('check');
		
		$('<div class="modal-backdrop"></div>').appendTo(document.body);
		$("#addPopup").slideDown();
	});
	
	$("#tblJ").on("click", ".delJ", function(){
		action = "delete";
		rowID = $(this).parent().parent().attr("id");
		job_id = $("#"+rowID).find('td').eq(0).text();
		doSubmit();
	});
	
	$("#submitJ").click(function(){
		doSubmit();
	});
	
	function doSubmit(){
		if(action == "add"){
			job_id = 0;
		}
		var title = $("#txtTitle").val();
		var no_engineer = $("#txtNo").val();
		var start_date = $("#txtStartDate").val();
		var end_date = $("#txtEndDate").val();
		var qualification_id = $("#txtQualification").val();
		status_id= $("input[type='radio']:checked" ).val();
		if(action == "add" || action == "edit"){
			if(title.length == 0 || no_engineer.length == 0){
				$("#warningAlert b").text("Please fill in the form!");
				$("#warningAlert").show();
			}else{
				if(checkDate(start_date, end_date)){
					$("#warningAlert b").text("Please enter End date greater than Start date!");
					$("#warningAlert").show();
				}else{
					handleJob(job_id, title, no_engineer, start_date, end_date, qualification_id, status_id, action);
				}
			}
		}else{
			handleJob(job_id, "delete row", 2, "11/11/2014", "12/11/2014", 1, 1, action);
		}
		
	}
	
	function handleJob(job_id, title, no_engineer, start_date, end_date, qualification_id, status_id, action){
		var xhr;
        if (window.XMLHttpRequest) {
            xhr = new XMLHttpRequest();
        } else if (window.ActiveXObject) {
            xhr = new ActiveXObject("Microsoft.XMLHTTP");
        }
        var data = "id=" + job_id + "&title=" + title + "&no_engineer=" + no_engineer + "&start_date=" + start_date + "&end_date=" + end_date + "&qualification_id=" + qualification_id + "&status_id=" + status_id + "&action=" + action;
        xhr.open("POST", servletUrl, true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send(data);
        xhr.onreadystatechange = display_data;
        function display_data() {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    console.log(xhr.responseText);
                    if(xhr.responseText != "invalid"){
                        if(action == "add"){
                        	$("#addPopup").slideUp();
                        	$(".modal-backdrop").remove();
                            var _id = xhr.responseText;
                            addingTable(_id, title, no_engineer, start_date, end_date, qualification_id, status_id);
                        }else if(action == "edit"){
                        	$("#addPopup").slideUp();
                        	$(".modal-backdrop").remove();
                        	editingTable(title, no_engineer, start_date, end_date, qualification_id, status_id);
                        }else{
                        	var table = $('#tblJ').DataTable();
                        	table.row("#"+rowID).remove().draw();
                        }
                    }
                } else {
                    alert('There was a problem with the request.');
                }
            }
        }
	}
	
	function addingTable(job_id, title, no_engineer, start_date, end_date, qualification_id, status_id){
		var table = $('#tblJ').DataTable();
		var qualification_name = $("#txtQualification option:selected" ).text();
		var status_html ="";
		
		if(status_id == 1){
			status_html = "<small class='label label-warning'><i class='fa fa-coffee'></i> Pending</small>";
		}else if(status_id == 2){
			status_html = "<small class='label label-danger'><i class='fa fa-smile-o'></i> In Progress</small>";
		}else{
			status_html = "<small class='label label-success'><i class='fa fa-check-circle-o'></i> Completed</small>";
		}
		
		var myHTML = "<tr id='row"+job_id+"'>"+
					 "<td style='display:none;'>"+job_id+"</td>"+
					 "<td><a href='job_allocate.jsp?job_id="+job_id+"'>"+title+"</a></td>"+
					 "<td>"+no_engineer+"</td>"+
					 "<td>"+start_date+"</td>"+
					 "<td>"+end_date+"</td>"+
					 "<td qua_id='"+qualification_id+"'>"+
					 	qualification_name +
					 "</td>"+
					 "<td status_id='"+status_id+"' style='text-align:center;'>"+
						status_html +
					 "</td>"+
					 "<td>"+
						"<a class='btn btn-social-icon btn-flickr delJ'><i class='fa fa-trash-o'></i></a>"+
						"<a class='btn btn-social-icon btn-dropbox editJ'><i class='fa fa-edit'></i></a>"+
					 "</td>"+
					 "</tr>";
		$("#tblJ tbody").append(myHTML);
	}
	
	function editingTable(title, no_engineer, start_date, end_date, qualification_id, status_id){
		if(status_id == 1){
			status_html = "<small class='label label-warning'><i class='fa fa-coffee'></i> Pending</small>";
		}else if(status_id == 2){
			status_html = "<small class='label label-danger'><i class='fa fa-smile-o'></i> In Progress</small>";
		}else{
			status_html = "<small class='label label-success'><i class='fa fa-check-circle-o'></i> Completed</small>";
		}
		var title_html = "<a href='job_allocate.jsp?job_id="+job_id+"'>"+title+"</a>";
		$("#"+rowID).find('td').eq(6).html("");
		
		$("#"+rowID).find('td').eq(1).html(title_html);
		$("#"+rowID).find('td').eq(2).text(no_engineer);
		$("#"+rowID).find('td').eq(3).text(start_date);
		$("#"+rowID).find('td').eq(4).text(end_date);
		$("#"+rowID).find('td').eq(5).text($("#txtQualification option:selected" ).text());
		$("#"+rowID).find('td').eq(6).html(status_html);
	}
	
	function checkDate(start_date, end_date){
		if( (new Date(start_date).getTime() > new Date(end_date).getTime()))
		{
		    return true;
		}
		return false;
	}
	
	$("#resetJ").click(function(){
		$("#txtTitle").val("");
		$("#txtNo").val("");
		$("#txtStartDate").val("");
		$("#txtEndDate").val("");
		$("#txtQualification").val("1");
		$('input[value="1"]').iCheck('check');
	});
	
	$("#txtTitle").focus(function(){
		$("#warningAlert").hide();
	});
	
	$("#txtNo").focus(function(){
		$("#warningAlert").hide();
	});
	
	$("#txtStartDate").focus(function(){
		$("#warningAlert").hide();
	});
	
	$("#txtEndDate").focus(function(){
		$("#warningAlert").hide();
	});
	
	$("#txtQualification").focus(function(){
		$("#warningAlert").hide();
	});
	
	$(".close").click(function(){
		$("#warningAlert").hide();
	});
	
	$("#closePopup").click(function(){
		$("#addPopup").slideUp();
		$(".modal-backdrop").remove();
	});
});