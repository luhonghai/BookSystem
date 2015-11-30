$(document).ready(function(){
/*jslint white: true, browser: true, undef: true, nomen: true, eqeqeq: true, plusplus: false, bitwise: true, regexp: true, strict: true, newcap: true, immed: true, maxerr: 14 */
/*global window: false, REDIPS: true */

/* enable strict mode */
	"use strict";
	
	// define init
	var redipsInit,
		pos = [1, 0, 0, 3, 0, 0] ;
	var user_id="";
	var job_id="";
	var action = "";
	var servletUrl = "JobAllocationHandler";
	$("#warningAlert").hide();
	$("#infoAlert").delay(30000).fadeOut('slow');
	// redips initialization
	redipsInit = function () {
		var num = 0,			// number of successfully placed elements
			rd = REDIPS.drag;	// reference to the REDIPS.drag lib
		// initialization
		rd.init();
		//rd.shift.animation = true;
		rd.dropMode = 'single';
		// set hover color
		rd.hover.colorTd = '#FFFFFF';
		rd.hover.colorTr = '#FFFFFF';
		rd.enableTable(false, 'inactive');
		//rd.enableTable(true, 'active');
		//rd.enableDrag(true, '#external-events div');
		// on each drop refresh content
		rd.event.dropped = function () {
			action = "map";
			var obj = REDIPS.drag.obj;
			user_id = obj.getAttribute("user_id");
			job_id = obj.getAttribute("job_id");
			
			if(checkDuplicate(user_id)){
				$("#warningAlert").show();
				rd.deleteObject(rd.obj);
				$('#warningAlert').delay(3000).fadeOut('slow');
			}else{
				array_userId.push(user_id);
				allocateJob(user_id, job_id, action);
			}
			//var id = rd.obj.id;
			// move DIV element to initial position
			//rd.moveObject({
			//	id: id,			// DIV element id
			//	target: pos	    // target position
			//});
		};
		
		// call showContent() after DIV element is deleted
		rd.event.deleted = function () {
			action = "unmap";
			var obj = REDIPS.drag.obj;
			user_id = obj.getAttribute("user_id");
			job_id = obj.getAttribute("job_id");
			allocateJob(user_id, job_id, action);
			
			removeItem(user_id);
			//test postion
			//var pos = rd.getPosition();
			// display element positions
			//console.log(pos);
		};
	};
	
	function checkDuplicate(user_id){
		if(array_userId.length>0){
			for(var i = 0; i< array_userId.length; i++){
				if(array_userId[i] == user_id){
					return true;
				}
			}
		}else{
			return false;
		}
		return false;
	}
	
	function removeItem(user_id){
		if(array_userId.length > 0){
			for(var i = 0; i<array_userId.length; i++){
				if(user_id == array_userId[i]){
					array_userId.splice(i, 1);
				}
			}
		}
	}
	
	function allocateJob(user_id, job_id, action){
		var xhr;
        if (window.XMLHttpRequest) {
            xhr = new XMLHttpRequest();
        } else if (window.ActiveXObject) {
            xhr = new ActiveXObject("Microsoft.XMLHTTP");
        }
        var data = "user_id=" + user_id + "&job_id=" + job_id + "&action=" + action;
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
	
	// add onload event listener
	if (window.addEventListener) {
		window.addEventListener('load', redipsInit, false);
	}
	else if (window.attachEvent) {
		window.attachEvent('onload', redipsInit);
	}
});