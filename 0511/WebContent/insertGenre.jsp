<%@page import="com.jbm.mms.dao.GenresDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	String genre = request.getParameter("genre");	
	
	GenresDAO.insertGenre(genre);
	
	response.sendRedirect("genres.jsp");
	
%>
<%-- 
<%=genre%>
--%>