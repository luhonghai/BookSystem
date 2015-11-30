$(document).ready(function () {
	var user_id="";
	var qualification_id="";
	var action = "";
	var servletUrl = "QualificationAllocationHandler";
    //$('.rotate').css('height', $('.rotate').width());
    
    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
        checkboxClass: 'icheckbox_flat-red',
        radioClass: 'iradio_flat-red'
    });
    
    $('input[type="checkbox"]').on('ifChecked', function(event){
    	action = "map";
    	user_id = $(this).attr('user_id');
    	qualification_id = $(this).attr('qua_id');
    	allocateQualification(user_id, qualification_id, action);
    });
    
    $('input[type="checkbox"]').on('ifUnchecked', function(event){
    	action = "unmap";
    	user_id = $(this).attr('user_id');
    	qualification_id = $(this).attr('qua_id');
    	allocateQualification(user_id, qualification_id, action);
    });
    
    function allocateQualification(user_id, qualification_id, action){
		var xhr;
        if (window.XMLHttpRequest) {
            xhr = new XMLHttpRequest();
        } else if (window.ActiveXObject) {
            xhr = new ActiveXObject("Microsoft.XMLHTTP");
        }
        var data = "user_id=" + user_id + "&qualification_id=" + qualification_id + "&action=" + action;
        xhr.open("POST", servletUrl, true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send(data);
        xhr.onreadystatechange = display_data;
        function display_data() {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    console.log(xhr.responseText);
                    if(xhr.responseText != "invalid"){
                        if(action == "map"){
                        	
                        }else{
                        	
                        }
                    }
                } else {
                    alert('There was a problem with the request.');
                }
            }
        }
	}
});