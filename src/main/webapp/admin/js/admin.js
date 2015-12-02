var entityName = 'admin';
var myTable;

function drawTable(){
    myTable = $('#datatable').dataTable({
        "retrieve": true,
        "destroy": true,
        "responsive": true,
        "bProcessing": true,
        "bServerSide": true,
        "order": [[ 0, "desc" ]],
        "ajax": {
            "url": CONTEXT_PATH + "/rest/" + entityName + "/search",
            "type": "GET",
            "dataType": "json",
        },

        "columns": [{
            "data": "username",
            "bSortable": true,
            "sDefaultContent": ""

        }, {
            "data": "fullname",
            "bSortable": true,
            "sDefaultContent": ""
        }, {
            "data": "email",
            "bSortable": true,
            "sDefaultContent": "",
        },
            {
                "data": null,
                "bSortable": false,
                "sDefaultContent": "",
                "mRender": function (data, type, full) {
                    var $div = $("<div/>");
                    var $btn = $(document.createElement("button"));
                    $btn.attr("type", "button");
                    $btn.attr("data-id", data.id);
                    $btn.attr("class", "btn btn-primary btn-xs btn-edit");
                    $btn.html("edit");
                    $div.append($btn);
                    $btn = $(document.createElement("button"));
                    $btn.attr("type", "button");
                    $btn.attr("data-id", data.id);
                    $btn.attr("class", "btn btn-danger btn-xs btn-delete");
                    $btn.html("delete");
                    $div.append($btn);
                    return $div.html();
                }
            }]

    });
}

function resetForm() {
    $('#txtUsername').val('');
    $('#txtPassword').val('');
    $('#txtFullname').val('');
    $('#txtEmail').val('');
    $('#txtId').val('0');
}

$(document).ready(function(){
    $('#btnSubmit').click(function() {
        putAdmin({
            id: $('#txtId').val(),
            username: $('#txtUsername').val(),
            password: $('#txtPassword').val(),
            fullname: $('#txtFullname').val(),
            email: $('#txtEmail').val(),
        });
    });
    $('#btnReset').click(function() {
        resetForm();
    });
    $('#btnAdd').click(function() {
        resetForm();
        $('#btnSubmit').html('Thêm mới');
        $("#addPopup").slideDown();
    });
    $("#closePopup").click(function(){
        $("#addPopup").slideUp();
    });

    $(document).click(function(e) {
        var $target = $(e.target);
        var dataId = $target.attr("data-id");
        if ($target.hasClass("btn-delete")) {
            swal({
                title: "Xóa đối tượng?",
                text: null,
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Xóa",
                cancelButtonText: "Không",
                closeOnConfirm: false },
                function() {
                    $.ajax({
                        "url": CONTEXT_PATH + "/rest/" + entityName + "/delete",
                        type: "POST",
                        dataType: "json",
                        data: {
                            id: dataId
                        },
                        success: function (data) {
                            if (data.status) {
                                myTable.fnDraw();
                                swal("Xóa thành công!", null, "success");
                            } else {
                                swal("Xảy ra lỗi!", data.message, "error");
                            }
                        },
                        error: function () {
                            swal("Xảy ra lỗi!", "Không thể kết nối tới máy chủ", "error");
                        }

                    });
                }
            );
        } else if ($target.hasClass("btn-edit")) {
            $.ajax({
                "url": CONTEXT_PATH + "/rest/" + entityName + "/get",
                type: "GET",
                dataType: "json",
                data: {
                    id: dataId
                },
                success: function (data) {
                    if (data.status) {
                        $('#txtId').val(data.data.id);
                        $('#txtUsername').val(data.data.username);
                        $('#txtPassword').val('');
                        $('#txtFullname').val(data.data.fullname);
                        $('#txtEmail').val(data.data.email);
                        $("#addPopup").slideDown();
                        $('#btnSubmit').html('Cập nhật');
                    } else {
                        swal("Xảy ra lỗi!", data.message, "error");
                    }
                },
                error: function () {
                    swal("Xảy ra lỗi!", "Không thể kết nối tới máy chủ", "error");
                }

            });
        }
    });

    drawTable();
});

function putAdmin(admin) {
    $.ajax({
        url: CONTEXT_PATH + '/rest/' + entityName + '/put',
        method: 'POST',
        dataType: 'json',
        data: {
            data: JSON.stringify(admin)
        },
        success: function(data) {
            $("#addPopup").slideUp();
            if (data.status) {
                myTable.fnDraw();
                // saved successfully
                swal( $('#btnSubmit').html() + " thành công!", null, "success");
            } else {
                swal("Xảy ra lỗi!", data.message, "error");
            }
        },
        error: function() {
            $("#addPopup").slideUp();
            swal("Xảy ra lỗi!", "Không thể kết nối tới máy chủ", "error");
        }
    });
}

function isValidEmailAddress(emailAddress) {
    var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
    return pattern.test(emailAddress);
};