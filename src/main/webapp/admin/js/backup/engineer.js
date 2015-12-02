$(document).ready(function(){
	var servletUrl = "AccountHandler";
	var action = "";
	var engineer_id = "";
	var row_data = "";
	var rowID = "";
	
	$('#tblEngineer').dataTable({
        "bPaginate": true,
        "bLengthChange": false,
        "bFilter": false,
        "bSort": true,
        "bInfo": true,
        "bAutoWidth": false
    });
	
	/*Get row data
	var table = $('#tblEngineer').DataTable();
	$('#tblEngineer tbody').on('click','tr',function () {
	    row_data = table.row( this ).data();
	} );
	console.log(row_data);*/
	
	$("#warningAlert").hide();
	
	$("#btnAdd").click(function(){
		$("#resetEn").trigger("click");
		$("#title_box").text("Add Information");
		action = "add";
		$('<div class="modal-backdrop"></div>').appendTo(document.body);
		$("#addPopup").slideDown();
	});
	
	$("#tblEngineer").on("click", ".editEn", function(){
		$("#title_box").text("Edit Information");
		action = "edit";
		rowID = $(this).parent().parent().attr("id");
		
		engineer_id = $("#"+rowID).find('td').eq(0).text();
		$("#txtUsername").val($("#"+rowID).find('td').eq(1).text());
		$("#txtPassword").val($("#"+rowID).find('td').eq(2).text());
		$("#txtFName").val($("#"+rowID).find('td').eq(3).text());
		$("#txtLName").val($("#"+rowID).find('td').eq(4).text());
		$("#txtEmail").val($("#"+rowID).find('td').eq(5).text());
		
		$('<div class="modal-backdrop"></div>').appendTo(document.body);
		$("#addPopup").slideDown();
	});
	
	$("#tblEngineer").on("click", ".delEn", function(){
		action = "delete";
		rowID = $(this).parent().parent().attr("id");
		engineer_id = $("#"+rowID).find('td').eq(0).text();
		doSubmit();
	});
	
	$("#submitEn").click(function(){
		doSubmit();
		//$("#warningAlert b").delay(3000).text("Please fill in the form!");
	});
	
	function doSubmit(){
		if(action == "add"){
			engineer_id = 0;
		}
		var username = $("#txtUsername").val();
		var password = $("#txtPassword").val();
		var fname = $("#txtFName").val();
		var lname = $("#txtLName").val();
		var email = $("#txtEmail").val();
		if(action == "add" || action == "edit"){
			if(username.length == 0 || password.length == 0 || fname.length==0 || lname.length==0 || email.length==0){
				$("#warningAlert").show();
			}else{
				if(isValidEmailAddress(email)){
					handleEngineer(engineer_id, username, password, fname, lname, email, action);
				}else{
					$("#warningAlert b").text("Please input valid email!!!");
					$("#warningAlert").show();
					
					$("#warningAlert").delay(3000).fadeOut("slow");
				}
			}
		}else{
			handleEngineer(engineer_id, username, password, fname, lname, email, action);
		}
		
	}
	
	function isValidEmailAddress(emailAddress) {
	    var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
	    return pattern.test(emailAddress);
	};
	
	function handleEngineer(id, username, password, firstname, lastname, email, action){
		var xhr;
        if (window.XMLHttpRequest) {
            xhr = new XMLHttpRequest();
        } else if (window.ActiveXObject) {
            xhr = new ActiveXObject("Microsoft.XMLHTTP");
        }
        var data = "id=" + id + "&username=" + username + "&password=" + password + "&fname=" + firstname + "&lname=" + lastname + "&email=" + email + "&action=" + action;
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
                            var user_id = xhr.responseText;
                            addingTable(user_id, username, password, firstname, lastname, email);
                        }else if(action == "edit"){
                        	$("#addPopup").slideUp();
                        	$(".modal-backdrop").remove();
                        	editingTable(engineer_id, username, password, firstname, lastname, email);
                        }else{
                        	var table = $('#tblEngineer').DataTable();
                        	table.row("#"+rowID).remove().draw();
                        }
                    }
                } else {
                    alert('There was a problem with the request.');
                }
            }
        }
	}
	
	function addingTable(id, username, password, firstname, lastname, email){
		var table = $('#tblEngineer').DataTable();
		
		var myHTML = "<tr id='row"+id+"' role='row'>"+
					 "<td style='display:none;' class='sorting_1'>"+id+"</td>"+
					 "<td><a href='engineer_info.jsp?en_id="+id+"'>"+username+"</a></td>"+
					 "<td style='display:none;'>"+password+"</td>"+
					 "<td>"+firstname+"</td>"+
					 "<td>"+lastname+"</td>"+
					 "<td>"+email+"</td>"+
					 "<td>"+
					 	"<a class='btn btn-social-icon btn-flickr delEn'><i class='fa fa-trash-o'></i></a>"+
					 	"<a class='btn btn-social-icon btn-dropbox editEn' style='margin-left:3px;'><i class='fa fa-edit'></i></a>"+
					 "</td>"+
					 "</tr>";
		$("#tblEngineer tbody").append(myHTML);
		/*var jRow = $("<tr id='row"+id+"' role='row'>").append("<td style='display:none;' class='sorting_1'>"+id+"</td>"+
				 "<td>"+username+"</td>"+
				 "<td style='display:none;'>"+password+"</td>"+
				 "<td>"+firstname+"</td>"+
				 "<td>"+lastname+"</td>"+
				 "<td>"+email+"</td>"+
				 "<td>"+
				 	"<a class='btn btn-social-icon btn-flickr delEn'><i class='fa fa-trash-o'></i></a>"+
				 	"<a class='btn btn-social-icon btn-dropbox editEn'><i class='fa fa-edit'></i></a>"+
				 "</td>");
		table.row.add(jRow).draw();*/
	}
	
	function editingTable(id, username, password, firstname, lastname, email){
		var myHtml = "<a href='engineer_info.jsp?en_id="+id+"'>"+username+"</a>";
		$("#"+rowID).find('td').eq(1).html(myHtml);
		$("#"+rowID).find('td').eq(2).text(password);
		$("#"+rowID).find('td').eq(3).text(firstname);
		$("#"+rowID).find('td').eq(4).text(lastname);
		$("#"+rowID).find('td').eq(5).text(email);
	}
	
	$("#resetEn").click(function(){
		$("#txtUsername").val("");
		$("#txtPassword").val("");
		$("#txtFName").val("");
		$("#txtLName").val("");
		$("#txtEmail").val("");
	});
	
	$("#txtUsername").focus(function(){
		$("#warningAlert").hide();
	});
	
	$("#txtPassword").focus(function(){
		$("#warningAlert").hide();
	});
	
	$("#txtFName").focus(function(){
		$("#warningAlert").hide();
	});
	
	$("#txtLName").focus(function(){
		$("#warningAlert").hide();
	});
	
	$("#txtEmail").focus(function(){
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