<%@ page import="com.booksystem.dao.IAdminDAO" %>
<%@ page import="com.booksystem.dao.impl.AdminDAOImpl" %>
<%@ page import="com.booksystem.entity.Admin" %>
<%@ page import="java.util.Collection" %><%
  IAdminDAO adminDAO = new AdminDAOImpl();
  Collection<Admin> list = adminDAO.findAll();
%>
<!-- Content Header (Page header) -->
<section class="content-header">
  <h1>
    Engineer Management
    <small>Control panel</small>
  </h1>
  <ol class="breadcrumb">
    <li><a href="../index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
    <li class="active">Engineer</li>
  </ol>
</section>

<!-- Main content -->
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">List of engineers</h3>
          <a id="btnAdd" class="btn btn-block btn-social btn-github"><i class="fa fa-plus"></i>Add new engineer</a>
        </div><!-- /.box-header -->
        <div class="box-body table-responsive">
          <table id="tblEngineer" class="table table-bordered table-hover">
            <thead>
            <tr>
              <th>Tên đăng nhập</th>
              <th>Họ và tên</th>
              <th>Email</th>
              <th style="width:10%;"></th>
            </tr>
            </thead>
            <tbody>
            <%for(Admin a:list) {%>
            <tr id="row<%=a.getId()%>">
              <td><%=a.getUsername()%></td>
              <td><%=a.getFullname() %></td>
              <td><%=a.getEmail() %></td>
              <td>
                <a class="btn btn-social-icon btn-flickr delEn"><i class="fa fa-trash-o"></i></a>
                <a class="btn btn-social-icon btn-dropbox editEn"><i class="fa fa-edit"></i></a>
              </td>
            </tr>
            <%} %>
            </tbody>
          </table>
        </div><!-- /.box-body -->
      </div><!-- /.box -->
    </div>
  </div>

  <div id="addPopup">
    <div class="box box-solid bg-light-blue">
      <div class="box-header" data-toggle="tooltip">
        <h3 id="title_box" class="box-title">Add Information</h3>
        <div class="box-tools pull-right">
          <button id="closePopup" class="btn btn-primary btn-xs"><i class="fa fa-times"></i></button>
        </div>
      </div>
      <div class="box-body">
        <div class="form-group">
          <label for="txtUsername">Username</label> <input
                type="text" class="form-control" id="txtUsername" placeholder="Enter username">
        </div>
        <div class="form-group">
          <label for="txtPassword">Password</label> <input
                type="password" class="form-control" id="txtPassword" placeholder="Enter password">
        </div>
        <div class="form-group">
          <label for="txtFName">First Name</label> <input
                type="text" class="form-control" id="txtFName" placeholder="Enter firstname">
        </div>
        <div class="form-group">
          <label for="txtLName">Last Name</label> <input
                type="text" class="form-control" id="txtLName" placeholder="Enter lastname">
        </div>
        <div class="form-group">
          <label for="txtEmail">Email address</label> <input
                type="email" class="form-control" id="txtEmail" placeholder="Enter email">
        </div>
      </div>
      <!-- /.box-body -->
      <div id="warningAlert" class="alert alert-warning alert-dismissable" style="margin-right:15px">
        <button type="button" class="close">x</button>
        <b>Please fill in the form!</b>
      </div>
      <div class="box-footer" style="border: 1px solid;border-color: #3c8dbc;">
        <button id="submitEn" class="btn btn-primary">Submit</button>
        <button id="resetEn" class="btn btn-danger">Reset</button>
      </div>
    </div><!-- /.box -->
  </div>
</section><!-- /.content -->