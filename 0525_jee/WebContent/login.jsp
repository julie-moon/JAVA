<%@page import="vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	User loginUser = new User();
	loginUser.setNickname("윙깅이");
	
	session.setAttribute("loginUser", loginUser);
	
	response.sendRedirect("index.jsp");
%>