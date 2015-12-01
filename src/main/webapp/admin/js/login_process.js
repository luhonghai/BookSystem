$(document).ready(function(){
	var servletUrl = "Authenticate";
	$("#resultAlert").hide();
	$("#warningAlert").hide();
	function doSubmit(){
		var username = $("#username").val();
		var password = $("#password").val();
		if(username.length == 0 || password.length == 0){
			$("#warningAlert").show();
		}else{
			login(username, password);
		}
	}
	
	function login(username, password){
		var xhr;
        if (window.XMLHttpRequest) {
            xhr = new XMLHttpRequest();
        } else if (window.ActiveXObject) {
            xhr = new ActiveXObject("Microsoft.XMLHTTP");
        }
        var data = "_request_username=" + username + "&_request_password=" + password;
        xhr.open("POST", servletUrl, true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send(data);
        xhr.onreadystatechange = display_data;
        function display_data() {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    console.log(xhr.responseText);
                    if(xhr.responseText != "invalid"){
                    	var account = $.parseJSON(xhr.responseText);
                        
                        var id = account.user_id;
                        var username = account.username;
                        var password = account.password;
                        var firstname = account.firstname;
                        var lastname = account.lastname;
                        var email = account.email;
                        var role_id = account.role_id;
                        
                        if(role_id == 1){
                        	window.location = "../index.jsp";
                        }else{
                        	window.location = "../backup/index_engineer.jsp";
                        }
                    }else{
                    	$("#resultAlert").show();
                    }
                } else {
                    alert('There was a problem with the request.');
                }
            }
        }
	}
	
	$("#username").focus(function(){
		$("#resultAlert").hide();
		$("#warningAlert").hide();
	});
	
	$("#password").focus(function(){
		$("#resultAlert").hide();
		$("#warningAlert").hide();
	});
	
	$("#submit").click(function(){
		doSubmit();
	});
	
	$("#password").keypress(function( event ) {
		  if ( event.which == 13 ) {
			  doSubmit();
		  }
		});
	
	$(".close").click(function(){
		$("#resultAlert").hide();
		$("#warningAlert").hide();
	});
	
});