$(document).ready(function () {
	var servletUrl = "QualificationHandler";
	var action = "";
	var qualification_id = "";
	var row_data = "";
	var rowID = "";
	
	$('#tblQ').dataTable({
        "bPaginate": true,
        "bLengthChange": false,
        "bFilter": false,
        "bSort": true,
        "bInfo": true,
        "bAutoWidth": false
    });
	
	$("#warningAlert").hide();
	
	$("#btnAdd").click(function(){
		$("#resetQ").trigger("click");
		$("#title_box").text("Add Information");
		action = "add";
		$('<div class="modal-backdrop"></div>').appendTo(document.body);
		$("#addPopup").slideDown();
	});
	
	$("#tblQ").on("click", ".editQ", function(){
		$("#title_box").text("Edit Information");
		action = "edit";
		rowID = $(this).parent().parent().attr("id");
		
		qualification_id = $("#"+rowID).find('td').eq(0).text();
		$("#txtName").val($("#"+rowID).find('td').eq(1).text());
		
		$('<div class="modal-backdrop"></div>').appendTo(document.body);
		$("#addPopup").slideDown();
	});
	
	$("#tblQ").on("click", ".delQ", function(){
		action = "delete";
		rowID = $(this).parent().parent().attr("id");
		qualification_id = $("#"+rowID).find('td').eq(0).text();
		doSubmit();
	});
	
	$("#submitQ").click(function(){
		doSubmit();
	});
	
	function doSubmit(){
		if(action == "add"){
			qualification_id = 0;
		}
		var name = $("#txtName").val();
		if(action == "add" || action == "edit"){
			if(name.length == 0){
				$("#warningAlert").show();
			}else{
				handleQualification(qualification_id, name, action);
			}
		}else{
			handleQualification(qualification_id, name, action);
		}
		
	}
	
	function handleQualification(id, name, action){
		var xhr;
        if (window.XMLHttpRequest) {
            xhr = new XMLHttpRequest();
        } else if (window.ActiveXObject) {
            xhr = new ActiveXObject("Microsoft.XMLHTTP");
        }
        var data = "id=" + id + "&name=" + name + "&action=" + action;
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
                            var q_id = xhr.responseText;
                            addingTable(q_id, name);
                        }else if(action == "edit"){
                        	$("#addPopup").slideUp();
                        	$(".modal-backdrop").remove();
                        	editingTable(name);
                        }else{
                        	var table = $('#tblQ').DataTable();
                        	table.row("#"+rowID).remove().draw();
                        }
                    }
                } else {
                    alert('There was a problem with the request.');
                }
            }
        }
	}
	
	function addingTable(id, name){
		var table = $('#tblQ').DataTable();
		
		var myHTML = "<tr id='row"+id+"' role='row'>"+
					 "<td class='sorting_1'>"+id+"</td>"+
					 "<td>"+name+"</td>"+
					 "<td>"+
					 	"<a class='btn btn-social-icon btn-flickr delQ'><i class='fa fa-trash-o'></i></a>"+
					 	"<a class='btn btn-social-icon btn-dropbox editQ' style='margin-left:3px;'><i class='fa fa-edit'></i></a>"+
					 "</td>"+
					 "</tr>";
		$("#tblQ tbody").append(myHTML);
	}
	
	function editingTable(name){
		$("#"+rowID).find('td').eq(1).text(name);
	}
	
	$("#resetQ").click(function(){
		$("#txtName").val("");
	});
	
	$("#txtName").focus(function(){
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