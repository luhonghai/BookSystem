<%@ page import="com.booksystem.service.AdminService" %><%
	AdminService adminService = new AdminService(request, response);
	adminService.logout();
	response.sendRedirect("login.jsp");
%>
