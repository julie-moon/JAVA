<%@page import="dao.GroupsDAO"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String noStr = request.getParameter("no");
	int no = Integer.parseInt(noStr);
	
	int result = GroupsDAO.deleteGroup(no);
%>
<%=result%>