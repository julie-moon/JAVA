<%@page import="com.jbm.mms.dao.GenresDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");	

	// 넘어온 파라미터 받음
	String name = request.getParameter("name");

	// insert구문 수행
	GenresDAO.insert(name);
	
	// genres.jsp로 리다이렉트
	response.sendRedirect("genres.jsp");
%>