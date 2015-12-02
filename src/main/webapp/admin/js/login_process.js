$(document).ready(function(){
	$('#submit').click(function(e) {
		var $username = $('#username');
		var $password = $('#password');
		var u = $username.val();
		var p = $password.val();
		$.ajax({
			url: CONTEXT_PATH + '/rest/admin/auth',
			method: 'POST',
			dataType: 'json',
			data: {
				username: u,
				password: p
			},
			success: function(data) {
				if (data.status) {
					window.location = CONTEXT_PATH + "/admin/"
				} else {
					swal("Không thể đăng nhập!", data.message, "error");
				}
			},
			error: function() {
				swal("Xảy ra lỗi!", "Không thể kết nối tới máy chủ", "error");
			}
		});
	});
});