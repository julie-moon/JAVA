<%@page import="com.jbm.model1.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 넘어온 파라미터
	String noStr = request.getParameter("no");
	int no = Integer.parseInt(noStr);
	
	// 해당 번호 삭제
	BoardDAO.deleteContent(no);
	
	// index로 이동
	response.sendRedirect("index.jsp");
%>