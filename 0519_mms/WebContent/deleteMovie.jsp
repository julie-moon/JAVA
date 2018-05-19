<%@page import="com.jbm.mms.dao.MoviesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String noStr = request.getParameter("no");
	int no = Integer.parseInt(noStr);
	
	MoviesDAO.deleteMovie(no);
	
	response.sendRedirect("movies.jsp");
%>