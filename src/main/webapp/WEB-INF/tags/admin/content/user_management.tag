<%@tag pageEncoding="UTF-8" %>
<section class="content-header">
  <h1>
    Quản lí quản trị viên
    <small>Control panel</small>
  </h1>
  <ol class="breadcrumb">
    <li><a href="<%=request.getContextPath()%>/admin/"><i class="fa fa-dashboard"></i> Trang chủ</a></li>
    <li class="active">Quản trị viên</li>
  </ol>
</section>

<!-- Main content -->
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div>
          <h3 class="box-title">Danh sách quản trị viên</h3>
          <a id="btnAdd" class="btn btn-social btn-primary"><i class="fa fa-plus"></i>Thêm mới</a>
        </div>
        <div class="box-body table-responsive">
          <table id="datatable" class="table table-bordered table-hover">
            <thead>
            <tr>
              <th>Tên đăng nhập</th>
              <th>Họ và tên</th>
              <th>Email</th>
              <th style="width:10%;"></th>
            </tr>
            </thead>
          </table>
        </div><!-- /.box-body -->
      </div><!-- /.box -->
    </div>
  </div>

  <div id="addPopup" style="display: none">
    <div class="box box-solid bg-light-blue">
      <div class="box-header" data-toggle="tooltip">
        <%--<h3 id="title_box" class="box-title">Thêm mới quản trị viên</h3>--%>
        <div class="box-tools pull-right">
          <button id="closePopup" class="btn btn-primary btn-xs"><i class="fa fa-times"></i></button>
        </div>
      </div>
      <div class="box-body">
        <input type="hidden" name="txtId" id="txtId" value="0"/>
        <div class="form-group">
          <label for="txtUsername">Tên đăng nhập</label> <input
                type="text" class="form-control" id="txtUsername">
        </div>
        <div class="form-group">
          <label for="txtPassword">Mật khẩu</label> <input
                type="password" class="form-control" id="txtPassword">
        </div>
        <div class="form-group">
          <label for="txtFullname">Họ tên</label> <input
                type="text" class="form-control" id="txtFullname">
        </div>
        <div class="form-group">
          <label for="txtEmail">Email</label> <input
                type="email" class="form-control" id="txtEmail">
        </div>
      </div>
      <div class="box-footer" style="border: 1px solid;border-color: #3c8dbc;">
        <button id="btnSubmit" class="btn btn-primary">Thêm mới</button>
        <button id="btnReset" class="btn btn-danger">Làm lại</button>
      </div>
    </div><!-- /.box -->
  </div>
</section><!-- /.content -->
<script src="<%=request.getContextPath()%>/admin/js/admin.js" type="text/javascript"></script>