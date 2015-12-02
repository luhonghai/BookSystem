<%@tag pageEncoding="UTF-8" %>
<section class="content-header">
  <h1>
    Quản lí sách
    <small>Control panel</small>
  </h1>
  <ol class="breadcrumb">
    <li><a href="<%=request.getContextPath()%>/admin/"><i class="fa fa-dashboard"></i> Trang chủ</a></li>
    <li class="active">Quản lí sách</li>
  </ol>
</section>

<!-- Main content -->
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div>
          <h3 class="box-title">Toàn bộ sách</h3>
          <a id="btnAdd" class="btn btn-social btn-primary"><i class="fa fa-plus"></i>Thêm mới</a>
        </div>
        <div class="box-body table-responsive">
          <table id="datatable" class="table table-bordered table-hover">
            <thead>
            <tr>
              <th>Ảnh bìa</th>
              <th>Tiêu đề</th>
              <th>Tác giả</th>
              <th>Mô tả</th>
              <th>Nội dung</th>
              <th>Giá</th>
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
        <%--<h3 id="title_box" class="box-title">Thêm mới sách</h3>--%>
        <div class="box-tools pull-right">
          <button id="closePopup" class="btn btn-primary btn-xs"><i class="fa fa-times"></i></button>
        </div>
      </div>
      <form id="uploadForm">
      <div class="box-body">
        <input type="hidden" name="txtId" id="txtId" value="0"/>
        <div class="form-group">
          <label for="txtTitle">Tiêu đề</label> <input
                type="text" class="form-control" name="txtTitle" id="txtTitle">
        </div>
        <div class="form-group">
          <label for="txtAuthor">Tác giả</label> <input
                type="text" class="form-control" name="txtAuthor" id="txtAuthor">
        </div>
        <div class="form-group">
          <label for="txtPrice">Giá</label> <input
                type="text" class="form-control" name="txtPrice" id="txtPrice">
        </div>
        <div class="form-group">
          <label for="fileImage">Ảnh bìa</label> <input
                type="file" class="form-control" id="fileImage" name="image">
        </div>
        <div class="form-group">
          <label for="txtDescription">Mô tả</label> <textarea
                 class="form-control" name="txtDescription" id="txtDescription"></textarea>
        </div>
        <div class="form-group">
          <label for="txtContent">Nội dung</label> <textarea
                class="form-control" name="txtContent" id="txtContent"></textarea>
        </div>
      </div>
      <div class="box-footer" style="border: 1px solid;border-color: #3c8dbc;">
        <button id="btnSubmit" class="btn btn-primary" name="submit">Thêm mới</button>
        <button id="btnReset" class="btn btn-danger" name="reset">Làm lại</button>
      </div>
      </form>
    </div><!-- /.box -->
  </div>
</section><!-- /.content -->
<script src="<%=request.getContextPath()%>/admin/js/book.js" type="text/javascript"></script>