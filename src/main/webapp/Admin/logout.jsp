<%@page import="ac.gre.aircraft.dao.StatisticDao"%>
<%@page import="ac.gre.aircraft.dao.imp.StatisticDaoImp" %>
<%@page import="ac.gre.aircraft.object.LogFile" %>
<%@page import="ac.gre.aircraft.object.Account" %>
<%@page import="ac.gre.aircraft.util.DateUtil" %>
<%
	StatisticDao statisticDao = new StatisticDaoImp();
	
	LogFile log = new LogFile();
	log.setUser_id(((Account)session.getAttribute("account")).getUser_id());
	log.setAction_title("logout");
	log.setAction_time(DateUtil.getCurrentDatetime());
	
	statisticDao.addLog(log);

	session.invalidate();
	response.sendRedirect("login.jsp");
%>
