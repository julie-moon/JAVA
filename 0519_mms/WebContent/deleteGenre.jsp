<%@page import="com.jbm.mms.dao.GenresDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String noStr = request.getParameter("no");
	int no = Integer.parseInt(noStr);
	
	GenresDAO.deleteGenre(no);
	
	response.sendRedirect("genres.jsp");
%>