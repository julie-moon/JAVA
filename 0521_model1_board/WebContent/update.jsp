<%@page import="com.jbm.model1.dao.BoardDAO"%>
<%@page import="com.jbm.model1.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	// 파라미터
	String noStr = request.getParameter("no");
	int no = Integer.parseInt(noStr);
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	
	Board board = new Board(no, title, contents);
	
	BoardDAO.updateContent(board);
	
	response.sendRedirect("contents.jsp?no="+no);
%>